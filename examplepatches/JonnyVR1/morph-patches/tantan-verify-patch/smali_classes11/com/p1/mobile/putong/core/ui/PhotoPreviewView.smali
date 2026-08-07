.class public Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Lv/a$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$b;,
        Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;
    }
.end annotation


# static fields
.field public static h:I

.field public static i:I


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

.field public b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

.field public c:Landroid/view/View;

.field public d:Lv/VText;

.field public e:Landroid/widget/TextView;

.field public f:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$b;

.field public g:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;


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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->init()V

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->init()V

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->init()V

    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private getImageContainerHeight()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->i:I

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
    sget p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->h:I

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
    invoke-static {v0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 13
    .line 14
    new-instance v1, Ll/jj70;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/jj70;-><init>(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnViewTapListener(Ll/fp50;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 23
    .line 24
    new-instance v1, Ll/lj70;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/lj70;-><init>(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    new-instance v1, Ll/nj70;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/nj70;-><init>(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 43
    .line 44
    new-instance v1, Ll/pj70;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/pj70;-><init>(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->E(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->C(Landroid/view/View;FF)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->G(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->getImageContainerHeight()I

    move-result p0

    return p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->getImageContainerWidth()I

    move-result p0

    return p0
.end method


# virtual methods
.method public B(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/sj70;->b(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic C(Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->L()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic E(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic G(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->K()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final K()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->f:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$b;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->f:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$b;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$b;->a()Z

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

.method public final L()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->g:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->g:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public M()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ll/lde;->e()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public N(Lcom/p1/mobile/putong/data/Picture;Z)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setOriginalHeight(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    const/16 v1, 0x8

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    if-eqz p2, :cond_0

    .line 44
    .line 45
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p2, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 56
    .line 57
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 58
    .line 59
    new-instance v5, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$a;

    .line 60
    .line 61
    invoke-direct {v5, p0, v4}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$a;-><init>(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 62
    .line 63
    .line 64
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 65
    .line 66
    const-string v7, ""

    .line 67
    .line 68
    invoke-virtual/range {v2 .. v7}, Ll/fsb0;->D0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public O(ZZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->e:Landroid/widget/TextView;

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
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
    sput p1, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->h:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sput p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->i:I

    .line 15
    .line 16
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 19
    .line 20
    invoke-virtual {v0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

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
    invoke-static {}, Ll/bnl0;->w0()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    int-to-float v2, v2

    .line 36
    invoke-static {}, Ll/bnl0;->y0()I

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 47
    .line 48
    invoke-virtual {v0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {}, Ll/bnl0;->w0()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    int-to-float v2, v2

    .line 57
    mul-float/2addr v0, v2

    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 59
    .line 60
    invoke-virtual {v2}, Lv/VDraweeView;->getOriginalHeight()F

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    div-float/2addr v0, v2

    .line 65
    invoke-static {}, Ll/bnl0;->y0()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    int-to-float v2, v2

    .line 70
    div-float/2addr v2, v0

    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 72
    .line 73
    invoke-virtual {v0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    cmpl-float v3, v2, v3

    .line 78
    .line 79
    if-lez v3, :cond_0

    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 82
    .line 83
    invoke-virtual {v2}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    :cond_0
    const/4 v3, 0x1

    .line 88
    invoke-virtual {v0, v2, v1, v1, v3}, Lv/fresco/photodraweeview/PhotoDraweeView;->v(FFFZ)V

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 93
    .line 94
    const/high16 v2, 0x3f800000    # 1.0f

    .line 95
    .line 96
    invoke-virtual {v0, v2}, Lv/fresco/photodraweeview/PhotoDraweeView;->setScale(F)V

    .line 97
    .line 98
    .line 99
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 100
    .line 101
    invoke-static {v0}, Ll/fsb0;->d0(Lv/fresco/photodraweeview/PhotoDraweeView;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_3

    .line 106
    .line 107
    invoke-static {}, Ll/bnl0;->y0()I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    int-to-float v0, v0

    .line 112
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 113
    .line 114
    invoke-virtual {v2}, Lv/VDraweeView;->getOriginalWidth()F

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    const/high16 v3, 0x44700000    # 960.0f

    .line 119
    .line 120
    cmpl-float v2, v2, v3

    .line 121
    .line 122
    if-lez v2, :cond_2

    .line 123
    .line 124
    goto :goto_1

    .line 125
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 126
    .line 127
    invoke-virtual {v2}, Lv/VDraweeView;->getOriginalWidth()F

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    :goto_1
    div-float/2addr v0, v3

    .line 132
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 133
    .line 134
    new-instance v3, Landroid/graphics/PointF;

    .line 135
    .line 136
    invoke-direct {v3, v1, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v2, v0, v3}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->D0(FLandroid/graphics/PointF;)V

    .line 140
    .line 141
    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 143
    .line 144
    const/4 v0, 0x0

    .line 145
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 146
    .line 147
    .line 148
    :cond_3
    return-void
.end method

.method public setOnLongPressListener(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->f:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$b;

    .line 2
    .line 3
    return-void
.end method

.method public setOnTapListener(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->g:Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;

    .line 2
    .line 3
    return-void
.end method

.method public setOriginalHeight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPictureZoomAnimationKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setReplayClick(Landroid/view/View$OnClickListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setReplayVisibility(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->d:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setZoomAnimationKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
