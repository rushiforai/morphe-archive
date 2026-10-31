package com.dhuadapter.root;

import android.util.Log;

import java.lang.reflect.Method;

import com.dhuadapter.core.BuildFields;
import com.dhuadapter.core.HookEnv;

import top.canyie.pine.Pine;
import top.canyie.pine.callback.MethodHook;

/**
 * Category 2 — Root Detection Bypass. gate: config.rootBypass
 *
 * Many apps (media apps, banking apps) check for root/su and refuse to run on
 * rooted devices; DHUs are often userdebug/rooted. We intercept the common
 * detection methods: Build.TAGS, File.exists, Runtime.exec, ProcessBuilder,
 * PackageManager. Root-revealing SystemProperties are spoofed by the shared
 * com.dhuadapter.sysprops.SystemPropertiesSpoof.
 */
public final class RootBypass {

    private static final String TAG = HookEnv.TAG;

    private RootBypass() {}

    private static final java.util.Set<String> ROOT_PACKAGES = new java.util.HashSet<>(
            java.util.Arrays.asList(
                    "com.noshufou.android.su",
                    "com.thirdparty.superuser",
                    "eu.chainfire.supersu",
                    "com.koushikdutta.superuser",
                    "com.zachspong.temprootremovejb",
                    "com.ramdroid.appquarantine",
                    "com.topjohnwu.magisk",
                    "me.phh.superuser"));

