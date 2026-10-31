package g2;

import android.os.Trace;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import androidx.recyclerview.widget.u1;
import b3.z1;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import p1.s2;

/* loaded from: classes.dex */
public final class z extends Modifier$Node implements b3.m, x, z1, a3.h {

    /* renamed from: a, reason: collision with root package name */
    public final Function2 f56911a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f56912b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f56913c;

    /* renamed from: d, reason: collision with root package name */
    public final int f56914d;

    public z(int i5, int i11, Function2 function2) {
        i5 = (i11 & 1) != 0 ? 1 : i5;
        this.f56911a = (i11 & 2) != 0 ? null : function2;
        this.f56914d = i5;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v10, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r4v11, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v12 */
    /* JADX WARN: Type inference failed for: r4v13 */
    /* JADX WARN: Type inference failed for: r4v14 */
    /* JADX WARN: Type inference failed for: r4v15 */
    /* JADX WARN: Type inference failed for: r4v18 */
    /* JADX WARN: Type inference failed for: r4v19 */
    /* JADX WARN: Type inference failed for: r4v6 */
    /* JADX WARN: Type inference failed for: r4v7, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r4v9 */
    /* JADX WARN: Type inference failed for: r6v0 */
    /* JADX WARN: Type inference failed for: r6v1 */
    /* JADX WARN: Type inference failed for: r6v10 */
    /* JADX WARN: Type inference failed for: r6v11 */
    /* JADX WARN: Type inference failed for: r6v2 */
    /* JADX WARN: Type inference failed for: r6v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r6v4 */
    /* JADX WARN: Type inference failed for: r6v5 */
    /* JADX WARN: Type inference failed for: r6v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r6v8 */
    /* JADX WARN: Type inference failed for: r6v9 */
    public final void B(w wVar, w wVar2) {
        NodeChain nodes;
        Function2 function2;
        l lVar = (l) b3.o.g(this).getFocusOwner();
        z zVar = lVar.f56881h;
        if (!wVar.equals(wVar2) && (function2 = this.f56911a) != null) {
            function2.invoke(wVar, wVar2);
        }
        Modifier$Node node = getNode();
        if (!getNode().getIsAttached()) {
            y2.a.b("visitAncestors called on an unattached node");
        }
        Modifier$Node node2 = getNode();
        LayoutNode layoutNodeF = b3.o.f(this);
        while (layoutNodeF != null) {
            if ((a2.c.c(layoutNodeF) & 5120) != 0) {
                while (node2 != null) {
                    if ((node2.getKindSet() & 5120) != 0) {
                        if (node2 != node && (node2.getKindSet() & 1024) != 0) {
                            return;
                        }
                        if ((node2.getKindSet() & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                            DelegatingNode delegatingNodeB = node2;
                            ?? eVar = 0;
                            while (delegatingNodeB != 0) {
                                if (delegatingNodeB instanceof e) {
                                    e eVar2 = (e) delegatingNodeB;
                                    if (zVar == lVar.f56881h) {
                                        eVar2.onFocusEvent(wVar2);
                                    }
                                } else if ((delegatingNodeB.getKindSet() & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                                    Modifier$Node delegate = delegatingNodeB.getDelegate();
                                    int i5 = 0;
                                    delegatingNodeB = delegatingNodeB;
                                    eVar = eVar;
                                    while (delegate != null) {
                                        if ((delegate.getKindSet() & u1.FLAG_APPEARED_IN_PRE_LAYOUT) != 0) {
                                            i5++;
                                            eVar = eVar;
                                            if (i5 == 1) {
                                                delegatingNodeB = delegate;
                                            } else {
                                                if (eVar == 0) {
                                                    eVar = new r1.e(new Modifier$Node[16]);
                                                }
                                                if (delegatingNodeB != 0) {
                                                    eVar.b(delegatingNodeB);
                                                    delegatingNodeB = 0;
                                                }
                                                eVar.b(delegate);
                                            }
                                        }
                                        delegate = delegate.getChild();
                                        delegatingNodeB = delegatingNodeB;
                                        eVar = eVar;
                                    }
                                    if (i5 == 1) {
                                    }
                                }
                                delegatingNodeB = b3.o.b(eVar);
                            }
                        }
                    }
                    node2 = node2.getParent();
                }
            }
            layoutNodeF = layoutNodeF.getParent$ui_release();
            node2 = (layoutNodeF == null || (nodes = layoutNodeF.getNodes()) == null) ? null : nodes.getTail();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v10, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r6v11, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v12 */
    /* JADX WARN: Type inference failed for: r6v13 */
    /* JADX WARN: Type inference failed for: r6v14 */
    /* JADX WARN: Type inference failed for: r6v15 */
    /* JADX WARN: Type inference failed for: r6v18 */
    /* JADX WARN: Type inference failed for: r6v19 */
    /* JADX WARN: Type inference failed for: r6v6 */
    /* JADX WARN: Type inference failed for: r6v7, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r6v9 */
    /* JADX WARN: Type inference failed for: r8v0 */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v10 */
    /* JADX WARN: Type inference failed for: r8v11 */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v3, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r8v4 */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v6, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r8v8 */
    /* JADX WARN: Type inference failed for: r8v9 */
    public final o D() {
        boolean z11;
        NodeChain nodes;
        o oVar = new o();
        int i5 = this.f56914d;
        if (i5 == 1) {
            z11 = true;
        } else if (i5 == 0) {
            z11 = !(((r2.a) ((s2) ((r2.c) ((r2.b) b3.g.c(this, c3.z1.f19502m))).f85331a).getValue()).f85330a == 1);
        } else {
            if (i5 != 2) {
                throw new IllegalStateException("Unknown Focusability");
            }
            z11 = false;
        }
        oVar.b(z11);
        Modifier$Node node = getNode();
        if (!getNode().getIsAttached()) {
            y2.a.b("visitAncestors called on an unattached node");
        }
        Modifier$Node node2 = getNode();
        LayoutNode layoutNodeF = b3.o.f(this);
        loop0: while (layoutNodeF != null) {
            if ((a2.c.c(layoutNodeF) & 3072) != 0) {
                while (node2 != null) {
                    if ((node2.getKindSet() & 3072) != 0) {
                        if (node2 != node && (node2.getKindSet() & 1024) != 0) {
                            break loop0;
                        }
                        if ((node2.getKindSet() & 2048) != 0) {
                            DelegatingNode delegatingNodeB = node2;
                            ?? eVar = 0;
                            while (delegatingNodeB != 0) {
                                if (delegatingNodeB instanceof q) {
                                    ((q) delegatingNodeB).applyFocusProperties(oVar);
                                } else if ((delegatingNodeB.getKindSet() & 2048) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                                    Modifier$Node delegate = delegatingNodeB.getDelegate();
                                    int i11 = 0;
                                    delegatingNodeB = delegatingNodeB;
                                    eVar = eVar;
                                    while (delegate != null) {
                                        if ((delegate.getKindSet() & 2048) != 0) {
                                            i11++;
                                            eVar = eVar;
                                            if (i11 == 1) {
                                                delegatingNodeB = delegate;
                                            } else {
                                                if (eVar == 0) {
                                                    eVar = new r1.e(new Modifier$Node[16]);
                                                }
                                                if (delegatingNodeB != 0) {
                                                    eVar.b(delegatingNodeB);
                                                    delegatingNodeB = 0;
                                                }
                                                eVar.b(delegate);
                                            }
                                        }
                                        delegate = delegate.getChild();
                                        delegatingNodeB = delegatingNodeB;
                                        eVar = eVar;
                                    }
                                    if (i11 == 1) {
                                    }
                                }
                                delegatingNodeB = b3.o.b(eVar);
                            }
                        }
                    }
                    node2 = node2.getParent();
                }
            }
            layoutNodeF = layoutNodeF.getParent$ui_release();
            node2 = (layoutNodeF == null || (nodes = layoutNodeF.getNodes()) == null) ? null : nodes.getTail();
        }
        return oVar;
    }

    public final w E() {
        l lVar;
        z zVar;
        NodeChain nodes;
        if (getIsAttached() && (zVar = (lVar = (l) b3.o.g(this).getFocusOwner()).f56881h) != null) {
            if (this == zVar) {
                lVar.getClass();
                return w.f56904a;
            }
            if (zVar.getIsAttached()) {
                if (!zVar.getNode().getIsAttached()) {
                    y2.a.b("visitAncestors called on an unattached node");
                }
                Modifier$Node parent = zVar.getNode().getParent();
                LayoutNode layoutNodeF = b3.o.f(zVar);
                while (layoutNodeF != null) {
                    if ((a2.c.c(layoutNodeF) & 1024) != 0) {
                        while (parent != null) {
                            if ((parent.getKindSet() & 1024) != 0) {
                                Modifier$Node modifier$NodeB = parent;
                                r1.e eVar = null;
                                while (modifier$NodeB != null) {
                                    if (modifier$NodeB instanceof z) {
                                        if (this == ((z) modifier$NodeB)) {
                                            return w.f56905b;
                                        }
                                    } else if ((modifier$NodeB.getKindSet() & 1024) != 0 && (modifier$NodeB instanceof DelegatingNode)) {
                                        int i5 = 0;
                                        for (Modifier$Node delegate = ((DelegatingNode) modifier$NodeB).getDelegate(); delegate != null; delegate = delegate.getChild()) {
                                            if ((delegate.getKindSet() & 1024) != 0) {
                                                i5++;
                                                if (i5 == 1) {
                                                    modifier$NodeB = delegate;
                                                } else {
                                                    if (eVar == null) {
                                                        eVar = new r1.e(new Modifier$Node[16]);
                                                    }
                                                    if (modifier$NodeB != null) {
                                                        eVar.b(modifier$NodeB);
                                                        modifier$NodeB = null;
                                                    }
                                                    eVar.b(delegate);
                                                }
                                            }
                                        }
                                        if (i5 == 1) {
                                        }
                                    }
                                    modifier$NodeB = b3.o.b(eVar);
                                }
                            }
                            parent = parent.getParent();
                        }
                    }
                    layoutNodeF = layoutNodeF.getParent$ui_release();
                    parent = (layoutNodeF == null || (nodes = layoutNodeF.getNodes()) == null) ? null : nodes.getTail();
                }
            }
            return w.f56907d;
        }
        return w.f56907d;
    }

    public final void F() {
        int iOrdinal = E().ordinal();
        if (iOrdinal != 0) {
            if (iOrdinal == 1) {
                return;
            }
            if (iOrdinal != 2) {
                if (iOrdinal != 3) {
                    throw new NoWhenBranchMatchedException();
                }
                return;
            }
        }
        Ref.ObjectRef objectRef = new Ref.ObjectRef();
        b3.g.f(this, new y(objectRef, this));
        Object obj = objectRef.f71863a;
        if (obj == null) {
            Intrinsics.m("focusProperties");
            throw null;
        }
        if (((m) obj).c()) {
            return;
        }
        ((l) b3.o.g(this).getFocusOwner()).b(true);
    }

    public final boolean H(int i5) {
        Trace.beginSection("FocusTransactions:requestFocus");
        try {
            boolean zF = false;
            if (!D().c()) {
                Trace.endSection();
                return false;
            }
            int iOrdinal = a0.e(this, i5).ordinal();
            if (iOrdinal == 0) {
                zF = a0.f(this);
            } else if (iOrdinal != 1) {
                if (iOrdinal == 2) {
                    zF = true;
                } else if (iOrdinal != 3) {
                    throw new NoWhenBranchMatchedException();
                }
            }
            return zF;
        } finally {
            Trace.endSection();
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final boolean getShouldAutoInvalidate() {
        return false;
    }

    @Override // b3.z1
    public final void k() {
        F();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        int iOrdinal = E().ordinal();
        if (iOrdinal != 0) {
            if (iOrdinal == 1) {
                return;
            }
            if (iOrdinal != 2) {
                if (iOrdinal != 3) {
                    throw new NoWhenBranchMatchedException();
                }
                return;
            }
        }
        l lVar = (l) b3.o.g(this).getFocusOwner();
        lVar.d(8, true, false);
        lVar.f56877d.a();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onReset() {
        if (E().b()) {
            ((l) b3.o.g(this).getFocusOwner()).d(8, true, true);
        }
    }
}
