package j3;

import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.NodeChain;
import b3.p2;
import b3.t1;
import java.util.ArrayList;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import z.o0;
import z2.r1;

/* loaded from: classes.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final Modifier$Node f68820a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f68821b;

    /* renamed from: c, reason: collision with root package name */
    public final LayoutNode f68822c;

    /* renamed from: d, reason: collision with root package name */
    public final k f68823d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f68824e;

    /* renamed from: f, reason: collision with root package name */
    public q f68825f;

    /* renamed from: g, reason: collision with root package name */
    public final int f68826g;

    public q(Modifier$Node modifier$Node, boolean z11, LayoutNode layoutNode, k kVar) {
        this.f68820a = modifier$Node;
        this.f68821b = z11;
        this.f68822c = layoutNode;
        this.f68823d = kVar;
        this.f68826g = layoutNode.getSemanticsId();
    }

    public static /* synthetic */ List j(int i5, q qVar) {
        return qVar.i((i5 & 1) != 0 ? !qVar.f68821b : false, (i5 & 2) == 0);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v10, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r2v11 */
    /* JADX WARN: Type inference failed for: r2v12, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r2v13, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r2v14 */
    /* JADX WARN: Type inference failed for: r2v15 */
    /* JADX WARN: Type inference failed for: r2v16 */
    /* JADX WARN: Type inference failed for: r2v17 */
    /* JADX WARN: Type inference failed for: r2v18 */
    /* JADX WARN: Type inference failed for: r2v19 */
    /* JADX WARN: Type inference failed for: r2v2 */
    /* JADX WARN: Type inference failed for: r2v3 */
    /* JADX WARN: Type inference failed for: r2v9 */
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
    public final h2.c a(t1 t1Var) {
        DelegatingNode delegatingNodeB;
        q qVarL = l();
        if (qVarL == null) {
            return h2.c.f59017e;
        }
        NodeChain nodes$ui_release = qVarL.f68822c.getNodes();
        if ((nodes$ui_release.getAggregateChildKindSet() & 8) != 0) {
            loop0: for (Modifier$Node head = nodes$ui_release.getHead(); head != null; head = head.getChild()) {
                if ((head.getKindSet() & 8) != 0) {
                    delegatingNodeB = head;
                    ?? eVar = 0;
                    while (delegatingNodeB != 0) {
                        if (delegatingNodeB instanceof p2) {
                            if (delegatingNodeB.isImportantForBounds()) {
                                break loop0;
                            }
                        } else if ((delegatingNodeB.getKindSet() & 8) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                            Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                            int i5 = 0;
                            delegatingNodeB = delegatingNodeB;
                            eVar = eVar;
                            while (delegate$ui_release != null) {
                                if ((delegate$ui_release.getKindSet() & 8) != 0) {
                                    i5++;
                                    eVar = eVar;
                                    if (i5 == 1) {
                                        delegatingNodeB = delegate$ui_release;
                                    } else {
                                        if (eVar == 0) {
                                            eVar = new r1.e(new Modifier$Node[16]);
                                        }
                                        if (delegatingNodeB != 0) {
                                            eVar.b(delegatingNodeB);
                                            delegatingNodeB = 0;
                                        }
                                        eVar.b(delegate$ui_release);
                                    }
                                }
                                delegate$ui_release = delegate$ui_release.getChild();
                                delegatingNodeB = delegatingNodeB;
                                eVar = eVar;
                            }
                            if (i5 == 1) {
                            }
                        }
                        delegatingNodeB = b3.o.b(eVar);
                    }
                }
                if ((head.getAggregateChildKindSet() & 8) == 0) {
                    break;
                }
            }
            delegatingNodeB = 0;
        } else {
            delegatingNodeB = 0;
        }
        p2 p2Var = (p2) delegatingNodeB;
        t1 t1VarD = p2Var != null ? b3.o.d(p2Var, 8) : null;
        return t1VarD == null ? qVarL.a(t1Var) : t1VarD.i(t1Var, true);
    }

    public final q b(h hVar, Function1 function1) {
        k kVar = new k();
        kVar.f68814c = false;
        kVar.f68815d = false;
        function1.invoke(kVar);
        q qVar = new q(new p(function1), false, new LayoutNode(true, this.f68826g + (hVar != null ? 1000000000 : 2000000000)), kVar);
        qVar.f68824e = true;
        qVar.f68825f = this;
        return qVar;
    }

    public final void c(LayoutNode layoutNode, ArrayList arrayList) {
        r1.e zSortedChildren = layoutNode.getZSortedChildren();
        Object[] objArr = zSortedChildren.f85077a;
        int i5 = zSortedChildren.f85079c;
        for (int i11 = 0; i11 < i5; i11++) {
            LayoutNode layoutNode2 = (LayoutNode) objArr[i11];
            if (layoutNode2.isAttached() && !layoutNode2.getIsDeactivated()) {
                if (layoutNode2.getNodes().m44hasH91voCI$ui_release(8)) {
                    arrayList.add(bh.g.q(layoutNode2, this.f68821b));
                } else {
                    c(layoutNode2, arrayList);
                }
            }
        }
    }

    public final t1 d() {
        if (!this.f68824e) {
            p2 p2VarF = f();
            return p2VarF != null ? b3.o.d(p2VarF, 8) : this.f68822c.getInnerCoordinator$ui_release();
        }
        q qVarL = l();
        if (qVarL != null) {
            return qVarL.d();
        }
        return null;
    }

    public final void e(ArrayList arrayList, ArrayList arrayList2) {
        p(arrayList, false);
        int size = arrayList.size();
        for (int size2 = arrayList.size(); size2 < size; size2++) {
            q qVar = (q) arrayList.get(size2);
            if (qVar.m()) {
                arrayList2.add(qVar);
            } else if (!qVar.f68823d.f68815d) {
                qVar.e(arrayList, arrayList2);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r6v12 */
    /* JADX WARN: Type inference failed for: r6v13, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r6v14, types: [b3.p2] */
    /* JADX WARN: Type inference failed for: r6v15 */
    /* JADX WARN: Type inference failed for: r6v16, types: [androidx.compose.ui.Modifier$Node] */
    /* JADX WARN: Type inference failed for: r6v17, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r6v18 */
    /* JADX WARN: Type inference failed for: r6v19 */
    /* JADX WARN: Type inference failed for: r6v20 */
    /* JADX WARN: Type inference failed for: r6v21 */
    /* JADX WARN: Type inference failed for: r6v22 */
    /* JADX WARN: Type inference failed for: r6v23 */
    /* JADX WARN: Type inference failed for: r7v12 */
    /* JADX WARN: Type inference failed for: r7v13 */
    /* JADX WARN: Type inference failed for: r7v14 */
    /* JADX WARN: Type inference failed for: r7v15, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r7v16 */
    /* JADX WARN: Type inference failed for: r7v17 */
    /* JADX WARN: Type inference failed for: r7v18, types: [r1.e] */
    /* JADX WARN: Type inference failed for: r7v20 */
    /* JADX WARN: Type inference failed for: r7v21 */
    /* JADX WARN: Type inference failed for: r7v22 */
    /* JADX WARN: Type inference failed for: r7v23 */
    public final p2 f() {
        Modifier$Node modifier$NodeB;
        boolean z11 = this.f68823d.f68814c;
        LayoutNode layoutNode = this.f68822c;
        Object obj = null;
        if (z11) {
            NodeChain nodes$ui_release = layoutNode.getNodes();
            if ((nodes$ui_release.getAggregateChildKindSet() & 8) != 0) {
                modifier$NodeB = null;
                for (Modifier$Node head = nodes$ui_release.getHead(); head != null; head = head.getChild()) {
                    if ((head.getKindSet() & 8) != 0) {
                        DelegatingNode delegatingNodeB = head;
                        ?? eVar = 0;
                        while (delegatingNodeB != 0) {
                            if (delegatingNodeB instanceof p2) {
                                ?? r62 = (p2) delegatingNodeB;
                                if (r62.isImportantForBounds()) {
                                    if (r62.getShouldMergeDescendantSemantics()) {
                                        return r62;
                                    }
                                    if (modifier$NodeB == null) {
                                        modifier$NodeB = r62;
                                    }
                                }
                            } else if ((delegatingNodeB.getKindSet() & 8) != 0 && (delegatingNodeB instanceof DelegatingNode)) {
                                Modifier$Node delegate$ui_release = delegatingNodeB.getDelegate();
                                int i5 = 0;
                                delegatingNodeB = delegatingNodeB;
                                eVar = eVar;
                                while (delegate$ui_release != null) {
                                    if ((delegate$ui_release.getKindSet() & 8) != 0) {
                                        i5++;
                                        eVar = eVar;
                                        if (i5 == 1) {
                                            delegatingNodeB = delegate$ui_release;
                                        } else {
                                            if (eVar == 0) {
                                                eVar = new r1.e(new Modifier$Node[16]);
                                            }
                                            if (delegatingNodeB != 0) {
                                                eVar.b(delegatingNodeB);
                                                delegatingNodeB = 0;
                                            }
                                            eVar.b(delegate$ui_release);
                                        }
                                    }
                                    delegate$ui_release = delegate$ui_release.getChild();
                                    delegatingNodeB = delegatingNodeB;
                                    eVar = eVar;
                                }
                                if (i5 == 1) {
                                }
                            }
                            delegatingNodeB = b3.o.b(eVar);
                        }
                    }
                    if ((head.getAggregateChildKindSet() & 8) == 0) {
                        break;
                    }
                }
                obj = modifier$NodeB;
            }
        } else {
            NodeChain nodes$ui_release2 = layoutNode.getNodes();
            if ((nodes$ui_release2.getAggregateChildKindSet() & 8) != 0) {
                loop3: for (Modifier$Node head2 = nodes$ui_release2.getHead(); head2 != null; head2 = head2.getChild()) {
                    if ((head2.getKindSet() & 8) != 0) {
                        modifier$NodeB = head2;
                        r1.e eVar2 = null;
                        while (modifier$NodeB != null) {
                            if (modifier$NodeB instanceof p2) {
                                if (((p2) modifier$NodeB).isImportantForBounds()) {
                                    obj = modifier$NodeB;
                                }
                            } else if ((modifier$NodeB.getKindSet() & 8) != 0 && (modifier$NodeB instanceof DelegatingNode)) {
                                int i11 = 0;
                                for (Modifier$Node delegate$ui_release2 = ((DelegatingNode) modifier$NodeB).getDelegate(); delegate$ui_release2 != null; delegate$ui_release2 = delegate$ui_release2.getChild()) {
                                    if ((delegate$ui_release2.getKindSet() & 8) != 0) {
                                        i11++;
                                        if (i11 == 1) {
                                            modifier$NodeB = delegate$ui_release2;
                                        } else {
                                            if (eVar2 == null) {
                                                eVar2 = new r1.e(new Modifier$Node[16]);
                                            }
                                            if (modifier$NodeB != null) {
                                                eVar2.b(modifier$NodeB);
                                                modifier$NodeB = null;
                                            }
                                            eVar2.b(delegate$ui_release2);
                                        }
                                    }
                                }
                                if (i11 == 1) {
                                }
                            }
                            modifier$NodeB = b3.o.b(eVar2);
                        }
                    }
                    if ((head2.getAggregateChildKindSet() & 8) == 0) {
                        break;
                    }
                }
            }
        }
        return (p2) obj;
    }

    public final h2.c g() {
        t1 t1VarD = d();
        if (t1VarD != null) {
            if (!t1VarD.isAttached()) {
                t1VarD = null;
            }
            if (t1VarD != null) {
                return r1.f(t1VarD).i(t1VarD, true);
            }
        }
        return h2.c.f59017e;
    }

    public final h2.c h() {
        t1 t1VarD = d();
        if (t1VarD != null) {
            if (!t1VarD.isAttached()) {
                t1VarD = null;
            }
            if (t1VarD != null) {
                return r1.e(t1VarD);
            }
        }
        return h2.c.f59017e;
    }

    public final List i(boolean z11, boolean z12) {
        if (!z11 && this.f68823d.f68815d) {
            return EmptyList.f71733a;
        }
        ArrayList arrayList = new ArrayList();
        if (!m()) {
            return p(arrayList, z12);
        }
        ArrayList arrayList2 = new ArrayList();
        e(arrayList, arrayList2);
        return arrayList2;
    }

    public final k k() {
        boolean zM = m();
        k kVar = this.f68823d;
        if (!zM) {
            return kVar;
        }
        k kVarC = kVar.c();
        o(new ArrayList(), kVarC);
        return kVarC;
    }

    public final q l() {
        LayoutNode parent$ui_release;
        q qVar = this.f68825f;
        if (qVar != null) {
            return qVar;
        }
        LayoutNode layoutNode = this.f68822c;
        boolean z11 = this.f68821b;
        if (z11) {
            parent$ui_release = layoutNode.getParent$ui_release();
            while (parent$ui_release != null) {
                k semanticsConfiguration = parent$ui_release.getSemanticsConfiguration();
                if (semanticsConfiguration != null && semanticsConfiguration.f68814c) {
                    break;
                }
                parent$ui_release = parent$ui_release.getParent$ui_release();
            }
            parent$ui_release = null;
        } else {
            parent$ui_release = null;
        }
        if (parent$ui_release == null) {
            LayoutNode parent$ui_release2 = layoutNode.getParent$ui_release();
            while (true) {
                if (parent$ui_release2 == null) {
                    parent$ui_release = null;
                    break;
                }
                if (parent$ui_release2.getNodes().m44hasH91voCI$ui_release(8)) {
                    parent$ui_release = parent$ui_release2;
                    break;
                }
                parent$ui_release2 = parent$ui_release2.getParent$ui_release();
            }
        }
        if (parent$ui_release == null) {
            return null;
        }
        return bh.g.q(parent$ui_release, z11);
    }

    public final boolean m() {
        return this.f68821b && this.f68823d.f68814c;
    }

    public final boolean n() {
        if (this.f68824e || !j(4, this).isEmpty()) {
            return false;
        }
        LayoutNode parent$ui_release = this.f68822c.getParent$ui_release();
        while (true) {
            if (parent$ui_release == null) {
                parent$ui_release = null;
                break;
            }
            k semanticsConfiguration = parent$ui_release.getSemanticsConfiguration();
            if (semanticsConfiguration != null && semanticsConfiguration.f68814c) {
                break;
            }
            parent$ui_release = parent$ui_release.getParent$ui_release();
        }
        return parent$ui_release == null;
    }

    public final void o(ArrayList arrayList, k kVar) {
        if (this.f68823d.f68815d) {
            return;
        }
        p(arrayList, false);
        int size = arrayList.size();
        for (int size2 = arrayList.size(); size2 < size; size2++) {
            q qVar = (q) arrayList.get(size2);
            if (!qVar.m()) {
                kVar.e(qVar.f68823d);
                qVar.o(arrayList, kVar);
            }
        }
    }

    public final List p(ArrayList arrayList, boolean z11) {
        if (this.f68824e) {
            return EmptyList.f71733a;
        }
        c(this.f68822c, arrayList);
        if (z11) {
            k kVar = this.f68823d;
            o0 o0Var = kVar.f68812a;
            Object objD = o0Var.d(w.f68873x);
            if (objD == null) {
                objD = null;
            }
            h hVar = (h) objD;
            if (hVar != null && kVar.f68814c && !arrayList.isEmpty()) {
                arrayList.add(b(hVar, new androidx.fragment.app.p(hVar, 17)));
            }
            a0 a0Var = w.f68852a;
            if (o0Var.b(a0Var) && !arrayList.isEmpty() && kVar.f68814c) {
                Object objD2 = o0Var.d(a0Var);
                if (objD2 == null) {
                    objD2 = null;
                }
                List list = (List) objD2;
                String str = list != null ? (String) b70.g.Y0(list) : null;
                if (str != null) {
                    arrayList.add(0, b(null, new o(str, 0)));
                }
            }
        }
        return arrayList;
    }
}
