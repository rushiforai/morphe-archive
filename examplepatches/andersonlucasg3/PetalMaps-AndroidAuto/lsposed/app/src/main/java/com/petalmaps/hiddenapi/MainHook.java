package com.petalmaps.hiddenapi;

import android.content.pm.PackageManager;
import android.util.Log;

import org.lsposed.hiddenapibypass.HiddenApiBypass;
import org.lsposed.hiddenapibypass.LSPass;

import java.lang.reflect.Method;

import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_LoadPackage;

/**
 * LSPosed module for Petal Maps (com.huawei.maps.app).
 *
 * <p>1. In the Petal Maps process: exempts hidden APIs process-wide
 * ({@code dalvik.system.VMRuntime.setHiddenApiExemptions}), so the injected
 * extension can reflect into android.window.ScreenCapture /
 * SurfaceControl.screenshot.
 *
 * <p>2. In system_server: grants {@code android.permission.READ_FRAME_BUFFER} in
 * {@code PermissionManagerService.checkUidPermission} for the captureDisplay
 * path. Verified chain (AOSP android14/android15-release):
 * {@code WMS.captureDisplay -> checkCallingPermission(READ_FRAME_BUFFER) ->
 * ContextImpl.checkCallingPermission -> AMS.checkPermission ->
 * ActivityManager.checkComponentPermission -> IPackageManager.checkUidPermission
 * -> ComputerEngine.checkUidPermission ->
 * PermissionManagerService.checkUidPermission}.
 * Android 14 exposes {@code checkUidPermission(int, String)} (private) and
 * Android 15 exposes {@code checkUidPermission(int, String, int)} (public); both
 * overloads are hooked. The grant currently applies to ANY uid for
 * READ_FRAME_BUFFER only (personal-device trade-off; see README).
 */
public class MainHook implements IXposedHookLoadPackage {

    private static final String TAG = "PetalMapsHiddenApi";
    private static final String TARGET_PACKAGE = "com.huawei.maps.app";
    private static final String SYSTEM_SERVER_PACKAGE = "android";
    private static final String PMS_CLASS =
            "com.android.server.pm.permission.PermissionManagerService";
    private static final String READ_FRAME_BUFFER = "android.permission.READ_FRAME_BUFFER";

    /**
     * Requested prefixes plus "L" (which already covers the specific ones).
     * Only the "L" prefix is honored on Android 11+; the specific prefixes are
     * kept for API 28-29 where fine-grained exemptions are still meaningful.
     */
    private static final String[] EXEMPTIONS = {
            "Landroid/window/ScreenCapture;",
            "Landroid/window/DisplayCaptureArgs;",
            "Landroid/window/ScreenCaptureResult;",
            "Landroid/view/SurfaceControl;",
            "L"
    };

    /** setHiddenApiExemptions is only effective once per process. */
    private static volatile boolean exemptionApplied;

    /** Permission hook is installed once per process. */
    private static volatile boolean permissionHookInstalled;

    private static volatile boolean firstGrantLogged;
    private static volatile int grantCount;

    @Override
    public void handleLoadPackage(XC_LoadPackage.LoadPackageParam lpparam) {
        if (TARGET_PACKAGE.equals(lpparam.packageName)) {
            applyHiddenApiExemptions(lpparam.processName);
        } else if (SYSTEM_SERVER_PACKAGE.equals(lpparam.packageName)) {
            // system_server: also lift hidden API restrictions for this process
            // (harmless there; ensures the hook lookup below always succeeds),
            // then grant READ_FRAME_BUFFER for the captureDisplay path.
            applyHiddenApiExemptions(lpparam.processName);
            hookSystemServerPermissionCheck(lpparam.classLoader);
        }
    }

    private static void applyHiddenApiExemptions(String processName) {
        if (exemptionApplied) {
            return;
        }
        exemptionApplied = true;

        Log.i(TAG, "Process " + processName + ": applying hidden API exemptions");

        boolean ok = false;
        try {
            ok = HiddenApiBypass.setHiddenApiExemptions(EXEMPTIONS);
        } catch (Throwable t) {
            Log.w(TAG, "HiddenApiBypass failed; falling back to LSPass", t);
        }
        if (!ok) {
            try {
                ok = LSPass.setHiddenApiExemptions(EXEMPTIONS);
            } catch (Throwable t) {
                Log.w(TAG, "LSPass failed too", t);
            }
        }

        Log.i(TAG, "setHiddenApiExemptions: " + (ok ? "OK" : "FAILED"));
        verifyExemption();
    }

    private static void hookSystemServerPermissionCheck(ClassLoader classLoader) {
        if (permissionHookInstalled) {
            return;
        }
        permissionHookInstalled = true;

        try {
            Class<?> pms = XposedHelpers.findClass(PMS_CLASS, classLoader);
            installHook(pms, "checkUidPermission", int.class, String.class);
            installHook(pms, "checkUidPermission", int.class, String.class, int.class);
        } catch (Throwable t) {
            Log.e(TAG, "Failed to prepare READ_FRAME_BUFFER hook in system_server", t);
        }
    }

    private static void installHook(Class<?> pms, String methodName, Class<?>... params) {
        try {
            XposedHelpers.findAndHookMethod(pms, methodName,
                    withCallback(params, readFrameBufferGrant));
            Log.i(TAG, "Permission hook installed: " + pms.getName() + "." + methodName);
        } catch (Throwable t) {
            // Expected: only one of the two overloads exists per Android version.
            Log.i(TAG, "Permission hook not present on this version: " + methodName
                    + " (" + t.getClass().getSimpleName() + ")");
        }
    }

    private static Object[] withCallback(Class<?>[] params, XC_MethodHook hook) {
        Object[] all = new Object[params.length + 1];
        System.arraycopy(params, 0, all, 0, params.length);
        all[params.length] = hook;
        return all;
    }

    /**
     * After-hook: if the original check denied READ_FRAME_BUFFER, replace the
     * result with PERMISSION_GRANTED. The original method still runs (keeping
     * its bookkeeping side effects); only the returned decision changes.
     */
    private static final XC_MethodHook readFrameBufferGrant = new XC_MethodHook() {
        @Override
        protected void afterHookedMethod(MethodHookParam<?> param) {
            Object[] args = param.args;
            if (args == null || args.length < 2 || !READ_FRAME_BUFFER.equals(args[1])) {
                return;
            }
            if (Integer.valueOf(PackageManager.PERMISSION_GRANTED).equals(param.getResult())) {
                return;
            }
            param.setResult(PackageManager.PERMISSION_GRANTED);
            grantCount++;
            if (!firstGrantLogged || grantCount % 100 == 0) {
                Log.i(TAG, "grant READ_FRAME_BUFFER (uid=" + args[0]
                        + ", count=" + grantCount + ")");
                firstGrantLogged = true;
            }
        }
    };

    /**
     * Probe: with the exemption active, Class#getDeclaredMethods stops
     * filtering hidden members (e.g. SurfaceControl.screenshot).
     */
    private static void verifyExemption() {
        try {
            Class<?> surfaceControl = Class.forName("android.view.SurfaceControl");
            boolean hasScreenshot = false;
            for (Method m : surfaceControl.getDeclaredMethods()) {
                if ("screenshot".equals(m.getName())) {
                    hasScreenshot = true;
                    break;
                }
            }
            Log.i(TAG, "Verification: SurfaceControl.screenshot via reflection "
                    + (hasScreenshot ? "ACCESSIBLE" : "BLOCKED"));
        } catch (Throwable t) {
            Log.w(TAG, "Verification failed", t);
        }
    }
}
