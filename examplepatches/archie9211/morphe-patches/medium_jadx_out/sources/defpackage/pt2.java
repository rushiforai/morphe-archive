package defpackage;

import android.net.TrafficStats;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pt2 implements qu2 {
    public final ia7 a;
    public final f66 b;
    public final u31 c;
    public final String d;
    public final yp e;
    public volatile int f;
    public volatile m6e g;
    public volatile yp0 h;
    public final w5d i;

    public pt2(ia7 ia7Var, f66 f66Var, u31 u31Var, String str, yp ypVar, z46 z46Var) {
        ia7Var.getClass();
        f66Var.getClass();
        u31Var.getClass();
        str.getClass();
        ypVar.getClass();
        this.a = ia7Var;
        this.b = f66Var;
        this.c = u31Var;
        this.d = str;
        this.e = ypVar;
        this.f = 1;
        this.i = new w5d(new ir(7, this));
    }

    public final m6e a(lbb lbbVar) {
        Object next;
        fn7 fn7VarX;
        Map map = lbbVar.c;
        Iterator it2 = map.entrySet().iterator();
        while (true) {
            if (!it2.hasNext()) {
                next = null;
                break;
            }
            next = it2.next();
            if (tuc.G((String) ((Map.Entry) next).getKey(), "DD-API-KEY", true)) {
                break;
            }
        }
        Map.Entry entry = (Map.Entry) next;
        String str = entry != null ? (String) entry.getValue() : null;
        if (str != null) {
            if (str.length() != 0) {
                for (int i = 0; i < str.length(); i++) {
                    char cCharAt = str.charAt(i);
                    if (cCharAt == '\t' || (' ' <= cCharAt && cCharAt < 127)) {
                    }
                }
            }
            return new e6e(0);
        }
        x2b x2bVar = fn7.d;
        try {
            fn7VarX = en7.x("application/json");
        } catch (IllegalArgumentException unused) {
            fn7VarX = null;
        }
        iq1 iq1Var = new iq1(14);
        iq1Var.U(lbbVar.b);
        qbb qbbVar = sbb.a;
        byte[] bArr = lbbVar.d;
        int length = bArr.length;
        egf.a(bArr.length, 0L, length);
        iq1Var.J("POST", new rbb(fn7VarX, length, bArr));
        for (Map.Entry entry2 : map.entrySet()) {
            String str2 = (String) entry2.getKey();
            String str3 = (String) entry2.getValue();
            Locale locale = Locale.US;
            locale.getClass();
            String lowerCase = str2.toLowerCase(locale);
            lowerCase.getClass();
            if (lowerCase.equals("user-agent")) {
                f49.K(this.b, d66.WARN, e66.MAINTAINER, x22.E, null, false, 56);
            } else {
                iq1Var.v(str2, str3);
            }
        }
        iq1Var.v("User-Agent", (String) this.i.getValue());
        kbb kbbVar = new kbb(iq1Var);
        Thread threadCurrentThread = Thread.currentThread();
        threadCurrentThread.getClass();
        TrafficStats.setThreadStatsTag((int) w4.g(threadCurrentThread));
        adb adbVarD = this.c.a(kbbVar).d();
        adbVarD.close();
        int i2 = adbVarD.d;
        if (i2 == 202) {
            return new h6e(false, i2, null, 4);
        }
        if (i2 != 403) {
            if (i2 != 408) {
                if (i2 != 413) {
                    if (i2 != 429) {
                        if (i2 != 500 && i2 != 507) {
                            if (i2 != 400) {
                                if (i2 != 401) {
                                    switch (i2) {
                                        case 502:
                                        case 503:
                                        case 504:
                                            break;
                                        default:
                                            f49.L(this.b, d66.WARN, d46.R(e66.MAINTAINER, e66.TELEMETRY), new nt2(i2, lbbVar), null, 56);
                                            return new j6e(false, i2, null, 4);
                                    }
                                }
                            }
                        }
                        return new d6e(true, i2, null, 4);
                    }
                }
                return new b6e(false, i2, null, 4);
            }
            return new c6e(true, i2, null, 4);
        }
        return new e6e(i2);
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0051  */
    /* JADX WARN: Removed duplicated region for block: B:16:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x005d  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x006b  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x006f  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0093  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0095  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0099  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00ae  */
    @Override // defpackage.qu2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.m6e k(defpackage.vu2 r11, java.util.List r12, byte[] r13, defpackage.yp0 r14) {
        /*
            Method dump skipped, instruction units count: 283
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pt2.k(vu2, java.util.List, byte[], yp0):m6e");
    }
}
