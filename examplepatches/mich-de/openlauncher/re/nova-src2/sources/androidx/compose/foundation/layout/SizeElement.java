package androidx.compose.foundation.layout;

import a80.m;
import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import c3.r;
import k0.b2;
import kotlin.Metadata;
import kotlin.Unit;
import y3.f;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/SizeElement;", "Lb3/j1;", "Lk0/b2;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class SizeElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final float f13955b;

    /* renamed from: c, reason: collision with root package name */
    public final float f13956c;

    /* renamed from: d, reason: collision with root package name */
    public final float f13957d;

    /* renamed from: e, reason: collision with root package name */
    public final float f13958e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f13959f;

    /* renamed from: g, reason: collision with root package name */
    public final r f13960g;

    public SizeElement(float f11, float f12, float f13, float f14, boolean z11) {
        r rVar = r.n;
        this.f13955b = f11;
        this.f13956c = f12;
        this.f13957d = f13;
        this.f13958e = f14;
        this.f13959f = z11;
        this.f13960g = rVar;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        b2 b2Var = new b2();
        b2Var.f70569a = this.f13955b;
        b2Var.f70570b = this.f13956c;
        b2Var.f70571c = this.f13957d;
        b2Var.f70572d = this.f13958e;
        b2Var.f70573e = this.f13959f;
        return b2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof SizeElement)) {
            return false;
        }
        SizeElement sizeElement = (SizeElement) obj;
        return f.a(this.f13955b, sizeElement.f13955b) && f.a(this.f13956c, sizeElement.f13956c) && f.a(this.f13957d, sizeElement.f13957d) && f.a(this.f13958e, sizeElement.f13958e) && this.f13959f == sizeElement.f13959f;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f13959f) + m.d(this.f13958e, m.d(this.f13957d, m.d(this.f13956c, Float.hashCode(this.f13955b) * 31, 31), 31), 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        this.f13960g.getClass();
        Unit unit = Unit.f71706a;
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        b2 b2Var = (b2) modifier$Node;
        b2Var.f70569a = this.f13955b;
        b2Var.f70570b = this.f13956c;
        b2Var.f70571c = this.f13957d;
        b2Var.f70572d = this.f13958e;
        b2Var.f70573e = this.f13959f;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public /* synthetic */ SizeElement(float f11, float f12, float f13, float f14, boolean z11, int i5) {
        boolean z12;
        float f15;
        f11 = (i5 & 1) != 0 ? Float.NaN : f11;
        f12 = (i5 & 2) != 0 ? Float.NaN : f12;
        f13 = (i5 & 4) != 0 ? Float.NaN : f13;
        if ((i5 & 8) != 0) {
            z12 = z11;
            f15 = Float.NaN;
        } else {
            z12 = z11;
            f15 = f14;
        }
        this(f11, f12, f13, f15, z12);
    }
}
