package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import k0.g0;
import k0.i0;
import kotlin.Metadata;

/* JADX INFO: Access modifiers changed from: package-private */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/FillElement;", "Lb3/j1;", "Lk0/i0;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final class FillElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final g0 f13935b;

    /* renamed from: c, reason: collision with root package name */
    public final float f13936c;

    /* renamed from: d, reason: collision with root package name */
    public final String f13937d;

    public FillElement(g0 g0Var, float f11, String str) {
        this.f13935b = g0Var;
        this.f13936c = f11;
        this.f13937d = str;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        i0 i0Var = new i0();
        i0Var.f70641a = this.f13935b;
        i0Var.f70642b = this.f13936c;
        return i0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FillElement)) {
            return false;
        }
        FillElement fillElement = (FillElement) obj;
        return this.f13935b == fillElement.f13935b && this.f13936c == fillElement.f13936c;
    }

    public final int hashCode() {
        return Float.hashCode(this.f13936c) + (this.f13935b.hashCode() * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d(this.f13937d);
        q2Var.b().b("fraction", Float.valueOf(this.f13936c));
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        i0 i0Var = (i0) modifier$Node;
        i0Var.f70641a = this.f13935b;
        i0Var.f70642b = this.f13936c;
    }
}
