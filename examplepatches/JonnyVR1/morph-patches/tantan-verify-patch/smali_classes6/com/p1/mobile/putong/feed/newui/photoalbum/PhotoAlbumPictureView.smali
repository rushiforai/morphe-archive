.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lv/VTexturePlayer$b;


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VFrame_ColorFilter;

.field public c:Landroid/widget/ImageView;

.field public d:Lv/VProgressBar;

.field public e:Landroid/widget/ImageView;

.field public f:Lv/VTexturePlayer;

.field public g:Lv/VTexturePlayer$b;

.field public h:Lcom/p1/mobile/putong/data/Media;

.field public i:Z

.field public j:Z

.field public k:J

.field public l:J

.field public m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

.field public n:Ll/x20;

.field public o:Lcom/p1/mobile/putong/feed/data/Moment;

.field public p:Z

.field public q:I

.field public r:F

.field public s:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->k:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->l:J

    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p:Z

    .line 12
    .line 13
    sget p1, Ll/hdc0;->q1:I

    .line 14
    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->q:I

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->r:F

    .line 19
    .line 20
    const/16 p1, 0x1f4

    .line 21
    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->s:I

    .line 23
    .line 24
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, -0x1

    .line 26
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->k:J

    .line 27
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->l:J

    const/4 p1, 0x1

    .line 28
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p:Z

    .line 29
    sget p1, Ll/hdc0;->q1:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->q:I

    const/4 p1, 0x0

    .line 30
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->r:F

    const/16 p1, 0x1f4

    .line 31
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->s:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, -0x1

    .line 33
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->k:J

    .line 34
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->l:J

    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p:Z

    .line 36
    sget p1, Ll/hdc0;->q1:I

    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->q:I

    const/4 p1, 0x0

    .line 37
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->r:F

    const/16 p1, 0x1f4

    .line 38
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->s:I

    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ll/cbl0;->u(Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Lcom/p1/mobile/putong/data/Music;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->s(Lcom/p1/mobile/putong/data/Music;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->r(Ljava/lang/String;ILjava/lang/Integer;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->q()V

    return-void
.end method

.method public static synthetic g(Ljava/lang/Object;)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-static {p0, v0}, Ll/o1j0;->i(IZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private getVideoDisplayRatio()F
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    int-to-float p0, p0

    .line 14
    const/high16 v1, 0x3f800000    # 1.0f

    .line 15
    .line 16
    mul-float/2addr p0, v1

    .line 17
    int-to-float v0, v0

    .line 18
    div-float/2addr p0, v0

    .line 19
    return p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->k:J

    return-wide v0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->l:J

    return-wide v0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->l:J

    return-void
.end method

.method private m()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method private n(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->q:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 6
    .line 7
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-ge v1, v2, :cond_1

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 14
    .line 15
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 24
    .line 25
    if-eq v2, p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    const/4 v3, 0x4

    .line 32
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 41
    .line 42
    .line 43
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-void
.end method

.method private p()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Lv/VTexturePlayer;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1, p0}, Lv/VTexturePlayer;-><init>(Landroid/content/Context;Lv/VTexturePlayer$b;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Lv/VTexturePlayer;->setIfUseTTDynamicCache(Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 21
    .line 22
    sget v2, Ll/hdc0;->R1:I

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Landroid/view/View;->setId(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-lez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    const/high16 v3, 0x40000000    # 2.0f

    .line 40
    .line 41
    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    invoke-static {v4, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {v0, v2, v3}, Landroid/view/View;->measure(II)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    const/4 v4, 0x0

    .line 67
    invoke-virtual {v0, v4, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 68
    .line 69
    .line 70
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {p0, v0, v1, v2, v1}, Landroid/view/ViewGroup;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 80
    .line 81
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const/4 v1, -0x1

    .line 86
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 87
    .line 88
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 89
    .line 90
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    iput v1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 95
    .line 96
    :cond_1
    return-void
.end method

.method public static u(Landroid/view/View;Z)V
    .locals 3

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    move-object v0, p0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->o(Z)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v0, p0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->t()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    :goto_1
    move-object v1, p0

    .line 27
    check-cast v1, Landroid/view/ViewGroup;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ge v0, v2, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->u(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v0, v0, 0x1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_2
    return-void
.end method


# virtual methods
.method public d()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/high16 v1, 0x3f800000    # 1.0f

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-wide/16 v1, 0xc8

    .line 33
    .line 34
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 39
    .line 40
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/4 v1, 0x0

    .line 65
    cmpl-float v0, v0, v1

    .line 66
    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 70
    .line 71
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const-wide/16 v1, 0x190

    .line 80
    .line 81
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 86
    .line 87
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 95
    .line 96
    .line 97
    :cond_1
    sget v0, Ll/hdc0;->q1:I

    .line 98
    .line 99
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n(I)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_2

    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 111
    .line 112
    invoke-interface {v0}, Lv/VTexturePlayer$b;->d()V

    .line 113
    .line 114
    .line 115
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 116
    .line 117
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_3

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->g()V

    .line 126
    .line 127
    .line 128
    :cond_3
    :goto_0
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    sget v0, Ll/hdc0;->H0:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 15
    .line 16
    invoke-interface {p0}, Lv/VTexturePlayer$b;->h()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vi70;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lv/VTexturePlayer;->i(Z)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->a:Lv/VDraweeView;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->a:Lv/VDraweeView;

    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 46
    .line 47
    .line 48
    sget p1, Ll/hdc0;->q1:I

    .line 49
    .line 50
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 63
    .line 64
    const/high16 v0, 0x3f800000    # 1.0f

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 67
    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->a:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->h:Lcom/p1/mobile/putong/data/Media;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    if-eqz p1, :cond_1

    .line 87
    .line 88
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->a:Lv/VDraweeView;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->h:Lcom/p1/mobile/putong/data/Media;

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p1, v0, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->h:Lcom/p1/mobile/putong/data/Media;

    .line 106
    .line 107
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 108
    .line 109
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 113
    .line 114
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    if-eqz p1, :cond_2

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 121
    .line 122
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->g()V

    .line 123
    .line 124
    .line 125
    :cond_2
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_3

    .line 8
    .line 9
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->q:I

    .line 10
    .line 11
    sget v0, Ll/hdc0;->q1:I

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p:Z

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p:Z

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->v()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    sget v0, Ll/hdc0;->i1:I

    .line 27
    .line 28
    if-ne p1, v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->t()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_2
    sget v0, Ll/hdc0;->H0:I

    .line 35
    .line 36
    if-ne p1, v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->t()V

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void
.end method

.method public onComplete()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VTexturePlayer;->v()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-wide/16 v1, 0xc8

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 25
    .line 26
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->onPause()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-wide/16 v1, 0x258

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 57
    .line 58
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 66
    .line 67
    .line 68
    new-instance v0, Ll/ti70;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/ti70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;)V

    .line 71
    .line 72
    .line 73
    const-wide/16 v1, 0x190

    .line 74
    .line 75
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_0

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 87
    .line 88
    invoke-interface {v0}, Lv/VTexturePlayer$b;->onComplete()V

    .line 89
    .line 90
    .line 91
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n:Ll/x20;

    .line 92
    .line 93
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n:Ll/x20;

    .line 100
    .line 101
    invoke-interface {v0}, Ll/x20;->call()V

    .line 102
    .line 103
    .line 104
    :cond_1
    const/4 v0, 0x1

    .line 105
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p:Z

    .line 106
    .line 107
    return-void
.end method

.method public onError(II)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/Throwable;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "PhotoAlbumPictureView play video error "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-boolean v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->i:Z

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, " "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/16 v1, 0x64

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 50
    .line 51
    invoke-interface {v0, p1, p2}, Lv/VTexturePlayer$b;->onError(II)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->g()V

    .line 65
    .line 66
    .line 67
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    sget v0, Ll/hdc0;->q1:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n(I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 15
    .line 16
    invoke-interface {v0}, Lv/VTexturePlayer$b;->onPause()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->g()V

    .line 30
    .line 31
    .line 32
    :cond_1
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p:Z

    .line 34
    .line 35
    return-void
.end method

.method public onResume()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->r:F

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->s:I

    .line 14
    .line 15
    int-to-long v1, v1

    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 21
    .line 22
    .line 23
    sget v0, Ll/hdc0;->i1:I

    .line 24
    .line 25
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 37
    .line 38
    invoke-interface {v0}, Lv/VTexturePlayer$b;->onResume()V

    .line 39
    .line 40
    .line 41
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->f()V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public final synthetic q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Lv/VTexturePlayer;->v()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic r(Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->k:J

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {v0, v1, p0, p1, p2}, Ll/c7y;->d(JILjava/lang/String;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic s(Lcom/p1/mobile/putong/data/Music;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->l2(Landroid/content/Context;Lcom/p1/mobile/putong/data/Music;)Landroid/content/Intent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setOnCompleteAction(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setScaleX(F)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    neg-int v0, v0

    .line 31
    int-to-float v0, v0

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/View;->getPivotX()F

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    cmpl-float v1, v1, v0

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 43
    .line 44
    invoke-virtual {v1, v0}, Landroid/view/View;->setPivotX(F)V

    .line 45
    .line 46
    .line 47
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 48
    .line 49
    const/high16 v1, 0x3f800000    # 1.0f

    .line 50
    .line 51
    div-float/2addr v1, p1

    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 53
    .line 54
    .line 55
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public setScaleY(F)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/bnl0;->S(F)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 29
    .line 30
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sub-int/2addr v0, v1

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 36
    .line 37
    invoke-virtual {v1}, Landroid/view/View;->getPivotY()F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    int-to-float v0, v0

    .line 42
    cmpl-float v1, v1, v0

    .line 43
    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Landroid/view/View;->setPivotY(F)V

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 52
    .line 53
    const/high16 v1, 0x3f800000    # 1.0f

    .line 54
    .line 55
    div-float/2addr v1, p1

    .line 56
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 57
    .line 58
    .line 59
    :cond_2
    invoke-super {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public t()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-wide/16 v2, 0xc8

    .line 22
    .line 23
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v4, Landroid/view/animation/LinearInterpolator;

    .line 28
    .line 29
    invoke-direct {v4}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v4}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 54
    .line 55
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 66
    .line 67
    invoke-virtual {v0}, Lv/VTexturePlayer;->r()V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_0

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->g()V

    .line 81
    .line 82
    .line 83
    :cond_0
    return-void
.end method

.method public v()V
    .locals 14

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-wide/16 v1, 0xc8

    .line 28
    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 34
    .line 35
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->h:Lcom/p1/mobile/putong/data/Media;

    .line 46
    .line 47
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 48
    .line 49
    if-eqz v1, :cond_4

    .line 50
    .line 51
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 52
    .line 53
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p()V

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->o:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 57
    .line 58
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->w(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 59
    .line 60
    .line 61
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 62
    .line 63
    const/4 v2, 0x0

    .line 64
    if-nez v1, :cond_1

    .line 65
    .line 66
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 67
    .line 68
    const-string v3, "raw"

    .line 69
    .line 70
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->clone()Lcom/p1/mobile/putong/data/Video;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/wel0;

    .line 81
    .line 82
    new-instance v3, Ll/vel0;

    .line 83
    .line 84
    iget-object v4, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v4}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-direct {v3, v4}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    iget-boolean v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->j:Z

    .line 94
    .line 95
    invoke-direct {v1, v3, v4, v2}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 96
    .line 97
    .line 98
    const-string v3, "video/mp4"

    .line 99
    .line 100
    iput-object v3, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 101
    .line 102
    new-instance v3, Lcom/p1/mobile/putong/data/Dimension;

    .line 103
    .line 104
    invoke-virtual {v1}, Ll/wel0;->m()[I

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-direct {v3, v4}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 109
    .line 110
    .line 111
    iput-object v3, v0, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 112
    .line 113
    iget-wide v3, v1, Ll/wel0;->b:J

    .line 114
    .line 115
    long-to-float v1, v3

    .line 116
    iput v1, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 117
    .line 118
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->getVideoDisplayRatio()F

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    iget-boolean v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->j:Z

    .line 123
    .line 124
    if-eqz v3, :cond_2

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatSquare()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    :goto_0
    move-object v8, v3

    .line 131
    goto :goto_1

    .line 132
    :cond_2
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    goto :goto_0

    .line 137
    :goto_1
    invoke-static {}, Ll/j4h;->e()Z

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 142
    .line 143
    .line 144
    move-result-wide v4

    .line 145
    iput-wide v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->k:J

    .line 146
    .line 147
    sget v12, Ll/c7y;->a:I

    .line 148
    .line 149
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 150
    .line 151
    invoke-virtual {v4, v3}, Lv/VTexturePlayer;->setIsInABGroup(Z)V

    .line 152
    .line 153
    .line 154
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 155
    .line 156
    new-instance v5, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;

    .line 157
    .line 158
    invoke-direct {v5, p0, v8, v12}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Ljava/lang/String;I)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4, v5}, Lv/VTexturePlayer;->setOnBufferListener(Lv/VTexturePlayer$c;)V

    .line 162
    .line 163
    .line 164
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 165
    .line 166
    new-instance v5, Ll/pi70;

    .line 167
    .line 168
    invoke-direct {v5}, Ll/pi70;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v4, v5}, Lv/VTexturePlayer;->setNetErrorListener(Ll/y20;)V

    .line 172
    .line 173
    .line 174
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 175
    .line 176
    new-instance v5, Ll/qi70;

    .line 177
    .line 178
    invoke-direct {v5, v8}, Ll/qi70;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-static {v5}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 186
    .line 187
    .line 188
    move-result-object v6

    .line 189
    invoke-virtual {v5, v6}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    iget v6, v0, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 194
    .line 195
    const/4 v13, 0x0

    .line 196
    invoke-virtual {v4, v13, v5, v6}, Lv/VTexturePlayer;->w(Lv/VTexturePlayer$a;Lrx/c;F)V

    .line 197
    .line 198
    .line 199
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 200
    .line 201
    invoke-static {v8}, Ll/uqb0;->d0(Ljava/lang/String;)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    float-to-double v6, v1

    .line 210
    const/4 v1, 0x1

    .line 211
    if-nez v3, :cond_3

    .line 212
    .line 213
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 214
    .line 215
    const-string v3, "http"

    .line 216
    .line 217
    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-eqz v0, :cond_3

    .line 222
    .line 223
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 224
    .line 225
    invoke-static {v0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-nez v0, :cond_3

    .line 230
    .line 231
    move v9, v1

    .line 232
    goto :goto_2

    .line 233
    :cond_3
    move v9, v2

    .line 234
    :goto_2
    sget v10, Lcom/p1/mobile/putong/feed/R$string;->U:I

    .line 235
    .line 236
    sget v11, Lcom/p1/mobile/putong/feed/R$string;->A4:I

    .line 237
    .line 238
    invoke-virtual/range {v4 .. v11}, Lv/VTexturePlayer;->s(Landroid/net/Uri;DLjava/lang/String;ZII)V

    .line 239
    .line 240
    .line 241
    invoke-static {}, Ll/cbl0;->n()Ll/cbl0;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    invoke-virtual {v0, v8}, Ll/cbl0;->q(Ljava/lang/String;)Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-virtual {v0, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    new-instance v2, Ll/ri70;

    .line 258
    .line 259
    invoke-direct {v2, p0, v8, v12}, Ll/ri70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Ljava/lang/String;I)V

    .line 260
    .line 261
    .line 262
    new-instance p0, Ll/si70;

    .line 263
    .line 264
    invoke-direct {p0}, Ll/si70;-><init>()V

    .line 265
    .line 266
    .line 267
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 272
    .line 273
    .line 274
    invoke-static {v13, v1}, Ll/lb1;->b(Landroid/media/AudioManager$OnAudioFocusChangeListener;I)Z

    .line 275
    .line 276
    .line 277
    :cond_4
    :goto_3
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->isAnonymousMoment()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_3

    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->h:Lcom/p1/mobile/putong/data/Media;

    .line 23
    .line 24
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 25
    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->music:Lcom/p1/mobile/putong/data/Music;

    .line 32
    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Music;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sget v1, Ll/tec0;->y5:I

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 62
    .line 63
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 67
    .line 68
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Music;->cover:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->e(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 74
    .line 75
    new-instance v1, Ll/ui70;

    .line 76
    .line 77
    invoke-direct {v1, p0, p1}, Ll/ui70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Lcom/p1/mobile/putong/data/Music;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->d(Ll/x20;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    :goto_0
    return-void
.end method

.method public y()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v2, 0x3f800000    # 1.0f

    .line 14
    .line 15
    cmpg-float v0, v0, v2

    .line 16
    .line 17
    if-gez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->f:Lv/VTexturePlayer;

    .line 20
    .line 21
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-wide/16 v2, 0xc8

    .line 30
    .line 31
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 36
    .line 37
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 48
    .line 49
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->r:F

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->s:I

    .line 60
    .line 61
    int-to-long v2, v2

    .line 62
    invoke-virtual {v0, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    new-instance v2, Landroid/view/animation/LinearInterpolator;

    .line 67
    .line 68
    invoke-direct {v2}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 76
    .line 77
    .line 78
    sget v0, Ll/hdc0;->i1:I

    .line 79
    .line 80
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->n(I)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 84
    .line 85
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-eqz v0, :cond_1

    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->g:Lv/VTexturePlayer$b;

    .line 92
    .line 93
    invoke-interface {v0}, Lv/VTexturePlayer$b;->y()V

    .line 94
    .line 95
    .line 96
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 97
    .line 98
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-eqz v0, :cond_2

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->m:Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/RotatingDiscView;->f()V

    .line 107
    .line 108
    .line 109
    :cond_2
    iput-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->p:Z

    .line 110
    .line 111
    return-void
.end method
