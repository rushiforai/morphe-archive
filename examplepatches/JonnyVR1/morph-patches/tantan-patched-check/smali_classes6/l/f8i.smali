.class public Ll/f8i;
.super Ll/f7;
.source "SourceFile"

# interfaces
.implements Ll/t6i;


# instance fields
.field public a:Ll/dj70;

.field public b:Ll/lnh;

.field public c:Ll/wyd0;


# direct methods
.method public constructor <init>(Ll/lol;Ll/dj70;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/f7;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wyd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "FeedTopViewLiveRender_SHOW_TIME"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, ""

    .line 29
    .line 30
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/f8i;->c:Ll/wyd0;

    .line 34
    .line 35
    check-cast p1, Ll/lnh;

    .line 36
    .line 37
    iput-object p1, p0, Ll/f8i;->b:Ll/lnh;

    .line 38
    .line 39
    iput-object p2, p0, Ll/f8i;->a:Ll/dj70;

    .line 40
    .line 41
    return-void
.end method

.method public static synthetic n(Ll/f8i;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f8i;->v(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic o(Ll/f8i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/f8i;->w(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ll/f8i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f8i;->u(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Ll/f8i;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f8i;->x(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private t()Ll/lnh;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f8i;->b:Ll/lnh;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic w(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Ll/jka;->Dd(Z)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    new-instance v0, Ll/e8i;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/e8i;-><init>(Ll/f8i;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public b(Ll/dj70;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public c(Ll/dj70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/f8i;->a:Ll/dj70;

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/dj70;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public j()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/lnh;->g:Lv/VImage;

    .line 6
    .line 7
    new-instance v1, Ll/c8i;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/c8i;-><init>(Ll/f8i;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/f8i;->b:Ll/lnh;

    .line 16
    .line 17
    iget-object v0, v0, Ll/lnh;->O:Lv/VText;

    .line 18
    .line 19
    iget-object v1, p0, Ll/f8i;->a:Ll/dj70;

    .line 20
    .line 21
    iget-object v1, v1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 24
    .line 25
    iget-wide v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 26
    .line 27
    invoke-static {v1, v2}, Ll/p6i;->q(D)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/f8i;->c:Ll/wyd0;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {}, Ll/pzi0;->t()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_0

    .line 51
    .line 52
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    invoke-virtual {v0, v1}, Ll/jka;->Dd(Z)Lrx/c;

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Ll/f8i;->c:Ll/wyd0;

    .line 59
    .line 60
    invoke-static {}, Ll/pzi0;->t()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    :cond_0
    return-void
.end method

.method public l(Ll/dj70;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/f8i;->a:Ll/dj70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f8i;->z()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Ll/lnh;->g:Lv/VImage;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object v1, p1, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/f8i;->a:Ll/dj70;

    .line 29
    .line 30
    iget-boolean v0, v0, Ll/dj70;->c:Z

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {p1, v0}, Ll/u6i;->c(Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    iget-object p1, p0, Ll/f8i;->b:Ll/lnh;

    .line 45
    .line 46
    iget-object p1, p1, Ll/lnh;->n:Landroid/widget/FrameLayout;

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Ll/f8i;->s(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public m(Ll/dj70;)V
    .locals 0

    .line 1
    return-void
.end method

.method public r()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f8i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->g:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    return-object p0
.end method

.method public s(Landroid/view/View;)V
    .locals 1

    .line 1
    new-instance v0, Ll/b8i;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/b8i;-><init>(Ll/f8i;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic u(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/f8i;->a:Ll/dj70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/f8i;->r()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p1, v0, v1}, Ll/u6i;->d(Ll/dj70;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Ll/f8i;->a:Ll/dj70;

    .line 19
    .line 20
    iget v1, v0, Ll/dj70;->h:I

    .line 21
    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Ll/f8i;->a:Ll/dj70;

    .line 31
    .line 32
    iget-object p0, p0, Ll/dj70;->b:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p0}, Ll/o7i;->t(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string v2, ""

    .line 39
    .line 40
    invoke-static {p1, v1, v0, p0, v2}, Ll/dug;->k(Lcom/p1/mobile/putong/feed/data/Moment;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic v(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p1, p1, Ll/jka;->p0:Lrx/subjects/b;

    .line 4
    .line 5
    iget-object p0, p0, Ll/f8i;->a:Ll/dj70;

    .line 6
    .line 7
    iget-object p0, p0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic x(Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->setAvatar(Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public y()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f8i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object p0, p0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    return-object p0
.end method

.method public final z()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/f8i;->a:Ll/dj70;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/dj70;->c:Z

    .line 4
    .line 5
    if-nez v1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {v0, v1}, Ll/u6i;->c(Ll/dj70;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentVoiceLiveInfos:Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/f8i;->a:Ll/dj70;

    .line 26
    .line 27
    iget-object v1, v0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    const-string v1, "from_live_square_tab"

    .line 32
    .line 33
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Ll/lnh;->o:Lv/VDraweeView;

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v0, v0, Ll/lnh;->r:Lv/AutoVDraweeView;

    .line 56
    .line 57
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v0, v0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 65
    .line 66
    const/4 v2, 0x1

    .line 67
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v0, v0, Ll/lnh;->v:Lv/VImage;

    .line 75
    .line 76
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Ll/lnh;->i:Lv/VDraweeView;

    .line 84
    .line 85
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v0, v0, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 93
    .line 94
    const-string v1, "#D67AFF"

    .line 95
    .line 96
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    const-string v3, "#A87CFF"

    .line 101
    .line 102
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    invoke-virtual {v0, v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->c(II)V

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Ll/f8i;->a:Ll/dj70;

    .line 110
    .line 111
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v0}, Ll/o7i;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v1, p0, Ll/f8i;->a:Ll/dj70;

    .line 118
    .line 119
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v1}, Ll/o7i;->t(Ljava/lang/String;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    if-eqz v3, :cond_0

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 136
    .line 137
    if-eqz v3, :cond_0

    .line 138
    .line 139
    if-eqz v0, :cond_0

    .line 140
    .line 141
    if-eqz v1, :cond_0

    .line 142
    .line 143
    new-instance v1, Ll/pf60;

    .line 144
    .line 145
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 150
    .line 151
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 152
    .line 153
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 154
    .line 155
    const-string v4, "anchorId"

    .line 156
    .line 157
    invoke-direct {v1, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 158
    .line 159
    .line 160
    new-instance v3, Ll/pf60;

    .line 161
    .line 162
    invoke-virtual {p0}, Ll/f8i;->y()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 167
    .line 168
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 169
    .line 170
    const-string v5, "liveId"

    .line 171
    .line 172
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 173
    .line 174
    .line 175
    new-instance v4, Ll/pf60;

    .line 176
    .line 177
    const-string v5, "audio_card_type"

    .line 178
    .line 179
    const-string v6, "user_card"

    .line 180
    .line 181
    invoke-direct {v4, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    new-instance v5, Ll/pf60;

    .line 185
    .line 186
    const-string v6, "audio_tab_id"

    .line 187
    .line 188
    const-string v7, ""

    .line 189
    .line 190
    invoke-direct {v5, v6, v7}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    new-instance v6, Ll/pf60;

    .line 194
    .line 195
    iget-object v7, p0, Ll/f8i;->a:Ll/dj70;

    .line 196
    .line 197
    iget v7, v7, Ll/dj70;->h:I

    .line 198
    .line 199
    add-int/2addr v7, v2

    .line 200
    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    const-string v7, "index"

    .line 205
    .line 206
    invoke-direct {v6, v7, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 207
    .line 208
    .line 209
    filled-new-array {v1, v3, v4, v5, v6}, [Ll/pf60;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    const-string v2, "e_live_audio_room_enter"

    .line 214
    .line 215
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 216
    .line 217
    .line 218
    :cond_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 219
    .line 220
    iget-object v1, p0, Ll/f8i;->a:Ll/dj70;

    .line 221
    .line 222
    iget-object v1, v1, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 223
    .line 224
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    invoke-virtual {v0, v1}, Ll/fsb0;->X0(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    new-instance v1, Ll/q3d0;

    .line 237
    .line 238
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    iget-object v2, v2, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 243
    .line 244
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->getAvatarSize()I

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    invoke-direct {p0}, Ll/f8i;->t()Ll/lnh;

    .line 249
    .line 250
    .line 251
    move-result-object v3

    .line 252
    iget-object v3, v3, Ll/lnh;->s:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;

    .line 253
    .line 254
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/render/live/LiveHaloAvatar;->getAvatarSize()I

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    invoke-direct {v1, v2, v3}, Ll/q3d0;-><init>(II)V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0, v1}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-virtual {v0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 270
    .line 271
    new-instance v2, Ll/d8i;

    .line 272
    .line 273
    invoke-direct {v2, p0}, Ll/d8i;-><init>(Ll/f8i;)V

    .line 274
    .line 275
    .line 276
    invoke-virtual {v1, v0, v2}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 277
    .line 278
    .line 279
    :cond_1
    return-void
.end method
