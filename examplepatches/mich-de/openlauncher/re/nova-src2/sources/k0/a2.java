package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes2.dex */
public final class a2 extends Modifier$Node implements b3.j2 {

    /* renamed from: a, reason: collision with root package name */
    public z2.n f70562a;

    @Override // b3.j2
    public final Object modifyParentData(y3.c cVar, Object obj) {
        u1 u1Var = obj instanceof u1 ? (u1) obj : null;
        if (u1Var == null) {
            u1Var = new u1();
        }
        u1Var.f70756c = new c0(new a(this.f70562a));
        return u1Var;
    }
}
