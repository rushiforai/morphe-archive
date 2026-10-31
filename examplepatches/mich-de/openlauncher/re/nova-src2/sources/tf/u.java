package tf;

import xk.d1;
import xk.v0;
import xk.x0;

/* loaded from: classes3.dex */
public class u implements fe.e {

    /* renamed from: a, reason: collision with root package name */
    public final int f89153a;

    /* renamed from: b, reason: collision with root package name */
    public final int f89154b;

    /* renamed from: c, reason: collision with root package name */
    public final int f89155c;

    /* renamed from: d, reason: collision with root package name */
    public final int f89156d;

    /* renamed from: e, reason: collision with root package name */
    public final int f89157e;

    /* renamed from: f, reason: collision with root package name */
    public final int f89158f;

    /* renamed from: g, reason: collision with root package name */
    public final int f89159g;

    /* renamed from: h, reason: collision with root package name */
    public final int f89160h;

    /* renamed from: i, reason: collision with root package name */
    public final int f89161i;

    /* renamed from: j, reason: collision with root package name */
    public final int f89162j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f89163k;

    /* renamed from: l, reason: collision with root package name */
    public final v0 f89164l;

    /* renamed from: m, reason: collision with root package name */
    public final int f89165m;
    public final v0 n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final int f89166p;

    /* renamed from: q, reason: collision with root package name */
    public final int f89167q;

    /* renamed from: r, reason: collision with root package name */
    public final v0 f89168r;

    /* renamed from: s, reason: collision with root package name */
    public final v0 f89169s;

    /* renamed from: t, reason: collision with root package name */
    public final int f89170t;

    /* renamed from: u, reason: collision with root package name */
    public final int f89171u;

    /* renamed from: v, reason: collision with root package name */
    public final boolean f89172v;

    /* renamed from: w, reason: collision with root package name */
    public final boolean f89173w;

    /* renamed from: x, reason: collision with root package name */
    public final boolean f89174x;

    /* renamed from: y, reason: collision with root package name */
    public final x0 f89175y;

    /* renamed from: z, reason: collision with root package name */
    public final d1 f89176z;

    static {
        new u(new t());
    }

    public u(t tVar) {
        this.f89153a = tVar.f89129a;
        this.f89154b = tVar.f89130b;
        this.f89155c = tVar.f89131c;
        this.f89156d = tVar.f89132d;
        this.f89157e = tVar.f89133e;
        this.f89158f = tVar.f89134f;
        this.f89159g = tVar.f89135g;
        this.f89160h = tVar.f89136h;
        this.f89161i = tVar.f89137i;
        this.f89162j = tVar.f89138j;
        this.f89163k = tVar.f89139k;
        this.f89164l = tVar.f89140l;
        this.f89165m = tVar.f89141m;
        this.n = tVar.n;
        this.o = tVar.o;
        this.f89166p = tVar.f89142p;
        this.f89167q = tVar.f89143q;
        this.f89168r = tVar.f89144r;
        this.f89169s = tVar.f89145s;
        this.f89170t = tVar.f89146t;
        this.f89171u = tVar.f89147u;
        this.f89172v = tVar.f89148v;
        this.f89173w = tVar.f89149w;
        this.f89174x = tVar.f89150x;
        this.f89175y = x0.c(tVar.f89151y);
        this.f89176z = d1.n(tVar.f89152z);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && getClass() == obj.getClass()) {
            u uVar = (u) obj;
            if (this.f89153a == uVar.f89153a && this.f89154b == uVar.f89154b && this.f89155c == uVar.f89155c && this.f89156d == uVar.f89156d && this.f89157e == uVar.f89157e && this.f89158f == uVar.f89158f && this.f89159g == uVar.f89159g && this.f89160h == uVar.f89160h && this.f89163k == uVar.f89163k && this.f89161i == uVar.f89161i && this.f89162j == uVar.f89162j && this.f89164l.equals(uVar.f89164l) && this.f89165m == uVar.f89165m && this.n.equals(uVar.n) && this.o == uVar.o && this.f89166p == uVar.f89166p && this.f89167q == uVar.f89167q && this.f89168r.equals(uVar.f89168r) && this.f89169s.equals(uVar.f89169s) && this.f89170t == uVar.f89170t && this.f89171u == uVar.f89171u && this.f89172v == uVar.f89172v && this.f89173w == uVar.f89173w && this.f89174x == uVar.f89174x) {
                x0 x0Var = uVar.f89175y;
                x0 x0Var2 = this.f89175y;
                x0Var2.getClass();
                if (vm.d.f(x0Var, x0Var2) && this.f89176z.equals(uVar.f89176z)) {
                    return true;
                }
            }
        }
        return false;
    }

    public int hashCode() {
        return this.f89176z.hashCode() + ((this.f89175y.hashCode() + ((((((((((((this.f89169s.hashCode() + ((this.f89168r.hashCode() + ((((((((this.n.hashCode() + ((((this.f89164l.hashCode() + ((((((((((((((((((((((this.f89153a + 31) * 31) + this.f89154b) * 31) + this.f89155c) * 31) + this.f89156d) * 31) + this.f89157e) * 31) + this.f89158f) * 31) + this.f89159g) * 31) + this.f89160h) * 31) + (this.f89163k ? 1 : 0)) * 31) + this.f89161i) * 31) + this.f89162j) * 31)) * 31) + this.f89165m) * 31)) * 31) + this.o) * 31) + this.f89166p) * 31) + this.f89167q) * 31)) * 31)) * 31) + this.f89170t) * 31) + this.f89171u) * 31) + (this.f89172v ? 1 : 0)) * 31) + (this.f89173w ? 1 : 0)) * 31) + (this.f89174x ? 1 : 0)) * 31)) * 31);
    }
}
