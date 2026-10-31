package b3;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.Owner;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class o {
    public static final void a(r1.e eVar, Modifier$Node modifier$Node) {
        r1.e eVar2 = f(modifier$Node).get_children$ui_release();
        int i5 = eVar2.f85079c - 1;
        Object[] objArr = eVar2.f85077a;
        if (i5 < objArr.length) {
            while (i5 >= 0) {
                eVar.b(((LayoutNode) objArr[i5]).getNodes().getHead());
                i5--;
            }
        }
    }

    public static final Modifier$Node b(r1.e eVar) {
        int i5;
        if (eVar == null || (i5 = eVar.f85079c) == 0) {
            return null;
        }
        return (Modifier$Node) eVar.k(i5 - 1);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final e0 c(Modifier$Node modifier$Node) {
        if ((modifier$Node.getKindSet() & 2) != 0) {
            if (modifier$Node instanceof e0) {
                return (e0) modifier$Node;
            }
            if (modifier$Node instanceof DelegatingNode) {
                Modifier$Node delegate$ui_release = ((DelegatingNode) modifier$Node).getDelegate();
                while (delegate$ui_release != 0) {
                    if (delegate$ui_release instanceof e0) {
                        return (e0) delegate$ui_release;
                    }
                    delegate$ui_release = (!(delegate$ui_release instanceof DelegatingNode) || (delegate$ui_release.getKindSet() & 2) == 0) ? delegate$ui_release.getChild() : ((DelegatingNode) delegate$ui_release).getDelegate();
                }
            }
        }
        return null;
    }

    public static final t1 d(n nVar, int i5) {
        t1 coordinator = nVar.getNode().getCoordinator();
        Intrinsics.d(coordinator);
        if (coordinator.w0() != nVar || !u1.h(i5)) {
            return coordinator;
        }
        t1 t1Var = coordinator.f17359p;
        Intrinsics.d(t1Var);
        return t1Var;
    }

    public static final t1 e(n nVar) {
        if (!nVar.getNode().getIsAttached()) {
            y2.a.b("Cannot get LayoutCoordinates, Modifier.Node is not attached.");
        }
        t1 t1VarD = d(nVar, 2);
        if (!t1VarD.isAttached()) {
            y2.a.b("LayoutCoordinates is not attached.");
        }
        return t1VarD;
    }

    public static final LayoutNode f(n nVar) {
        t1 coordinator = nVar.getNode().getCoordinator();
        if (coordinator != null) {
            return coordinator.o;
        }
        throw a2.c.r("Cannot obtain node coordinator. Is the Modifier.Node attached?");
    }

    public static final Owner g(n nVar) {
        Owner owner = f(nVar).getOwner();
        if (owner != null) {
            return owner;
        }
        throw a2.c.r("This node does not have an owner.");
    }
}
