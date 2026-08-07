.class public final Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;
.source "SourceFile"

# interfaces
.implements Ll/k0m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings<",
        "Ll/pg10;",
        ">;",
        "Ll/k0m;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0018\u00002\u00020\u00012\u0008\u0012\u0004\u0012\u00020\u00030\u0002B\u001b\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0017\u0010\u0010\u001a\u00020\u000c2\u0006\u0010\u000f\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u000eJ\u001b\u0010\u0014\u001a\u00020\u000c2\u000c\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u0011\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u000f\u0010\u0016\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u001a\u001a\u00020\u000c2\u0006\u0010\u0019\u001a\u00020\u0018H\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ)\u0010\u001f\u001a\u00020\u000c2\u000c\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u001c2\u000c\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u001c\u00a2\u0006\u0004\u0008\u001f\u0010 J\u000f\u0010!\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008!\u0010\u0017R\u001b\u0010\'\u001a\u00020\"8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008#\u0010$\u001a\u0004\u0008%\u0010&\u00a8\u0006("
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;",
        "Ll/k0m;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;",
        "Ll/pg10;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "showEmpty",
        "",
        "t0",
        "(Z)V",
        "isRefresh",
        "u0",
        "",
        "Ll/ff10;",
        "data",
        "s0",
        "(Ljava/util/List;)V",
        "F",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "R",
        "(Lcom/p1/mobile/android/app/Act;)V",
        "Lkotlin/Function0;",
        "start",
        "finish",
        "r0",
        "(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V",
        "q0",
        "Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;",
        "i",
        "Lkotlin/Lazy;",
        "getAudienceAdapter",
        "()Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;",
        "audienceAdapter",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final i:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    sget-object p1, Lkotlin/LazyThreadSafetyMode;->NONE:Lkotlin/LazyThreadSafetyMode;

    .line 8
    .line 9
    new-instance p2, Ll/cb10;

    .line 10
    .line 11
    invoke-direct {p2}, Ll/cb10;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Lkotlin/LazyKt__LazyJVMKt;->a(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->i:Lkotlin/Lazy;

    .line 19
    .line 20
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 21
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private final getAudienceAdapter()Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->i:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 8
    .line 9
    return-object p0
.end method

.method public static i0(Lkotlin/jvm/functions/Function0;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->s0(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static j0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)Lkotlin/Unit;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->u0(Z)V

    .line 3
    .line 4
    .line 5
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 6
    .line 7
    return-object p0
.end method

.method public static k0(Lkotlin/jvm/functions/Function0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static l0()Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static synthetic m0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->p0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V

    return-void
.end method

.method public static n0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->q0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static o0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)Lkotlin/Unit;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->u0(Z)V

    .line 3
    .line 4
    .line 5
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 6
    .line 7
    return-object p0
.end method

.method public static final p0(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->q0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final t0(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->h:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->h:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 16
    .line 17
    sget v0, Ll/obc0;->P3:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b(I)Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->h:Lcom/p1/mobile/putong/live/base/view/EmptyView;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/EmptyView;->b:Landroid/widget/TextView;

    .line 25
    .line 26
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->W8:I

    .line 27
    .line 28
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method private final u0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->f:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public F()V
    .locals 4

    .line 1
    invoke-super {p0}, Ll/k0m;->F()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/bb10;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/bb10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V

    .line 11
    .line 12
    .line 13
    const-wide/16 v2, 0x12c

    .line 14
    .line 15
    invoke-static {v0, v1, v2, v3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public R(Lcom/p1/mobile/android/app/Act;)V
    .locals 4
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->g:Landroidx/recyclerview/widget/RecyclerView;

    .line 5
    .line 6
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->getAudienceAdapter()Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->f:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    .line 26
    .line 27
    sget v0, Ll/n9c0;->u1:I

    .line 28
    .line 29
    sget v1, Ll/n9c0;->r1:I

    .line 30
    .line 31
    sget v2, Ll/n9c0;->s1:I

    .line 32
    .line 33
    sget v3, Ll/n9c0;->t1:I

    .line 34
    .line 35
    filled-new-array {v0, v1, v2, v3}, [I

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/db10;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/db10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x1

    .line 51
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->t0(Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final q0()V
    .locals 2

    .line 1
    new-instance v0, Ll/eb10;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/eb10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/fb10;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/fb10;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->r0(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final r0(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V
    .locals 1
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveMultiCallAudienceBindings;->d:Ll/k3m;

    .line 11
    .line 12
    check-cast p1, Ll/pg10;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/pg10;->b4()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Ll/gb10;

    .line 19
    .line 20
    invoke-direct {v0, p2, p0}, Ll/gb10;-><init>(Lkotlin/jvm/functions/Function0;Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/hb10;

    .line 24
    .line 25
    invoke-direct {p0, p2}, Ll/hb10;-><init>(Lkotlin/jvm/functions/Function0;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final s0(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ff10;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->t0(Z)V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/multiCall/dialog/view/MultiCallAudienceView;->getAudienceAdapter()Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
