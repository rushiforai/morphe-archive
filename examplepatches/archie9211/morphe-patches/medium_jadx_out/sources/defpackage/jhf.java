package defpackage;

import android.content.Context;
import android.net.TrafficStats;
import android.os.Build;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import java.util.LinkedHashMap;
import java.util.Map;
import sprig.b.g;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class jhf {
    public final Context a;
    public final up8 b = new up8();
    public final String c = "https://api.sprig.com";

    public jhf(Context context) {
        this.a = context;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Can't wrap try/catch for region: R(18:51|52|106|53|110|54|55|116|56|57|112|58|59|104|60|61|(4:64|114|65|(4:(1:78)|79|93|(1:(1:96))(2:97|(3:100|101|(0))))(3:67|(1:74)|(1:76)))|99) */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x01d9, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:81:0x01da, code lost:
    
        r9 = r17;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x01dc, code lost:
    
        r15 = r5;
        r5 = r3;
        r3 = r15;
        r15 = r10;
        r10 = r4;
        r4 = r15;
        r15 = r2;
        r2 = r6;
        r6 = r1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x01e6, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x01e7, code lost:
    
        r9 = r17;
        r10 = r18;
     */
    /* JADX WARN: Code restructure failed: missing block: B:85:0x01ec, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x01ed, code lost:
    
        r3 = r8;
        r9 = r17;
        r10 = r18;
        r7 = r22;
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x01f5, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x01f6, code lost:
    
        r3 = r8;
        r7 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x01f9, code lost:
    
        r0 = e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:90:0x01fa, code lost:
    
        r3 = r8;
        r7 = r9;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x01ff, code lost:
    
        r3.onException(r0);
     */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x012b A[PHI: r18
      0x012b: PHI (r18v5 int) = (r18v3 int), (r18v4 int), (r18v6 int) binds: [B:41:0x0128, B:38:0x011d, B:35:0x0112] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:49:0x0156  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x01a3  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x01b3 A[Catch: IOException -> 0x01be, TryCatch #5 {IOException -> 0x01be, blocks: (B:65:0x01ad, B:67:0x01b3, B:69:0x01b7, B:76:0x01c4, B:78:0x01cb), top: B:114:0x01ad }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x01c9  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x01ff  */
    /* JADX WARN: Removed duplicated region for block: B:95:0x0207  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x021b  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:100:0x0262 -> B:101:0x0273). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(java.lang.String r23, java.lang.String r24, defpackage.rbb r25, java.util.Map r26, java.lang.String r27, sprig.d.a.d r28, defpackage.p92 r29) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 658
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.jhf.a(java.lang.String, java.lang.String, rbb, java.util.Map, java.lang.String, sprig.d.a$d, p92):java.lang.Object");
    }

    public final String b(String str, String str2, Map map) {
        String strP;
        str.getClass();
        map.getClass();
        TrafficStats.setThreadStatsTag((int) Thread.currentThread().getId());
        iq1 iq1Var = new iq1(14);
        iq1Var.U(this.c + str);
        yi5 yi5Var = yi5.b;
        iq1Var.d = iq7.E(pwd.T(c(null, map)));
        qbb qbbVar = sbb.a;
        iq1Var.J("POST", no7.n(str2, null));
        kbb kbbVar = new kbb(iq1Var);
        up8 up8Var = this.b;
        up8Var.getClass();
        adb adbVarD = new cva(up8Var, kbbVar, false).d();
        try {
            if (adbVarD.q) {
                fdb fdbVar = adbVarD.g;
                if (fdbVar == null || (strP = fdbVar.p()) == null) {
                    strP = "";
                }
                adbVarD.close();
                return strP;
            }
            throw new Exception("Failed to post to " + str + ": " + adbVarD.d + " " + adbVarD.c);
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                k50.X(adbVarD, th);
                throw th2;
            }
        }
    }

    public final String d() {
        String str;
        Context context = this.a;
        if (context != null) {
            try {
                str = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            } catch (Exception unused) {
                str = "unknown";
            }
        } else {
            str = null;
        }
        if (str == null) {
            str = "unknown";
        }
        String str2 = Build.VERSION.RELEASE;
        StringBuilder sb = new StringBuilder(ev6.y("UserLeap/android;Version=2.25.0;OSVersion=", str2 != null ? str2 : "unknown", ";OSAPILevel=", String.valueOf(Build.VERSION.SDK_INT), ";"));
        if (context != null) {
            sb.append("AppVersion=" + str + ";");
        }
        return sb.toString();
    }

    public final LinkedHashMap c(String str, Map map) {
        String str2;
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        linkedHashMap.put("userleap-platform", "android");
        linkedHashMap.put("Content-Type", "application/json");
        linkedHashMap.put("Accept", "application/json");
        linkedHashMap.put("x-ul-mobile-user-agent", d());
        linkedHashMap.put("x-ul-mobile-sdk-version", "2.25.0");
        g gVar = g.INSTANCE;
        linkedHashMap.put("x-ul-sdk-version", gVar.getWebSdkVersion$userleap_release());
        Context context = this.a;
        if (context != null) {
            try {
                str2 = context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
            } catch (Exception unused) {
                str2 = "unknown";
            }
        } else {
            str2 = null;
        }
        if (str2 == null) {
            str2 = "unknown";
        }
        linkedHashMap.put("x-ul-app-version", str2);
        linkedHashMap.put(MaAxRJinch.cLyxOqpnfYTxP, String.valueOf(Build.VERSION.SDK_INT));
        String str3 = Build.VERSION.RELEASE;
        linkedHashMap.put("x-ul-os-version", str3 != null ? str3 : "unknown");
        linkedHashMap.put("x-ul-environment-id", gVar.getEnvironmentId());
        String strA = i67.c().a.a();
        strA.getClass();
        linkedHashMap.put("accept-language", strA);
        if (str != null) {
            linkedHashMap.put("x-ul-visitor-id", str);
        }
        for (Map.Entry entry : map.entrySet()) {
            linkedHashMap.put((String) entry.getKey(), (String) entry.getValue());
        }
        return linkedHashMap;
    }
}
