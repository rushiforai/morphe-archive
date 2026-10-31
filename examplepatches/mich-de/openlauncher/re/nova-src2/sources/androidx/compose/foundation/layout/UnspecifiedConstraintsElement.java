package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import k0.d2;
import kotlin.Metadata;
import y3.f;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/layout/UnspecifiedConstraintsElement;", "Lb3/j1;", "Lk0/d2;", "foundation-layout"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
final class UnspecifiedConstraintsElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final float f13961b;

    /* renamed from: c, reason: collision with root package name */
    public final float f13962c;

    public UnspecifiedConstraintsElement(float f11, float f12) {
        this.f13961b = f11;
        this.f13962c = f12;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        d2 d2Var = new d2();
        d2Var.f70591a = this.f13961b;
        d2Var.f70592b = this.f13962c;
        return d2Var;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof UnspecifiedConstraintsElement)) {
            return false;
        }
        UnspecifiedConstraintsElement unspecifiedConstraintsElement = (UnspecifiedConstraintsElement) obj;
        return f.a(this.f13961b, unspecifiedConstraintsElement.f13961b) && f.a(this.f13962c, unspecifiedConstraintsElement.f13962c);
    }

    public final int hashCode() {
        return Float.hashCode(this.f13962c) + (Float.hashCode(this.f13961b) * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("defaultMinSize");
        q2Var.b().b("minWidth", new f(this.f13961b));
        q2Var.b().b("minHeight", new f(this.f13962c));
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        d2 d2Var = (d2) modifier$Node;
        d2Var.f70591a = this.f13961b;
        d2Var.f70592b = this.f13962c;
    }
}
