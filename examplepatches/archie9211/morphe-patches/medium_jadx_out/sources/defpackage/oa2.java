package defpackage;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Process;
import android.os.StrictMode;
import com.drew.lang.RandomAccessStreamReader;
import com.medium.android.explore.ui.vAWg.OphtYB;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class oa2 {
    public static final z72 L = new z72(3);
    public static final zl1[] M = {zl1.r, zl1.s, zl1.t, zl1.n, zl1.o, zl1.l, zl1.m};
    public final zp0 A;
    public uc8 B;
    public volatile kv2 C;
    public volatile String D;
    public k87 E;
    public dm0 F;
    public ThreadPoolExecutor G;
    public fm0 H;
    public File I;
    public final w5d J;
    public final w5d K;
    public final f66 a;
    public final z72 b;
    public final l01 c;
    public final w5d d;
    public final AtomicBoolean e;
    public WeakReference f;
    public ct2 g;
    public ge8 h;
    public u6d i;
    public rv8 j;
    public e52 k;
    public n78 l;
    public e68 m;
    public k60 n;
    public yp o;
    public la2 p;
    public un6 q;
    public volatile String r;
    public volatile String s;
    public volatile String t;
    public volatile String u;
    public volatile boolean v;
    public volatile String w;
    public volatile String x;
    public aq0 y;
    public v5e z;

    public oa2(f66 f66Var, bx2 bx2Var, z72 z72Var) {
        l01.a.getClass();
        j01 j01Var = k01.b;
        f66Var.getClass();
        this.a = f66Var;
        this.b = z72Var;
        this.c = j01Var;
        this.d = new w5d(new na2(this, 3));
        this.e = new AtomicBoolean(false);
        this.f = new WeakReference(null);
        this.g = new ct2(1, false);
        int i = 20;
        this.h = new h1c(i);
        this.i = new no3(i);
        this.j = new p23();
        this.k = new dq1(i);
        this.l = new y3b(i);
        this.m = new u3b(i);
        this.n = new xsa(19);
        this.o = new my6(9, false);
        this.r = "";
        this.s = "";
        this.t = "android";
        this.u = "3.10.0";
        this.v = true;
        this.w = "";
        this.x = "";
        this.y = aq0.MEDIUM;
        this.z = v5e.AVERAGE;
        this.A = zp0.MEDIUM;
        this.B = new jzb();
        this.C = kv2.US1;
        this.J = new w5d(new na2(this, 0));
        this.K = new w5d(new na2(this, 1));
        new w5d(new na2(this, 2));
    }

    public final ThreadPoolExecutor a() {
        ThreadPoolExecutor threadPoolExecutor = this.G;
        if (threadPoolExecutor != null) {
            return threadPoolExecutor;
        }
        g76.g0("contextExecutorService");
        throw null;
    }

    public final dm0 b() {
        dm0 dm0Var = this.F;
        if (dm0Var != null) {
            return dm0Var;
        }
        g76.g0("persistenceExecutorService");
        throw null;
    }

    public final File c() {
        File file = this.I;
        if (file != null) {
            return file;
        }
        g76.g0("storageDir");
        throw null;
    }

    public final void e(Context context) {
        Context contextCreateDeviceProtectedStorageContext;
        if (!((j01) this.c).b || (contextCreateDeviceProtectedStorageContext = context.createDeviceProtectedStorageContext()) == null) {
            contextCreateDeviceProtectedStorageContext = context;
        }
        List listR = d46.R(jv2.NTP_0, jv2.NTP_1, jv2.NTP_2, jv2.NTP_3);
        ArrayList arrayList = new ArrayList(cu1.k0(listR, 10));
        Iterator it2 = listR.iterator();
        while (it2.hasNext()) {
            arrayList.add(((jv2) it2.next()).getHost());
        }
        f66 f66Var = this.a;
        olb olbVar = new olb(f66Var);
        long j = e13.a;
        long j2 = e13.b;
        contextCreateDeviceProtectedStorageContext.getClass();
        int i = 11;
        wz7 wz7Var = new wz7(i);
        SharedPreferences sharedPreferences = contextCreateDeviceProtectedStorageContext.getSharedPreferences("com.lyft.kronos.shared_preferences", 0);
        sharedPreferences.getClass();
        zm7 zm7Var = new zm7(28, sharedPreferences);
        new u3b(16);
        new u3b(15);
        qlb qlbVar = new qlb();
        qlbVar.a = wz7Var;
        ljc ljcVar = new ljc(qlbVar, wz7Var, new a1a(zm7Var, i, wz7Var), olbVar, arrayList, j, 300000L, 1800000L, j2);
        un6 un6Var = new un6(ljcVar, wz7Var);
        try {
            ljcVar.b();
        } catch (IllegalStateException e) {
            f49.K(this.a, d66.ERROR, e66.MAINTAINER, x22.x, e, false, 48);
        }
        this.j = new wn6(un6Var, f66Var);
        this.q = un6Var;
    }

    public final void d(Context context, String str, q32 q32Var, tqd tqdVar) {
        PackageInfo packageInfo;
        String string;
        ActivityManager.RunningAppProcessInfo runningAppProcessInfo;
        List<ActivityManager.RunningAppProcessInfo> runningAppProcesses;
        Object next;
        context.getClass();
        str.getClass();
        tqdVar.getClass();
        if (this.e.get()) {
            return;
        }
        o32 o32Var = q32Var.a;
        this.y = o32Var.c;
        this.z = o32Var.d;
        this.C = o32Var.f;
        this.H = o32Var.h;
        try {
            String packageName = context.getPackageName();
            PackageManager packageManager = context.getPackageManager();
            packageInfo = ((j01) this.c).f ? packageManager.getPackageInfo(packageName, PackageManager.PackageInfoFlags.of(0L)) : packageManager.getPackageInfo(packageName, 0);
        } catch (PackageManager.NameNotFoundException e) {
            f49.K(this.a, d66.ERROR, e66.USER, x22.w, e, false, 48);
            packageInfo = null;
        }
        Integer numValueOf = packageInfo != null ? Integer.valueOf(packageInfo.versionCode) : null;
        String string2 = q32Var.h;
        if (string2 == null) {
            string2 = packageInfo != null ? packageInfo.versionName : null;
            if (string2 == null) {
                string2 = numValueOf != null ? numValueOf.toString() : null;
                if (string2 == null) {
                    string2 = "?";
                }
            }
        }
        this.n = new ad(string2, numValueOf != null ? numValueOf.intValue() : 0);
        this.r = q32Var.b;
        String packageName2 = q32Var.e;
        if (packageName2 == null) {
            packageName2 = context.getPackageName();
            packageName2.getClass();
        }
        this.s = packageName2;
        this.w = q32Var.c;
        this.x = q32Var.d;
        try {
            InputStream inputStreamOpen = context.getAssets().open("datadog.buildId");
            inputStreamOpen.getClass();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStreamOpen, wk1.a), 8192);
            try {
                string = muc.y0(qk7.y(bufferedReader)).toString();
                bufferedReader.close();
            } finally {
            }
        } catch (FileNotFoundException unused) {
            f49.K(this.a, d66.INFO, e66.USER, x22.y, null, false, 56);
            string = null;
        } catch (Exception e2) {
            f49.L(this.a, d66.ERROR, d46.R(e66.USER, e66.TELEMETRY), x22.z, e2, 48);
            string = null;
        }
        this.D = string;
        this.f = new WeakReference(context);
        int iMyPid = Process.myPid();
        Object systemService = context.getSystemService("activity");
        ActivityManager activityManager = systemService instanceof ActivityManager ? (ActivityManager) systemService : null;
        if (activityManager == null || (runningAppProcesses = activityManager.getRunningAppProcesses()) == null) {
            runningAppProcessInfo = null;
        } else {
            Iterator<T> it2 = runningAppProcesses.iterator();
            while (true) {
                if (it2.hasNext()) {
                    next = it2.next();
                    if (((ActivityManager.RunningAppProcessInfo) next).pid == iMyPid) {
                        break;
                    }
                } else {
                    next = null;
                    break;
                }
            }
            runningAppProcessInfo = (ActivityManager.RunningAppProcessInfo) next;
        }
        this.v = runningAppProcessInfo == null ? true : g76.L(context.getPackageName(), runningAppProcessInfo.processName);
        if (!this.v) {
            f49.K(this.a, d66.WARN, e66.USER, x22.A, null, false, 56);
        }
        f66 f66Var = this.a;
        fm0 fm0Var = this.H;
        if (fm0Var == null) {
            g76.g0("backpressureStrategy");
            throw null;
        }
        this.E = new k87(f66Var, fm0Var);
        z72 z72Var = this.b;
        fm0 fm0Var2 = this.H;
        if (fm0Var2 == null) {
            g76.g0("backpressureStrategy");
            throw null;
        }
        rv8 rv8Var = this.j;
        z72Var.getClass();
        rv8Var.getClass();
        this.F = new dm0(f66Var, fm0Var2, rv8Var);
        this.G = new ThreadPoolExecutor(1, 1, 0L, TimeUnit.MILLISECONDS, new im0(this.a, "context", RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH, Integer.MAX_VALUE, x22.B, fn.y, null, this.j), new lv2("context", 0));
        r40.C(b(), OphtYB.arFL, ymb.a, new ho(this, 14, context));
        this.p = new la2(new cn(this, 7, q32Var.a));
        ct2 ct2Var = this.g;
        Map map = q32Var.a.b;
        ct2Var.getClass();
        LinkedHashMap linkedHashMap = ct2Var.a;
        Set<Map.Entry> setEntrySet = map.entrySet();
        int iP = ei7.P(cu1.k0(setEntrySet, 10));
        if (iP < 16) {
            iP = 16;
        }
        LinkedHashMap linkedHashMap2 = new LinkedHashMap(iP);
        for (Map.Entry entry : setEntrySet) {
            String str2 = (String) entry.getKey();
            Locale locale = Locale.US;
            locale.getClass();
            String lowerCase = str2.toLowerCase(locale);
            lowerCase.getClass();
            linkedHashMap2.put(lowerCase, entry.getValue());
        }
        ct2Var.a = ei7.S(linkedHashMap, linkedHashMap2);
        this.o = new tw2(context);
        ma2 ma2Var = new ma2(0, context, str);
        StrictMode.ThreadPolicy threadPolicyAllowThreadDiskReads = StrictMode.allowThreadDiskReads();
        try {
            Object objInvoke = ma2Var.invoke();
            StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
            this.I = (File) objInvoke;
            Object obj = q32Var.g.get("_dd.native_source_type");
            String str3 = obj instanceof String ? (String) obj : null;
            if (this.v) {
                File fileC = c();
                dm0 dm0VarB = b();
                ba9 ba9Var = new ba9(this.a, 1);
                f66 f66Var2 = this.a;
                na2 na2Var = new na2(this, 4);
                if (str3 == null) {
                    str3 = "ndk";
                }
                f66Var2.getClass();
                iv2 iv2Var = new iv2();
                iv2Var.a = dm0VarB;
                iv2Var.b = ba9Var;
                iv2Var.c = f66Var2;
                iv2Var.d = na2Var;
                iv2Var.e = str3;
                iv2Var.f = new File(fileC, "ndk_crash_reports_v2");
                this.B = iv2Var;
                r40.C(dm0VarB, "NDK crash check", f66Var2, new v0(18, iv2Var));
            }
            this.k = new uqd(tqdVar);
            dz0 dz0Var = new dz0(this.a, a());
            this.i = dz0Var;
            IntentFilter intentFilter = new IntentFilter();
            intentFilter.addAction("android.intent.action.BATTERY_CHANGED");
            Intent intentB = dz0Var.b(context, intentFilter);
            if (intentB != null) {
                dz0Var.e(context, intentB);
            }
            IntentFilter intentFilter2 = new IntentFilter();
            intentFilter2.addAction("android.os.action.POWER_SAVE_MODE_CHANGED");
            Intent intentB2 = dz0Var.b(context, intentFilter2);
            if (intentB2 != null) {
                dz0Var.e(context, intentB2);
            }
            ge8 p41Var = ((j01) this.c).b ? new p41(this.a) : new cz0(this.a, a());
            this.h = p41Var;
            p41Var.l0(context);
            mv2 mv2Var = new mv2();
            mv2Var.a = new zae();
            this.l = mv2Var;
            this.a.getClass();
            this.m = new wz7(15);
            this.e.set(true);
        } catch (Throwable th) {
            StrictMode.setThreadPolicy(threadPolicyAllowThreadDiskReads);
            throw th;
        }
    }
}
