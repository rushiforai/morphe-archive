.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedCustomSGLayoutManager;
.super Landroidx/recyclerview/widget/StaggeredGridLayoutManager;
.source "SourceFile"


# instance fields
.field public y:D


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public f0(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedCustomSGLayoutManager;->y:D

    .line 2
    .line 3
    return-void
.end method

.method public scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedCustomSGLayoutManager;->y:D

    .line 2
    .line 3
    int-to-double v2, p1

    .line 4
    mul-double/2addr v0, v2

    .line 5
    double-to-int v0, v0

    .line 6
    invoke-super {p0, v0, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->scrollHorizontallyBy(ILandroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedCustomSGLayoutManager;->y:D

    .line 11
    .line 12
    mul-double/2addr v0, v2

    .line 13
    double-to-int p0, v0

    .line 14
    if-ne p2, p0, :cond_0

    .line 15
    .line 16
    return p1

    .line 17
    :cond_0
    return p2
.end method
