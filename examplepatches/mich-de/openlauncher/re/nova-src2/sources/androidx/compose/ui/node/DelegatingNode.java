package androidx.compose.ui.node;

import androidx.compose.ui.Modifier$Node;
import b3.e0;
import b3.n;
import b3.o;
import b3.t1;
import b3.u1;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import y2.a;
import z.h0;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0018\b'\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u001f\u0010\b\u001a\u00020\u00072\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0001H\u0002¢\u0006\u0004\b\b\u0010\tJ\u001f\u0010\r\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\f\u001a\u00020\u000bH\u0002¢\u0006\u0004\b\r\u0010\u000eJ\u0019\u0010\u0013\u001a\u00020\u00072\b\u0010\u0010\u001a\u0004\u0018\u00010\u000fH\u0010¢\u0006\u0004\b\u0011\u0010\u0012J!\u0010\u0019\u001a\u00028\u0000\"\b\b\u0000\u0010\u0015*\u00020\u00142\u0006\u0010\u0016\u001a\u00028\u0000H\u0000¢\u0006\u0004\b\u0017\u0010\u0018J\u0017\u0010\u001d\u001a\u00020\u00072\u0006\u0010\u001a\u001a\u00020\u0014H\u0000¢\u0006\u0004\b\u001b\u0010\u001cJ\u0017\u0010!\u001a\u00020\u00072\u0006\u0010\u001e\u001a\u00020\u0001H\u0010¢\u0006\u0004\b\u001f\u0010 J!\u0010\"\u001a\u00028\u0000\"\b\b\u0000\u0010\u0015*\u00020\u00142\u0006\u0010\u0016\u001a\u00028\u0000H\u0004¢\u0006\u0004\b\"\u0010\u0018J\u0017\u0010#\u001a\u00020\u00072\u0006\u0010\u001a\u001a\u00020\u0014H\u0004¢\u0006\u0004\b#\u0010\u001cJ$\u0010(\u001a\u00020\u00072\u0012\u0010%\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u00070$H\u0080\b¢\u0006\u0004\b&\u0010'J\u000f\u0010*\u001a\u00020\u0007H\u0010¢\u0006\u0004\b)\u0010\u0003J\u000f\u0010,\u001a\u00020\u0007H\u0010¢\u0006\u0004\b+\u0010\u0003J\u000f\u0010.\u001a\u00020\u0007H\u0010¢\u0006\u0004\b-\u0010\u0003J\u000f\u00100\u001a\u00020\u0007H\u0010¢\u0006\u0004\b/\u0010\u0003J\u000f\u00102\u001a\u00020\u0007H\u0010¢\u0006\u0004\b1\u0010\u0003R \u00103\u001a\u00020\u00048\u0000X\u0080\u0004¢\u0006\u0012\n\u0004\b3\u00104\u0012\u0004\b7\u0010\u0003\u001a\u0004\b5\u00106R$\u0010\"\u001a\u0004\u0018\u00010\u00018\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b\"\u00108\u001a\u0004\b9\u0010:\"\u0004\b;\u0010 ¨\u0006<"}, d2 = {"Landroidx/compose/ui/node/DelegatingNode;", "Landroidx/compose/ui/Modifier$Node;", "<init>", "()V", b.f42142b, "delegateKindSet", "delegateNode", b.f42142b, "validateDelegateKindSet", "(ILandroidx/compose/ui/Modifier$Node;)V", "newKindSet", b.f42142b, "recalculateOwner", "updateNodeKindSet", "(IZ)V", "Lb3/t1;", "coordinator", "updateCoordinator$ui_release", "(Lb3/t1;)V", "updateCoordinator", "Lb3/n;", "T", "delegatableNode", "delegateUnprotected$ui_release", "(Lb3/n;)Lb3/n;", "delegateUnprotected", "instance", "undelegateUnprotected$ui_release", "(Lb3/n;)V", "undelegateUnprotected", "owner", "setAsDelegateTo$ui_release", "(Landroidx/compose/ui/Modifier$Node;)V", "setAsDelegateTo", "delegate", "undelegate", "Lkotlin/Function1;", "block", "forEachImmediateDelegate$ui_release", "(Lkotlin/jvm/functions/Function1;)V", "forEachImmediateDelegate", "markAsAttached$ui_release", "markAsAttached", "runAttachLifecycle$ui_release", "runAttachLifecycle", "runDetachLifecycle$ui_release", "runDetachLifecycle", "markAsDetached$ui_release", "markAsDetached", "reset$ui_release", "reset", "selfKindSet", "I", "getSelfKindSet$ui_release", "()I", "getSelfKindSet$ui_release$annotations", "Landroidx/compose/ui/Modifier$Node;", "getDelegate$ui_release", "()Landroidx/compose/ui/Modifier$Node;", "setDelegate$ui_release", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class DelegatingNode extends Modifier$Node {
    public static final int $stable = 8;

    @Nullable
    private Modifier$Node delegate;
    private final int selfKindSet = u1.e(this);

    public static /* synthetic */ void getSelfKindSet$ui_release$annotations() {
    }

    private final void updateNodeKindSet(int newKindSet, boolean recalculateOwner) {
        Modifier$Node child;
        int kindSet = getKindSet();
        setKindSet$ui_release(newKindSet);
        if (kindSet != newKindSet) {
            if (getNode() == this) {
                setAggregateChildKindSet$ui_release(newKindSet);
            }
            if (getIsAttached()) {
                Modifier$Node node = getNode();
                Modifier$Node parent = this;
                while (parent != null) {
                    newKindSet |= parent.getKindSet();
                    parent.setKindSet$ui_release(newKindSet);
                    if (parent == node) {
                        break;
                    } else {
                        parent = parent.getParent();
                    }
                }
                if (recalculateOwner && parent == node) {
                    newKindSet = u1.g(node);
                    node.setKindSet$ui_release(newKindSet);
                }
                int aggregateChildKindSet = newKindSet | ((parent == null || (child = parent.getChild()) == null) ? 0 : child.getAggregateChildKindSet());
                while (parent != null) {
                    aggregateChildKindSet |= parent.getKindSet();
                    parent.setAggregateChildKindSet$ui_release(aggregateChildKindSet);
                    parent = parent.getParent();
                }
            }
        }
    }

    private final void validateDelegateKindSet(int delegateKindSet, Modifier$Node delegateNode) {
        int kindSet = getKindSet();
        if ((delegateKindSet & 2) == 0 || (kindSet & 2) == 0 || (this instanceof e0)) {
            return;
        }
        a.b("Delegating to multiple LayoutModifierNodes without the delegating node implementing LayoutModifierNode itself is not allowed.\nDelegating Node: " + this + "\nDelegate Node: " + delegateNode);
    }

    @NotNull
    public final <T extends n> T delegate(@NotNull T delegatableNode) {
        Modifier$Node node = delegatableNode.getNode();
        if (node != delegatableNode) {
            Modifier$Node modifier$Node = delegatableNode instanceof Modifier$Node ? (Modifier$Node) delegatableNode : null;
            Modifier$Node parent = modifier$Node != null ? modifier$Node.getParent() : null;
            if (node == getNode() && Intrinsics.b(parent, this)) {
                return delegatableNode;
            }
            throw new IllegalStateException("Cannot delegate to an already delegated node");
        }
        if (node.getIsAttached()) {
            a.b("Cannot delegate to an already attached node");
        }
        node.setAsDelegateTo$ui_release(getNode());
        int kindSet = getKindSet();
        int iG = u1.g(node);
        node.setKindSet$ui_release(iG);
        validateDelegateKindSet(iG, node);
        node.setChild$ui_release(this.delegate);
        this.delegate = node;
        node.setParent$ui_release(this);
        updateNodeKindSet(getKindSet() | iG, false);
        if (getIsAttached()) {
            if ((iG & 2) == 0 || (kindSet & 2) != 0) {
                updateCoordinator$ui_release(getCoordinator());
            } else {
                NodeChain nodes = o.f(this).getNodes();
                getNode().updateCoordinator$ui_release(null);
                nodes.syncCoordinators();
            }
            node.markAsAttached$ui_release();
            node.runAttachLifecycle$ui_release();
            u1.a(node);
        }
        return delegatableNode;
    }

    @NotNull
    public final <T extends n> T delegateUnprotected$ui_release(@NotNull T delegatableNode) {
        return (T) delegate(delegatableNode);
    }

    public final void forEachImmediateDelegate$ui_release(@NotNull Function1<? super Modifier$Node, Unit> block) {
        for (Modifier$Node delegate = getDelegate(); delegate != null; delegate = delegate.getChild()) {
            block.invoke(delegate);
        }
    }

    @Nullable
    /* renamed from: getDelegate$ui_release, reason: from getter */
    public final Modifier$Node getDelegate() {
        return this.delegate;
    }

    /* renamed from: getSelfKindSet$ui_release, reason: from getter */
    public final int getSelfKindSet() {
        return this.selfKindSet;
    }

    @Override // androidx.compose.ui.Modifier$Node
    public void markAsAttached$ui_release() {
        super.markAsAttached$ui_release();
        for (Modifier$Node delegate = getDelegate(); delegate != null; delegate = delegate.getChild()) {
            delegate.updateCoordinator$ui_release(getCoordinator());
            if (!delegate.getIsAttached()) {
                delegate.markAsAttached$ui_release();
            }
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public void markAsDetached$ui_release() {
        for (Modifier$Node delegate = getDelegate(); delegate != null; delegate = delegate.getChild()) {
            delegate.markAsDetached$ui_release();
        }
        super.markAsDetached$ui_release();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public /* bridge */ /* synthetic */ void onDensityChange() {
    }

    @Override // androidx.compose.ui.Modifier$Node
    public /* bridge */ /* synthetic */ void onLayoutDirectionChange() {
    }

    @Override // androidx.compose.ui.Modifier$Node
    public void reset$ui_release() {
        super.reset$ui_release();
        for (Modifier$Node delegate = getDelegate(); delegate != null; delegate = delegate.getChild()) {
            delegate.reset$ui_release();
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public void runAttachLifecycle$ui_release() {
        for (Modifier$Node delegate = getDelegate(); delegate != null; delegate = delegate.getChild()) {
            delegate.runAttachLifecycle$ui_release();
        }
        super.runAttachLifecycle$ui_release();
    }

    @Override // androidx.compose.ui.Modifier$Node
    public void runDetachLifecycle$ui_release() {
        super.runDetachLifecycle$ui_release();
        for (Modifier$Node delegate = getDelegate(); delegate != null; delegate = delegate.getChild()) {
            delegate.runDetachLifecycle$ui_release();
        }
    }

    @Override // androidx.compose.ui.Modifier$Node
    public void setAsDelegateTo$ui_release(@NotNull Modifier$Node owner) {
        super.setAsDelegateTo$ui_release(owner);
        for (Modifier$Node delegate = getDelegate(); delegate != null; delegate = delegate.getChild()) {
            delegate.setAsDelegateTo$ui_release(owner);
        }
    }

    public final void setDelegate$ui_release(@Nullable Modifier$Node modifier$Node) {
        this.delegate = modifier$Node;
    }

    public final void undelegate(@NotNull n instance) {
        Modifier$Node modifier$Node = null;
        for (Modifier$Node child = this.delegate; child != null; child = child.getChild()) {
            if (child == instance) {
                if (child.getIsAttached()) {
                    h0 h0Var = u1.f17377a;
                    if (!child.getIsAttached()) {
                        a.b("autoInvalidateRemovedNode called on unattached node");
                    }
                    u1.b(child, -1, 2);
                    child.runDetachLifecycle$ui_release();
                    child.markAsDetached$ui_release();
                }
                child.setAsDelegateTo$ui_release(child);
                child.setAggregateChildKindSet$ui_release(0);
                if (modifier$Node == null) {
                    this.delegate = child.getChild();
                } else {
                    modifier$Node.setChild$ui_release(child.getChild());
                }
                child.setChild$ui_release(null);
                child.setParent$ui_release(null);
                int kindSet = getKindSet();
                int iG = u1.g(this);
                updateNodeKindSet(iG, true);
                if (getIsAttached() && (kindSet & 2) != 0 && (iG & 2) == 0) {
                    NodeChain nodes = o.f(this).getNodes();
                    getNode().updateCoordinator$ui_release(null);
                    nodes.syncCoordinators();
                    return;
                }
                return;
            }
            modifier$Node = child;
        }
        throw new IllegalStateException(("Could not find delegate: " + instance).toString());
    }

    public final void undelegateUnprotected$ui_release(@NotNull n instance) {
        undelegate(instance);
    }

    @Override // androidx.compose.ui.Modifier$Node
    public void updateCoordinator$ui_release(@Nullable t1 coordinator) {
        super.updateCoordinator$ui_release(coordinator);
        for (Modifier$Node delegate = getDelegate(); delegate != null; delegate = delegate.getChild()) {
            delegate.updateCoordinator$ui_release(coordinator);
        }
    }
}
