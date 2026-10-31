package com.bytedance.sdk.openadsdk.utils;

import android.app.Activity;
import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Environment;
import android.os.Looper;
import android.os.StatFs;
import android.text.TextUtils;
import android.util.Pair;
import android.view.View;
import android.view.accessibility.AccessibilityManager;
import android.webkit.WebBackForwardList;
import android.webkit.WebHistoryItem;
import android.webkit.WebSettings;
import android.webkit.WebView;
import androidx.recyclerview.widget.s2;
import androidx.recyclerview.widget.u1;
import b.c0;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.openadsdk.AdSlot;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.UrlConst;
import com.vungle.ads.internal.protos.Sdk;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.Set;
import java.util.TimeZone;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Pattern;
import nb.c;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class oby {

    /* renamed from: ea, reason: collision with root package name */
    private static final HashSet<String> f27151ea;

    /* renamed from: ok, reason: collision with root package name */
    private static final byte[] f27155ok;

    /* renamed from: ry, reason: collision with root package name */
    private static final byte[] f27156ry;
    private static String syc;
    private static String xkz;
    public static Integer ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static final ExecutorService f27158zb = Executors.newSingleThreadExecutor();
    private static volatile boolean sya = false;

    /* renamed from: dj, reason: collision with root package name */
    private static final AtomicInteger f27150dj = new AtomicInteger(0);
    private static volatile String lud = b.f42142b;

    /* renamed from: lt, reason: collision with root package name */
    private static final ReentrantLock f27154lt = new ReentrantLock();

    /* renamed from: ul, reason: collision with root package name */
    private static String f27157ul = null;
    private static String fby = null;

    /* renamed from: jw, reason: collision with root package name */
    private static String f27153jw = null;

    /* renamed from: jc, reason: collision with root package name */
    private static final HashSet<String> f27152jc = new HashSet<>(Arrays.asList("Asia/Shanghai", "Asia/Urumqi", "Asia/Chongqing", "Asia/Harbin", "Asia/Kashgar"));

    /* renamed from: com.bytedance.sdk.openadsdk.utils.oby$2, reason: invalid class name */
    public static class AnonymousClass2 implements Runnable {
        @Override // java.lang.Runnable
        public void run() {
            try {
                if (TextUtils.isEmpty(oby.lud)) {
                    com.bytedance.sdk.component.jw.fby fbyVar = new com.bytedance.sdk.component.jw.fby(com.bytedance.sdk.openadsdk.core.pmi.ycx(), fby.sya.USER_AGENT);
                    fbyVar.setWebViewClient(new fby.ycx());
                    String unused = oby.lud = fbyVar.getUserAgentString();
                    com.bytedance.sdk.component.utils.bhi.ycx(fbyVar);
                }
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuTDoU=", "Sfsj", 371);
                com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", b.f42142b, e3);
            } catch (NoClassDefFoundError e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuTDoU=", "Sfsj", 373);
                com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", b.f42142b, e11);
            }
        }
    }

    public static class sya {
        private static final int ycx;

        static {
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", "init hasBindingAdapterPositionMethod start status = 0");
            int i5 = 2;
            try {
                int i11 = s2.f15123a;
                if (s2.class.getDeclaredMethod("getBindingAdapterPosition", null) != null) {
                    i5 = 0;
                }
            } catch (ClassNotFoundException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuTDvtclgiIJ1fqKIc=", "B+0hnA21fZk=", 1725);
                i5 = 1;
            } catch (NoSuchMethodException e11) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuTDvtclgiIJ1fqKIc=", "B+0hnA21fZk=", 1727);
            }
            ycx = i5;
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", "init hasBindingAdapterPositionMethod end status = ".concat(String.valueOf(i5)));
        }
    }

    public static class ycx implements Callable<String> {
        private final int ycx;

        public ycx(int i5) {
            this.ycx = i5;
        }

        private synchronized String sya() {
            final String[] strArr;
            strArr = new String[]{"unKnow"};
            final CountDownLatch countDownLatch = new CountDownLatch(1);
            yzp.ycx(new Runnable() { // from class: com.bytedance.sdk.openadsdk.utils.oby.ycx.1
                @Override // java.lang.Runnable
                public void run() {
                    strArr[0] = oby.kgy();
                    String str = strArr[0];
                    countDownLatch.countDown();
                }
            });
            try {
                countDownLatch.await(2L, TimeUnit.SECONDS);
            } catch (InterruptedException e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuTDvBYmCSzLUnPKpANqF3Gk0E=", "XOs5oga+X86FXeJc", 470);
                com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", e3.getMessage());
            }
            return strArr[0];
        }

        private String zb() {
            String property;
            Throwable th2;
            try {
                property = System.getProperty("http.agent");
                if (property != null) {
                    try {
                        if (!"unKnow".equals(property)) {
                            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("android_system_ua", property);
                            return property;
                        }
                    } catch (Throwable th3) {
                        th2 = th3;
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuTDvBYmCSzLUnPKpANqF3Gk0E=", "XOs5tA24e8iJTuREnwWlJW7v", 451);
                        com.bytedance.sdk.component.utils.htf.sya("getUA", "e:" + th2.getMessage());
                        return property;
                    }
                }
                return property;
            } catch (Throwable th4) {
                property = "unKnow";
                th2 = th4;
            }
        }

        @Override // java.util.concurrent.Callable
        /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
        public synchronized String call() throws Exception {
            String strZb;
            try {
                strZb = "unKnow";
                int i5 = this.ycx;
                if (i5 == 1) {
                    strZb = sya();
                } else if (i5 == 2) {
                    strZb = zb();
                }
            } catch (Throwable th2) {
                throw th2;
            }
            return strZb;
        }
    }

    public static class zb {
        public final ComponentName ycx;

        /* renamed from: zb, reason: collision with root package name */
        public final int f27160zb;

        public zb(ComponentName componentName, int i5) {
            this.ycx = componentName;
            this.f27160zb = i5;
        }
    }

    static {
        HashSet<String> hashSet = new HashSet<>();
        f27151ea = hashSet;
        hashSet.addAll(Arrays.asList("America/Eirunepe", "America/Rio_Branco", "America/Boa_Vista", "America/Campo_Grande", "America/Cuiaba", "America/Manaus", "America/Porto_Velho", "America/Araguaina", "America/Bahia", "America/Belem", "America/Fortaleza", "America/Maceio", "America/Recife", "America/Santarem", "America/Sao_Paulo", "America/Noronha"));
        ycx = null;
        f27155ok = new byte[]{108, 111, 97, 100, 105, 110, 103};
        f27156ry = new byte[]{97, 114, 98, 105, 116, 114, 97, 103, 101};
    }

    public static int aeu() {
        return sya.ycx;
    }

    public static String av() {
        String str = xkz;
        if (!TextUtils.isEmpty(str)) {
            return str;
        }
        String str2 = new String(f27155ok);
        xkz = str2;
        return str2;
    }

    public static boolean bhi() {
        return f27150dj.get() == 1;
    }

    public static boolean dj(int i5) {
        return i5 == 4;
    }

    public static String dv() {
        try {
            return TimeZone.getDefault().getID();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oQqxbP2PRNJ+hQW5", 978);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", e3.toString());
            return b.f42142b;
        }
    }

    public static int dy() {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("is_root", -1);
    }

    public static String ea() {
        return sya("MemTotal");
    }

    public static synchronized String fby() {
        try {
            if (TextUtils.isEmpty(f27153jw) && com.bytedance.sdk.openadsdk.core.pmi.ycx() != null) {
                try {
                    PackageInfo packageInfo = com.bytedance.sdk.openadsdk.core.pmi.ycx().getPackageManager().getPackageInfo(lt(), 0);
                    fby = String.valueOf(packageInfo.versionCode);
                    f27153jw = packageInfo.versionName;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5owaues6PRPlcgRQ=", 531);
                    com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", "ToolUtils getVersionName throws exception :", th2);
                }
            }
        } catch (Throwable th3) {
            throw th3;
        }
        return f27153jw;
    }

    public static int hf() {
        int rawOffset = TimeZone.getDefault().getRawOffset() / 3600000;
        if (rawOffset < -12) {
            rawOffset = -12;
        }
        if (rawOffset > 12) {
            return 12;
        }
        return rawOffset;
    }

    public static List<String> htf() {
        ArrayList arrayList = new ArrayList();
        Set<String> setQn = com.bytedance.sdk.openadsdk.core.pmi.dj().qn();
        if (setQn != null && !setQn.isEmpty()) {
            for (String str : setQn) {
                if (!TextUtils.isEmpty(str)) {
                    arrayList.add(str);
                }
            }
        }
        return arrayList;
    }

    private static boolean ifb() {
        try {
            return "mounted".equals(Environment.getExternalStorageState());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XvY5kBGyaMutT9pSngiBPlrnIZQBsGw=", 740);
            return false;
        }
    }

    public static String jc() {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("total_memory", "0");
    }

    public static String jw() {
        try {
            ActivityManager activityManager = (ActivityManager) com.bytedance.sdk.openadsdk.core.pmi.ycx().getSystemService("activity");
            ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
            activityManager.getMemoryInfo(memoryInfo);
            long j11 = memoryInfo.totalMem;
            if (j11 > 0) {
                return String.valueOf(j11 / 1024);
            }
            return null;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oQyoaMutT9pSngiCMXrtOZwVtX3erUvZXIsUsg==", 605);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String kgy() {
        try {
            WebView webView = new WebView(com.bytedance.sdk.openadsdk.core.pmi.ycx());
            webView.setWebViewClient(new fby.ycx());
            String userAgentString = webView.getSettings().getUserAgentString();
            if (userAgentString == null || "unKnow".equals(userAgentString)) {
                return userAgentString;
            }
            com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("webview_ua", userAgentString);
            return userAgentString;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oga+X86FXeJc", TTAdConstant.IMAGE_CODE);
            com.bytedance.sdk.component.utils.htf.sya("getUA", "e:" + th2.getMessage());
            return "unKnow";
        }
    }

    public static boolean lt(int i5) {
        return i5 == 6;
    }

    public static boolean lud(int i5) {
        return i5 == 5;
    }

    public static long ok() {
        try {
            StatFs statFs = new StatFs(Environment.getDataDirectory().getPath());
            return statFs.getBlockCountLong() * statFs.getBlockSizeLong();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oQyoaMupRMNYnh+hJGj6IocCu2z0iVDS", 694);
            return 0L;
        }
    }

    public static int oty() {
        try {
            String id2 = TimeZone.getDefault().getID();
            if (f27152jc.contains(id2)) {
                return 2;
            }
            if (id2 != null && id2.startsWith("Asia/")) {
                return 2;
            }
            if (id2 != null && id2.startsWith("Europe/")) {
                return 4;
            }
            if (id2 == null || !id2.startsWith("America/")) {
                return 3;
            }
            return !f27151ea.contains(id2) ? 5 : 3;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oQqxbP2PRNI=", 1013);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", th2.toString());
            return 0;
        }
    }

    public static String pmi() {
        String strDwi = com.bytedance.sdk.openadsdk.core.pmi.dj().dwi();
        return TextUtils.isEmpty(strDwi) ? tn.ycx() : strDwi;
    }

    public static String rmf() {
        String str = syc;
        if (!TextUtils.isEmpty(str)) {
            return str;
        }
        String str2 = new String(f27156ry);
        syc = str2;
        return str2;
    }

    public static String sya(int i5) {
        return i5 != 1 ? i5 != 2 ? (i5 == 3 || i5 == 4) ? "open_ad" : i5 != 7 ? i5 != 8 ? "embeded_ad" : "fullscreen_interstitial_ad" : "rewarded_video" : "interaction" : "banner_ad";
    }

    public static long syc() {
        try {
            if (!ifb()) {
                return 0L;
            }
            StatFs statFs = new StatFs(Environment.getExternalStorageDirectory().getPath());
            return statFs.getBlockCount() * statFs.getBlockSize();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5pge/aNWEed5HiQ==", 728);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", th2.getMessage());
            return 0L;
        }
    }

    public static String thx() {
        String strCi = com.bytedance.sdk.openadsdk.core.settings.ea.ci();
        if (!TextUtils.isEmpty(strCi)) {
            return strCi;
        }
        String strOby = com.bytedance.sdk.openadsdk.core.pmi.dj().oby();
        return TextUtils.isEmpty(strOby) ? tn.ycx() : strOby;
    }

    public static String tn() {
        return "https://lf-static.tiktokpangle-cdn-us.com/obj/ad-pattern-tx/renderer/package_tx.json";
    }

    public static String tru() {
        int i5 = -hf();
        return i5 >= 0 ? "Etc/GMT+".concat(String.valueOf(i5)) : "Etc/GMT".concat(String.valueOf(i5));
    }

    public static String uh() {
        String strUjb = com.bytedance.sdk.openadsdk.core.pmi.dj().ujb();
        if (!TextUtils.isEmpty(strUjb)) {
            return strUjb;
        }
        String strYcx = tn.ycx();
        return !TextUtils.isEmpty(strYcx) ? c0.l(UrlConst.HTTPS, strYcx, "/service/2/dual_events/") : strUjb;
    }

    public static int ul(int i5) {
        if (i5 == 1) {
            return 0;
        }
        if (i5 == 4) {
            return 1;
        }
        if (i5 == 5) {
            return 4;
        }
        if (i5 != 6) {
            return i5;
        }
        return 5;
    }

    public static boolean wie() {
        try {
            if (new File("/system/bin/su").exists()) {
                return true;
            }
            return new File("/system/xbin/su").exists();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "Uv0fmgyo", 759);
            return false;
        }
    }

    public static String wwx() {
        return "https://log.byteoversea.com/service/2/app_log_test/";
    }

    public static long xkz() {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("total_sdcard_storage", 0L).longValue();
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, View view) {
    }

    public static boolean zb(Context context, String str) {
        if (context != null && !TextUtils.isEmpty(str)) {
            try {
                Intent intent = new Intent("android.intent.action.DIAL", Uri.parse("tel:" + Uri.encode(str)));
                if (!(context instanceof Activity)) {
                    intent.setFlags(268435456);
                }
                com.bytedance.sdk.component.utils.zb.ycx(context, intent, null);
                return true;
            } catch (Exception e3) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "SPoshxeMYciOT+RenhSlJg==", 160);
            }
        }
        return false;
    }

    public static boolean dj(Context context) {
        return false;
    }

    public static boolean ea(String str) {
        if (com.bytedance.sdk.openadsdk.core.syc.lud()) {
            return true;
        }
        com.bytedance.sdk.component.utils.htf.sya(c0.l("You must use method '", str, "' after initialization, please check."), new Object[0]);
        return false;
    }

    public static long jc(String str) {
        if (TextUtils.isEmpty(str)) {
            return 0L;
        }
        try {
            String[] strArrSplit = str.split("\\.");
            if (strArrSplit.length == 0) {
                return 0L;
            }
            StringBuilder sb2 = new StringBuilder();
            sb2.append(strArrSplit[0]);
            for (int i5 = 1; i5 < strArrSplit.length; i5++) {
                String str2 = strArrSplit[i5];
                if (!fby(str2)) {
                    return 0L;
                }
                if (str2.length() == 1) {
                    sb2.append("0");
                    sb2.append(str2);
                } else {
                    sb2.append(str2);
                }
                if (sb2.length() > 18) {
                    return 0L;
                }
            }
            String string = sb2.toString();
            if (TextUtils.isEmpty(string)) {
                return 0L;
            }
            return Long.parseLong(string);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5sxawZfSEQeFYngKpJ1XNIpEG", 1434);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", e3.getMessage());
            return 0L;
        }
    }

    public static synchronized String lt() {
        Context contextYcx;
        try {
            if (TextUtils.isEmpty(f27157ul) && (contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx()) != null) {
                try {
                    f27157ul = contextYcx.getPackageName();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5pQK/YsaHT/lcgRQ=", 493);
                    com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", "ToolUtils getPackageName throws exception :", th2);
                }
            }
        } catch (Throwable th3) {
            throw th3;
        }
        return f27157ul;
    }

    public static String lud() {
        return tru.ycx();
    }

    public static long ry() {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("free_internal_storage", 0L).longValue();
    }

    public static synchronized String ul() {
        try {
            if (TextUtils.isEmpty(fby) && com.bytedance.sdk.openadsdk.core.pmi.ycx() != null) {
                try {
                    PackageInfo packageInfo = com.bytedance.sdk.openadsdk.core.pmi.ycx().getPackageManager().getPackageInfo(lt(), 0);
                    fby = String.valueOf(packageInfo.versionCode);
                    f27153jw = packageInfo.versionName;
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5owaues6PRPRSiBQ=", EventBridgeChannel.QUEUE_CAPACITY);
                    com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", "ToolUtils getVersionCode throws exception :", th2);
                }
            }
        } catch (Throwable th3) {
            throw th3;
        }
        return fby;
    }

    private static String xkz(String str) {
        try {
            return Uri.parse(str).buildUpon().appendQueryParameter("aid", "1371").appendQueryParameter("device_platform", "android").appendQueryParameter("version_code", ul()).toString();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "Wuoppgq7Z/eBWNZQnw==", 919);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", e3.getMessage());
            return str;
        }
    }

    public static Intent ycx(Context context, String str) {
        Intent launchIntentForPackage = context.getPackageManager().getLaunchIntentForPackage(str);
        if (launchIntentForPackage == null) {
            return null;
        }
        if (!launchIntentForPackage.hasCategory("android.intent.category.LAUNCHER")) {
            launchIntentForPackage.addCategory("android.intent.category.LAUNCHER");
        }
        launchIntentForPackage.setPackage(null);
        launchIntentForPackage.addFlags(2097152);
        launchIntentForPackage.addFlags(268435456);
        return launchIntentForPackage;
    }

    public static String dj() {
        if (!TextUtils.isEmpty(lud)) {
            return lud;
        }
        com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx());
        String strYcx = com.bytedance.sdk.openadsdk.core.jc.ycx("sdk_local_web_ua", 86400000L);
        lud = strYcx;
        if (TextUtils.isEmpty(strYcx)) {
            ReentrantLock reentrantLock = f27154lt;
            try {
                if (reentrantLock.tryLock()) {
                    try {
                        if (TextUtils.isEmpty(lud)) {
                            lud = WebSettings.getDefaultUserAgent(com.bytedance.sdk.openadsdk.core.pmi.ycx());
                        }
                        com.bytedance.sdk.openadsdk.core.jc.ycx("sdk_local_web_ua", lud);
                        reentrantLock.unlock();
                    } catch (Exception e3) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oga+X86FXeJ8", 385);
                        com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", b.f42142b, e3);
                        return lud;
                    } catch (NoClassDefFoundError e11) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oga+X86FXeJ8", 387);
                        com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", b.f42142b, e11);
                        return lud;
                    }
                }
            } finally {
                f27154lt.unlock();
            }
        }
        return lud;
    }

    public static String lud(String str) {
        if (TextUtils.isEmpty(str)) {
            str = com.bytedance.sdk.openadsdk.core.pmi.dj().nji();
        }
        if (TextUtils.isEmpty(str)) {
            return "https://api16-access-ttp.tiktokpangle.us/service/2/app_log/";
        }
        return !str.startsWith("http") ? UrlConst.HTTPS.concat(str) : str;
    }

    public static void ok(String str) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            return;
        }
        com.bytedance.sdk.component.utils.htf.sya(c0.l("You should use method '", str, "' on the asynchronous thread,it may cause anr, please check."), new Object[0]);
    }

    public static void sya() {
        com.bytedance.sdk.openadsdk.dy.dj.ycx("recycle_version_not_valid", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.utils.oby.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("method_exist", oby.aeu());
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("recycle_version_not_valid").zb(jSONObject.toString());
            }
        });
    }

    public static String jw(String str) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        if (str.contains("KLLK")) {
            return str.replace("KLLK", "OPPO");
        }
        return str.contains("kllk") ? str.replace("kllk", "oppo") : b.f42142b;
    }

    public static String lt(String str) {
        if (TextUtils.isEmpty(str)) {
            return b.f42142b;
        }
        return !str.startsWith("http") ? UrlConst.HTTPS.concat(str) : str;
    }

    public static boolean lud(Context context) {
        if (context == null) {
            return false;
        }
        try {
            return (context.getApplicationInfo().flags & 2) != 0;
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "Uv0MhQiVZ+OFSMJa", 1345);
            return false;
        }
    }

    public static String sya(String str) throws IOException {
        FileReader fileReader;
        BufferedReader bufferedReader;
        String line;
        try {
            fileReader = new FileReader("/proc/meminfo");
            try {
                bufferedReader = new BufferedReader(fileReader, u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                do {
                    try {
                        line = bufferedReader.readLine();
                        if (line == null) {
                            break;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        try {
                            com.bytedance.sdk.openadsdk.oty.sya.ycx(th, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5uAaxQMmGRf5EnBQ=", 647);
                            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", th.getMessage());
                            if (bufferedReader != null) {
                                try {
                                    bufferedReader.close();
                                } catch (Exception e3) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5uAaxQMmGRf5EnBQ=", 653);
                                }
                            }
                            if (fileReader != null) {
                                try {
                                    fileReader.close();
                                } catch (Exception e11) {
                                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e11, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5uAaxQMmGRf5EnBQ=", 659);
                                }
                            }
                            return null;
                        } finally {
                        }
                    }
                } while (!line.contains(str));
                if (line == null) {
                    try {
                        bufferedReader.close();
                    } catch (Exception e12) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e12, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5uAaxQMmGRf5EnBQ=", 653);
                    }
                    try {
                        fileReader.close();
                    } catch (Exception e13) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(e13, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5uAaxQMmGRf5EnBQ=", 659);
                    }
                    return null;
                }
                String str2 = line.split("\\s+")[1];
                try {
                    bufferedReader.close();
                } catch (Exception e14) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e14, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5uAaxQMmGRf5EnBQ=", 653);
                }
                try {
                    fileReader.close();
                } catch (Exception e15) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e15, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5uAaxQMmGRf5EnBQ=", 659);
                }
                return str2;
            } catch (Throwable th3) {
                th = th3;
                bufferedReader = null;
            }
        } catch (Throwable th4) {
            th = th4;
            fileReader = null;
            bufferedReader = null;
        }
    }

    public static zb ycx(Context context, Intent intent) {
        return new zb(null, 0);
    }

    public static String zb(int i5) {
        if (i5 == 1) {
            return "embeded_ad_landingpage";
        }
        if (i5 == 2) {
            return "banner_ad_landingpage";
        }
        if (i5 == 3) {
            return "interaction_landingpage";
        }
        if (i5 == 4) {
            return "splash_ad_landingpage";
        }
        if (i5 == 5) {
            return "fullscreen_interstitial_ad";
        }
        if (i5 != 7) {
            return "unknow";
        }
        return "rewarded_video_landingpage";
    }

    public static boolean ycx() {
        return (com.bytedance.sdk.openadsdk.core.dy.ycx() == null || com.bytedance.sdk.openadsdk.core.dy.ycx().dj()) ? false : true;
    }

    public static String ycx(int i5) {
        if (i5 == 1) {
            return "embeded_ad";
        }
        if (i5 == 2) {
            return "banner_ad";
        }
        if (i5 == 3) {
            return "interaction";
        }
        if (i5 == 4) {
            return "open_ad";
        }
        if (i5 == 5) {
            return "fullscreen_interstitial_ad";
        }
        if (i5 != 7) {
            return null;
        }
        return "rewarded_video";
    }

    public static boolean fby(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        return Pattern.compile("^[+-]?([0-9]|([1-9][0-9]*))(\\.[0-9]+)?").matcher(str).matches();
    }

    public static int lt(Context context) {
        try {
            return context.getApplicationInfo().targetSdkVersion;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oQKubsKUedNWuhSyO1LhIw==", 1361);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", th2.getMessage());
            return -1;
        }
    }

    public static boolean ul(String str) {
        try {
            return Pattern.compile("[一-龥]").matcher(str).find();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "Uv0Omg2oaM6Oad9UghSzLQ==", 1182);
            return false;
        }
    }

    public static void jw(Context context) {
        try {
            AtomicInteger atomicInteger = f27150dj;
            if (atomicInteger.get() != 0) {
                return;
            }
            AccessibilityManager accessibilityManager = (AccessibilityManager) context.getSystemService("accessibility");
            boolean zIsEnabled = accessibilityManager.isEnabled();
            boolean zIsTouchExplorationEnabled = accessibilityManager.isTouchExplorationEnabled();
            if (zIsEnabled && zIsTouchExplorationEnabled) {
                atomicInteger.set(1);
                com.bytedance.sdk.openadsdk.dy.dj.ycx().sya();
            } else {
                atomicInteger.set(2);
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "UuAkgTe9ZcyCS9RWqR+hKlfr", 1506);
            f27150dj.set(2);
        }
    }

    public static int fby(Context context) {
        return ul(com.bytedance.sdk.component.utils.hf.ycx(context, 0L));
    }

    public static int zb(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (tnVar == null) {
            return -1;
        }
        int iAn = tnVar.an();
        int i5 = 1;
        if (iAn == 1) {
            return 2;
        }
        if (iAn == 3) {
            return 4;
        }
        if (iAn != 5) {
            i5 = 7;
            if (iAn != 7) {
                return iAn != 8 ? -1 : 5;
            }
        }
        return i5;
    }

    public static boolean fby(int i5) {
        if (i5 <= 0) {
            return false;
        }
        return i5 >= 100 || new Random(System.currentTimeMillis()).nextInt(100) + 1 <= i5;
    }

    public static long ul(Context context) {
        int i5;
        try {
            i5 = context.getApplicationInfo().minSdkVersion;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5uAqyWsOLfNJPnxivJg==", 1379);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", th2.getMessage());
            i5 = -1;
        }
        return i5;
    }

    public static String ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (tnVar == null) {
            return null;
        }
        try {
            return sya(tnVar.an());
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5oQK7S96tS8NYnhihJHbrOZQ=", Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE);
            return null;
        }
    }

    public static String zb() {
        String strZb;
        String str = "unKnow";
        com.bytedance.sdk.openadsdk.uh.ycx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx());
        try {
            strZb = com.bytedance.sdk.openadsdk.core.sya.ycx().zb("android_system_ua", "unKnow");
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5tA24e8iJTuREnwWlJW7P", Sdk.SDKError.Reason.GENERATE_JSON_DATA_ERROR_VALUE);
        }
        if (strZb != null && !"unKnow".equals(strZb)) {
            return strZb;
        }
        FutureTask futureTask = new FutureTask(new ycx(2));
        f27158zb.execute(futureTask);
        str = (String) futureTask.get(500L, TimeUnit.MILLISECONDS);
        com.bytedance.sdk.component.utils.htf.sya("getUA", " getAndroidSystemUA userAgent".concat(String.valueOf(str)));
        return str;
    }

    public static int jc(Context context) {
        List<ResolveInfo> listQueryIntentActivities;
        Integer num = ycx;
        if (num != null) {
            return num.intValue();
        }
        if (context == null || (listQueryIntentActivities = context.getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse("https://www.example.com")), 0)) == null) {
            return 0;
        }
        int size = listQueryIntentActivities.size();
        ycx = Integer.valueOf(size);
        return size;
    }

    public static int ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return 1;
        }
        str.getClass();
        switch (str) {
        }
        return 1;
    }

    public static String dj(String str) {
        return ycx(str, false, false);
    }

    public static boolean dj(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        return tnVar != null && tnVar.liq() == 3 && tnVar.yw() && (tnVar.ff() == 4 || tnVar.ff() == 5);
    }

    public static String ycx(Context context) throws IOException {
        String strZb = com.bytedance.sdk.openadsdk.core.sya.ycx().zb("total_memory", (String) null);
        if (strZb != null && zb(strZb) > 0) {
            return strZb;
        }
        String strSya = sya("MemTotal");
        if (zb(strSya) <= 0) {
            strSya = jw();
        }
        com.bytedance.sdk.openadsdk.core.sya.ycx().ycx("total_memory", strSya);
        return strSya;
    }

    public static long zb(String str) {
        try {
            return Long.parseLong(str);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "SO8rkDCoe86OTeNSoB6uLw==", 591);
            return 0L;
        }
    }

    public static String ycx(String str, boolean z11, boolean z12) {
        String strPmi;
        if (str != null && !str.startsWith("/")) {
            str = "/".concat(str);
        }
        if (z12) {
            strPmi = thx();
        } else {
            strPmi = pmi();
        }
        if (TextUtils.isEmpty(strPmi)) {
            strPmi = "api16-access-ttp.tiktokpangle.us";
        }
        String strL = c0.l(UrlConst.HTTPS, strPmi, str);
        if (!TextUtils.isEmpty(str) && (str.equals("/api/ad/union/sdk/compliance_status/") || str.equals("/api/ad/union/sdk/register_status/"))) {
            return strL;
        }
        if (ifb.ycx() && !z11) {
            strL = ifb.ycx(strL);
        }
        return z11 ? xkz(strL) : strL;
    }

    public static long zb(Context context) {
        return com.bytedance.sdk.openadsdk.core.sya.ycx().zb("total_internal_storage", 0L).longValue();
    }

    public static String sya(Context context) {
        try {
            return context.getResources().getConfiguration().getLocales().get(0).getLanguage();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5thaue8KOXvtcgha1KVzr", 1062);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", e3.toString());
            return b.f42142b;
        }
    }

    public static boolean sya(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (tnVar == null) {
            return true;
        }
        int iZb = com.bytedance.sdk.openadsdk.core.pmi.dj().zb(tnVar.ksy());
        int iSya = com.bytedance.sdk.component.utils.pmi.sya(com.bytedance.sdk.openadsdk.core.pmi.ycx());
        if (iZb == 1) {
            return dj(iSya);
        }
        if (iZb == 2) {
            return lud(iSya) || dj(iSya) || lt(iSya);
        }
        if (iZb != 3) {
            return iZb != 5 || dj(iSya) || lt(iSya);
        }
        return false;
    }

    public static List<String> ycx(String str, boolean z11) {
        if (!TextUtils.isEmpty(str) && !str.startsWith("/")) {
            str = "/".concat(str);
        }
        ArrayList arrayList = new ArrayList();
        Set<String> setVbt = com.bytedance.sdk.openadsdk.core.pmi.dj().vbt();
        if (setVbt != null && !setVbt.isEmpty()) {
            for (String str2 : setVbt) {
                if (!TextUtils.isEmpty(str2)) {
                    String strL = c0.l(UrlConst.HTTPS, str2, str);
                    if (ifb.ycx() && !z11) {
                        strL = ifb.ycx(strL);
                    }
                    if (z11) {
                        strL = xkz(strL);
                    }
                    arrayList.add(strL);
                }
            }
        }
        return arrayList;
    }

    public static JSONObject ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, long j11, c cVar) throws JSONException {
        if (tnVar == null) {
            return new JSONObject();
        }
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("creative_id", tnVar.m147if());
            jSONObject.put("buffers_time", j11);
            com.bykv.vk.openvk.ycx.ycx.ycx.sya.c cVarCi = tnVar.ci();
            if (cVarCi != null) {
                jSONObject.put("video_size", cVarCi.f22185c);
                jSONObject.put("video_resolution", cVarCi.f22187e);
            }
            ycx(jSONObject, cVar);
            return jSONObject;
        } catch (JSONException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5owq4bMihScNUgx8=", 1151);
            com.bytedance.sdk.component.utils.htf.ycx("TTAD.ToolUtils", "getVideoAction json error", e3);
            return jSONObject;
        }
    }

    private static void ycx(JSONObject jSONObject, c cVar) {
        if (jSONObject.has("video_resolution") || cVar == null) {
            return;
        }
        try {
            jSONObject.put("video_resolution", String.format(Locale.getDefault(), "%d×%d", Integer.valueOf(cVar.dj()), Integer.valueOf(cVar.lud())));
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "WOYolgiKYMOFReVYnx6sPU/nIps=", 1167);
        }
    }

    public static void ycx(String str, String str2, Context context) {
        int i5;
        if (TextUtils.isEmpty(str2) || !lud(context)) {
            return;
        }
        int length = str2.length();
        if (length % 3572 == 0) {
            i5 = length / 3572;
        } else {
            i5 = (length / 3572) + 1;
        }
        int i11 = 3572;
        for (int i12 = 1; i12 <= i5 && i11 < length; i12++) {
            i11 += 3572;
        }
    }

    public static void ycx(StringBuilder sb2, String str, String str2) {
        int iIndexOf;
        if (sb2 == null || TextUtils.isEmpty(str) || (iIndexOf = sb2.indexOf(str)) <= 0) {
            return;
        }
        sb2.replace(iIndexOf, str.length() + iIndexOf, str2);
    }

    public static com.bytedance.sdk.openadsdk.common.lud ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, com.bytedance.sdk.component.jw.fby fbyVar, Context context, String str) {
        int iFf = tnVar.ff();
        if (!tnVar.yw()) {
            return null;
        }
        if (iFf != 1 && iFf != 3) {
            return null;
        }
        fbyVar.ycx(true, (View) new com.bytedance.sdk.openadsdk.common.dj(context));
        return new com.bytedance.sdk.openadsdk.common.lud(tnVar, fbyVar, str, false);
    }

    public static void ycx(JSONObject jSONObject) {
        int iIntValue;
        try {
            Pair<String, Long> pairDj = com.bytedance.sdk.openadsdk.core.jc.dj("oem_store");
            int i5 = -1;
            if (pairDj != null && ((iIntValue = Integer.valueOf((String) pairDj.first).intValue()) != -2 || System.currentTimeMillis() - ((Long) pairDj.second).longValue() < com.bytedance.sdk.openadsdk.dv.lud.ycx("oem_store_state_time", 259200000))) {
                i5 = iIntValue;
            }
            jSONObject.put("oem_store", i5);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "S/s5ugaxWtOPWNI=", 1579);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", th2.getMessage());
        }
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, com.bytedance.sdk.component.jw.fby fbyVar) {
        ycx(tnVar, fbyVar, false);
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar, com.bytedance.sdk.component.jw.fby fbyVar, boolean z11) {
        com.bytedance.sdk.component.jw.fby fbyVar2;
        com.bytedance.sdk.openadsdk.core.model.fby fbyVarHf;
        List<Integer> list;
        if (tnVar == null || fbyVar == null) {
            return;
        }
        int iFf = tnVar.ff();
        if (!tnVar.yw() || (!(iFf == 2 || iFf == 3 || iFf == 5) || (fbyVarHf = tnVar.hf()) == null)) {
            fbyVar2 = fbyVar;
        } else {
            List<Integer> listLt = fbyVarHf.lt();
            ArrayList arrayList = new ArrayList();
            if (z11) {
                for (int i5 = 0; i5 < listLt.size(); i5++) {
                    arrayList.add(Integer.valueOf(listLt.get(i5).intValue() - 1));
                }
                list = arrayList;
            } else {
                list = listLt;
            }
            fbyVar2 = fbyVar;
            fbyVar2.ycx(true, fbyVarHf.dj(), fbyVarHf.lud(), list, fbyVarHf.ul(), fbyVarHf.sya());
        }
        int iWw = tnVar.ww();
        long jFiz = tnVar.fiz();
        if ((iWw == 1 || iWw == 2) && jFiz > 0) {
            fbyVar2.ycx(iWw, jFiz);
        }
    }

    public static int ycx(WebView webView) {
        if (webView == null) {
            return -1;
        }
        try {
            WebBackForwardList webBackForwardListCopyBackForwardList = webView.copyBackForwardList();
            int size = webBackForwardListCopyBackForwardList.getSize();
            ArrayList arrayList = new ArrayList();
            for (int i5 = 0; i5 < size; i5++) {
                WebHistoryItem itemAtIndex = webBackForwardListCopyBackForwardList.getItemAtIndex(i5);
                if (itemAtIndex != null) {
                    String url = itemAtIndex.getUrl();
                    if (!arrayList.contains(url)) {
                        arrayList.add(url);
                    }
                }
            }
            return arrayList.indexOf(webView.getUrl()) + 1;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "XOs5thaue8KOXuJPgDiuLF72", 1672);
            com.bytedance.sdk.component.utils.htf.sya("TTAD.ToolUtils", th2.toString());
            return -1;
        }
    }

    public static JSONObject ycx(AdSlot adSlot) {
        JSONObject jSONObject = new JSONObject();
        if (adSlot != null) {
            try {
                jSONObject.put("is_sb", !TextUtils.isEmpty(adSlot.getBidAdm()));
                return jSONObject;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "b+EimTaoYMuT", "Uv0ekBGqbNWiQ9NZhR+n", 1687);
            }
        }
        return jSONObject;
    }
}
