package z0;

import androidx.compose.ui.node.DelegatingNode;
import b3.m;
import b3.r;
import e0.j;
import e1.q0;
import p1.e1;
import p1.g1;
import p1.s2;
import v2.f0;
import v2.l0;
import z2.y;

/* loaded from: classes2.dex */
public final class e extends DelegatingNode implements m, r {

    /* renamed from: a, reason: collision with root package name */
    public q0 f97881a;

    /* renamed from: b, reason: collision with root package name */
    public final e1 f97882b = androidx.compose.runtime.d.j(null, g1.f81422b);

    public e(q0 q0Var) {
        this.f97881a = q0Var;
        j jVar = new j(this, 5);
        v2.m mVar = f0.f91929a;
        delegate(new l0(null, null, jVar));
    }

    @Override // b3.r
    public final void onGloballyPositioned(y yVar) {
        ((s2) this.f97882b).setValue(yVar);
    }
}
