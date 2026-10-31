package xk;

/* loaded from: classes3.dex */
public final class q2 extends p0 {

    /* renamed from: j, reason: collision with root package name */
    public static final q2 f95997j = new q2();

    /* renamed from: e, reason: collision with root package name */
    public final transient Object f95998e;

    /* renamed from: f, reason: collision with root package name */
    public final transient Object[] f95999f;

    /* renamed from: g, reason: collision with root package name */
    public final transient int f96000g;

    /* renamed from: h, reason: collision with root package name */
    public final transient int f96001h;

    /* renamed from: i, reason: collision with root package name */
    public final transient q2 f96002i;

    public q2() {
        super(0);
        this.f95998e = null;
        this.f95999f = new Object[0];
        this.f96000g = 0;
        this.f96001h = 0;
        this.f96002i = this;
    }

    @Override // xk.x0
    public final d1 d() {
        return new t2(this, this.f95999f, this.f96000g, this.f96001h);
    }

    @Override // xk.x0
    public final d1 e() {
        return new u2(this, new v2(this.f95999f, this.f96000g, this.f96001h));
    }

    @Override // xk.x0, java.util.Map
    public final Object get(Object obj) {
        Object objM = w2.m(this.f95998e, this.f95999f, this.f96001h, this.f96000g, obj);
        if (objM == null) {
            return null;
        }
        return objM;
    }

    @Override // xk.x0
    public final boolean h() {
        return false;
    }

    @Override // java.util.Map
    public final int size() {
        return this.f96001h;
    }

    public q2(Object obj, Object[] objArr, int i5, q2 q2Var) {
        super(0);
        this.f95998e = obj;
        this.f95999f = objArr;
        this.f96000g = 1;
        this.f96001h = i5;
        this.f96002i = q2Var;
    }

    public q2(Object[] objArr, int i5) {
        super(0);
        this.f95999f = objArr;
        this.f96001h = i5;
        this.f96000g = 0;
        int iK = i5 >= 2 ? d1.k(i5) : 0;
        Object objL = w2.l(objArr, i5, iK, 0);
        if (!(objL instanceof Object[])) {
            this.f95998e = objL;
            Object objL2 = w2.l(objArr, i5, iK, 1);
            if (!(objL2 instanceof Object[])) {
                this.f96002i = new q2(objL2, objArr, i5, this);
                return;
            }
            throw ((w0) ((Object[]) objL2)[2]).a();
        }
        throw ((w0) ((Object[]) objL)[2]).a();
    }
}
