.class public Ll/ko20;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public final e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

.field public f:Ll/ie80;

.field public g:Ll/ie80;

.field public h:Z

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ko20;->h:Z

    .line 6
    .line 7
    iput-object p1, p0, Ll/ko20;->e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic q(Ll/ko20;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ko20;->y()V

    return-void
.end method

.method private s(Landroid/view/View;Z)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, 0x0

    .line 5
    const-string v4, "translationY"

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    neg-int p2, p2

    .line 14
    int-to-float p2, p2

    .line 15
    new-array v2, v2, [F

    .line 16
    .line 17
    aput v3, v2, v1

    .line 18
    .line 19
    aput p2, v2, v0

    .line 20
    .line 21
    invoke-static {p1, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    int-to-float p2, p2

    .line 31
    new-array v2, v2, [F

    .line 32
    .line 33
    aput v3, v2, v1

    .line 34
    .line 35
    aput p2, v2, v0

    .line 36
    .line 37
    invoke-static {p1, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    :goto_0
    const-wide/16 v0, 0xfa

    .line 42
    .line 43
    invoke-virtual {p2, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/ko20$c;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1}, Ll/ko20$c;-><init>(Ll/ko20;Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/animation/ObjectAnimator;->start()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private z(Landroid/view/View;Z)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x2

    .line 4
    const/4 v3, 0x0

    .line 5
    const-string v4, "translationY"

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    neg-int p2, p2

    .line 14
    int-to-float p2, p2

    .line 15
    new-array v2, v2, [F

    .line 16
    .line 17
    aput p2, v2, v1

    .line 18
    .line 19
    aput v3, v2, v0

    .line 20
    .line 21
    invoke-static {p1, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    int-to-float p2, p2

    .line 31
    new-array v2, v2, [F

    .line 32
    .line 33
    aput p2, v2, v1

    .line 34
    .line 35
    aput v3, v2, v0

    .line 36
    .line 37
    invoke-static {p1, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    :goto_0
    const-wide/16 v0, 0xfa

    .line 42
    .line 43
    invoke-virtual {p2, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/ko20$b;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1}, Ll/ko20$b;-><init>(Ll/ko20;Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p2}, Landroid/animation/ObjectAnimator;->start()V

    .line 55
    .line 56
    .line 57
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ko20;->e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    instance-of p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    move-object p2, p0

    .line 17
    check-cast p2, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->setPlayer(Ll/ie80;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ko20;->e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->x:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 10
    .line 11
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Video;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    move-object v0, p2

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/ko20;->r(Lcom/p1/mobile/putong/data/Video;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    instance-of v0, p2, Lcom/p1/mobile/putong/data/Picture;

    .line 24
    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Ll/ko20;->t(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    :goto_0
    invoke-virtual {p0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    return-object p2
.end method

.method public final r(Lcom/p1/mobile/putong/data/Video;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ko20;->w(Lcom/p1/mobile/putong/data/Video;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;

    .line 9
    .line 10
    iget-object v1, p0, Ll/ko20;->e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->setProgressBarsEnabled(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ll/ko20;->u(Ljava/lang/String;)Ll/ie80;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "moments"

    .line 28
    .line 29
    invoke-interface {v1, v2}, Ll/ie80;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p0, v1}, Ll/ko20;->u(Ljava/lang/String;)Ll/ie80;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->setPlayer(Ll/ie80;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ll/bnl0;->y0()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-static {}, Ll/bnl0;->w0()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-static {}, Ll/bnl0;->F0()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    sub-int/2addr v2, v3

    .line 57
    const/high16 v3, 0x43520000    # 210.0f

    .line 58
    .line 59
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    sub-int/2addr v2, v3

    .line 64
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->t(II)V

    .line 65
    .line 66
    .line 67
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-nez v1, :cond_1

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {v1}, Ll/uqb0;->S0(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    new-instance v1, Ll/ko20$a;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/ko20$a;-><init>(Ll/ko20;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->r(Ll/ie80$b;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0, p1, v0}, Ll/ko20;->v(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V

    .line 99
    .line 100
    .line 101
    return-object v0
.end method

.method public final t(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;
    .locals 3

    .line 1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 14
    .line 15
    invoke-static {p1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    iget p1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 19
    .line 20
    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 21
    .line 22
    filled-new-array {p1, v0}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;

    .line 27
    .line 28
    iget-object v2, p0, Ll/ko20;->e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 36
    .line 37
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 38
    .line 39
    invoke-direct {v2, p1}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 40
    .line 41
    .line 42
    iput-object v2, p2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 43
    .line 44
    invoke-virtual {v0, p2, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->O(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 45
    .line 46
    .line 47
    new-instance p1, Ll/jo20;

    .line 48
    .line 49
    invoke-direct {p1, p0}, Ll/jo20;-><init>(Ll/ko20;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->setOnTapListener(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$d;)V

    .line 53
    .line 54
    .line 55
    return-object v0
.end method

.method public u(Ljava/lang/String;)Ll/ie80;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "http"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/ko20;->f:Ll/ie80;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ll/re80;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/re80;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/ko20;->f:Ll/ie80;

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Ll/ko20;->f:Ll/ie80;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p1, p0, Ll/ko20;->g:Ll/ie80;

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    new-instance p1, Ll/ye80;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/ye80;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/ko20;->g:Ll/ie80;

    .line 39
    .line 40
    :cond_2
    iget-object p0, p0, Ll/ko20;->g:Ll/ie80;

    .line 41
    .line 42
    return-object p0
.end method

.method public final v(Lcom/p1/mobile/putong/data/Video;Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;)V
    .locals 7

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 7
    .line 8
    iget p1, p1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 9
    .line 10
    invoke-static {}, Ll/bnl0;->y0()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {}, Ll/bnl0;->w0()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/high16 v3, 0x42dc0000    # 110.0f

    .line 19
    .line 20
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    sub-int/2addr v2, v3

    .line 25
    int-to-float v0, v0

    .line 26
    int-to-float p1, p1

    .line 27
    div-float v3, v0, p1

    .line 28
    .line 29
    int-to-float v4, v1

    .line 30
    int-to-float v5, v2

    .line 31
    div-float v6, v4, v5

    .line 32
    .line 33
    cmpl-float v3, v3, v6

    .line 34
    .line 35
    if-ltz v3, :cond_1

    .line 36
    .line 37
    iput v1, p0, Ll/ko20;->i:I

    .line 38
    .line 39
    div-float/2addr v4, v0

    .line 40
    mul-float/2addr p1, v4

    .line 41
    float-to-int p1, p1

    .line 42
    iput p1, p0, Ll/ko20;->j:I

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iput v2, p0, Ll/ko20;->j:I

    .line 46
    .line 47
    div-float/2addr v5, p1

    .line 48
    mul-float/2addr v0, v5

    .line 49
    float-to-int p1, v0

    .line 50
    iput p1, p0, Ll/ko20;->i:I

    .line 51
    .line 52
    :goto_0
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 53
    .line 54
    iget v0, p0, Ll/ko20;->i:I

    .line 55
    .line 56
    iget p0, p0, Ll/ko20;->j:I

    .line 57
    .line 58
    invoke-direct {p1, v0, p0}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    new-instance p0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 65
    .line 66
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(Landroid/widget/RelativeLayout$LayoutParams;)V

    .line 67
    .line 68
    .line 69
    const/16 p1, 0xd

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 72
    .line 73
    .line 74
    iget-object p1, p2, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PlayerView;->a:Landroid/view/TextureView;

    .line 75
    .line 76
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/data/Video;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 3
    .line 4
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    .line 7
    :try_start_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v1, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->init(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    new-instance v0, Lcom/p1/mobile/putong/data/Dimension;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    filled-new-array {v2, v3}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getRotation()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    const/16 v2, 0x5a

    .line 43
    .line 44
    if-eq v0, v2, :cond_0

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getRotation()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    const/16 v2, 0x10e

    .line 51
    .line 52
    if-ne v0, v2, :cond_1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catchall_0
    move-exception v0

    .line 56
    goto :goto_1

    .line 57
    :cond_0
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 58
    .line 59
    iget v2, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 60
    .line 61
    iget v3, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 62
    .line 63
    iput v3, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 64
    .line 65
    iput v2, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    .line 67
    :cond_1
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :catchall_1
    move-exception v1

    .line 72
    move-object v4, v1

    .line 73
    move-object v1, v0

    .line 74
    move-object v0, v4

    .line 75
    :goto_1
    :try_start_2
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {v2, v0}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/Throwable;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 86
    .line 87
    if-nez v0, :cond_2

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ll/ko20;->x(Lcom/p1/mobile/putong/data/Video;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 90
    .line 91
    .line 92
    goto :goto_2

    .line 93
    :catchall_2
    move-exception p0

    .line 94
    goto :goto_3

    .line 95
    :cond_2
    :goto_2
    if-eqz v1, :cond_3

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 98
    .line 99
    .line 100
    :cond_3
    return-void

    .line 101
    :goto_3
    if-eqz v1, :cond_4

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 104
    .line 105
    .line 106
    :cond_4
    throw p0
.end method

.method public final x(Lcom/p1/mobile/putong/data/Video;)V
    .locals 4

    .line 1
    new-instance p0, Landroid/media/MediaMetadataRetriever;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const/16 v0, 0x12

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/16 v1, 0x13

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/16 v2, 0x18

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_0
    const/4 v2, 0x0

    .line 55
    :goto_0
    new-instance v3, Lcom/p1/mobile/putong/data/Dimension;

    .line 56
    .line 57
    filled-new-array {v0, v1}, [I

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-direct {v3, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 62
    .line 63
    .line 64
    iput-object v3, p1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 65
    .line 66
    const/16 p1, 0x5a

    .line 67
    .line 68
    if-eq v2, p1, :cond_1

    .line 69
    .line 70
    const/16 p1, 0x10e

    .line 71
    .line 72
    if-ne v2, p1, :cond_2

    .line 73
    .line 74
    :cond_1
    iget p1, v3, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 75
    .line 76
    iget v0, v3, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 77
    .line 78
    iput v0, v3, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 79
    .line 80
    iput p1, v3, Lcom/p1/mobile/putong/data/Dimension;->height:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    .line 82
    :cond_2
    :try_start_1
    invoke-virtual {p0}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :goto_1
    :try_start_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0, p1}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 94
    .line 95
    .line 96
    :try_start_3
    invoke-virtual {p0}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 97
    .line 98
    .line 99
    :catch_0
    return-void

    .line 100
    :catchall_1
    move-exception p1

    .line 101
    :try_start_4
    invoke-virtual {p0}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 102
    .line 103
    .line 104
    :catch_1
    throw p1
.end method

.method public final synthetic y()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/ko20;->h:Z

    .line 2
    .line 3
    iget-object v1, p0, Ll/ko20;->e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->g:Landroid/widget/LinearLayout;

    .line 10
    .line 11
    invoke-direct {p0, v0, v3}, Ll/ko20;->s(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/ko20;->e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->d:Lv/VFrame;

    .line 17
    .line 18
    invoke-direct {p0, v0, v2}, Ll/ko20;->s(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iput-boolean v2, p0, Ll/ko20;->h:Z

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->g:Landroid/widget/LinearLayout;

    .line 25
    .line 26
    invoke-direct {p0, v0, v3}, Ll/ko20;->z(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/ko20;->e:Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/MediaPreviewAct;->d:Lv/VFrame;

    .line 32
    .line 33
    invoke-direct {p0, v0, v2}, Ll/ko20;->z(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iput-boolean v3, p0, Ll/ko20;->h:Z

    .line 37
    .line 38
    return-void
.end method
