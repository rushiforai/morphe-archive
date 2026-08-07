.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;
.super Lv/VRecyclerView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;

.field public d:Z

.field public e:Z

.field public f:D


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    .line 4
    .line 5
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;)V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->c:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lv/VRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;)Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->c:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;

    return-object p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->e:Z

    return p0
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->d:Z

    return p0
.end method


# virtual methods
.method public J()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->K()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->e:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->d:Z

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->c:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;

    .line 14
    .line 15
    const-wide/16 v1, 0x5

    .line 16
    .line 17
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public K()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->d:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->c:Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle$a;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public fling(II)Z
    .locals 4

    .line 1
    int-to-double v0, p1

    .line 2
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->f:D

    .line 3
    .line 4
    mul-double/2addr v0, v2

    .line 5
    double-to-int p1, v0

    .line 6
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public setflingScale(D)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedStateSquareRecycle;->f:D

    .line 2
    .line 3
    return-void
.end method
