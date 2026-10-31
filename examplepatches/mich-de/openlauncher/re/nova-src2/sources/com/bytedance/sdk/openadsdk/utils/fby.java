package com.bytedance.sdk.openadsdk.utils;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.os.Build;
import android.text.TextUtils;
import android.webkit.WebView;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.atomic.AtomicReference;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class fby {
    private static final AtomicReference<Boolean> ycx = new AtomicReference<>(null);

    /* renamed from: zb, reason: collision with root package name */
    private static final AtomicReference<String> f27141zb = new AtomicReference<>(null);

    public static int dj(Context context) throws ClassNotFoundException {
        try {
            Class.forName("com.google.android.play.core.splitinstall.SplitInstallManager");
            return 1;
        } catch (ClassNotFoundException unused) {
            return 0;
        }
    }

    private static PackageInfo ea(Context context) {
        try {
            String str = (String) Class.forName("android.webkit.WebViewUpdateService").getMethod("getCurrentWebViewPackageName", null).invoke(null, null);
            if (str == null) {
                return null;
            }
            return context.getPackageManager().getPackageInfo(str, 0);
        } catch (Throwable unused) {
            return null;
        }
    }

    private static boolean fby(Context context) throws ClassNotFoundException {
        try {
            Class.forName("com.unity3d.player.UnityPlayerActivity");
            return true;
        } catch (ClassNotFoundException unused) {
            if (context == null) {
                return false;
            }
            try {
                return new File(context.getApplicationInfo().nativeLibraryDir + "/libunity.so").exists();
            } catch (Throwable unused2) {
                return false;
            }
        }
    }

    private static boolean jc(Context context) throws ClassNotFoundException {
        try {
            Class.forName("com.facebook.react.ReactActivity");
            return true;
        } catch (ClassNotFoundException unused) {
            if (context == null) {
                return false;
            }
            try {
                return new File(context.getApplicationInfo().nativeLibraryDir + "/libreactnativejni.so").exists();
            } catch (Throwable unused2) {
                return false;
            }
        }
    }

    private static boolean jw(Context context) throws ClassNotFoundException {
        try {
            Class.forName("io.flutter.embedding.android.FlutterActivity");
            return true;
        } catch (ClassNotFoundException unused) {
            if (context == null) {
                return false;
            }
            try {
                return new File(context.getApplicationInfo().nativeLibraryDir + "/libflutter.so").exists();
            } catch (Throwable unused2) {
                return false;
            }
        }
    }

    public static PackageInfo lt(Context context) {
        try {
            return WebView.getCurrentWebViewPackage();
        } catch (ClassNotFoundException | IllegalAccessException | NoSuchMethodException | InvocationTargetException unused) {
            return null;
        }
    }

    public static String lud(Context context) {
        try {
            AtomicReference<String> atomicReference = f27141zb;
            String str = atomicReference.get();
            if (str != null) {
                return str;
            }
            PackageInfo packageInfoLt = lt(context);
            String str2 = packageInfoLt != null ? packageInfoLt.versionName : b.f42142b;
            while (!atomicReference.compareAndSet(null, str2) && atomicReference.get() == null) {
            }
            return str2;
        } catch (Throwable unused) {
            AtomicReference<String> atomicReference2 = f27141zb;
            while (!atomicReference2.compareAndSet(null, b.f42142b) && atomicReference2.get() == null) {
            }
            return b.f42142b;
        }
    }

    public static String sya(Context context) {
        try {
            return String.valueOf(context.getApplicationInfo().targetSdkVersion);
        } catch (Throwable unused) {
            return b.f42142b;
        }
    }

    /* JADX WARN: Failed to find 'out' block for switch in B:28:0x0057. Please report as an issue. */
    /* JADX WARN: Removed duplicated region for block: B:63:0x00ca  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean ul(Context context) {
        boolean z11;
        boolean zLud;
        boolean zLud2;
        try {
            AtomicReference<Boolean> atomicReference = ycx;
            Boolean bool = atomicReference.get();
            if (bool != null) {
                return bool.booleanValue();
            }
            String lowerCase = Build.BRAND;
            if (!TextUtils.isEmpty(lowerCase)) {
                lowerCase = lowerCase.toLowerCase();
            }
            String lowerCase2 = Build.MANUFACTURER;
            if (!TextUtils.isEmpty(lowerCase2)) {
                lowerCase2 = lowerCase2.toLowerCase();
            }
            if (TextUtils.isEmpty(lowerCase) && TextUtils.isEmpty(lowerCase2)) {
                Boolean bool2 = Boolean.FALSE;
                while (!atomicReference.compareAndSet(null, bool2) && atomicReference.get() == null) {
                }
                return false;
            }
            if (!TextUtils.isEmpty(lowerCase)) {
                switch (lowerCase.hashCode()) {
                    case -759499589:
                        if (lowerCase.equals("xiaomi")) {
                            zLud2 = lud();
                            zLud = zLud2;
                            z11 = false;
                            break;
                        }
                        z11 = true;
                        zLud = false;
                        break;
                    case 3418016:
                        if (lowerCase.equals("oppo")) {
                            zLud2 = jw();
                            zLud = zLud2;
                            z11 = false;
                            break;
                        }
                        z11 = true;
                        zLud = false;
                        break;
                    case 3620012:
                        if (lowerCase.equals("vivo")) {
                            zLud2 = lt();
                            zLud = zLud2;
                            z11 = false;
                            break;
                        }
                        z11 = true;
                        zLud = false;
                        break;
                    case 1864941562:
                        if (lowerCase.equals("samsung")) {
                            zLud2 = dj();
                            zLud = zLud2;
                            z11 = false;
                            break;
                        }
                        z11 = true;
                        zLud = false;
                        break;
                    default:
                        z11 = true;
                        zLud = false;
                        break;
                }
            } else {
                z11 = false;
                zLud = false;
            }
            if (z11 && !TextUtils.isEmpty(lowerCase2)) {
                switch (lowerCase2.hashCode()) {
                    case -759499589:
                        if (!lowerCase2.equals("xiaomi")) {
                            zLud = false;
                            break;
                        } else {
                            zLud = lud();
                            break;
                        }
                    case 3418016:
                        if (lowerCase2.equals("oppo")) {
                            zLud = jw();
                            break;
                        }
                        break;
                    case 3620012:
                        if (lowerCase2.equals("vivo")) {
                            zLud = lt();
                            break;
                        }
                        break;
                    case 1864941562:
                        if (lowerCase2.equals("samsung")) {
                            zLud = dj();
                            break;
                        }
                        break;
                    default:
                        zLud = false;
                        break;
                }
            }
            Boolean boolValueOf = Boolean.valueOf(zLud);
            while (!atomicReference.compareAndSet(null, boolValueOf) && atomicReference.get() == null) {
            }
            return zLud;
        } catch (Throwable unused) {
            AtomicReference<Boolean> atomicReference2 = ycx;
            Boolean bool3 = Boolean.FALSE;
            while (!atomicReference2.compareAndSet(null, bool3) && atomicReference2.get() == null) {
            }
            return false;
        }
    }

    public static void ycx(Context context) {
        if (context == null) {
            return;
        }
        try {
            if (zb()) {
                com.bytedance.sdk.openadsdk.core.sya syaVarYcx = com.bytedance.sdk.openadsdk.core.sya.ycx();
                syaVarYcx.ycx("w_ver", lud(context));
                syaVarYcx.ycx("bp", zb(context));
                syaVarYcx.ycx("is_fold", ul(context) ? 1 : 0);
                syaVarYcx.ycx("abi", ycx());
                syaVarYcx.ycx("t_ver", sya(context));
                syaVarYcx.ycx("aab", dj(context));
            }
        } catch (Throwable unused) {
        }
    }

    public static int zb(Context context) {
        if (fby(context)) {
            return 1;
        }
        if (jw(context)) {
            return 2;
        }
        return jc(context) ? 3 : 4;
    }

    private static boolean dj() {
        String lowerCase;
        if (ea()) {
            return true;
        }
        String[] strArr = {"sm-f9000", "sm-f9160", "sm-f9260", "sm-f9360", "sm-f9460", "sm-f9560", "sm-f7000", "sm-f7070", "sm-f7110", "sm-f7210", "sm-f7310", "sm-f7410"};
        String[] strArr2 = {"winner", "f2q", "q2q", "q4q", "q5q", "q6q", "bloomq", "bloomxq", "b2q", "b4q", "b5q", "b6q"};
        try {
            String lowerCase2 = Build.DEVICE.toLowerCase();
            if (!TextUtils.isEmpty(lowerCase2)) {
                for (int i5 = 0; i5 < 12; i5++) {
                    if (lowerCase2.contains(strArr2[i5])) {
                        return true;
                    }
                }
            }
            lowerCase = Build.MODEL.toLowerCase();
        } catch (Throwable unused) {
        }
        if (TextUtils.isEmpty(lowerCase)) {
            return false;
        }
        for (int i11 = 0; i11 < 12; i11++) {
            if (lowerCase.contains(strArr[i11])) {
                return true;
            }
        }
        if (zb()) {
            String strYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("fold_config", "fold_samung", b.f42142b);
            if (TextUtils.isEmpty(strYcx)) {
                return false;
            }
            for (String str : strYcx.split(",")) {
                if (lowerCase.contains(str)) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean lt() {
        if (ul()) {
            return true;
        }
        String[] strArr = {"V2330", "V2178A", "V2229A", "V2303A", "V2337A", "V2256A", "V2266A"};
        try {
            String lowerCase = Build.MODEL.toLowerCase();
            if (!TextUtils.isEmpty(lowerCase)) {
                for (int i5 = 0; i5 < 7; i5++) {
                    if (lowerCase.contains(strArr[i5].toLowerCase())) {
                        return true;
                    }
                }
                if (zb()) {
                    String strSya = sya();
                    if (TextUtils.isEmpty(strSya)) {
                        return false;
                    }
                    for (String str : strSya.split(",")) {
                        if (lowerCase.contains(str.toLowerCase())) {
                            return true;
                        }
                    }
                }
            }
        } catch (Throwable unused) {
        }
        return false;
    }

    private static boolean fby() {
        try {
            return ((Integer) Class.forName("android.os.SystemProperties").getMethod("getInt", String.class, Integer.TYPE).invoke(null, "persist.sys.muiltdisplay_type", 0)).intValue() == 2;
        } catch (Throwable th2) {
            com.bytedance.sdk.component.utils.htf.sya("BED", "isXiaomiFold return false " + th2.getMessage());
            return false;
        }
    }

    private static boolean jc() {
        try {
            Class<?> cls = Class.forName("com.oplus.content.OplusFeatureConfigManager");
            Object objInvoke = cls.getDeclaredMethod("hasFeature", String.class).invoke(cls.getMethod("getInstance", null).invoke(null, null), "oplus.hardware.type.fold");
            if (objInvoke instanceof Boolean) {
                return ((Boolean) objInvoke).booleanValue();
            }
            return false;
        } catch (ClassNotFoundException | IllegalAccessException | NoSuchMethodException | InvocationTargetException e3) {
            com.bytedance.sdk.component.utils.htf.sya("BED", "get oppo fold properties error, msg: " + e3.getMessage());
            return false;
        } catch (Throwable unused) {
            return false;
        }
    }

    private static boolean jw() {
        if (jc()) {
            return true;
        }
        String[] strArr = {"CPH2439", "CPH2437", "CPH2499", "CPH2519", "PEUM00", "PGU110", "PGT110", "PHN110", "PHT110"};
        try {
            String lowerCase = Build.MODEL.toLowerCase();
            if (!TextUtils.isEmpty(lowerCase)) {
                for (int i5 = 0; i5 < 9; i5++) {
                    if (lowerCase.contains(strArr[i5].toLowerCase())) {
                        return true;
                    }
                }
                if (zb()) {
                    String strSya = sya();
                    if (TextUtils.isEmpty(strSya)) {
                        return false;
                    }
                    for (String str : strSya.split(",")) {
                        if (lowerCase.contains(str.toLowerCase())) {
                            return true;
                        }
                    }
                }
            }
        } catch (Throwable unused) {
        }
        return false;
    }

    public static String sya() {
        return com.bytedance.sdk.openadsdk.dv.lud.ycx("fold_config", "fold_default", b.f42142b);
    }

    public static void zb(JSONObject jSONObject, Context context) {
        try {
            if (zb()) {
                String strZb = com.bytedance.sdk.openadsdk.core.sya.ycx().zb("w_ver", lud(context));
                if (TextUtils.isEmpty(strZb)) {
                    return;
                }
                jSONObject.put("w_ver", strZb);
            }
        } catch (Throwable unused) {
        }
    }

    private static boolean ea() throws IllegalAccessException, NoSuchMethodException, ClassNotFoundException, SecurityException, IllegalArgumentException, InvocationTargetException {
        try {
            Class<?> cls = Class.forName("com.samsung.android.feature.SemFloatingFeature");
            Object objInvoke = cls.getMethod("getInstance", null).invoke(null, null);
            Method declaredMethod = cls.getDeclaredMethod("getString", String.class);
            if ("TRUE".equalsIgnoreCase((String) declaredMethod.invoke(objInvoke, "SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_FOLDABLE_TYPE_FOLD"))) {
                return true;
            }
            return "TRUE".equalsIgnoreCase((String) declaredMethod.invoke(objInvoke, "SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_FOLDABLE_TYPE_FLIP"));
        } catch (ClassNotFoundException | IllegalAccessException | NoSuchMethodException | InvocationTargetException e3) {
            com.bytedance.sdk.component.utils.htf.sya("PAG_BANNER", "get ss fold device error: " + e3.getMessage());
            return false;
        }
    }

    private static boolean lud() {
        if (fby()) {
            return true;
        }
        String[] strArr = {"M2011J18C", "22061218C", "2308CPXD0C", "24072PX77C", "2405CPX3DC", "2405CPX3DG"};
        try {
            String lowerCase = Build.MODEL.toLowerCase();
            if (!TextUtils.isEmpty(lowerCase)) {
                for (int i5 = 0; i5 < 6; i5++) {
                    if (lowerCase.contains(strArr[i5])) {
                        return true;
                    }
                }
                if (zb()) {
                    String strSya = sya();
                    if (TextUtils.isEmpty(strSya)) {
                        return false;
                    }
                    for (String str : strSya.split(",")) {
                        if (lowerCase.contains(str)) {
                            return true;
                        }
                    }
                }
            }
        } catch (Throwable unused) {
        }
        return false;
    }

    public static boolean zb() {
        return com.bytedance.sdk.openadsdk.dv.lud.ycx("fold_config", "enable", 0) == 1;
    }

    public static String ycx() {
        try {
            return Build.SUPPORTED_ABIS[0];
        } catch (Exception unused) {
            return b.f42142b;
        }
    }

    public static void ycx(JSONObject jSONObject, Context context) {
        if (context == null) {
            return;
        }
        try {
            if (zb()) {
                com.bytedance.sdk.openadsdk.core.sya syaVarYcx = com.bytedance.sdk.openadsdk.core.sya.ycx();
                String strZb = syaVarYcx.zb("md", com.bytedance.sdk.openadsdk.core.jc.zb().ul());
                if (!TextUtils.isEmpty(strZb)) {
                    jSONObject.put("md", strZb);
                }
                int iZb = syaVarYcx.zb("bp", zb(context));
                if (iZb != 4) {
                    jSONObject.put("bp", iZb);
                }
                String strZb2 = syaVarYcx.zb("t_ver", sya(context));
                if (!TextUtils.isEmpty(strZb2)) {
                    jSONObject.put("t_ver", strZb2);
                }
                jSONObject.put("is_fold", syaVarYcx.zb("is_fold", ul(context) ? 1 : 0));
                jSONObject.put("aab", syaVarYcx.zb("aab", dj(context)));
                String strZb3 = syaVarYcx.zb("abi", ycx());
                if (TextUtils.isEmpty(strZb3)) {
                    return;
                }
                jSONObject.put("abi", strZb3);
            }
        } catch (Throwable unused) {
        }
    }

    private static boolean ul() {
        try {
            return "foldable".equals(Class.forName("android.util.FtDeviceInfo").getMethod("getDeviceType", null).invoke(null, null));
        } catch (Throwable th2) {
            com.bytedance.sdk.component.utils.htf.sya("BED", "isVIVOFoldDevice return false " + th2.getMessage());
            return false;
        }
    }
}
