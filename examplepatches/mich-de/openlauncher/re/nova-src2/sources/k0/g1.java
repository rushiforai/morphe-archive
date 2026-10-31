package k0;

import androidx.compose.ui.Modifier$Node;

/* loaded from: classes.dex */
public final class g1 extends Modifier$Node implements b3.j2 {

    /* renamed from: a, reason: collision with root package name */
    public float f70611a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f70612b;

    @Override // b3.j2
    public final Object modifyParentData(y3.c cVar, Object obj) {
        u1 u1Var = obj instanceof u1 ? (u1) obj : null;
        if (u1Var == null) {
            u1Var = new u1();
        }
        u1Var.f70754a = this.f70611a;
        u1Var.f70755b = this.f70612b;
        return u1Var;
    }
}
