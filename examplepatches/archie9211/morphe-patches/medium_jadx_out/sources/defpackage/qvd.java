package defpackage;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.InetAddress;
import java.net.URI;
import java.net.URL;
import java.util.BitSet;
import java.util.Currency;
import java.util.Locale;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class qvd {
    public static final dm8 A;
    public static final fvd B;
    public static final fvd C;
    public static final o04 D;
    public static final fvd a = new fvd(Class.class, new vud().a(), 0);
    public static final fvd b = new fvd(BitSet.class, new evd().a(), 0);
    public static final jvd c;
    public static final gvd d;
    public static final gvd e;
    public static final gvd f;
    public static final gvd g;
    public static final fvd h;
    public static final fvd i;
    public static final fvd j;
    public static final oud k;
    public static final pud l;
    public static final ovd m;
    public static final ovd n;
    public static final gvd o;
    public static final fvd p;
    public static final fvd q;
    public static final fvd r;
    public static final fvd s;
    public static final fvd t;
    public static final fvd u;
    public static final fvd v;
    public static final fvd w;
    public static final fvd x;
    public static final fvd y;
    public static final fvd z;

    static {
        ivd ivdVar = new ivd();
        c = new jvd();
        d = new gvd(Boolean.TYPE, Boolean.class, ivdVar);
        e = new gvd(Byte.TYPE, Byte.class, new kvd());
        f = new gvd(Short.TYPE, Short.class, new lvd());
        g = new gvd(Integer.TYPE, Integer.class, new mvd());
        h = new fvd(AtomicInteger.class, new nvd().a(), 0);
        i = new fvd(AtomicBoolean.class, new mud().a(), 0);
        j = new fvd(AtomicIntegerArray.class, new nud().a(), 0);
        k = new oud();
        l = new pud();
        new ovd(1, false);
        m = new ovd(1, true);
        new ovd(0, false);
        n = new ovd(0, true);
        o = new gvd(Character.TYPE, Character.class, new qud());
        rud rudVar = new rud();
        p = new fvd(BigDecimal.class, new sud(), 0);
        q = new fvd(BigInteger.class, new tud(), 0);
        r = new fvd(uq6.class, new uud(), 0);
        s = new fvd(String.class, rudVar, 0);
        t = new fvd(StringBuilder.class, new wud(), 0);
        u = new fvd(StringBuffer.class, new xud(), 0);
        v = new fvd(URL.class, new yud(), 0);
        w = new fvd(URI.class, new zud(), 0);
        x = new fvd(InetAddress.class, new avd(), 1);
        y = new fvd(UUID.class, new bvd(), 0);
        z = new fvd(Currency.class, new cvd().a(), 0);
        A = new dm8(2, new n96(8, new String[]{"year", "month", "dayOfMonth", "hourOfDay", "minute", "second"}));
        B = new fvd(Locale.class, new dvd(), 0);
        C = new fvd(dc6.class, jc6.a, 1);
        D = q04.d;
    }

    public static void a(double d2) {
        if (Double.isNaN(d2) || Double.isInfinite(d2)) {
            throw new IllegalArgumentException(d2 + " is not a valid double value as per JSON specification. To override this behavior, use GsonBuilder.serializeSpecialFloatingPointValues() method.");
        }
    }

    public static int b(long j2) {
        int i2 = (int) j2;
        if (i2 == j2) {
            return i2;
        }
        ay0.e(ho2.D(j2, "Too big for an int: "));
        return 0;
    }
}
