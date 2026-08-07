.class public final Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010!\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010\u0007\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0011\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B\u001b\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u00a2\u0006\u0004\u0008\u0004\u0010\u0008J\u000f\u0010\n\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000e\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ%\u0010\u0014\u001a\u00020\t2\u0006\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0012\u001a\u00020\u00102\u0006\u0010\u0013\u001a\u00020\u0010\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J#\u0010\u001b\u001a\u00020\t2\u000c\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u00162\u0006\u0010\u001a\u001a\u00020\u0019\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0015\u0010\u001f\u001a\u00020\t2\u0006\u0010\u001e\u001a\u00020\u001d\u00a2\u0006\u0004\u0008\u001f\u0010 J\r\u0010!\u001a\u00020\t\u00a2\u0006\u0004\u0008!\u0010\u000bJ\u0019\u0010$\u001a\u00020\u00192\u0008\u0010#\u001a\u0004\u0018\u00010\"H\u0016\u00a2\u0006\u0004\u0008$\u0010%J\u000f\u0010&\u001a\u00020\tH\u0014\u00a2\u0006\u0004\u0008&\u0010\u000bJ\r\u0010\'\u001a\u00020\t\u00a2\u0006\u0004\u0008\'\u0010\u000bJ\u0017\u0010(\u001a\u00020\t2\u0006\u0010\u001e\u001a\u00020\u001dH\u0002\u00a2\u0006\u0004\u0008(\u0010 J\u000f\u0010)\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008)\u0010\u000bJ\u000f\u0010*\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008*\u0010+J\u0017\u0010.\u001a\u00020-2\u0006\u0010,\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008.\u0010/R\u0016\u0010\u0011\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00080\u0010\'R\u0016\u0010\u0012\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00081\u0010\'R\u0016\u0010\u0013\u001a\u00020\u00108\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00082\u0010\'R\u0018\u00105\u001a\u0004\u0018\u00010\u000c8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00083\u00104R\u0016\u00108\u001a\u00020\u00198\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u00086\u00107R\u0018\u0010<\u001a\u0004\u0018\u0001098\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008:\u0010;\u00a8\u0006="
    }
    d2 = {
        "Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;",
        "Landroidx/recyclerview/widget/RecyclerView;",
        "Landroid/content/Context;",
        "context",
        "<init>",
        "(Landroid/content/Context;)V",
        "Landroid/util/AttributeSet;",
        "attrs",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "init",
        "()V",
        "Ll/v0e0;",
        "adapter",
        "setAdapterData",
        "(Ll/v0e0;)V",
        "",
        "itemSize",
        "overlapSize",
        "colum",
        "K",
        "(III)V",
        "",
        "",
        "urls",
        "",
        "needBlur",
        "N",
        "(Ljava/util/List;Z)V",
        "",
        "duration",
        "H",
        "(J)V",
        "M",
        "Landroid/view/MotionEvent;",
        "ev",
        "dispatchTouchEvent",
        "(Landroid/view/MotionEvent;)Z",
        "onDetachedFromWindow",
        "I",
        "G",
        "L",
        "F",
        "()I",
        "int",
        "",
        "J",
        "(I)F",
        "a",
        "b",
        "c",
        "d",
        "Ll/v0e0;",
        "mAdapter",
        "e",
        "Z",
        "isRunning",
        "Ljava/lang/Runnable;",
        "f",
        "Ljava/lang/Runnable;",
        "runnable",
        "b_feed_intlGmsRelease"
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
.field public a:I

.field public b:I

.field public c:I

.field public d:Ll/v0e0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public e:Z

.field public f:Ljava/lang/Runnable;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

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

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->init()V

    return-void
.end method

.method public static E(Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;J)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->M()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->G(J)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private final init()V
    .locals 1

    .line 1
    const/16 v0, 0x42

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->J(I)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    float-to-int v0, v0

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->a:I

    .line 9
    .line 10
    const/16 v0, 0xd

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->J(I)F

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    float-to-int v0, v0

    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->b:I

    .line 18
    .line 19
    const/4 v0, 0x5

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->c:I

    .line 21
    .line 22
    return-void
.end method

.method private final setAdapterData(Ll/v0e0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->L()V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 11
    .line 12
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->a:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/v0e0;->D(I)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final F()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->c:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x2

    .line 4
    .line 5
    iget v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->a:I

    .line 6
    .line 7
    mul-int/2addr v1, v2

    .line 8
    add-int/lit8 v0, v0, 0x1

    .line 9
    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->b:I

    .line 11
    .line 12
    mul-int/2addr v0, p0

    .line 13
    sub-int/2addr v1, v0

    .line 14
    return v1
.end method

.method public final G(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->d:Ll/v0e0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/v0e0;->y()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x2

    .line 29
    if-ge v0, v1, :cond_1

    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->e:Z

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->f:Ljava/lang/Runnable;

    .line 36
    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    new-instance v0, Ll/yk80;

    .line 40
    .line 41
    invoke-direct {v0, p0, p1, p2}, Ll/yk80;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;J)V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->f:Ljava/lang/Runnable;

    .line 45
    .line 46
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->f:Ljava/lang/Runnable;

    .line 47
    .line 48
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->f:Ljava/lang/Runnable;

    .line 56
    .line 57
    invoke-static {v0, p0, p1, p2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final H(J)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->e:Z

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->G(J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final I()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->d:Ll/v0e0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/v0e0;->y()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final J(I)F
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 v0, 0x1

    .line 11
    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final K(III)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->a:I

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->b:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->c:I

    .line 6
    .line 7
    return-void
.end method

.method public final L()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->F()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    new-instance v1, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/OverlapLinearLayoutManager;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/OverlapLinearLayoutManager;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/m760;

    .line 24
    .line 25
    iget v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->b:I

    .line 26
    .line 27
    int-to-float v3, v3

    .line 28
    invoke-direct {v2, v3}, Ll/m760;-><init>(F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 32
    .line 33
    .line 34
    new-instance v2, Ll/zk80;

    .line 35
    .line 36
    iget v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->a:I

    .line 37
    .line 38
    int-to-float v3, v3

    .line 39
    iget v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->b:I

    .line 40
    .line 41
    int-to-float v4, v4

    .line 42
    invoke-direct {v2, v1, v0, v3, v4}, Ll/zk80;-><init>(Landroidx/recyclerview/widget/LinearLayoutManager;IFF)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final M()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    iget v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->b:I

    .line 25
    .line 26
    add-int/2addr v3, v4

    .line 27
    const/4 v4, 0x2

    .line 28
    if-ge v3, v4, :cond_0

    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    :cond_0
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->a:I

    .line 43
    .line 44
    add-int/2addr v0, v1

    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->b:I

    .line 46
    .line 47
    sub-int/2addr v0, v1

    .line 48
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    .line 49
    .line 50
    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 51
    .line 52
    .line 53
    const/16 v2, 0x384

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    invoke-virtual {p0, v0, v3, v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollBy(IILandroid/view/animation/Interpolator;I)V

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void
.end method

.method public final N(Ljava/util/List;Z)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->d:Ll/v0e0;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ll/v0e0;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-direct {v0, v1}, Ll/v0e0;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->setAdapterData(Ll/v0e0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ll/v0e0;->C(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ll/v0e0;->y()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ll/v0e0;->y()Ljava/util/List;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p1, Ljava/util/Collection;

    .line 38
    .line 39
    invoke-interface {p2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->d:Ll/v0e0;

    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->setAdapterData(Ll/v0e0;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0}, Ll/v0e0;->y()Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ll/v0e0;->y()Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p1, Ljava/util/Collection;

    .line 65
    .line 66
    invoke-interface {p0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 70
    .line 71
    .line 72
    :cond_1
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    const/4 p0, 0x0

    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/entry/scalerv/PopScaleRecyclerView;->f:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onDetachedFromWindow()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
