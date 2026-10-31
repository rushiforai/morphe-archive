package c0;

import p1.s2;
import p1.y2;

/* loaded from: classes2.dex */
public final class j0 implements y2 {

    /* renamed from: a, reason: collision with root package name */
    public Number f18837a;

    /* renamed from: b, reason: collision with root package name */
    public Number f18838b;

    /* renamed from: c, reason: collision with root package name */
    public final i2 f18839c;

    /* renamed from: d, reason: collision with root package name */
    public final p1.e1 f18840d;

    /* renamed from: e, reason: collision with root package name */
    public t1 f18841e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f18842f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f18843g;

    /* renamed from: h, reason: collision with root package name */
    public long f18844h;

    /* renamed from: i, reason: collision with root package name */
    public final /* synthetic */ n0 f18845i;

    public j0(n0 n0Var, Number number, Number number2, i2 i2Var, i0 i0Var) {
        this.f18845i = n0Var;
        this.f18837a = number;
        this.f18838b = number2;
        this.f18839c = i2Var;
        this.f18840d = androidx.compose.runtime.d.k(number);
        this.f18841e = new t1(i0Var, i2Var, this.f18837a, this.f18838b, null);
    }

    @Override // p1.y2
    public final Object getValue() {
        return ((s2) this.f18840d).getValue();
    }
}
