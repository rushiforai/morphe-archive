.class public Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->B5()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;->b:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;->a:Z

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;->a:Z

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;->b:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 21
    .line 22
    invoke-static {p2}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->s5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->getItemCount()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    add-int/lit8 p2, p2, -0x5

    .line 31
    .line 32
    if-lt p1, p2, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;->b:Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;->t5(Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag;)Ll/i5o;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ll/i5o;->h3()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    if-lez p3, :cond_0

    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p1, 0x0

    .line 9
    :goto_0
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/fragments/followTab/IntlLiveSquareFollowFrag$b;->a:Z

    .line 10
    .line 11
    return-void
.end method
