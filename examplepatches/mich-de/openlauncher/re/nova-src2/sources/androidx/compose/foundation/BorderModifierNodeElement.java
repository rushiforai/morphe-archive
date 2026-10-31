package androidx.compose.foundation;

import a5.d1;
import androidx.compose.ui.Modifier$Node;
import b3.j1;
import c3.q2;
import e0.t;
import i2.p;
import i2.s;
import i2.v0;
import i2.x0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import y3.f;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001¨\u0006\u0003"}, d2 = {"Landroidx/compose/foundation/BorderModifierNodeElement;", "Lb3/j1;", "Le0/t;", "foundation_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public final /* data */ class BorderModifierNodeElement extends j1 {

    /* renamed from: b, reason: collision with root package name */
    public final float f13877b;

    /* renamed from: c, reason: collision with root package name */
    public final p f13878c;

    /* renamed from: d, reason: collision with root package name */
    public final v0 f13879d;

    public BorderModifierNodeElement(float f11, p pVar, v0 v0Var) {
        this.f13877b = f11;
        this.f13878c = pVar;
        this.f13879d = v0Var;
    }

    @Override // b3.j1
    public final Modifier$Node create() {
        return new t(this.f13877b, this.f13878c, this.f13879d);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof BorderModifierNodeElement)) {
            return false;
        }
        BorderModifierNodeElement borderModifierNodeElement = (BorderModifierNodeElement) obj;
        return f.a(this.f13877b, borderModifierNodeElement.f13877b) && Intrinsics.b(this.f13878c, borderModifierNodeElement.f13878c) && Intrinsics.b(this.f13879d, borderModifierNodeElement.f13879d);
    }

    public final int hashCode() {
        return this.f13879d.hashCode() + ((this.f13878c.hashCode() + (Float.hashCode(this.f13877b) * 31)) * 31);
    }

    @Override // b3.j1
    public final void inspectableProperties(q2 q2Var) {
        q2Var.d("border");
        q2Var.b().b("width", new f(this.f13877b));
        p pVar = this.f13878c;
        if (pVar instanceof x0) {
            d1 d1VarB = q2Var.b();
            long j11 = ((x0) pVar).f61189a;
            d1VarB.b("color", new s(j11));
            q2Var.e(new s(j11));
        } else {
            q2Var.b().b("brush", pVar);
        }
        q2Var.b().b("shape", this.f13879d);
    }

    public final String toString() {
        return "BorderModifierNodeElement(width=" + ((Object) f.b(this.f13877b)) + ", brush=" + this.f13878c + ", shape=" + this.f13879d + ')';
    }

    @Override // b3.j1
    public final void update(Modifier$Node modifier$Node) {
        t tVar = (t) modifier$Node;
        float f11 = tVar.f50126b;
        f2.b bVar = tVar.f50129e;
        float f12 = this.f13877b;
        if (!f.a(f11, f12)) {
            tVar.f50126b = f12;
            bVar.B();
        }
        p pVar = tVar.f50127c;
        p pVar2 = this.f13878c;
        if (!Intrinsics.b(pVar, pVar2)) {
            tVar.f50127c = pVar2;
            bVar.B();
        }
        v0 v0Var = tVar.f50128d;
        v0 v0Var2 = this.f13879d;
        if (Intrinsics.b(v0Var, v0Var2)) {
            return;
        }
        tVar.f50128d = v0Var2;
        bVar.B();
    }
}
