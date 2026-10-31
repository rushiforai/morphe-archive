package wk;

/* loaded from: classes3.dex */
public class x extends g {

    /* renamed from: a, reason: collision with root package name */
    public final Object f94585a;

    /* renamed from: b, reason: collision with root package name */
    public final int f94586b;

    /* renamed from: c, reason: collision with root package name */
    public final h0 f94587c;

    /* renamed from: d, reason: collision with root package name */
    public volatile z f94588d = g0.f94519r;

    public x(Object obj, int i5, h0 h0Var) {
        this.f94585a = obj;
        this.f94586b = i5;
        this.f94587c = h0Var;
    }

    @Override // wk.g, wk.h0
    public final z d() {
        return this.f94588d;
    }

    @Override // wk.g, wk.h0
    public final Object getKey() {
        return this.f94585a;
    }

    @Override // wk.g, wk.h0
    public final int j() {
        return this.f94586b;
    }

    @Override // wk.g, wk.h0
    public final void m(z zVar) {
        this.f94588d = zVar;
    }

    @Override // wk.g, wk.h0
    public final h0 p() {
        return this.f94587c;
    }
}
