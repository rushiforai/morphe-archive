package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ce6 {
    public static final y05 a;
    public static final mn1 b;

    static {
        y05 y05Var = new y05("kotlin.jvm.JvmField");
        a = y05Var;
        kng.P(y05Var);
        kng.P(new y05("kotlin.reflect.jvm.internal.ReflectionFactoryImpl"));
        b = kng.y("kotlin/jvm/internal/RepeatableContainer", false);
    }

    public static final String a(String str) {
        str.getClass();
        return b(str) ? str : "get".concat(sgg.E(str));
    }

    public static final boolean b(String str) {
        str.getClass();
        if (tuc.N(str, "is", false) && str.length() != 2) {
            char cCharAt = str.charAt(2);
            if (g76.Q(97, cCharAt) > 0 || g76.Q(cCharAt, 122) > 0) {
                return true;
            }
        }
        return false;
    }
}
