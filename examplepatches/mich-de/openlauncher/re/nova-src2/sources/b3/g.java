package b3;

import android.view.View;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.node.BackwardsCompatNode;
import androidx.compose.ui.node.LayoutNode;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public static final e f17216a = new e(0);

    /* renamed from: b, reason: collision with root package name */
    public static final b2 f17217b = new b2(1);

    public static final boolean a(BackwardsCompatNode backwardsCompatNode) {
        Modifier$Node tail = o.f(backwardsCompatNode).getNodes().getTail();
        Intrinsics.e(tail, "null cannot be cast to non-null type androidx.compose.ui.node.TailModifierNode");
        return ((r2) tail).f17327a;
    }

    public static final Modifier$Node b(n nVar, int i5) {
        Modifier$Node child = nVar.getNode().getChild();
        if (child == null || (child.getAggregateChildKindSet() & i5) == 0) {
            return null;
        }
        while (child != null) {
            int kindSet = child.getKindSet();
            if ((kindSet & 2) != 0) {
                return null;
            }
            if ((kindSet & i5) != 0) {
                return child;
            }
            child = child.getChild();
        }
        return null;
    }

    public static final Object c(m mVar, androidx.compose.runtime.e eVar) {
        if (!mVar.getNode().getIsAttached()) {
            y2.a.b("Cannot read CompositionLocal because the Modifier node is not currently attached.");
        }
        x1.j jVar = (x1.j) o.f(mVar).getCompositionLocalMap();
        jVar.getClass();
        return p1.a0.h(jVar, eVar);
    }

    public static final void d(q qVar) {
        if (qVar.getNode().getIsAttached()) {
            o.d(qVar, 1).D0();
        }
    }

    public static final boolean e(LayoutNode layoutNode) {
        if (layoutNode.getLookaheadRoot() == null) {
            return false;
        }
        LayoutNode parent$ui_release = layoutNode.getParent$ui_release();
        return (parent$ui_release != null ? parent$ui_release.getLookaheadRoot() : null) == null || layoutNode.getLayoutDelegate().f17345b;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void f(Modifier$Node modifier$Node, Function0 function0) {
        a2 ownerScope = modifier$Node.getOwnerScope();
        if (ownerScope == null) {
            ownerScope = new a2((z1) modifier$Node);
            modifier$Node.setOwnerScope$ui_release(ownerScope);
        }
        o.g(modifier$Node).getSnapshotObserver().a(ownerScope, f.o, function0);
    }

    public static final View g(n nVar) {
        if (!nVar.getNode().getIsAttached()) {
            y2.a.b("Cannot get View because the Modifier node is not currently attached.");
        }
        return (View) s0.a(o.f(nVar));
    }
}
