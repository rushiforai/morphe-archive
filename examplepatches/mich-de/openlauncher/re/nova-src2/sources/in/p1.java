package in;

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

/* loaded from: classes.dex */
public abstract class p1 {
    public static final e1 A;
    public static final n B;
    public static final e1 C;
    public static final i D;

    /* renamed from: a, reason: collision with root package name */
    public static final e1 f61726a;

    /* renamed from: b, reason: collision with root package name */
    public static final e1 f61727b;

    /* renamed from: c, reason: collision with root package name */
    public static final j1 f61728c;

    /* renamed from: d, reason: collision with root package name */
    public static final g1 f61729d;

    /* renamed from: e, reason: collision with root package name */
    public static final g1 f61730e;

    /* renamed from: f, reason: collision with root package name */
    public static final g1 f61731f;

    /* renamed from: g, reason: collision with root package name */
    public static final g1 f61732g;

    /* renamed from: h, reason: collision with root package name */
    public static final e1 f61733h;

    /* renamed from: i, reason: collision with root package name */
    public static final e1 f61734i;

    /* renamed from: j, reason: collision with root package name */
    public static final e1 f61735j;

    /* renamed from: k, reason: collision with root package name */
    public static final l0 f61736k;

    /* renamed from: l, reason: collision with root package name */
    public static final m0 f61737l;

    /* renamed from: m, reason: collision with root package name */
    public static final n0 f61738m;
    public static final g1 n;
    public static final q0 o;

    /* renamed from: p, reason: collision with root package name */
    public static final r0 f61739p;

    /* renamed from: q, reason: collision with root package name */
    public static final s0 f61740q;

    /* renamed from: r, reason: collision with root package name */
    public static final e1 f61741r;

    /* renamed from: s, reason: collision with root package name */
    public static final e1 f61742s;

    /* renamed from: t, reason: collision with root package name */
    public static final e1 f61743t;

    /* renamed from: u, reason: collision with root package name */
    public static final e1 f61744u;

    /* renamed from: v, reason: collision with root package name */
    public static final e1 f61745v;

    /* renamed from: w, reason: collision with root package name */
    public static final e1 f61746w;

    /* renamed from: x, reason: collision with root package name */
    public static final e1 f61747x;

    /* renamed from: y, reason: collision with root package name */
    public static final e1 f61748y;

    /* renamed from: z, reason: collision with root package name */
    public static final d f61749z;

    static {
        int i5 = 0;
        f61726a = new e1(Class.class, new u0().a(), i5);
        f61727b = new e1(BitSet.class, new f1().a(), i5);
        i1 i1Var = new i1();
        f61728c = new j1();
        f61729d = new g1(Boolean.TYPE, Boolean.class, i1Var);
        f61730e = new g1(Byte.TYPE, Byte.class, new k1());
        f61731f = new g1(Short.TYPE, Short.class, new l1());
        f61732g = new g1(Integer.TYPE, Integer.class, new m1());
        int i11 = 0;
        f61733h = new e1(AtomicInteger.class, new n1().a(), i11);
        f61734i = new e1(AtomicBoolean.class, new o1().a(), i11);
        f61735j = new e1(AtomicIntegerArray.class, new k0().a(), i11);
        f61736k = new l0();
        f61737l = new m0();
        f61738m = new n0();
        n = new g1(Character.TYPE, Character.class, new o0());
        p0 p0Var = new p0();
        o = new q0();
        f61739p = new r0();
        f61740q = new s0();
        int i12 = 0;
        f61741r = new e1(String.class, p0Var, i12);
        f61742s = new e1(StringBuilder.class, new t0(), i12);
        f61743t = new e1(StringBuffer.class, new v0(), i12);
        f61744u = new e1(URL.class, new w0(), i12);
        f61745v = new e1(URI.class, new x0(), i12);
        f61746w = new e1(InetAddress.class, new y0(), 1);
        int i13 = 0;
        f61747x = new e1(UUID.class, new z0(), i13);
        f61748y = new e1(Currency.class, new a1().a(), i13);
        f61749z = new d(new b1(), 3);
        A = new e1(Locale.class, new c1(), 0);
        n nVar = n.f61724a;
        B = nVar;
        C = new e1(com.google.gson.p.class, nVar, 1);
        D = j.f61712d;
    }
}
