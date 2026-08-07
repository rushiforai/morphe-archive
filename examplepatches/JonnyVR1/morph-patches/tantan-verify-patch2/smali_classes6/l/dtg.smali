.class public Ll/dtg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

.field public b:Lcom/p1/mobile/putong/data/Video;

.field public c:I

.field public d:I

.field public e:Lcom/p1/mobile/putong/feed/data/Moment;

.field public f:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dtg;->e()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/dtg;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/dtg;->h(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V

    return-void
.end method

.method public static synthetic b(Ll/dtg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/dtg;->g()V

    return-void
.end method

.method public static synthetic c(Ll/dtg;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/dtg;->i(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public d(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->i:Landroid/widget/ImageView;

    .line 16
    .line 17
    sget v1, Ll/lbc0;->s0:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->b:Lv/AutoVDraweeView;

    .line 27
    .line 28
    const-string v1, "#eeeeee"

    .line 29
    .line 30
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 40
    .line 41
    new-instance v1, Ll/atg;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/atg;-><init>(Ll/dtg;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->L(Ll/x20;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->b:Lv/AutoVDraweeView;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ll/wlj;

    .line 60
    .line 61
    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    .line 62
    .line 63
    const/high16 v2, 0x18000000

    .line 64
    .line 65
    invoke-direct {v1, v2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ll/wlj;->C(Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 76
    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 84
    .line 85
    const/4 v1, 0x1

    .line 86
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setLoopMode(Z)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 92
    .line 93
    const/high16 v0, 0x40800000    # 4.0f

    .line 94
    .line 95
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setRadius(F)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->getPlayListener()Ljava/util/Set;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 26
    .line 27
    new-instance v1, Ll/dtg$a;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/dtg$a;-><init>(Ll/dtg;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->x(Ll/ie80$b;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic g()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 v0, 0x1

    .line 9
    sput-boolean v0, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->m:Z

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->c0(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic h(Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;Z)V
    .locals 1

    .line 1
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p1, p2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->k0(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    sput-boolean p1, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->m:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/dtg;->j()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final j()V
    .locals 4

    .line 1
    invoke-static {}, Ll/cmg;->P()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->M()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 16
    .line 17
    iget-object p0, p0, Ll/dtg;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->j0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 24
    .line 25
    iget-object p0, p0, Ll/dtg;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    iget-boolean v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->m:Z

    .line 28
    .line 29
    iget-boolean v2, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->n:Z

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    invoke-virtual {v0, p0, v3, v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g0(Lcom/p1/mobile/putong/feed/data/Moment;IZZ)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final k()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/dtg;->b:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 25
    .line 26
    if-lez v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Ll/dtg;->b:Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p0, Ll/dtg;->b:Lcom/p1/mobile/putong/data/Video;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 42
    .line 43
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 44
    .line 45
    if-lez v1, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 49
    .line 50
    const/16 v1, 0x168

    .line 51
    .line 52
    const/16 v2, 0x280

    .line 53
    .line 54
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 55
    .line 56
    .line 57
    :goto_0
    iget v1, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 58
    .line 59
    int-to-float v1, v1

    .line 60
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 61
    .line 62
    int-to-float v0, v0

    .line 63
    div-float/2addr v1, v0

    .line 64
    sget v0, Ll/cai;->c:I

    .line 65
    .line 66
    sget v2, Ll/cai;->d:I

    .line 67
    .line 68
    invoke-static {v0, v2}, Ll/cai;->c(II)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    mul-int/lit8 v0, v0, 0x2

    .line 73
    .line 74
    sget v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVideoView;->H:I

    .line 75
    .line 76
    int-to-float v2, v2

    .line 77
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    add-int/2addr v0, v2

    .line 82
    const v2, 0x3f333333    # 0.7f

    .line 83
    .line 84
    .line 85
    cmpg-float v2, v1, v2

    .line 86
    .line 87
    if-gtz v2, :cond_3

    .line 88
    .line 89
    mul-int/lit8 v1, v0, 0x9

    .line 90
    .line 91
    div-int/lit8 v1, v1, 0x10

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_3
    const v2, 0x3f547ae1    # 0.83f

    .line 95
    .line 96
    .line 97
    cmpg-float v2, v1, v2

    .line 98
    .line 99
    if-gtz v2, :cond_4

    .line 100
    .line 101
    mul-int/lit8 v1, v0, 0x3

    .line 102
    .line 103
    div-int/lit8 v1, v1, 0x4

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_4
    const v2, 0x3f99999a    # 1.2f

    .line 107
    .line 108
    .line 109
    cmpl-float v1, v1, v2

    .line 110
    .line 111
    if-ltz v1, :cond_5

    .line 112
    .line 113
    mul-int/lit8 v1, v0, 0x3

    .line 114
    .line 115
    div-int/lit8 v1, v1, 0x4

    .line 116
    .line 117
    move v3, v1

    .line 118
    move v1, v0

    .line 119
    move v0, v3

    .line 120
    goto :goto_1

    .line 121
    :cond_5
    move v1, v0

    .line 122
    :goto_1
    iput v0, p0, Ll/dtg;->d:I

    .line 123
    .line 124
    iput v1, p0, Ll/dtg;->c:I

    .line 125
    .line 126
    iget-object p0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 129
    .line 130
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 131
    .line 132
    invoke-direct {v2, v1, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->E:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->H:Lv/VLinear;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->R()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->P()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 49
    .line 50
    invoke-static {v0}, Ll/s1j;->b(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iget-object p0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 55
    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->F:Lv/VText;

    .line 59
    .line 60
    const-string v0, "\u62b1\u6b49\uff0c\u6b64\u52a8\u6001\u5df2\u88ab\u5220\u9664\u6216\u5931\u6548"

    .line 61
    .line 62
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->F:Lv/VText;

    .line 67
    .line 68
    const-string v0, "\u62b1\u6b49\uff0c\u6b64\u52a8\u6001\u5df2\u88ab\u4f5c\u8005\u7981\u6b62\u8f6c\u53d1"

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/data/Picture;)V
    .locals 2

    .line 1
    sget v0, Ll/cai;->c:I

    .line 2
    .line 3
    invoke-static {v0}, Ll/cai;->d(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, p1, p2, v0, v1}, Ll/dtg;->o(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/data/Picture;IZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public n(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/util/HashMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/dtg;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dtg;->f()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->g:Lv/VText;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, p1, v0}, Ll/dtg;->d(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 15
    .line 16
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->E(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 25
    .line 26
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/4 v3, 0x1

    .line 31
    xor-int/2addr v2, v3

    .line 32
    invoke-virtual {p0, v1, v2}, Ll/dtg;->d(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 36
    .line 37
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->f:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 38
    .line 39
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-nez v2, :cond_0

    .line 46
    .line 47
    move v2, v0

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    iget-object v2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Ljava/lang/Boolean;

    .line 56
    .line 57
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    :goto_0
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->L(Z)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    new-instance v2, Ll/btg;

    .line 66
    .line 67
    invoke-direct {v2, p0, p3, p2}, Ll/btg;-><init>(Ll/dtg;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->Q(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$e;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-virtual {p3, p1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 75
    .line 76
    .line 77
    invoke-static {p2}, Ll/s1j;->a(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_1

    .line 82
    .line 83
    const/4 p1, 0x2

    .line 84
    iput p1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->curForwardRenderState:I

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/dtg;->l()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_1
    iput v3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->curForwardRenderState:I

    .line 91
    .line 92
    iget-object p1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->E:Landroid/widget/RelativeLayout;

    .line 95
    .line 96
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->H:Lv/VLinear;

    .line 102
    .line 103
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 107
    .line 108
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 109
    .line 110
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 114
    .line 115
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 116
    .line 117
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p1, p2}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Ll/dtg;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 124
    .line 125
    new-instance p1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string p2, "@"

    .line 128
    .line 129
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 133
    .line 134
    iget-object p3, p0, Ll/dtg;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 135
    .line 136
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {p2, p3}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 143
    .line 144
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string p2, " "

    .line 148
    .line 149
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    iget-object p2, p0, Ll/dtg;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 153
    .line 154
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget-object p2, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 160
    .line 161
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->G:Lv/VText;

    .line 162
    .line 163
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 168
    .line 169
    .line 170
    iget-object p1, p0, Ll/dtg;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 171
    .line 172
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 173
    .line 174
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 175
    .line 176
    .line 177
    move-result p2

    .line 178
    if-eq p2, v3, :cond_2

    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 186
    .line 187
    instance-of p2, p1, Lcom/p1/mobile/putong/data/Video;

    .line 188
    .line 189
    if-nez p2, :cond_3

    .line 190
    .line 191
    goto :goto_1

    .line 192
    :cond_3
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 193
    .line 194
    iget-object p2, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 195
    .line 196
    if-nez p2, :cond_4

    .line 197
    .line 198
    :goto_1
    return-void

    .line 199
    :cond_4
    invoke-virtual {p0, p1, p2}, Ll/dtg;->m(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/data/Picture;)V

    .line 200
    .line 201
    .line 202
    return-void
.end method

.method public final o(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/data/Picture;IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dtg;->b:Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Video;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->R()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->P()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 34
    .line 35
    invoke-virtual {v0, p1, p4}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->Q(Lcom/p1/mobile/putong/data/Video;Z)V

    .line 36
    .line 37
    .line 38
    iget-object p4, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 39
    .line 40
    iget-object p4, p4, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 41
    .line 42
    instance-of v0, p4, Lcom/p1/mobile/putong/feed/newui/preview/gesture/PlayerViewWithTransAnim;

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    check-cast p4, Lcom/p1/mobile/putong/feed/newui/preview/gesture/PlayerViewWithTransAnim;

    .line 47
    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p4, v0}, Lcom/p1/mobile/putong/feed/newui/preview/gesture/PlayerViewWithTransAnim;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iput-object p1, p0, Ll/dtg;->b:Lcom/p1/mobile/putong/data/Video;

    .line 58
    .line 59
    new-instance p1, Landroid/graphics/Point;

    .line 60
    .line 61
    iget-object p4, p2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 62
    .line 63
    iget v0, p4, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 64
    .line 65
    iget p4, p4, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 66
    .line 67
    invoke-direct {p1, v0, p4}, Landroid/graphics/Point;-><init>(II)V

    .line 68
    .line 69
    .line 70
    invoke-static {p3, p1}, Ll/dmk0;->b(ILandroid/graphics/Point;)Landroid/graphics/Point;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iget-object p3, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 75
    .line 76
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 77
    .line 78
    const/4 p4, 0x1

    .line 79
    invoke-static {p3, p4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ll/dtg;->k()V

    .line 83
    .line 84
    .line 85
    iget-object p3, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 86
    .line 87
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 88
    .line 89
    sget p4, Ll/hdc0;->D:I

    .line 90
    .line 91
    invoke-virtual {p3, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 92
    .line 93
    .line 94
    move-result-object p3

    .line 95
    check-cast p3, Lv/VDraweeView;

    .line 96
    .line 97
    iget-object p4, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 98
    .line 99
    iget-object p4, p4, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->H:Lv/VLinear;

    .line 100
    .line 101
    new-instance v0, Ll/ctg;

    .line 102
    .line 103
    invoke-direct {v0, p0}, Ll/ctg;-><init>(Ll/dtg;)V

    .line 104
    .line 105
    .line 106
    invoke-static {p4, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 107
    .line 108
    .line 109
    iget-object p4, p2, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 110
    .line 111
    const-string v0, "raw"

    .line 112
    .line 113
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result p4

    .line 117
    if-nez p4, :cond_1

    .line 118
    .line 119
    iget-object p4, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result p4

    .line 125
    if-nez p4, :cond_1

    .line 126
    .line 127
    sget-object p4, Ll/uqb0;->G:Ll/fsb0;

    .line 128
    .line 129
    iget p1, p1, Landroid/graphics/Point;->x:I

    .line 130
    .line 131
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p4, p3, p1}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p3, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_1
    iget-object p1, p0, Ll/dtg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;

    .line 148
    .line 149
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterForwardVideoView;->D:Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 150
    .line 151
    iget p2, p0, Ll/dtg;->c:I

    .line 152
    .line 153
    iget p0, p0, Ll/dtg;->d:I

    .line 154
    .line 155
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->S(II)V

    .line 156
    .line 157
    .line 158
    return-void
.end method
