.class public Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Landroidx/recyclerview/widget/RecyclerView;

.field public d:Ll/tfy;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xfy;->a(Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public Q(Ljava/util/List;Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/MeetLiveItemData;",
            ">;",
            "Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;->d:Ll/tfy;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/tfy;

    .line 6
    .line 7
    invoke-direct {v0, p2}, Ll/tfy;-><init>(Lcom/p1/mobile/putong/core/newui/newmeet/frag/meet/NewMeetFragPresenter;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;->d:Ll/tfy;

    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 13
    .line 14
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-direct {v0, v1, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 25
    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;->d:Ll/tfy;

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;->d:Ll/tfy;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/tfy;->L(Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/newmeet/header/MeetStateHeaderView;->P(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
