.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/csl;


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

.field public e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VDraweeView;

.field public i:Landroid/graphics/drawable/GradientDrawable;

.field public j:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public k:Landroid/graphics/Bitmap;

.field public l:Landroid/graphics/Paint;

.field public m:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->l:Landroid/graphics/Paint;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->s0()V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->p0(Ljava/io/File;)V

    return-void
.end method

.method public static synthetic j0(Ll/sh3;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sh3;->h:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic k0(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->r0(Ljava/io/File;)V

    return-void
.end method

.method public static synthetic l0(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->q0(Ljava/io/File;)V

    return-void
.end method

.method public static bridge synthetic m0(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->m:I

    return p0
.end method

.method public static o0([IFF)Landroid/graphics/drawable/ShapeDrawable;
    .locals 11

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aput p1, v1, v2

    .line 7
    .line 8
    const/4 v3, 0x1

    .line 9
    aput p1, v1, v3

    .line 10
    .line 11
    const/4 v4, 0x2

    .line 12
    aput p1, v1, v4

    .line 13
    .line 14
    const/4 v5, 0x3

    .line 15
    aput p1, v1, v5

    .line 16
    .line 17
    const/4 v6, 0x4

    .line 18
    aput p1, v1, v6

    .line 19
    .line 20
    const/4 v7, 0x5

    .line 21
    aput p1, v1, v7

    .line 22
    .line 23
    const/4 v8, 0x6

    .line 24
    aput p1, v1, v8

    .line 25
    .line 26
    const/4 v9, 0x7

    .line 27
    aput p1, v1, v9

    .line 28
    .line 29
    new-instance v10, Landroid/graphics/RectF;

    .line 30
    .line 31
    invoke-direct {v10, p2, p2, p2, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 32
    .line 33
    .line 34
    sub-float/2addr p1, p2

    .line 35
    new-array p2, v0, [F

    .line 36
    .line 37
    aput p1, p2, v2

    .line 38
    .line 39
    aput p1, p2, v3

    .line 40
    .line 41
    aput p1, p2, v4

    .line 42
    .line 43
    aput p1, p2, v5

    .line 44
    .line 45
    aput p1, p2, v6

    .line 46
    .line 47
    aput p1, p2, v7

    .line 48
    .line 49
    aput p1, p2, v8

    .line 50
    .line 51
    aput p1, p2, v9

    .line 52
    .line 53
    new-instance p1, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 54
    .line 55
    invoke-direct {p1, v1, v10, p2}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 56
    .line 57
    .line 58
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$b;

    .line 59
    .line 60
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$b;-><init>([I)V

    .line 61
    .line 62
    .line 63
    new-instance p0, Landroid/graphics/drawable/ShapeDrawable;

    .line 64
    .line 65
    invoke-direct {p0, p1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/ShapeDrawable;->setShaderFactory(Landroid/graphics/drawable/ShapeDrawable$ShaderFactory;)V

    .line 69
    .line 70
    .line 71
    return-object p0
.end method

.method private setViewWidth(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->l:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/high16 v1, 0x41500000    # 13.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-float v1, v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->l:Landroid/graphics/Paint;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    float-to-double v0, p1

    .line 20
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    const/high16 p1, 0x42840000    # 66.0f

    .line 25
    .line 26
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    int-to-double v2, p1

    .line 31
    add-double/2addr v0, v2

    .line 32
    double-to-int p1, v0

    .line 33
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->m:I

    .line 34
    .line 35
    const/high16 v0, 0x43160000    # 150.0f

    .line 36
    .line 37
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-ge p1, v1, :cond_0

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->m:I

    .line 48
    .line 49
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->m:I

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    new-array v0, v0, [Landroid/view/View;

    .line 53
    .line 54
    const/4 v1, 0x0

    .line 55
    aput-object p0, v0, v1

    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method


# virtual methods
.method public B()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->h:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public getCalculateParams()Landroid/view/ViewGroup$MarginLayoutParams;
    .locals 2

    .line 1
    new-instance v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->m:I

    .line 4
    .line 5
    sget v1, Ll/bnl0;->f:I

    .line 6
    .line 7
    invoke-direct {v0, p0, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/bnl0;->y0()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 15
    .line 16
    const/high16 p0, 0x41000000    # 8.0f

    .line 17
    .line 18
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    iput p0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 23
    .line 24
    return-object v0
.end method

.method public final n0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/isp;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->k:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->j:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/ps40;->e(Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->n0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic p0(Ljava/io/File;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ps40;->h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->k:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    return-void
.end method

.method public final synthetic q0(Ljava/io/File;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/ps40;->h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->k:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    return-void
.end method

.method public final synthetic r0(Ljava/io/File;)V
    .locals 1

    .line 1
    new-instance v0, Ll/hsp;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/hsp;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;Ljava/io/File;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic s0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final t0(Ll/sh3;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/sh3;->m:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/ps40;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ll/esp;

    .line 18
    .line 19
    invoke-direct {p1, p0, v0}, Ll/esp;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;Ljava/io/File;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object p1, p1, Ll/sh3;->m:Ljava/lang/String;

    .line 27
    .line 28
    new-instance v1, Ll/fsp;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/fsp;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;)V

    .line 31
    .line 32
    .line 33
    new-instance v2, Ll/gsp;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/gsp;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0, v1, v2}, Ll/ps40;->f(Ljava/lang/String;Ljava/io/File;Ll/y20;Ll/x20;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->j:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 43
    .line 44
    return-void
.end method

.method public z(Ll/sh3;)V
    .locals 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/sh3;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->setViewWidth(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 7
    .line 8
    sget v1, Ll/qa00;->A:I

    .line 9
    .line 10
    iget-object v2, p1, Ll/sh3;->e:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v3, p1, Ll/sh3;->g:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v4, p1, Ll/sh3;->f:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0, v1, v2, v3, v4}, Ll/biv;->g(Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Ll/dsp;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Ll/dsp;-><init>(Ll/sh3;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->f:Lv/VText;

    .line 28
    .line 29
    iget-object v1, p1, Ll/sh3;->c:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->g:Lv/VText;

    .line 35
    .line 36
    iget-object v1, p1, Ll/sh3;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 42
    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 46
    .line 47
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 51
    .line 52
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 58
    .line 59
    sget v1, Ll/qa00;->i:I

    .line 60
    .line 61
    int-to-float v1, v1

    .line 62
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 63
    .line 64
    .line 65
    :cond_0
    iget-object v0, p1, Ll/sh3;->j:Ljava/util/List;

    .line 66
    .line 67
    const/4 v1, 0x2

    .line 68
    const/4 v2, 0x1

    .line 69
    const/4 v3, 0x0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-object v4, p1, Ll/sh3;->j:Ljava/util/List;

    .line 77
    .line 78
    if-ne v0, v2, :cond_1

    .line 79
    .line 80
    new-array v0, v1, [I

    .line 81
    .line 82
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    check-cast v4, Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    aput v4, v0, v3

    .line 93
    .line 94
    iget-object v4, p1, Ll/sh3;->j:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    check-cast v4, Ljava/lang/String;

    .line 101
    .line 102
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    aput v4, v0, v2

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    new-array v0, v0, [I

    .line 114
    .line 115
    move v4, v3

    .line 116
    :goto_0
    iget-object v5, p1, Ll/sh3;->j:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    if-ge v4, v5, :cond_3

    .line 123
    .line 124
    iget-object v5, p1, Ll/sh3;->j:Ljava/util/List;

    .line 125
    .line 126
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v5

    .line 130
    check-cast v5, Ljava/lang/String;

    .line 131
    .line 132
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v5

    .line 136
    aput v5, v0, v4

    .line 137
    .line 138
    add-int/lit8 v4, v4, 0x1

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_2
    new-array v0, v1, [I

    .line 142
    .line 143
    const/high16 v4, -0x1000000

    .line 144
    .line 145
    aput v4, v0, v3

    .line 146
    .line 147
    aput v4, v0, v2

    .line 148
    .line 149
    :cond_3
    :goto_1
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 150
    .line 151
    invoke-virtual {v4, v0}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p1, Ll/sh3;->n:Ljava/util/List;

    .line 155
    .line 156
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    if-nez v4, :cond_4

    .line 161
    .line 162
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    if-lt v4, v1, :cond_5

    .line 167
    .line 168
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    check-cast v4, Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v4}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    check-cast v0, Ljava/lang/String;

    .line 183
    .line 184
    invoke-static {v0}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    filled-new-array {v4, v0}, [I

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    sget v4, Ll/qa00;->i:I

    .line 193
    .line 194
    int-to-float v4, v4

    .line 195
    sget v5, Ll/qa00;->a:I

    .line 196
    .line 197
    int-to-float v5, v5

    .line 198
    invoke-static {v0, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->o0([IFF)Landroid/graphics/drawable/ShapeDrawable;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 203
    .line 204
    new-array v1, v1, [Landroid/graphics/drawable/Drawable;

    .line 205
    .line 206
    aput-object v4, v1, v3

    .line 207
    .line 208
    aput-object v0, v1, v2

    .line 209
    .line 210
    new-instance v0, Landroid/graphics/drawable/LayerDrawable;

    .line 211
    .line 212
    invoke-direct {v0, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 213
    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 216
    .line 217
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 218
    .line 219
    .line 220
    goto :goto_2

    .line 221
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->d:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;

    .line 222
    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->i:Landroid/graphics/drawable/GradientDrawable;

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 226
    .line 227
    .line 228
    :cond_5
    :goto_2
    iget-object v0, p1, Ll/sh3;->m:Ljava/lang/String;

    .line 229
    .line 230
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    if-nez v0, :cond_6

    .line 235
    .line 236
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->t0(Ll/sh3;)V

    .line 237
    .line 238
    .line 239
    :cond_6
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 240
    .line 241
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    check-cast v0, Ll/hiv;

    .line 246
    .line 247
    iget p1, p1, Ll/sh3;->d:I

    .line 248
    .line 249
    int-to-long v1, p1

    .line 250
    invoke-virtual {v0, v1, v2}, Ll/hiv;->v(J)Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    if-eqz p1, :cond_7

    .line 255
    .line 256
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 257
    .line 258
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-nez v0, :cond_7

    .line 263
    .line 264
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->h:Lv/VDraweeView;

    .line 265
    .line 266
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 267
    .line 268
    const/high16 p1, 0x41600000    # 14.0f

    .line 269
    .line 270
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    mul-int/lit8 v4, v0, 0x3

    .line 275
    .line 276
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 277
    .line 278
    .line 279
    move-result v5

    .line 280
    new-instance v9, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;

    .line 281
    .line 282
    invoke-direct {v9, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;)V

    .line 283
    .line 284
    .line 285
    const-string v1, "context_livingAct"

    .line 286
    .line 287
    const/4 v6, 0x0

    .line 288
    const/4 v7, 0x0

    .line 289
    const/4 v8, 0x0

    .line 290
    invoke-static/range {v1 .. v9}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 291
    .line 292
    .line 293
    return-void

    .line 294
    :cond_7
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->m:I

    .line 295
    .line 296
    const/high16 v0, 0x42840000    # 66.0f

    .line 297
    .line 298
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    sub-int/2addr p1, v0

    .line 303
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/IntlVoiceDanmakuItem;->f:Lv/VText;

    .line 304
    .line 305
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 306
    .line 307
    .line 308
    return-void
.end method
