package androidx.compose.foundation;

import android.view.View;
import androidx.compose.ui.Modifier$Node;
import b.c0;
import b.c9;
import b3.g;
import b3.j1;
import b3.o;
import c3.q2;
import cu.m;
import dv.z;
import e0.d1;
import e0.e1;
import e0.q1;
import j3.a0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import y3.f;
import y3.i;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/MagnifierElement;", "Lb3/j1;", "Le0/d1;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class MagnifierElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final z f13896b;

    /* renamed from: c, reason: collision with root package name */
    public final m f13897c;

    /* renamed from: d, reason: collision with root package name */
    public final q1 f13898d;

    public MagnifierElement(z zVar, m mVar, q1 q1Var) {
        this.f13896b = zVar;
        this.f13897c = mVar;
        this.f13898d = q1Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new d1(this.f13896b, this.f13897c, this.f13898d);
    }

    public final boolean equals(Object obj) {
        return this == obj;
    }

    public final int hashCode() {
        return this.f13898d.hashCode() + ((this.f13897c.hashCode() + c9.f(a80.m.d(Float.NaN, a80.m.d(Float.NaN, c0.d(c9.f(a80.m.d(Float.NaN, this.f13896b.hashCode() * 961, 31), 31, true), 31, 9205357640488583168L), 31), 31), 31, true)) * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.f19405a = "magnifier";
        a5.d1 d1Var = q2Var.f19407c;
        d1Var.b("sourceCenter", this.f13896b);
        d1Var.b("magnifierCenter", null);
        d1Var.b("zoom", Float.valueOf(Float.NaN));
        d1Var.b("size", new i(9205357640488583168L));
        d1Var.b("cornerRadius", new f(Float.NaN));
        d1Var.b("elevation", new f(Float.NaN));
        d1Var.b("clippingEnabled", Boolean.TRUE);
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        d1 d1Var = (d1) modifier$Node;
        float f11 = d1Var.f49948c;
        long j11 = d1Var.f49950e;
        float f12 = d1Var.f49951f;
        boolean z11 = d1Var.f49949d;
        float f13 = d1Var.f49952g;
        boolean z12 = d1Var.f49953h;
        q1 q1Var = d1Var.f49954i;
        View view = d1Var.f49955j;
        y3.c cVar = d1Var.f49956k;
        d1Var.f49946a = this.f13896b;
        d1Var.f49948c = Float.NaN;
        d1Var.f49949d = true;
        d1Var.f49950e = 9205357640488583168L;
        d1Var.f49951f = Float.NaN;
        d1Var.f49952g = Float.NaN;
        d1Var.f49953h = true;
        d1Var.f49947b = this.f13897c;
        q1 q1Var2 = this.f13898d;
        d1Var.f49954i = q1Var2;
        View viewG = g.g(d1Var);
        y3.c density = o.f(d1Var).getDensity();
        if (d1Var.f49957l != null) {
            a0 a0Var = e1.f49969a;
            if (((!Float.isNaN(Float.NaN) || !Float.isNaN(f11)) && Float.NaN != f11 && !q1Var2.b()) || 9205357640488583168L != j11 || !f.a(Float.NaN, f12) || !f.a(Float.NaN, f13) || true != z11 || true != z12 || !q1Var2.equals(q1Var) || !viewG.equals(view) || !Intrinsics.b(density, cVar)) {
                d1Var.D();
            }
        }
        d1Var.E();
    }
}