    public static void install() {
        if (!HookEnv.config.rootBypass) {
            Log.i(TAG, "Root bypass disabled (config.rootBypass=false)");
            return;
        }

        // 0. Build.TAGS → release-keys. "test-keys" in Build.TAGS is the classic
        //    signal of a custom/rooted ROM (root detectors read Build.TAGS), so
        //    force release-keys. Emulator Build.* de-genericising lives in
        //    EmulatorBypass; SystemProperties spoofing is shared in
        //    SystemPropertiesSpoof.
        BuildFields.setBuildField("TAGS", "release-keys");

        // 1. File.exists() — hide su binaries. AM's root check uses File.exists,
        // so we MUST hook it. But it is an extremely hot method (Telegram calls it
        // thousands of times from many threads at startup). The earlier version
        // crashed Telegram (SIGSEGV) because it did Log + getAbsolutePath on EVERY
        // call — Pine's own logging inside the trampoline hit ICU/TimeZone
        // (String.format -> DecimalFormatSymbols) before it was ready, and the
        // concurrent multithreaded burst raced it. This version is hot-path-safe:
        //   * NO Log call anywhere in the callback (that was the ICU trigger).
        //   * NO getAbsolutePath() (heavy, resolves symlinks) — use getPath().
        //   * fast-path bail before any string work: only paths containing 'su',
        //     'magisk', 'busybox' etc. are inspected; everything else returns
        //     immediately, so Telegram's DB/cache probes do near-zero work.
        try {
            Method existsMethod = java.io.File.class.getMethod("exists");
            Pine.hook(existsMethod, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        java.io.File file = (java.io.File) callFrame.thisObject;
                        if (file == null) {
                            return;
                        }
                        String path = file.getPath();   // cheap, no symlink resolve
                        if (path == null || path.length() < 3) {
                            return;
                        }
                        // Fast-path: only strings that could be a root artefact.
                        // No toLowerCase (locale/ICU-free): check both cases cheaply.
                        if (RootPathMatcher.isRootPath(path)) {
                            callFrame.setResult(Boolean.FALSE);   // short-circuit: exists()=false
                        }
                    } catch (Throwable ignored) {
                        // Never log here — logging on this hot path is what crashed.
                    }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook File.exists", e);
        }

        // 2. Runtime.exec() — block su execution
        try {
            Method execMethod = Runtime.class.getMethod("exec", String.class);
            Pine.hook(execMethod, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        String cmd = (String) callFrame.args[0];
                        if (cmd != null && (cmd.equals("su")
                                || cmd.contains("/su")
                                || cmd.equals("which su")
                                || cmd.contains("busybox"))) {
                            // Throw IOException as if command not found
                            callFrame.setResult(null);
                            callFrame.setThrowable(new java.io.IOException(
                                    "Cannot run program \"" + cmd + "\": error=2, No such file or directory"));
                            if (HookEnv.config.debug) {
                                Log.d(TAG, "Root bypass: Runtime.exec(" + cmd + ") → IOException");
                            }
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "Runtime.exec hook error", e);
                    }
                }
            });

            // Also hook exec(String[]) variant
            Method execArrayMethod = Runtime.class.getMethod("exec", String[].class);
            Pine.hook(execArrayMethod, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        String[] cmdArray = (String[]) callFrame.args[0];
                        if (cmdArray != null && cmdArray.length > 0) {
                            String cmd = cmdArray[0];
                            if (cmd.equals("su") || cmd.contains("/su")
                                    || cmd.equals("which")) {
                                callFrame.setResult(null);
                                callFrame.setThrowable(new java.io.IOException(
                                        "Cannot run program \"" + cmd + "\": error=2, No such file or directory"));
                                if (HookEnv.config.debug) {
                                    Log.d(TAG, "Root bypass: Runtime.exec(["
                                            + String.join(",", cmdArray) + "]) → IOException");
                                }
                            }
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "Runtime.exec[] hook error", e);
                    }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook Runtime.exec", e);
        }

        // 3. PackageManager.getPackageInfo — hide root manager apps
        //    PackageManager is abstract; hook the concrete ApplicationPackageManager
        try {
            Class<?> apmClass = Class.forName("android.app.ApplicationPackageManager");
            Method getPackageInfo = apmClass.getMethod(
                    "getPackageInfo", String.class, int.class);
            Pine.hook(getPackageInfo, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        String packageName = (String) callFrame.args[0];
                        if (packageName != null && ROOT_PACKAGES.contains(packageName)) {
                            callFrame.setResult(null);
                            callFrame.setThrowable(
                                    new android.content.pm.PackageManager.NameNotFoundException(packageName));
                            if (HookEnv.config.debug) {
                                Log.d(TAG, "Root bypass: getPackageInfo(" + packageName
                                        + ") → NameNotFoundException");
                            }
                        }
                    } catch (Exception e) {
                        Log.e(TAG, "getPackageInfo hook error", e);
                    }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook PackageManager.getPackageInfo", e);
        }

        // 5. ProcessBuilder.start — block su/which/mount probes
        try {
            Method pbStart = ProcessBuilder.class.getMethod("start");
            Pine.hook(pbStart, new MethodHook() {
                @Override
                public void beforeCall(Pine.CallFrame callFrame) {
                    try {
                        ProcessBuilder pb = (ProcessBuilder) callFrame.thisObject;
                        java.util.List<String> cmd = pb.command();
                        if (cmd != null && !cmd.isEmpty()) {
                            String joined = String.join(" ", cmd).toLowerCase(java.util.Locale.US);
                            if (joined.contains("su") || joined.contains("which")
                                    || joined.contains("busybox") || joined.contains("mount")
                                    || joined.contains("magisk") || joined.contains("getprop")) {
                                callFrame.setResult(null);
                                callFrame.setThrowable(new java.io.IOException(
                                        "Cannot run program: error=2, No such file or directory"));
                                if (HookEnv.config.debug) {
                                    Log.d(TAG, "Root bypass: ProcessBuilder.start(" + joined + ") → IOException");
                                }
                            }
                        }
                    } catch (Exception e) { /* ignore */ }
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Failed to hook ProcessBuilder.start", e);
        }

        Log.i(TAG, "Hook installed: Root detection bypass "
                + "(Build.TAGS + File.exists + Runtime.exec + ProcessBuilder + PackageManager)");
    }
}
