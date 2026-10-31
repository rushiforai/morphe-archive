package e2;

import androidx.compose.ui.Modifier$Node;
import b3.c0;
import b3.u2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes.dex */
public final class g extends Modifier$Node implements u2, i, c0 {

    /* renamed from: b, reason: collision with root package name */
    public g f51998b;

    /* renamed from: c, reason: collision with root package name */
    public i f51999c;

    /* renamed from: a, reason: collision with root package name */
    public final d f51997a = d.f51992a;

    /* renamed from: d, reason: collision with root package name */
    public long f52000d = 0;

    public final boolean B(cm.f fVar) {
        g gVar = this.f51998b;
        if (gVar != null) {
            return gVar.B(fVar);
        }
        i iVar = this.f51999c;
        if (iVar != null) {
            return ((g) iVar).B(fVar);
        }
        return false;
    }

    public final void D(cm.f fVar) {
        i iVar = this.f51999c;
        if (iVar != null) {
            ((g) iVar).D(fVar);
            return;
        }
        g gVar = this.f51998b;
        if (gVar != null) {
            gVar.D(fVar);
        }
    }

    public final void E(cm.f fVar) {
        i iVar = this.f51999c;
        if (iVar != null) {
            ((g) iVar).E(fVar);
        }
        g gVar = this.f51998b;
        if (gVar != null) {
            gVar.E(fVar);
        }
        this.f51998b = null;
    }

    public final void F(cm.f fVar) {
        u2 u2Var;
        g gVar;
        g gVar2 = this.f51998b;
        if (gVar2 == null || !h.a(gVar2, wh.f.Q(fVar))) {
            if (getNode().getIsAttached()) {
                Ref.ObjectRef objectRef = new Ref.ObjectRef();
                t2.c.S(this, new f(objectRef, this, fVar));
                u2Var = (u2) objectRef.f71863a;
            } else {
                u2Var = null;
            }
            gVar = (g) u2Var;
        } else {
            gVar = gVar2;
        }
        if (gVar != null && gVar2 == null) {
            h.b(gVar, fVar);
            i iVar = this.f51999c;
            if (iVar != null) {
                ((g) iVar).E(fVar);
            }
        } else if (gVar == null && gVar2 != null) {
            i iVar2 = this.f51999c;
            if (iVar2 != null) {
                h.b(iVar2, fVar);
            }
            gVar2.E(fVar);
        } else if (!Intrinsics.b(gVar, gVar2)) {
            if (gVar != null) {
                h.b(gVar, fVar);
            }
            if (gVar2 != null) {
                gVar2.E(fVar);
            }
        } else if (gVar != null) {
            gVar.F(fVar);
        } else {
            i iVar3 = this.f51999c;
            if (iVar3 != null) {
                ((g) iVar3).F(fVar);
            }
        }
        this.f51998b = gVar;
    }

    public final void H(cm.f fVar) {
        i iVar = this.f51999c;
        if (iVar != null) {
            ((g) iVar).H(fVar);
            return;
        }
        g gVar = this.f51998b;
        if (gVar != null) {
            gVar.H(fVar);
        }
    }

    @Override // b3.u2
    public final Object a() {
        return this.f51997a;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        this.f51999c = null;
        this.f51998b = null;
    }

    @Override // b3.c0
    /* renamed from: onRemeasured-ozmzZPI */
    public final void mo27onRemeasuredozmzZPI(long j11) {
        this.f52000d = j11;
    }
}
