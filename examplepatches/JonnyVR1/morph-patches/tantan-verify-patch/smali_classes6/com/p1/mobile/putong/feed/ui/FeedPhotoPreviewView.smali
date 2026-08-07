.class public Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Lv/a$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;,
        Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;
    }
.end annotation


# static fields
.field public static e:I

.field public static f:I


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

.field public b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

.field public c:Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;

.field public d:Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

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

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->init()V

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

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->init()V

    return-void
.end method

.method private synthetic C(Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic E(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic G(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private K()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->c:Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->c:Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;->a()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method private L()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->d:Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->d:Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private getImageContainerHeight()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->f:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    invoke-static {}, Ll/bnl0;->w0()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private getImageContainerWidth()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->e:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private init()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 13
    .line 14
    new-instance v1, Ll/aoh;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/aoh;-><init>(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnViewTapListener(Ll/fp50;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 23
    .line 24
    new-instance v1, Ll/boh;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/boh;-><init>(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    new-instance v1, Ll/coh;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/coh;-><init>(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 43
    .line 44
    new-instance v1, Ll/doh;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/doh;-><init>(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->C(Landroid/view/View;FF)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->G(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->E(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerHeight()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerWidth()I

    move-result p0

    return p0
.end method


# virtual methods
.method public B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/eoh;->b(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public M(Lcom/p1/mobile/putong/data/Picture;Z)V
    .locals 7

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 12
    .line 13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 16
    .line 17
    int-to-float v0, v0

    .line 18
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setOriginalHeight(F)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    const/16 v0, 0x8

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 46
    .line 47
    new-instance v4, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$a;

    .line 48
    .line 49
    invoke-direct {v4, p0, v3}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$a;-><init>(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 50
    .line 51
    .line 52
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 53
    .line 54
    const-string v6, ""

    .line 55
    .line 56
    invoke-virtual/range {v1 .. v6}, Ll/fsb0;->D0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VDraweeView;->k()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VDraweeView;->getZoomAnimationAttacher()Lv/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lv/a;->H(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    sput p1, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->e:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sput p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->f:I

    .line 15
    .line 16
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 8
    .line 9
    invoke-virtual {v1}, Lv/VDraweeView;->getOriginalWidth()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    cmpl-float v0, v0, v1

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 19
    .line 20
    invoke-virtual {v0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 25
    .line 26
    invoke-virtual {v2}, Lv/VDraweeView;->getOriginalWidth()F

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    div-float/2addr v0, v2

    .line 31
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerHeight()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-float v2, v2

    .line 36
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerWidth()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    int-to-float v3, v3

    .line 41
    div-float/2addr v2, v3

    .line 42
    cmpl-float v0, v0, v2

    .line 43
    .line 44
    if-lez v0, :cond_1

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerWidth()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerHeight()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    invoke-static {v0, v2}, Ll/fsb0;->b0(II)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 61
    .line 62
    invoke-virtual {v0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerHeight()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    int-to-float v2, v2

    .line 71
    mul-float/2addr v0, v2

    .line 72
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 73
    .line 74
    invoke-virtual {v2}, Lv/VDraweeView;->getOriginalHeight()F

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    div-float/2addr v0, v2

    .line 79
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerWidth()I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    int-to-float v2, v2

    .line 84
    div-float/2addr v2, v0

    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 86
    .line 87
    invoke-virtual {v0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    cmpl-float v3, v2, v3

    .line 92
    .line 93
    if-lez v3, :cond_0

    .line 94
    .line 95
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 96
    .line 97
    invoke-virtual {v2}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    :cond_0
    const/4 v3, 0x1

    .line 102
    invoke-virtual {v0, v2, v1, v1, v3}, Lv/fresco/photodraweeview/PhotoDraweeView;->v(FFFZ)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 107
    .line 108
    const/high16 v2, 0x3f800000    # 1.0f

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Lv/fresco/photodraweeview/PhotoDraweeView;->setScale(F)V

    .line 111
    .line 112
    .line 113
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 114
    .line 115
    invoke-virtual {v0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 120
    .line 121
    invoke-virtual {v2}, Lv/VDraweeView;->getOriginalHeight()F

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    invoke-static {v0, v2}, Ll/ksg;->p0(FF)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_3

    .line 130
    .line 131
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->getImageContainerWidth()I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    int-to-float v0, v0

    .line 136
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 137
    .line 138
    invoke-virtual {v2}, Lv/VDraweeView;->getOriginalWidth()F

    .line 139
    .line 140
    .line 141
    move-result v2

    .line 142
    const/high16 v3, 0x44700000    # 960.0f

    .line 143
    .line 144
    cmpl-float v2, v2, v3

    .line 145
    .line 146
    if-lez v2, :cond_2

    .line 147
    .line 148
    goto :goto_1

    .line 149
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 150
    .line 151
    invoke-virtual {v2}, Lv/VDraweeView;->getOriginalWidth()F

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    :goto_1
    div-float/2addr v0, v3

    .line 156
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 157
    .line 158
    new-instance v3, Landroid/graphics/PointF;

    .line 159
    .line 160
    invoke-direct {v3, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v2, v0, v3}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->D0(FLandroid/graphics/PointF;)V

    .line 164
    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 167
    .line 168
    const/4 v0, 0x0

    .line 169
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 170
    .line 171
    .line 172
    :cond_3
    return-void
.end method

.method public setOnLongPressListener(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->c:Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$b;

    .line 2
    .line 3
    return-void
.end method

.method public setOnTapListener(Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->d:Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView$c;

    .line 2
    .line 3
    return-void
.end method

.method public setOriginalHeight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setOriginalHeight(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOriginalWidth(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPicture(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->M(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setZoomAnimationKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/FeedPhotoPreviewView;->a:Lcom/p1/mobile/putong/feed/newui/preview/gesture/FeedPhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
