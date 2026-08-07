.class public Ll/jo00;
.super Ll/fo00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/fo00<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fo00;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/jo00;->h(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fo00;->c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sget v0, Ll/tec0;->a1:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    instance-of v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    .line 26
    .line 27
    new-instance v0, Ljava/util/HashMap;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 30
    .line 31
    .line 32
    const/16 v1, 0xc

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {p2, v2, p3, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->X0(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;I)V

    .line 36
    .line 37
    .line 38
    const-string p3, "detail"

    .line 39
    .line 40
    iput-object p3, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 41
    .line 42
    const/4 p3, 0x1

    .line 43
    iput-boolean p3, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->l:Z

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p2}, Ll/fo00;->d(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
