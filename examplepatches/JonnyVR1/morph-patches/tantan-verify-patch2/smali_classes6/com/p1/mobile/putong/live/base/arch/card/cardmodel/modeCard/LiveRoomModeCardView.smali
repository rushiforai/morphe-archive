.class public Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field private adapter:Ll/v6u;

.field private recyclerView:Lv/VRecyclerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;Ll/ags;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->c(Ll/ags;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Ll/ggs;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ggs;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/ggs;->a()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p1}, Ll/ggs;->a()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/ags;

    .line 38
    .line 39
    new-instance v2, Ll/yit;

    .line 40
    .line 41
    invoke-direct {v2, v1}, Ll/yit;-><init>(Ll/ags;)V

    .line 42
    .line 43
    .line 44
    new-instance v3, Ll/xit;

    .line 45
    .line 46
    invoke-direct {v3, p0, v1}, Ll/xit;-><init>(Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;Ll/ags;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    :goto_1
    return-object v0
.end method

.method public final synthetic c(Ll/ags;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/ags;->b()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-static {p0, p2}, Ll/yrs;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ll/ags;->d()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/apibean/LiveCardTracker;->trackMc(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d(Ll/ggs;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->adapter:Ll/v6u;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->b(Ll/ggs;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/jdc0;->y0:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VRecyclerView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->recyclerView:Lv/VRecyclerView;

    .line 13
    .line 14
    new-instance v0, Ll/v6u;

    .line 15
    .line 16
    invoke-direct {v0}, Ll/v6u;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->adapter:Ll/v6u;

    .line 20
    .line 21
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->recyclerView:Lv/VRecyclerView;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/luf0;

    .line 37
    .line 38
    sget v1, Ll/qa00;->h:I

    .line 39
    .line 40
    invoke-direct {v0, v2, v1}, Ll/luf0;-><init>(II)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->recyclerView:Lv/VRecyclerView;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->recyclerView:Lv/VRecyclerView;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/cardmodel/modeCard/LiveRoomModeCardView;->adapter:Ll/v6u;

    .line 51
    .line 52
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
