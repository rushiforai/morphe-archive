package androidx.compose.ui;

import b3.a2;
import b3.n;
import b3.o;
import b3.t1;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import t70.q1;
import t70.r1;
import t70.s1;
import y2.a;
import y70.d;

@Metadata(d1 = {"\u0000N\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b!\b'\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0019\u0010\t\u001a\u00020\u00062\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004H\u0010¢\u0006\u0004\b\u0007\u0010\bJ\u001c\u0010\u000f\u001a\u00020\f2\n\u0010\u000b\u001a\u0006\u0012\u0002\b\u00030\nH\u0080\b¢\u0006\u0004\b\r\u0010\u000eJ\u000f\u0010\u0011\u001a\u00020\u0006H\u0010¢\u0006\u0004\b\u0010\u0010\u0003J\u000f\u0010\u0013\u001a\u00020\u0006H\u0010¢\u0006\u0004\b\u0012\u0010\u0003J\u000f\u0010\u0015\u001a\u00020\u0006H\u0010¢\u0006\u0004\b\u0014\u0010\u0003J\u000f\u0010\u0017\u001a\u00020\u0006H\u0010¢\u0006\u0004\b\u0016\u0010\u0003J\u000f\u0010\u0019\u001a\u00020\u0006H\u0010¢\u0006\u0004\b\u0018\u0010\u0003J\u000f\u0010\u001a\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u001a\u0010\u0003J\u000f\u0010\u001b\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u001b\u0010\u0003J\u000f\u0010\u001c\u001a\u00020\u0006H\u0016¢\u0006\u0004\b\u001c\u0010\u0003J\u001b\u0010\u001f\u001a\u00020\u00062\f\u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\u00060\u001d¢\u0006\u0004\b\u001f\u0010 J\u0017\u0010%\u001a\u00020\u00062\u0006\u0010\"\u001a\u00020!H\u0010¢\u0006\u0004\b#\u0010$R*\u0010'\u001a\u00020!2\u0006\u0010&\u001a\u00020!8\u0006@BX\u0086\u000e¢\u0006\u0012\n\u0004\b'\u0010(\u0012\u0004\b+\u0010\u0003\u001a\u0004\b)\u0010*R\u0018\u0010-\u001a\u0004\u0018\u00010,8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b-\u0010.R\"\u00100\u001a\u00020/8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b0\u00101\u001a\u0004\b2\u00103\"\u0004\b4\u00105R\"\u00106\u001a\u00020/8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b6\u00101\u001a\u0004\b7\u00103\"\u0004\b8\u00105R$\u00109\u001a\u0004\u0018\u00010!8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b9\u0010(\u001a\u0004\b:\u0010*\"\u0004\b;\u0010$R$\u0010<\u001a\u0004\u0018\u00010!8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b<\u0010(\u001a\u0004\b=\u0010*\"\u0004\b>\u0010$R$\u0010@\u001a\u0004\u0018\u00010?8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\b@\u0010A\u001a\u0004\bB\u0010C\"\u0004\bD\u0010ER(\u0010\u0005\u001a\u0004\u0018\u00010\u00042\b\u0010&\u001a\u0004\u0018\u00010\u00048\u0000@BX\u0080\u000e¢\u0006\f\n\u0004\b\u0005\u0010F\u001a\u0004\bG\u0010HR\"\u0010I\u001a\u00020\f8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\bI\u0010J\u001a\u0004\bK\u0010L\"\u0004\bM\u0010NR\"\u0010O\u001a\u00020\f8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\bO\u0010J\u001a\u0004\bP\u0010L\"\u0004\bQ\u0010NR\u0016\u0010R\u001a\u00020\f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bR\u0010JR\u0016\u0010S\u001a\u00020\f8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bS\u0010JR*\u0010T\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010\u001d8\u0000@\u0000X\u0080\u000e¢\u0006\u0012\n\u0004\bT\u0010U\u001a\u0004\bV\u0010W\"\u0004\bX\u0010 R$\u0010Y\u001a\u00020\f2\u0006\u0010&\u001a\u00020\f8\u0006@BX\u0086\u000e¢\u0006\f\n\u0004\bY\u0010J\u001a\u0004\bY\u0010LR\u0011\u0010\\\u001a\u00020,8F¢\u0006\u0006\u001a\u0004\bZ\u0010[R\u001a\u0010_\u001a\u00020\f8VX\u0096\u0004¢\u0006\f\u0012\u0004\b^\u0010\u0003\u001a\u0004\b]\u0010L¨\u0006`"}, d2 = {"androidx/compose/ui/Modifier$Node", "Lb3/n;", "<init>", "()V", "Lb3/t1;", "coordinator", b.f42142b, "updateCoordinator$ui_release", "(Lb3/t1;)V", "updateCoordinator", b.f42142b, "kind", b.f42142b, "isKind-H91voCI$ui_release", "(I)Z", "isKind", "markAsAttached$ui_release", "markAsAttached", "runAttachLifecycle$ui_release", "runAttachLifecycle", "runDetachLifecycle$ui_release", "runDetachLifecycle", "markAsDetached$ui_release", "markAsDetached", "reset$ui_release", "reset", "onAttach", "onDetach", "onReset", "Lkotlin/Function0;", "effect", "sideEffect", "(Lkotlin/jvm/functions/Function0;)V", "Landroidx/compose/ui/Modifier$Node;", "owner", "setAsDelegateTo$ui_release", "(Landroidx/compose/ui/Modifier$Node;)V", "setAsDelegateTo", "value", "node", "Landroidx/compose/ui/Modifier$Node;", "getNode", "()Landroidx/compose/ui/Modifier$Node;", "getNode$annotations", "Lt70/j0;", "scope", "Lt70/j0;", b.f42142b, "kindSet", "I", "getKindSet$ui_release", "()I", "setKindSet$ui_release", "(I)V", "aggregateChildKindSet", "getAggregateChildKindSet$ui_release", "setAggregateChildKindSet$ui_release", "parent", "getParent$ui_release", "setParent$ui_release", "child", "getChild$ui_release", "setChild$ui_release", "Lb3/a2;", "ownerScope", "Lb3/a2;", "getOwnerScope$ui_release", "()Lb3/a2;", "setOwnerScope$ui_release", "(Lb3/a2;)V", "Lb3/t1;", "getCoordinator$ui_release", "()Lb3/t1;", "insertedNodeAwaitingAttachForInvalidation", "Z", "getInsertedNodeAwaitingAttachForInvalidation$ui_release", "()Z", "setInsertedNodeAwaitingAttachForInvalidation$ui_release", "(Z)V", "updatedNodeAwaitingAttachForInvalidation", "getUpdatedNodeAwaitingAttachForInvalidation$ui_release", "setUpdatedNodeAwaitingAttachForInvalidation$ui_release", "onAttachRunExpected", "onDetachRunExpected", "detachedListener", "Lkotlin/jvm/functions/Function0;", "getDetachedListener$ui_release", "()Lkotlin/jvm/functions/Function0;", "setDetachedListener$ui_release", "isAttached", "getCoroutineScope", "()Lt70/j0;", "coroutineScope", "getShouldAutoInvalidate", "getShouldAutoInvalidate$annotations", "shouldAutoInvalidate", "ui_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public abstract class Modifier$Node implements n {
    public static final int $stable = 8;

    @Nullable
    private Modifier$Node child;

    @Nullable
    private t1 coordinator;

    @Nullable
    private Function0<Unit> detachedListener;
    private boolean insertedNodeAwaitingAttachForInvalidation;
    private boolean isAttached;
    private int kindSet;
    private boolean onAttachRunExpected;
    private boolean onDetachRunExpected;

    @Nullable
    private a2 ownerScope;

    @Nullable
    private Modifier$Node parent;

    @Nullable
    private j0 scope;
    private boolean updatedNodeAwaitingAttachForInvalidation;

    @NotNull
    private Modifier$Node node = this;
    private int aggregateChildKindSet = -1;

    public static /* synthetic */ void getNode$annotations() {
    }

    public static /* synthetic */ void getShouldAutoInvalidate$annotations() {
    }

    /* renamed from: getAggregateChildKindSet$ui_release, reason: from getter */
    public final int getAggregateChildKindSet() {
        return this.aggregateChildKindSet;
    }

    @Nullable
    /* renamed from: getChild$ui_release, reason: from getter */
    public final Modifier$Node getChild() {
        return this.child;
    }

    @Nullable
    /* renamed from: getCoordinator$ui_release, reason: from getter */
    public final t1 getCoordinator() {
        return this.coordinator;
    }

    @NotNull
    public final j0 getCoroutineScope() {
        j0 j0Var = this.scope;
        if (j0Var != null) {
            return j0Var;
        }
        d dVarA = k0.a(o.g(this).getCoroutineContext().plus(new s1((r1) o.g(this).getCoroutineContext().get(q1.f88853a))));
        this.scope = dVarA;
        return dVarA;
    }

    @Nullable
    public final Function0<Unit> getDetachedListener$ui_release() {
        return this.detachedListener;
    }

    /* renamed from: getInsertedNodeAwaitingAttachForInvalidation$ui_release, reason: from getter */
    public final boolean getInsertedNodeAwaitingAttachForInvalidation() {
        return this.insertedNodeAwaitingAttachForInvalidation;
    }

    /* renamed from: getKindSet$ui_release, reason: from getter */
    public final int getKindSet() {
        return this.kindSet;
    }

    @Override // b3.n
    @NotNull
    public final Modifier$Node getNode() {
        return this.node;
    }

    @Nullable
    /* renamed from: getOwnerScope$ui_release, reason: from getter */
    public final a2 getOwnerScope() {
        return this.ownerScope;
    }

    @Nullable
    /* renamed from: getParent$ui_release, reason: from getter */
    public final Modifier$Node getParent() {
        return this.parent;
    }

    public boolean getShouldAutoInvalidate() {
        return true;
    }

    /* renamed from: getUpdatedNodeAwaitingAttachForInvalidation$ui_release, reason: from getter */
    public final boolean getUpdatedNodeAwaitingAttachForInvalidation() {
        return this.updatedNodeAwaitingAttachForInvalidation;
    }

    /* renamed from: isAttached, reason: from getter */
    public final boolean getIsAttached() {
        return this.isAttached;
    }

    /* renamed from: isKind-H91voCI$ui_release, reason: not valid java name */
    public final boolean m6isKindH91voCI$ui_release(int kind) {
        return (kind & getKindSet()) != 0;
    }

    public void markAsAttached$ui_release() {
        if (this.isAttached) {
            a.b("node attached multiple times");
        }
        if (!(this.coordinator != null)) {
            a.b("attach invoked on a node without a coordinator");
        }
        this.isAttached = true;
        this.onAttachRunExpected = true;
    }

    public void markAsDetached$ui_release() {
        if (!this.isAttached) {
            a.b("Cannot detach a node that is not attached");
        }
        if (this.onAttachRunExpected) {
            a.b("Must run runAttachLifecycle() before markAsDetached()");
        }
        if (this.onDetachRunExpected) {
            a.b("Must run runDetachLifecycle() before markAsDetached()");
        }
        this.isAttached = false;
        j0 j0Var = this.scope;
        if (j0Var != null) {
            k0.c(j0Var, new ModifierNodeDetachedCancellationException());
            this.scope = null;
        }
    }

    public void onAttach() {
    }

    public /* bridge */ /* synthetic */ void onDensityChange() {
    }

    public void onDetach() {
    }

    public /* bridge */ /* synthetic */ void onLayoutDirectionChange() {
    }

    public void onReset() {
    }

    public void reset$ui_release() {
        if (!this.isAttached) {
            a.b("reset() called on an unattached node");
        }
        onReset();
    }

    public void runAttachLifecycle$ui_release() {
        if (!this.isAttached) {
            a.b("Must run markAsAttached() prior to runAttachLifecycle");
        }
        if (!this.onAttachRunExpected) {
            a.b("Must run runAttachLifecycle() only once after markAsAttached()");
        }
        this.onAttachRunExpected = false;
        onAttach();
        this.onDetachRunExpected = true;
    }

    public void runDetachLifecycle$ui_release() {
        if (!this.isAttached) {
            a.b("node detached multiple times");
        }
        if (this.coordinator == null) {
            a.b("detach invoked on a node without a coordinator");
        }
        if (!this.onDetachRunExpected) {
            a.b("Must run runDetachLifecycle() once after runAttachLifecycle() and before markAsDetached()");
        }
        this.onDetachRunExpected = false;
        Function0<Unit> function0 = this.detachedListener;
        if (function0 != null) {
            function0.invoke();
        }
        onDetach();
    }

    public final void setAggregateChildKindSet$ui_release(int i5) {
        this.aggregateChildKindSet = i5;
    }

    public void setAsDelegateTo$ui_release(@NotNull Modifier$Node owner) {
        this.node = owner;
    }

    public final void setChild$ui_release(@Nullable Modifier$Node modifier$Node) {
        this.child = modifier$Node;
    }

    public final void setDetachedListener$ui_release(@Nullable Function0<Unit> function0) {
        this.detachedListener = function0;
    }

    public final void setInsertedNodeAwaitingAttachForInvalidation$ui_release(boolean z11) {
        this.insertedNodeAwaitingAttachForInvalidation = z11;
    }

    public final void setKindSet$ui_release(int i5) {
        this.kindSet = i5;
    }

    public final void setOwnerScope$ui_release(@Nullable a2 a2Var) {
        this.ownerScope = a2Var;
    }

    public final void setParent$ui_release(@Nullable Modifier$Node modifier$Node) {
        this.parent = modifier$Node;
    }

    public final void setUpdatedNodeAwaitingAttachForInvalidation$ui_release(boolean z11) {
        this.updatedNodeAwaitingAttachForInvalidation = z11;
    }

    public final void sideEffect(@NotNull Function0<Unit> effect) {
        o.g(this).registerOnEndApplyChangesListener(effect);
    }

    public void updateCoordinator$ui_release(@Nullable t1 coordinator) {
        this.coordinator = coordinator;
    }
}
