package com.bytedance.sdk.openadsdk.utils;

import android.os.Build;
import android.text.TextUtils;
import com.google.android.gms.internal.measurement.k2;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class bhi {

    /* renamed from: lt, reason: collision with root package name */
    private static int f27114lt = Integer.MAX_VALUE;
    private static String lud = null;
    public static boolean ycx = false;

    /* renamed from: zb, reason: collision with root package name */
    public static boolean f27116zb = false;
    private static final CharSequence sya = "amigo";

    /* renamed from: dj, reason: collision with root package name */
    private static final CharSequence f27113dj = "funtouch";

    /* renamed from: ul, reason: collision with root package name */
    private static final ConcurrentHashMap<String, String> f27115ul = new ConcurrentHashMap<>();

    public static class ycx implements Callable<String> {
        private final String ycx;

        public ycx(String str) {
            this.ycx = str;
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public String call() throws Exception {
            String str = (String) bhi.f27115ul.get(this.ycx);
            if (str != null) {
                return str;
            }
            String strSya = bhi.sya(this.ycx);
            if (strSya != null) {
                bhi.f27115ul.put(this.ycx, strSya);
            }
            return strSya;
        }
    }

    public static String dj() {
        return dj("ro.build.uiversion") + "_" + Build.DISPLAY;
    }

    public static boolean dy() {
        return "smartisan".equalsIgnoreCase(Build.MANUFACTURER) || "smartisan".equalsIgnoreCase(Build.BRAND);
    }

    public static String ea() {
        if (!ok()) {
            return b.f42142b;
        }
        return "eui_" + dj("ro.letv.release.version") + "_" + Build.DISPLAY;
    }

    public static boolean fby() {
        String strDj = dj("ro.vivo.os.build.display.id");
        return !TextUtils.isEmpty(strDj) && strDj.toLowerCase().contains(f27113dj);
    }

    public static String htf() {
        if (!uh()) {
            return b.f42142b;
        }
        return "coloros_" + dj(oby.jw("ro.build.version.kllkrom")) + "_" + Build.DISPLAY;
    }

    public static String jc() {
        return Build.DISPLAY + "_" + dj("ro.gn.sv.version");
    }

    public static boolean jw() {
        String str = Build.DISPLAY;
        return !TextUtils.isEmpty(str) && str.toLowerCase().contains(sya);
    }

    public static boolean lt() throws ClassNotFoundException {
        if (!f27116zb) {
            try {
                Class.forName("miui.os.Build");
                ycx = true;
                f27116zb = true;
                return true;
            } catch (Exception unused) {
                f27116zb = true;
            }
        }
        return ycx;
    }

    public static boolean lud() {
        String str = Build.MANUFACTURER + Build.BRAND;
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        String lowerCase = str.toLowerCase();
        return lowerCase.contains("360") || lowerCase.contains("qiku");
    }

    public static boolean ok() {
        return !TextUtils.isEmpty(dj("ro.letv.release.version"));
    }

    public static String pmi() {
        String str = Build.DISPLAY;
        return (str == null || !str.toLowerCase().contains("flyme")) ? b.f42142b : str;
    }

    public static String ry() {
        if (!lt()) {
            return b.f42142b;
        }
        return "miui_" + dj("ro.miui.ui.version.name") + "_" + Build.VERSION.INCREMENTAL;
    }

    public static boolean sya() {
        return Build.DISPLAY.contains("Flyme") || Build.USER.equals("flyme");
    }

    public static String syc() {
        return dj("ro.build.version.emui");
    }

    public static boolean thx() {
        try {
            String str = Build.BRAND;
            if (TextUtils.isEmpty(str) || !str.toLowerCase().startsWith("huawei")) {
                String str2 = Build.MANUFACTURER;
                if (TextUtils.isEmpty(str2)) {
                    return false;
                }
                if (!str2.toLowerCase().startsWith("huawei")) {
                    return false;
                }
            }
            return true;
        } catch (Throwable unused) {
            return false;
        }
    }

    private static String tn() {
        if (dy()) {
            return wie();
        }
        if (lt()) {
            return ry();
        }
        if (sya()) {
            return pmi();
        }
        if (uh()) {
            return htf();
        }
        String strXkz = xkz();
        if (!TextUtils.isEmpty(strXkz)) {
            return strXkz;
        }
        if (fby()) {
            return ul();
        }
        if (jw()) {
            return jc();
        }
        if (lud()) {
            return dj();
        }
        String strEa = ea();
        return !TextUtils.isEmpty(strEa) ? strEa : Build.DISPLAY;
    }

    public static boolean uh() {
        if (f27114lt == Integer.MAX_VALUE) {
            String str = Build.MANUFACTURER;
            String strJw = oby.jw("kllk");
            if (TextUtils.isEmpty(str) || !str.toLowerCase().contains(strJw)) {
                f27114lt = 0;
            } else {
                f27114lt = 1;
            }
        }
        return f27114lt == 1;
    }

    public static String ul() {
        return dj("ro.vivo.os.build.display.id") + "_" + dj("ro.vivo.product.version");
    }

    public static String wie() {
        if (dy()) {
            try {
                return "smartisan_".concat(String.valueOf(dj("ro.smartisan.version")));
            } catch (Throwable unused) {
            }
        }
        return Build.DISPLAY;
    }

    public static String xkz() {
        String strSyc = syc();
        if (strSyc == null || !strSyc.toLowerCase().contains("emotionui")) {
            return b.f42142b;
        }
        StringBuilder sbK = k2.k(strSyc, "_");
        sbK.append(Build.DISPLAY);
        return sbK.toString();
    }

    public static String ycx() throws JSONException {
        if (!TextUtils.isEmpty(lud)) {
            return lud;
        }
        String strYcx = com.bytedance.sdk.openadsdk.core.jc.ycx("sdk_local_rom_info", 604800000L);
        lud = strYcx;
        if (TextUtils.isEmpty(strYcx)) {
            String strTn = tn();
            lud = strTn;
            com.bytedance.sdk.openadsdk.core.jc.ycx("sdk_local_rom_info", strTn);
        }
        return lud;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static String dj(String str) {
        String str2;
        String str3 = f27115ul.get(str);
        if (str3 != null) {
            return str3;
        }
        if (TextUtils.isEmpty(b.f42142b)) {
            final com.bytedance.sdk.component.fby.zb.zb zbVar = new com.bytedance.sdk.component.fby.zb.zb(new ycx(str), 5, 2);
            yzp.sya((Runnable) new com.bytedance.sdk.component.fby.zb.sya("_getSystemPropertyTask") { // from class: com.bytedance.sdk.openadsdk.utils.bhi.1
                @Override // java.lang.Runnable
                public void run() {
                    zbVar.run();
                }
            });
            str2 = (String) zbVar.get(1L, TimeUnit.SECONDS);
        } else {
            str2 = b.f42142b;
        }
        return str2 == null ? b.f42142b : str2;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Can't wrap try/catch for region: R(8:0|2|(4:49|3|43|4)|(2:51|5)|39|6|34|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0034, code lost:
    
        r8 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:9:0x0035, code lost:
    
        com.bytedance.sdk.component.utils.htf.ycx("ToolUtils", "Exception while closing InputStream", r8);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static String sya(String str) throws IOException {
        BufferedReader bufferedReader;
        Throwable th2;
        Process processExec;
        String line = b.f42142b;
        Process process = null;
        try {
            try {
                processExec = Runtime.getRuntime().exec("getprop ".concat(String.valueOf(str)));
                try {
                    bufferedReader = new BufferedReader(new InputStreamReader(processExec.getInputStream()), 1024);
                } catch (IllegalThreadStateException unused) {
                    bufferedReader = null;
                }
            } catch (Throwable th3) {
                bufferedReader = null;
                th2 = th3;
            }
        } catch (IllegalThreadStateException unused2) {
            bufferedReader = null;
        }
        try {
            line = bufferedReader.readLine();
            processExec.exitValue();
        } catch (IllegalThreadStateException unused3) {
            process = processExec;
            try {
                process.destroy();
            } catch (Throwable unused4) {
            }
            if (bufferedReader != null) {
                bufferedReader.close();
            }
            return line;
        } catch (Throwable th4) {
            th2 = th4;
            try {
                com.bytedance.sdk.component.utils.htf.ycx("ToolUtils", "Unable to read sysprop ".concat(String.valueOf(str)), th2);
                return line;
            } finally {
                if (bufferedReader != null) {
                    try {
                        bufferedReader.close();
                    } catch (IOException e3) {
                        com.bytedance.sdk.component.utils.htf.ycx("ToolUtils", "Exception while closing InputStream", e3);
                    }
                }
            }
        }
        bufferedReader.close();
        return line;
    }

    public static boolean zb() {
        try {
            String strYcx = ycx();
            if (TextUtils.isEmpty(strYcx) || !strYcx.startsWith("miui")) {
                return false;
            }
            String str = Build.VERSION.INCREMENTAL;
            if (TextUtils.isEmpty(str)) {
                return false;
            }
            return str.toLowerCase().startsWith("v12");
        } catch (Throwable unused) {
            return false;
        }
    }

    public static boolean ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            str = syc();
        }
        return (!TextUtils.isEmpty(str) && str.toLowerCase().startsWith("emotionui")) || thx();
    }
}
