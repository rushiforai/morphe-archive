.class public Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;

.field public g:Ljava/lang/String;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->h:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->h:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->h:Z

    return-void
.end method

.method private synthetic B(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->g:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const-string v1, "e_state_explore"

    .line 9
    .line 10
    invoke-static {v1, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->f:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;->getBubbleInfoLists()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->f:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;->getCurrentIndex()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    rem-int/2addr v1, v2

    .line 30
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 37
    .line 38
    const-string v2, "\u5b9e\u65f6\u72b6\u6001\u5e7f\u573a\uff0c\u53d1\u73b0\u66f4\u591a\u6709\u8da3\u7684\u4eba"

    .line 39
    .line 40
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->g:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p0, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const/4 v0, 0x1

    .line 62
    invoke-static {v2, v0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/FeedStatusPageAct;->s2(Landroid/content/Context;ZLcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {v1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;Ljava/util/List;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->H(Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->B(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final synthetic H(Ljava/util/List;Ljava/util/List;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-ge v2, v3, :cond_2

    .line 13
    .line 14
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Ljava/lang/String;

    .line 19
    .line 20
    move v4, v1

    .line 21
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-ge v4, v5, :cond_1

    .line 26
    .line 27
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    check-cast v5, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 32
    .line 33
    iget-object v5, v5, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    if-eqz v5, :cond_0

    .line 40
    .line 41
    invoke-interface {p2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    check-cast v5, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 46
    .line 47
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_3

    .line 61
    .line 62
    new-instance p1, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 63
    .line 64
    invoke-direct {p1}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string p2, "\u5b9e\u65f6\u72b6\u6001\u5e7f\u573a\uff0c\u53d1\u73b0\u66f4\u591a\u6709\u8da3\u7684\u4eba"

    .line 68
    .line 69
    iput-object p2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->f:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;->setBubbleInfo(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->f:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;->setBubbleInfoList(Ljava/util/List;)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->f:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;->p()V

    .line 85
    .line 86
    .line 87
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->h:Z

    .line 88
    .line 89
    if-nez p1, :cond_4

    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->L()V

    .line 92
    .line 93
    .line 94
    :cond_4
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;Ljava/lang/String;)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->g:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;->stateIds:Ljava/util/List;

    .line 4
    .line 5
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->f:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;

    .line 6
    .line 7
    invoke-virtual {p3}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;->getBubbleInfoLists()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p3

    .line 17
    const/4 v0, 0x1

    .line 18
    if-le p3, v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 22
    .line 23
    iget-object p3, p3, Ll/jka;->x0:Lrx/subjects/a;

    .line 24
    .line 25
    invoke-virtual {p3}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    check-cast p3, Ljava/util/List;

    .line 30
    .line 31
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 32
    .line 33
    .line 34
    move-result p3

    .line 35
    if-eqz p3, :cond_1

    .line 36
    .line 37
    new-instance p3, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 38
    .line 39
    invoke-direct {p3}, Lcom/p1/mobile/putong/data/BubbleInfo;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v0, "\u5b9e\u65f6\u72b6\u6001\u5e7f\u573a\uff0c\u53d1\u73b0\u66f4\u591a\u6709\u8da3\u7684\u4eba"

    .line 43
    .line 44
    iput-object v0, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->value:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->f:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;

    .line 47
    .line 48
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedAutoScrollView;->setBubbleInfo(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    sget-object p3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 52
    .line 53
    iget-object p3, p3, Ll/jka;->x0:Lrx/subjects/a;

    .line 54
    .line 55
    invoke-virtual {p1, p3}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance p3, Ll/t3i;

    .line 64
    .line 65
    invoke-direct {p3, p0, p2}, Ll/t3i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;Ljava/util/List;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->h:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->g:Ljava/lang/String;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p0, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_state_explore"

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->z(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;->d:Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;

    .line 13
    .line 14
    new-instance v1, Ll/s3i;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/s3i;-><init>(Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final z(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/u3i;->a(Lcom/p1/mobile/putong/feed/newui/status/display/view/FeedStateSquareEntranceView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
