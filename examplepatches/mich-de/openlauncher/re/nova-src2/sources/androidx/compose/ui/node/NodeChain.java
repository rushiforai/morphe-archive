package androidx.compose.ui.node;

import a2.c;
import androidx.compose.ui.Modifier$Node;
import androidx.compose.ui.platform.AndroidComposeView;
import b0.x;
import b2.m;
import b2.s;
import b2.t;
import b3.e0;
import b3.g0;
import b3.j1;
import b3.m1;
import b3.n1;
import b3.o;
import b3.o1;
import b3.r2;
import b3.t1;
import b3.u1;
import b3.w;
import c3.j2;
import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import mk.v;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r1.e;
import y2.a;
import z.h0;
import z2.y0;

@Metadata(d1 = {"\u0000\u007f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0007\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u001a*\u0001f\b\u0001\u0018\u00002\u00020\u0001:\u0002L\u0006B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0019\u0010\u000b\u001a\u00020\b2\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0000¢\u0006\u0004\b\t\u0010\nJ\u0017\u0010\u0010\u001a\u00020\b2\u0006\u0010\r\u001a\u00020\fH\u0000¢\u0006\u0004\b\u000e\u0010\u000fJ\u000f\u0010\u0013\u001a\u00020\bH\u0000¢\u0006\u0004\b\u0011\u0010\u0012J\r\u0010\u0014\u001a\u00020\b¢\u0006\u0004\b\u0014\u0010\u0012J\r\u0010\u0015\u001a\u00020\b¢\u0006\u0004\b\u0015\u0010\u0012J\r\u0010\u0016\u001a\u00020\b¢\u0006\u0004\b\u0016\u0010\u0012J\u0013\u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u00180\u0017¢\u0006\u0004\b\u0019\u0010\u001aJ\u000f\u0010\u001c\u001a\u00020\bH\u0000¢\u0006\u0004\b\u001b\u0010\u0012J\u000f\u0010\u001e\u001a\u00020\bH\u0000¢\u0006\u0004\b\u001d\u0010\u0012J<\u0010&\u001a\u0004\u0018\u00018\u0000\"\u0006\b\u0000\u0010\u001f\u0018\u00012\f\u0010 \u001a\b\u0012\u0004\u0012\u00028\u00000\u00012\u0012\u0010#\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\"0!H\u0080\b¢\u0006\u0004\b$\u0010%J:\u0010)\u001a\u00020\b\"\u0006\b\u0000\u0010\u001f\u0018\u00012\f\u0010 \u001a\b\u0012\u0004\u0012\u00028\u00000\u00012\u0012\u0010#\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\b0!H\u0080\b¢\u0006\u0004\b'\u0010(J,\u0010)\u001a\u00020\b2\u0006\u0010+\u001a\u00020*2\u0012\u0010#\u001a\u000e\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020\b0!H\u0080\b¢\u0006\u0004\b-\u0010(J$\u0010)\u001a\u00020\b2\u0012\u0010#\u001a\u000e\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020\b0!H\u0080\b¢\u0006\u0004\b-\u0010.J$\u00100\u001a\u00020\b2\u0012\u0010#\u001a\u000e\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020\b0!H\u0080\b¢\u0006\u0004\b/\u0010.J:\u00102\u001a\u00020\b\"\u0006\b\u0000\u0010\u001f\u0018\u00012\f\u0010 \u001a\b\u0012\u0004\u0012\u00028\u00000\u00012\u0012\u0010#\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\b0!H\u0080\b¢\u0006\u0004\b1\u0010(J,\u00102\u001a\u00020\b2\u0006\u0010+\u001a\u00020*2\u0012\u0010#\u001a\u000e\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020\b0!H\u0080\b¢\u0006\u0004\b3\u0010(J$\u00102\u001a\u00020\b2\u0012\u0010#\u001a\u000e\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u00020\b0!H\u0080\b¢\u0006\u0004\b3\u0010.J(\u00106\u001a\u0004\u0018\u00018\u0000\"\u0006\b\u0000\u0010\u001f\u0018\u00012\f\u0010 \u001a\b\u0012\u0004\u0012\u00028\u00000\u0001H\u0080\b¢\u0006\u0004\b4\u00105J(\u00108\u001a\u0004\u0018\u00018\u0000\"\u0006\b\u0000\u0010\u001f\u0018\u00012\f\u0010 \u001a\b\u0012\u0004\u0012\u00028\u00000\u0001H\u0080\b¢\u0006\u0004\b7\u00105J\u001b\u0010;\u001a\u00020\"2\n\u0010 \u001a\u0006\u0012\u0002\b\u00030\u0001H\u0000¢\u0006\u0004\b9\u0010:J\u0017\u0010;\u001a\u00020\"2\u0006\u0010+\u001a\u00020*H\u0000¢\u0006\u0004\b<\u0010:J\u000f\u0010>\u001a\u00020=H\u0016¢\u0006\u0004\b>\u0010?J\u000f\u0010@\u001a\u00020,H\u0002¢\u0006\u0004\b@\u0010AJ\u0017\u0010C\u001a\u00020,2\u0006\u0010B\u001a\u00020,H\u0002¢\u0006\u0004\bC\u0010DJ\u000f\u0010E\u001a\u00020\bH\u0002¢\u0006\u0004\bE\u0010\u0012JG\u0010M\u001a\u00060LR\u00020\u00002\u0006\u00108\u001a\u00020,2\u0006\u0010F\u001a\u00020*2\f\u0010I\u001a\b\u0012\u0004\u0012\u00020H0G2\f\u0010J\u001a\b\u0012\u0004\u0012\u00020H0G2\u0006\u0010K\u001a\u00020\"H\u0002¢\u0006\u0004\bM\u0010NJ\u001f\u0010R\u001a\u00020\b2\u0006\u0010O\u001a\u00020,2\u0006\u0010Q\u001a\u00020PH\u0002¢\u0006\u0004\bR\u0010SJC\u0010T\u001a\u00020\b2\u0006\u0010F\u001a\u00020*2\f\u0010I\u001a\b\u0012\u0004\u0012\u00020H0G2\f\u0010J\u001a\b\u0012\u0004\u0012\u00020H0G2\u0006\u00106\u001a\u00020,2\u0006\u0010K\u001a\u00020\"H\u0002¢\u0006\u0004\bT\u0010UJ\u0017\u0010W\u001a\u00020,2\u0006\u0010V\u001a\u00020,H\u0002¢\u0006\u0004\bW\u0010DJ\u0017\u0010X\u001a\u00020,2\u0006\u0010V\u001a\u00020,H\u0002¢\u0006\u0004\bX\u0010DJ\u001f\u0010[\u001a\u00020,2\u0006\u0010Y\u001a\u00020H2\u0006\u0010Z\u001a\u00020,H\u0002¢\u0006\u0004\b[\u0010\\J\u001f\u0010]\u001a\u00020,2\u0006\u0010V\u001a\u00020,2\u0006\u0010Z\u001a\u00020,H\u0002¢\u0006\u0004\b]\u0010^J'\u0010a\u001a\u00020\b2\u0006\u0010_\u001a\u00020H2\u0006\u0010`\u001a\u00020H2\u0006\u0010V\u001a\u00020,H\u0002¢\u0006\u0004\ba\u0010bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010c\u001a\u0004\bd\u0010eR\u0014\u0010g\u001a\u00020f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bg\u0010hR\u001a\u0010j\u001a\u00020i8\u0000X\u0080\u0004¢\u0006\f\n\u0004\bj\u0010k\u001a\u0004\bl\u0010mR$\u0010o\u001a\u00020P2\u0006\u0010n\u001a\u00020P8\u0000@BX\u0080\u000e¢\u0006\f\n\u0004\bo\u0010p\u001a\u0004\bq\u0010rR\u001a\u00106\u001a\u00020,8\u0000X\u0080\u0004¢\u0006\f\n\u0004\b6\u0010s\u001a\u0004\bt\u0010AR$\u00108\u001a\u00020,2\u0006\u0010n\u001a\u00020,8\u0000@BX\u0080\u000e¢\u0006\f\n\u0004\b8\u0010s\u001a\u0004\bu\u0010AR\u001e\u0010v\u001a\n\u0012\u0004\u0012\u00020H\u0018\u00010G8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bv\u0010wR\u001e\u0010x\u001a\n\u0012\u0004\u0012\u00020H\u0018\u00010G8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bx\u0010wR\u001a\u0010y\u001a\b\u0012\u0004\u0012\u00020\f0G8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\by\u0010wR\u001c\u0010z\u001a\b\u0018\u00010LR\u00020\u00008\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bz\u0010{R\u0018\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b\u0007\u0010|R\u0014\u0010\u007f\u001a\u00020\"8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b}\u0010~R\u0017\u0010\u0082\u0001\u001a\u00020*8BX\u0082\u0004¢\u0006\b\u001a\u0006\b\u0080\u0001\u0010\u0081\u0001¨\u0006\u0083\u0001"}, d2 = {"Landroidx/compose/ui/node/NodeChain;", b.f42142b, "Landroidx/compose/ui/node/LayoutNode;", "layoutNode", "<init>", "(Landroidx/compose/ui/node/LayoutNode;)V", "Lb3/n1;", "logger", b.f42142b, "useLogger$ui_release", "(Lb3/n1;)V", "useLogger", "Lb2/t;", InneractiveMediationDefs.GENDER_MALE, "updateFrom$ui_release", "(Lb2/t;)V", "updateFrom", "resetState$ui_release", "()V", "resetState", "syncCoordinators", "markAsAttached", "runAttachLifecycle", b.f42142b, "Lz2/y0;", "getModifierInfo", "()Ljava/util/List;", "markAsDetached$ui_release", "markAsDetached", "runDetachLifecycle$ui_release", "runDetachLifecycle", "T", TTConst.TRACK_TYPE, "Lkotlin/Function1;", b.f42142b, "block", "firstFromHead-aLcG6gQ$ui_release", "(ILkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "firstFromHead", "headToTail-aLcG6gQ$ui_release", "(ILkotlin/jvm/functions/Function1;)V", "headToTail", b.f42142b, "mask", "Landroidx/compose/ui/Modifier$Node;", "headToTail$ui_release", "(Lkotlin/jvm/functions/Function1;)V", "headToTailExclusive$ui_release", "headToTailExclusive", "tailToHead-aLcG6gQ$ui_release", "tailToHead", "tailToHead$ui_release", "tail-H91voCI$ui_release", "(I)Ljava/lang/Object;", "tail", "head-H91voCI$ui_release", "head", "has-H91voCI$ui_release", "(I)Z", "has", "has$ui_release", b.f42142b, "toString", "()Ljava/lang/String;", "padChain", "()Landroidx/compose/ui/Modifier$Node;", "paddedHead", "trimChain", "(Landroidx/compose/ui/Modifier$Node;)Landroidx/compose/ui/Modifier$Node;", "syncAggregateChildKindSet", "offset", "Lr1/e;", "Lb2/s;", "before", "after", "shouldAttachOnInsert", "Lb3/m1;", "getDiffer", "(Landroidx/compose/ui/Modifier$Node;ILr1/e;Lr1/e;Z)Lb3/m1;", "start", "Lb3/t1;", "coordinator", "propagateCoordinator", "(Landroidx/compose/ui/Modifier$Node;Lb3/t1;)V", "structuralUpdate", "(ILr1/e;Lr1/e;Landroidx/compose/ui/Modifier$Node;Z)V", "node", "detachAndRemoveNode", "removeNode", "element", "parent", "createAndInsertNodeAsChild", "(Lb2/s;Landroidx/compose/ui/Modifier$Node;)Landroidx/compose/ui/Modifier$Node;", "insertChild", "(Landroidx/compose/ui/Modifier$Node;Landroidx/compose/ui/Modifier$Node;)Landroidx/compose/ui/Modifier$Node;", "prev", "next", "updateNode", "(Lb2/s;Lb2/s;Landroidx/compose/ui/Modifier$Node;)V", "Landroidx/compose/ui/node/LayoutNode;", "getLayoutNode", "()Landroidx/compose/ui/node/LayoutNode;", "b3/o1", "sentinelHead", "Lb3/o1;", "Lb3/w;", "innerCoordinator", "Lb3/w;", "getInnerCoordinator$ui_release", "()Lb3/w;", "value", "outerCoordinator", "Lb3/t1;", "getOuterCoordinator$ui_release", "()Lb3/t1;", "Landroidx/compose/ui/Modifier$Node;", "getTail$ui_release", "getHead$ui_release", "current", "Lr1/e;", "buffer", "stack", "cachedDiffer", "Lb3/m1;", "Lb3/n1;", "isUpdating$ui_release", "()Z", "isUpdating", "getAggregateChildKindSet", "()I", "aggregateChildKindSet", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class NodeChain {
    public static final int $stable = 8;

    @Nullable
    private e buffer;

    @Nullable
    private m1 cachedDiffer;

    @Nullable
    private e current;

    @NotNull
    private Modifier$Node head;

    @NotNull
    private final w innerCoordinator;

    @NotNull
    private final LayoutNode layoutNode;

    @Nullable
    private n1 logger;

    @NotNull
    private t1 outerCoordinator;

    @NotNull
    private final o1 sentinelHead;

    @NotNull
    private final e stack;

    @NotNull
    private final Modifier$Node tail;

    public NodeChain(@NotNull LayoutNode layoutNode) {
        this.layoutNode = layoutNode;
        o1 o1Var = new o1();
        o1Var.setAggregateChildKindSet$ui_release(-1);
        this.sentinelHead = o1Var;
        w wVar = new w(layoutNode);
        this.innerCoordinator = wVar;
        this.outerCoordinator = wVar;
        r2 r2Var = wVar.P;
        this.tail = r2Var;
        this.head = r2Var;
        this.stack = new e(new t[16]);
    }

    public static final /* synthetic */ n1 access$getLogger$p(NodeChain nodeChain) {
        nodeChain.getClass();
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Modifier$Node createAndInsertNodeAsChild(s element, Modifier$Node parent) {
        Modifier$Node backwardsCompatNode;
        if (element instanceof j1) {
            backwardsCompatNode = ((j1) element).create();
            backwardsCompatNode.setKindSet$ui_release(u1.g(backwardsCompatNode));
        } else {
            backwardsCompatNode = new BackwardsCompatNode(element);
        }
        if (backwardsCompatNode.getIsAttached()) {
            a.b("A ModifierNodeElement cannot return an already attached node from create() ");
        }
        backwardsCompatNode.setInsertedNodeAwaitingAttachForInvalidation$ui_release(true);
        return insertChild(backwardsCompatNode, parent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Modifier$Node detachAndRemoveNode(Modifier$Node node) {
        if (node.getIsAttached()) {
            h0 h0Var = u1.f17377a;
            if (!node.getIsAttached()) {
                a.b("autoInvalidateRemovedNode called on unattached node");
            }
            u1.b(node, -1, 2);
            node.runDetachLifecycle$ui_release();
            node.markAsDetached$ui_release();
        }
        return removeNode(node);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final int getAggregateChildKindSet() {
        return this.head.getAggregateChildKindSet();
    }

    private final m1 getDiffer(Modifier$Node head, int offset, e before, e after, boolean shouldAttachOnInsert) {
        m1 m1Var = this.cachedDiffer;
        if (m1Var == null) {
            m1 m1Var2 = new m1(this, head, offset, before, after, shouldAttachOnInsert);
            this.cachedDiffer = m1Var2;
            return m1Var2;
        }
        m1Var.d(head);
        m1Var.e(offset);
        m1Var.c(before);
        m1Var.b(after);
        m1Var.f(shouldAttachOnInsert);
        return m1Var;
    }

    private final Modifier$Node insertChild(Modifier$Node node, Modifier$Node parent) {
        Modifier$Node child = parent.getChild();
        if (child != null) {
            child.setParent$ui_release(node);
            node.setChild$ui_release(child);
        }
        parent.setChild$ui_release(node);
        node.setParent$ui_release(parent);
        return node;
    }

    private final Modifier$Node padChain() {
        if (!(this.head != this.sentinelHead)) {
            a.b("padChain called on already padded chain");
        }
        Modifier$Node modifier$Node = this.head;
        modifier$Node.setParent$ui_release(this.sentinelHead);
        this.sentinelHead.setChild$ui_release(modifier$Node);
        return this.sentinelHead;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void propagateCoordinator(Modifier$Node start, t1 coordinator) {
        for (Modifier$Node parent = start.getParent(); parent != null; parent = parent.getParent()) {
            if (parent == this.sentinelHead) {
                LayoutNode parent$ui_release = this.layoutNode.getParent$ui_release();
                coordinator.f17360q = parent$ui_release != null ? parent$ui_release.getInnerCoordinator$ui_release() : null;
                this.outerCoordinator = coordinator;
                return;
            } else {
                if ((parent.getKindSet() & 2) != 0) {
                    return;
                }
                parent.updateCoordinator$ui_release(coordinator);
            }
        }
    }

    private final Modifier$Node removeNode(Modifier$Node node) {
        Modifier$Node child = node.getChild();
        Modifier$Node parent = node.getParent();
        if (child != null) {
            child.setParent$ui_release(parent);
            node.setChild$ui_release(null);
        }
        if (parent != null) {
            parent.setChild$ui_release(child);
            node.setParent$ui_release(null);
        }
        Intrinsics.d(parent);
        return parent;
    }

    private final void structuralUpdate(int offset, e before, e after, Modifier$Node tail, boolean shouldAttachOnInsert) {
        v.G(before.f85079c - offset, after.f85079c - offset, getDiffer(tail, offset, before, after, shouldAttachOnInsert));
        syncAggregateChildKindSet();
    }

    private final void syncAggregateChildKindSet() {
        int kindSet = 0;
        for (Modifier$Node parent = this.tail.getParent(); parent != null && parent != this.sentinelHead; parent = parent.getParent()) {
            kindSet |= parent.getKindSet();
            parent.setAggregateChildKindSet$ui_release(kindSet);
        }
    }

    private final Modifier$Node trimChain(Modifier$Node paddedHead) {
        if (!(paddedHead == this.sentinelHead)) {
            a.b("trimChain called on already trimmed chain");
        }
        Modifier$Node child = this.sentinelHead.getChild();
        if (child == null) {
            child = this.tail;
        }
        child.setParent$ui_release(null);
        this.sentinelHead.setChild$ui_release(null);
        this.sentinelHead.setAggregateChildKindSet$ui_release(-1);
        this.sentinelHead.updateCoordinator$ui_release(null);
        if (!(child != this.sentinelHead)) {
            a.b("trimChain did not update the head");
        }
        return child;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updateNode(s prev, s next, Modifier$Node node) {
        if ((prev instanceof j1) && (next instanceof j1)) {
            Intrinsics.e(node, "null cannot be cast to non-null type T of androidx.compose.ui.node.NodeChainKt.updateUnsafe");
            ((j1) next).update(node);
            if (node.getIsAttached()) {
                u1.d(node);
                return;
            } else {
                node.setUpdatedNodeAwaitingAttachForInvalidation$ui_release(true);
                return;
            }
        }
        if (!(node instanceof BackwardsCompatNode)) {
            a.b("Unknown Modifier.Node type");
            return;
        }
        ((BackwardsCompatNode) node).setElement(next);
        if (node.getIsAttached()) {
            u1.d(node);
        } else {
            node.setUpdatedNodeAwaitingAttachForInvalidation$ui_release(true);
        }
    }

    /* renamed from: firstFromHead-aLcG6gQ$ui_release, reason: not valid java name */
    public final /* synthetic */ <T> T m43firstFromHeadaLcG6gQ$ui_release(int type, Function1<? super T, Boolean> block) {
        if ((getAggregateChildKindSet() & type) != 0) {
            for (Modifier$Node head = getHead(); head != null; head = head.getChild()) {
                if ((head.getKindSet() & type) != 0) {
                    Intrinsics.k();
                    throw null;
                }
                if ((head.getAggregateChildKindSet() & type) == 0) {
                    break;
                }
            }
        }
        return null;
    }

    @NotNull
    /* renamed from: getHead$ui_release, reason: from getter */
    public final Modifier$Node getHead() {
        return this.head;
    }

    @NotNull
    /* renamed from: getInnerCoordinator$ui_release, reason: from getter */
    public final w getInnerCoordinator() {
        return this.innerCoordinator;
    }

    @NotNull
    public final LayoutNode getLayoutNode() {
        return this.layoutNode;
    }

    @NotNull
    public final List<y0> getModifierInfo() {
        e eVar = this.current;
        if (eVar == null) {
            return EmptyList.f71733a;
        }
        e eVar2 = new e(new y0[eVar.f85079c]);
        Modifier$Node head = getHead();
        int i5 = 0;
        while (head != null && head != getTail()) {
            t1 coordinator = head.getCoordinator();
            if (coordinator == null) {
                throw new IllegalArgumentException("getModifierInfo called on node with no coordinator");
            }
            j2 j2Var = coordinator.I;
            j2 j2Var2 = this.innerCoordinator.I;
            Modifier$Node child = head.getChild();
            if (child != this.tail || head.getCoordinator() == child.getCoordinator()) {
                j2Var2 = null;
            }
            if (j2Var == null) {
                j2Var = j2Var2;
            }
            eVar2.b(new y0((t) eVar.f85077a[i5], coordinator, j2Var));
            head = head.getChild();
            i5++;
        }
        return eVar2.f();
    }

    @NotNull
    /* renamed from: getOuterCoordinator$ui_release, reason: from getter */
    public final t1 getOuterCoordinator() {
        return this.outerCoordinator;
    }

    @NotNull
    /* renamed from: getTail$ui_release, reason: from getter */
    public final Modifier$Node getTail() {
        return this.tail;
    }

    public final boolean has$ui_release(int mask) {
        return (mask & getAggregateChildKindSet()) != 0;
    }

    /* renamed from: has-H91voCI$ui_release, reason: not valid java name */
    public final boolean m44hasH91voCI$ui_release(int type) {
        return (type & getAggregateChildKindSet()) != 0;
    }

    /* renamed from: head-H91voCI$ui_release, reason: not valid java name */
    public final /* synthetic */ <T> T m45headH91voCI$ui_release(int type) {
        if ((getAggregateChildKindSet() & type) != 0) {
            for (Modifier$Node head = getHead(); head != null; head = head.getChild()) {
                if ((head.getKindSet() & type) != 0) {
                    Intrinsics.k();
                    throw null;
                }
                if ((head.getAggregateChildKindSet() & type) == 0) {
                    break;
                }
            }
        }
        return null;
    }

    public final void headToTail$ui_release(int mask, @NotNull Function1<? super Modifier$Node, Unit> block) {
        if ((getAggregateChildKindSet() & mask) == 0) {
            return;
        }
        for (Modifier$Node head = getHead(); head != null; head = head.getChild()) {
            if ((head.getKindSet() & mask) != 0) {
                block.invoke(head);
            }
            if ((head.getAggregateChildKindSet() & mask) == 0) {
                return;
            }
        }
    }

    /* renamed from: headToTail-aLcG6gQ$ui_release, reason: not valid java name */
    public final /* synthetic */ <T> void m46headToTailaLcG6gQ$ui_release(int type, Function1<? super T, Unit> block) {
        if ((getAggregateChildKindSet() & type) != 0) {
            for (Modifier$Node head = getHead(); head != null; head = head.getChild()) {
                if ((head.getKindSet() & type) != 0) {
                    Intrinsics.k();
                    throw null;
                }
                if ((head.getAggregateChildKindSet() & type) == 0) {
                    return;
                }
            }
        }
    }

    public final void headToTailExclusive$ui_release(@NotNull Function1<? super Modifier$Node, Unit> block) {
        for (Modifier$Node head = getHead(); head != null && head != getTail(); head = head.getChild()) {
            block.invoke(head);
        }
    }

    public final boolean isUpdating$ui_release() {
        return this.sentinelHead.getChild() != null;
    }

    public final void markAsAttached() {
        for (Modifier$Node head = getHead(); head != null; head = head.getChild()) {
            head.markAsAttached$ui_release();
        }
    }

    public final void markAsDetached$ui_release() {
        for (Modifier$Node tail = getTail(); tail != null; tail = tail.getParent()) {
            if (tail.getIsAttached()) {
                tail.markAsDetached$ui_release();
            }
        }
    }

    public final void resetState$ui_release() {
        for (Modifier$Node tail = getTail(); tail != null; tail = tail.getParent()) {
            if (tail.getIsAttached()) {
                tail.reset$ui_release();
            }
        }
        runDetachLifecycle$ui_release();
        markAsDetached$ui_release();
    }

    public final void runAttachLifecycle() {
        for (Modifier$Node head = getHead(); head != null; head = head.getChild()) {
            head.runAttachLifecycle$ui_release();
            if (head.getInsertedNodeAwaitingAttachForInvalidation()) {
                u1.a(head);
            }
            if (head.getUpdatedNodeAwaitingAttachForInvalidation()) {
                u1.d(head);
            }
            head.setInsertedNodeAwaitingAttachForInvalidation$ui_release(false);
            head.setUpdatedNodeAwaitingAttachForInvalidation$ui_release(false);
        }
    }

    public final void runDetachLifecycle$ui_release() {
        for (Modifier$Node tail = getTail(); tail != null; tail = tail.getParent()) {
            if (tail.getIsAttached()) {
                tail.runDetachLifecycle$ui_release();
            }
        }
    }

    public final void syncCoordinators() {
        g0 g0Var;
        t1 t1Var = this.innerCoordinator;
        for (Modifier$Node parent = this.tail.getParent(); parent != null; parent = parent.getParent()) {
            e0 e0VarC = o.c(parent);
            if (e0VarC != null) {
                if (parent.getCoordinator() != null) {
                    t1 coordinator = parent.getCoordinator();
                    Intrinsics.e(coordinator, "null cannot be cast to non-null type androidx.compose.ui.node.LayoutModifierNodeCoordinator");
                    g0 g0Var2 = (g0) coordinator;
                    e0 e0Var = g0Var2.P;
                    g0Var2.Z0(e0VarC);
                    g0Var = g0Var2;
                    if (e0Var != parent) {
                        j2 j2Var = g0Var2.I;
                        g0Var = g0Var2;
                        if (j2Var != null) {
                            AndroidComposeView androidComposeView = j2Var.f19352c;
                            g0Var = g0Var2;
                            if (!j2Var.f19359j) {
                                g0Var = g0Var2;
                                if (!j2Var.f19356g) {
                                    androidComposeView.invalidate();
                                    g0Var = g0Var2;
                                    if (true != j2Var.f19359j) {
                                        j2Var.f19359j = true;
                                        androidComposeView.notifyLayerIsDirty$ui_release(j2Var, true);
                                        g0Var = g0Var2;
                                    }
                                }
                            }
                        }
                    }
                } else {
                    g0 g0Var3 = new g0(this.layoutNode, e0VarC);
                    parent.updateCoordinator$ui_release(g0Var3);
                    g0Var = g0Var3;
                }
                t1Var.f17360q = g0Var;
                g0Var.f17359p = t1Var;
                t1Var = g0Var;
            } else {
                parent.updateCoordinator$ui_release(t1Var);
            }
        }
        LayoutNode parent$ui_release = this.layoutNode.getParent$ui_release();
        t1Var.f17360q = parent$ui_release != null ? parent$ui_release.getInnerCoordinator$ui_release() : null;
        this.outerCoordinator = t1Var;
    }

    /* renamed from: tail-H91voCI$ui_release, reason: not valid java name */
    public final /* synthetic */ <T> T m47tailH91voCI$ui_release(int type) {
        if ((getAggregateChildKindSet() & type) != 0) {
            for (Modifier$Node tail = getTail(); tail != null; tail = tail.getParent()) {
                if ((tail.getKindSet() & type) != 0) {
                    Intrinsics.k();
                    throw null;
                }
            }
        }
        return null;
    }

    public final void tailToHead$ui_release(int mask, @NotNull Function1<? super Modifier$Node, Unit> block) {
        if ((getAggregateChildKindSet() & mask) == 0) {
            return;
        }
        for (Modifier$Node tail = getTail(); tail != null; tail = tail.getParent()) {
            if ((tail.getKindSet() & mask) != 0) {
                block.invoke(tail);
            }
        }
    }

    /* renamed from: tailToHead-aLcG6gQ$ui_release, reason: not valid java name */
    public final /* synthetic */ <T> void m48tailToHeadaLcG6gQ$ui_release(int type, Function1<? super T, Unit> block) {
        if ((getAggregateChildKindSet() & type) != 0) {
            for (Modifier$Node tail = getTail(); tail != null; tail = tail.getParent()) {
                if ((tail.getKindSet() & type) != 0) {
                    Intrinsics.k();
                    throw null;
                }
            }
        }
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("[");
        if (this.head == this.tail) {
            sb2.append("]");
        } else {
            Modifier$Node head = getHead();
            while (true) {
                if (head == null || head == getTail()) {
                    break;
                }
                sb2.append(String.valueOf(head));
                if (head.getChild() == this.tail) {
                    sb2.append("]");
                    break;
                }
                sb2.append(",");
                head = head.getChild();
            }
        }
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x009b, code lost:
    
        r9 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:43:0x00a2, code lost:
    
        if (r6 >= r1) goto L51;
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00a4, code lost:
    
        if (r7 == null) goto L49;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00a6, code lost:
    
        if (r9 == null) goto L47;
     */
    /* JADX WARN: Code restructure failed: missing block: B:46:0x00a8, code lost:
    
        structuralUpdate(r6, r7, r8, r9, !r13.layoutNode.getApplyingModifierOnAttach$ui_release());
        r0 = r13;
     */
    /* JADX WARN: Code restructure failed: missing block: B:48:0x00be, code lost:
    
        throw a2.c.r("structuralUpdate requires a non-null tail");
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:0x00c4, code lost:
    
        throw a2.c.r("expected prior modifier list to be non-empty");
     */
    /* JADX WARN: Code restructure failed: missing block: B:51:0x00c5, code lost:
    
        r2 = r13;
     */
    /* JADX WARN: Removed duplicated region for block: B:105:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:82:0x013e  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x014c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void updateFrom$ui_release(@NotNull t m11) {
        NodeChain nodeChain;
        NodeChain nodeChain2;
        Modifier$Node modifier$NodePadChain = padChain();
        e eVar = this.current;
        int i5 = eVar != null ? eVar.f85079c : 0;
        e eVar2 = this.buffer;
        if (eVar2 == null) {
            eVar2 = new e(new s[16]);
        }
        e eVar3 = eVar2;
        e eVar4 = this.stack;
        eVar4.b(m11);
        e eVar5 = null;
        x xVar = null;
        while (true) {
            int i11 = eVar4.f85079c;
            if (i11 == 0) {
                break;
            }
            t tVar = (t) eVar4.k(i11 - 1);
            if (tVar instanceof m) {
                m mVar = (m) tVar;
                eVar4.b(mVar.f17018b);
                eVar4.b(mVar.f17017a);
            } else if (tVar instanceof s) {
                eVar3.b(tVar);
            } else {
                if (xVar == null) {
                    xVar = new x(eVar3, 6);
                }
                tVar.all(xVar);
                xVar = xVar;
            }
        }
        boolean z11 = true;
        if (eVar3.f85079c == i5) {
            Modifier$Node child = modifier$NodePadChain.getChild();
            int i12 = 0;
            while (true) {
                if (child == null || i12 >= i5) {
                    break;
                }
                if (eVar == null) {
                    throw c.r("expected prior modifier list to be non-empty");
                }
                s sVar = (s) eVar.f85077a[i12];
                s sVar2 = (s) eVar3.f85077a[i12];
                char c11 = Intrinsics.b(sVar, sVar2) ? (char) 2 : sVar.getClass() == sVar2.getClass() ? (char) 1 : (char) 0;
                if (c11 == 0) {
                    child = child.getParent();
                    break;
                }
                if (c11 == 1) {
                    updateNode(sVar, sVar2, child);
                }
                child = child.getChild();
                i12++;
            }
        } else {
            nodeChain = this;
            if (nodeChain.layoutNode.getApplyingModifierOnAttach$ui_release() && i5 == 0) {
                Modifier$Node modifier$NodeCreateAndInsertNodeAsChild = modifier$NodePadChain;
                for (int i13 = 0; i13 < eVar3.f85079c; i13++) {
                    modifier$NodeCreateAndInsertNodeAsChild = createAndInsertNodeAsChild((s) eVar3.f85077a[i13], modifier$NodeCreateAndInsertNodeAsChild);
                }
                syncAggregateChildKindSet();
            } else {
                if (eVar3.f85079c != 0) {
                    if (eVar == null) {
                        eVar = new e(new s[16]);
                    }
                    nodeChain2 = nodeChain;
                    nodeChain2.structuralUpdate(0, eVar, eVar3, modifier$NodePadChain, !nodeChain.layoutNode.getApplyingModifierOnAttach$ui_release());
                    nodeChain2.current = eVar3;
                    if (eVar != null) {
                        eVar.g();
                        eVar5 = eVar;
                    }
                    nodeChain2.buffer = eVar5;
                    nodeChain2.head = trimChain(modifier$NodePadChain);
                    if (z11) {
                        return;
                    }
                    syncCoordinators();
                    return;
                }
                if (eVar == null) {
                    throw c.r("expected prior modifier list to be non-empty");
                }
                Modifier$Node child2 = modifier$NodePadChain.getChild();
                for (int i14 = 0; child2 != null && i14 < eVar.f85079c; i14++) {
                    child2 = detachAndRemoveNode(child2).getChild();
                }
                w wVar = nodeChain.innerCoordinator;
                LayoutNode parent$ui_release = nodeChain.layoutNode.getParent$ui_release();
                wVar.f17360q = parent$ui_release != null ? parent$ui_release.getInnerCoordinator$ui_release() : null;
                nodeChain.outerCoordinator = nodeChain.innerCoordinator;
                z11 = false;
            }
        }
        nodeChain2 = nodeChain;
        nodeChain2.current = eVar3;
        if (eVar != null) {
        }
        nodeChain2.buffer = eVar5;
        nodeChain2.head = trimChain(modifier$NodePadChain);
        if (z11) {
        }
    }

    public final void useLogger$ui_release(@Nullable n1 logger) {
    }

    public final void tailToHead$ui_release(@NotNull Function1<? super Modifier$Node, Unit> block) {
        for (Modifier$Node tail = getTail(); tail != null; tail = tail.getParent()) {
            block.invoke(tail);
        }
    }

    public final void headToTail$ui_release(@NotNull Function1<? super Modifier$Node, Unit> block) {
        for (Modifier$Node head = getHead(); head != null; head = head.getChild()) {
            block.invoke(head);
        }
    }
}
