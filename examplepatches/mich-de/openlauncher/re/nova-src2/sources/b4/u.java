package b4;

import android.view.View;
import android.view.ViewTreeObserver;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.Owner;
import g2.a0;
import g2.z;

/* loaded from: classes.dex */
public final class u extends Modifier$Node implements g2.q, ViewTreeObserver.OnGlobalFocusChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public View f17525a;

    /* renamed from: b, reason: collision with root package name */
    public ViewTreeObserver f17526b;

    /* renamed from: c, reason: collision with root package name */
    public final t f17527c = new t(this, 0);

    /* renamed from: d, reason: collision with root package name */
    public final t f17528d = new t(this, 1);

    public final z B() {
        if (!getNode().getIsAttached()) {
            y2.a.b("visitLocalDescendants called on an unattached node");
        }
        Modifier$Node node = getNode();
        if ((node.getAggregateChildKindSet() & 1024) != 0) {
            boolean z11 = false;
            for (Modifier$Node child = node.getChild(); child != null; child = child.getChild()) {
                if ((child.getKindSet() & 1024) != 0) {
                    Modifier$Node modifier$NodeB = child;
                    r1.e eVar = null;
                    while (modifier$NodeB != null) {
                        if (modifier$NodeB instanceof z) {
                            z zVar = (z) modifier$NodeB;
                            if (z11) {
                                return zVar;
                            }
                            z11 = true;
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
            }
        }
        throw new IllegalStateException("Could not find focus target of embedded view wrapper");
    }

    @Override // g2.q
    public final void applyFocusProperties(g2.m mVar) {
        mVar.b(false);
        mVar.d(this.f17527c);
        mVar.a(this.f17528d);
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onAttach() {
        super.onAttach();
        ViewTreeObserver viewTreeObserver = b3.g.g(this).getViewTreeObserver();
        this.f17526b = viewTreeObserver;
        viewTreeObserver.addOnGlobalFocusChangeListener(this);
    }

    @Override // androidx.compose.ui.Modifier$Node
    public final void onDetach() {
        ViewTreeObserver viewTreeObserver = this.f17526b;
        if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
            viewTreeObserver.removeOnGlobalFocusChangeListener(this);
        }
        this.f17526b = null;
        b3.g.g(this).getViewTreeObserver().removeOnGlobalFocusChangeListener(this);
        this.f17525a = null;
        super.onDetach();
    }

    @Override // android.view.ViewTreeObserver.OnGlobalFocusChangeListener
    public final void onGlobalFocusChanged(View view, View view2) {
        if (b3.o.f(this).getOwner() == null) {
            return;
        }
        View viewC = o.c(this);
        g2.j focusOwner = b3.o.g(this).getFocusOwner();
        Owner ownerG = b3.o.g(this);
        boolean z11 = (view == null || view.equals(ownerG) || !o.a(viewC, view)) ? false : true;
        boolean z12 = (view2 == null || view2.equals(ownerG) || !o.a(viewC, view2)) ? false : true;
        if (z11 && z12) {
            this.f17525a = view2;
            return;
        }
        if (z12) {
            this.f17525a = view2;
            z zVarB = B();
            if (zVarB.E().a()) {
                return;
            }
            a0.f(zVarB);
            return;
        }
        if (!z11) {
            this.f17525a = null;
            return;
        }
        this.f17525a = null;
        if (B().E().b()) {
            ((g2.l) focusOwner).d(8, false, false);
        }
    }
}
