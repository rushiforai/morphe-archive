package defpackage;

import android.content.Context;
import android.os.Bundle;
import java.math.BigDecimal;
import java.util.Currency;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.ScheduledThreadPoolExecutor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g50 {
    public static final String c;
    public static ScheduledThreadPoolExecutor d;
    public static final f50 e;
    public static final Object f;
    public static volatile String g;
    public static boolean h;
    public static final z10 i;
    public final String a;
    public final y3 b;

    static {
        String canonicalName = g50.class.getCanonicalName();
        if (canonicalName == null) {
            canonicalName = "com.facebook.appevents.AppEventsLoggerImpl";
        }
        c = canonicalName;
        e = f50.AUTO;
        f = new Object();
        i = new z10(4);
    }

    public g50(String str, String str2) {
        hk7.G();
        this.a = str;
        Date date = w3.l;
        w3 w3VarR = wgf.r();
        if (w3VarR == null || new Date().after(w3VarR.a) || !(str2 == null || str2.equals(w3VarR.h))) {
            if (str2 == null) {
                f94.a();
                str2 = f94.b();
            }
            this.b = new y3(null, str2);
        } else {
            this.b = new y3(w3VarR.e, f94.b());
        }
        o7f.z();
    }

    public static final String a() {
        if (ec2.a.contains(g50.class)) {
            return null;
        }
        try {
            return g;
        } catch (Throwable th) {
            ec2.a(g50.class, th);
            return null;
        }
    }

    public static final ScheduledThreadPoolExecutor b() {
        if (ec2.a.contains(g50.class)) {
            return null;
        }
        try {
            return d;
        } catch (Throwable th) {
            ec2.a(g50.class, th);
            return null;
        }
    }

    public static final Object c() {
        if (ec2.a.contains(g50.class)) {
            return null;
        }
        try {
            return f;
        } catch (Throwable th) {
            ec2.a(g50.class, th);
            return null;
        }
    }

    public static void f(g50 g50Var, String str, Double d2, Bundle bundle, boolean z, UUID uuid) {
        if (ec2.a.contains(g50.class)) {
            return;
        }
        try {
            g50Var.e(str, d2, bundle, z, uuid, null);
        } catch (Throwable th) {
            ec2.a(g50.class, th);
        }
    }

    public final void d(String str, Bundle bundle) {
        g50 g50Var;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            g50Var = this;
            try {
                f(g50Var, str, null, bundle, false, u6.b());
            } catch (Throwable th) {
                th = th;
                ec2.a(g50Var, th);
            }
        } catch (Throwable th2) {
            th = th2;
            g50Var = this;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:79:0x011d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(java.lang.String r13, java.lang.Double r14, android.os.Bundle r15, boolean r16, java.util.UUID r17, defpackage.ov8 r18) {
        /*
            Method dump skipped, instruction units count: 461
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g50.e(java.lang.String, java.lang.Double, android.os.Bundle, boolean, java.util.UUID, ov8):void");
    }

    public final void g(String str, Bundle bundle) {
        g50 g50Var;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            g50Var = this;
            try {
                f(g50Var, str, null, bundle, true, u6.b());
            } catch (Throwable th) {
                th = th;
                ec2.a(g50Var, th);
            }
        } catch (Throwable th2) {
            th = th2;
            g50Var = this;
        }
    }

    public final void h(BigDecimal bigDecimal, Currency currency, Bundle bundle, ov8 ov8Var) {
        g50 g50Var;
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            bundle.putString("fb_currency", currency.getCurrencyCode());
            g50Var = this;
            try {
                g50Var.e("fb_mobile_purchase", Double.valueOf(bigDecimal.doubleValue()), bundle, true, u6.b(), ov8Var);
                if (o7f.u() != f50.EXPLICIT_ONLY) {
                    l40.c(xq4.EAGER_FLUSHING_EVENT);
                }
            } catch (Throwable th) {
                th = th;
                ec2.a(g50Var, th);
            }
        } catch (Throwable th2) {
            th = th2;
            g50Var = this;
        }
    }

    public g50(Context context, String str) {
        this(epe.t(context), str);
    }
}
