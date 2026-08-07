.class public Ll/zn00;
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


# instance fields
.field public f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;


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
    invoke-virtual {p0, p1, p2, p3}, Ll/zn00;->h(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

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
    sget v0, Ll/tec0;->Z0:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    instance-of v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 26
    .line 27
    iput-object p2, p0, Ll/zn00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 28
    .line 29
    new-instance v0, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    const/16 v2, 0xc

    .line 35
    .line 36
    invoke-virtual {p2, v1, p3, v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->l0(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;I)V

    .line 37
    .line 38
    .line 39
    iget-object p2, p0, Ll/zn00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 40
    .line 41
    iget-object v0, p0, Ll/fo00;->a:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 44
    .line 45
    const/4 v0, 0x1

    .line 46
    iput-boolean v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->l:Z

    .line 47
    .line 48
    iget-boolean v1, p0, Ll/fo00;->c:Z

    .line 49
    .line 50
    iput-boolean v1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->m:Z

    .line 51
    .line 52
    iget-boolean v1, p0, Ll/fo00;->d:Z

    .line 53
    .line 54
    iput-boolean v1, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->n:Z

    .line 55
    .line 56
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Ll/zn00;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/fo00;->d(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p3}, Ll/s1j;->a(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_0

    .line 69
    .line 70
    const/4 p0, 0x0

    .line 71
    invoke-static {p0, v0}, Ll/lb1;->b(Landroid/media/AudioManager$OnAudioFocusChangeListener;I)Z

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method
