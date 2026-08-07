.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;
.super Lv/VLinear;
.source "SourceFile"


# instance fields
.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

.field public e:Ljava/lang/String;

.field public f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VLinear;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->S(Landroid/content/Context;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->S(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VLinear;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->S(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final P(Ll/y20;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->e:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    move v0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/16 v0, 0x8

    .line 21
    .line 22
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eq v0, v2, :cond_1

    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 31
    .line 32
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;->g0(Ll/y20;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;->h0(Ll/y20;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->c:Lv/VText;

    .line 46
    .line 47
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public Q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->k0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public R(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final S(Landroid/content/Context;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget v1, Ll/tec0;->y:I

    .line 10
    .line 11
    invoke-virtual {p1, v1, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    sget p1, Ll/hdc0;->O:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lv/VText;

    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->c:Lv/VText;

    .line 23
    .line 24
    sget p1, Ll/hdc0;->G1:I

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 33
    .line 34
    sget p1, Ll/hdc0;->k:I

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->c:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 53
    .line 54
    .line 55
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 56
    .line 57
    const-string v1, "p_album"

    .line 58
    .line 59
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;->setPageId(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;->a0()V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->e:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isWisdomStar(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_1

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->c:Lv/VText;

    .line 76
    .line 77
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public T(Ll/bkj0;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;Z)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSendMomentEnterView;->i0(Ll/bkj0;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/data/User;Ll/x20;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->e:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, p1, v1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->n0(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ll/x20;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->e:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/p1/mobile/putong/data/User;->isWisdomStar(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->c:Lv/VText;

    .line 25
    .line 26
    const/4 p2, 0x1

    .line 27
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->c:Lv/VText;

    .line 31
    .line 32
    sget p1, Ll/qa00;->j:I

    .line 33
    .line 34
    invoke-static {p0, p1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public W(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/newui/FeedAlbumPersionTitleView;->o0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedAct;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public X(ZLl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->P(Ll/y20;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/AlbumFeedHeader;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
