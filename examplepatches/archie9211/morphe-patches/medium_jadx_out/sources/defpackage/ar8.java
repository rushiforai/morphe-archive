package defpackage;

import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ar8 {
    public static final ar8 a = new ar8();
    public static final Set b = k80.S0(new String[]{"fb_mobile_purchase", "StartTrial", "Subscribe"});

    public static final boolean a() {
        boolean zBooleanValue;
        Set set = ec2.a;
        if (set.contains(ar8.class)) {
            return false;
        }
        try {
            if (f94.f(f94.a()) || epe.H()) {
                return false;
            }
            y3b y3bVar = y3b.b;
            if (set.contains(y3b.class)) {
                zBooleanValue = false;
            } else {
                try {
                    Boolean boolValueOf = y3b.c;
                    if (boolValueOf == null) {
                        boolValueOf = Boolean.valueOf(y3b.b.v(f94.a()) != null);
                        y3b.c = boolValueOf;
                    }
                    zBooleanValue = boolValueOf.booleanValue();
                } catch (Throwable th) {
                    ec2.a(y3b.class, th);
                    zBooleanValue = false;
                }
            }
            return zBooleanValue;
        } catch (Throwable th2) {
            ec2.a(ar8.class, th2);
            return false;
        }
    }
}
