.class public Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/mxh;


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

.field public b:Ll/dg70;

.field public c:Z

.field public d:Z

.field public e:Z

.field public f:I

.field public g:I

.field public h:Z

.field public i:Ljava/lang/String;

.field public j:Ll/hai;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 28
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->d(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->d(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IZZZ)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->i:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const-string p2, "from_video_flow"

    .line 13
    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->i:Ljava/lang/String;

    .line 15
    .line 16
    :cond_0
    iput-boolean p4, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->c:Z

    .line 17
    .line 18
    iput-boolean p5, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->d:Z

    .line 19
    .line 20
    iput-boolean p6, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->e:Z

    .line 21
    .line 22
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->g:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->d(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static c(Landroid/view/View;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;
    .locals 1

    .line 1
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    check-cast p0, Landroid/view/ViewGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->c(Landroid/view/View;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return-object p0
.end method

.method private getVideoPlayView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->b:Lv/VPager;

    .line 22
    .line 23
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->c(Landroid/view/View;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return-object p0
.end method


# virtual methods
.method public a(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public b(ILcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public final d(Landroid/content/Context;)V
    .locals 4

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ll/dg70;

    .line 6
    .line 7
    move-object v1, p1

    .line 8
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ll/dg70;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->b:Ll/dg70;

    .line 14
    .line 15
    new-instance v0, Ll/hai;

    .line 16
    .line 17
    invoke-direct {v0, v1, p0}, Ll/hai;-><init>(Lcom/p1/mobile/android/app/Act;Ll/mxh;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

    .line 21
    .line 22
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->e:Z

    .line 23
    .line 24
    iput-boolean v2, v0, Ll/hai;->p1:Z

    .line 25
    .line 26
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->c:Z

    .line 27
    .line 28
    iput-boolean v2, v0, Ll/hai;->o1:Z

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->a()Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->d(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->c(Ll/kxh;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->f(Ll/jxh;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->i:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->e(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a$a;->b()Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->b:Ll/dg70;

    .line 63
    .line 64
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 68
    .line 69
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 78
    .line 79
    invoke-static {}, Ll/bnl0;->y0()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->g:I

    .line 84
    .line 85
    if-nez v2, :cond_0

    .line 86
    .line 87
    invoke-static {}, Ll/bnl0;->w0()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-static {}, Ll/bnl0;->F0()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    sub-int/2addr v2, v3

    .line 96
    :cond_0
    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 103
    .line 104
    .line 105
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->b:Ll/dg70;

    .line 106
    .line 107
    invoke-virtual {p1}, Ll/dg70;->a0()V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->f()V

    .line 113
    .line 114
    .line 115
    :cond_1
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hai;->z1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/feed/data/Moment;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->b:Ll/dg70;

    .line 8
    .line 9
    iput-object p1, p2, Ll/dg70;->e:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p2, Ll/dg70;->a:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 24
    .line 25
    check-cast p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->v(Ljava/util/ArrayList;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/act/a;->s()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->getVideoPlayView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->h:Z

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->y()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->F()V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->h:Z

    .line 25
    .line 26
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->h:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/hai;->w1()V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public getShowInVideoFlowPosition()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public getViewModel()Lcom/p1/mobile/putong/feed/newui/preview/act/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->a:Lcom/p1/mobile/putong/feed/newui/preview/act/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->getVideoPlayView()Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->y()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPlayerView;->J()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hai;->A1()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setAutoNextVideo(Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/jbi;->l1(Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setLivingStore(Ll/msv;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->j:Ll/hai;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ll/yqg;->F:Ll/msv;

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public setShowInVideoFlowPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/videoflow/item/FeedVideoViewFlowItemView;->f:I

    .line 2
    .line 3
    return-void
.end method
