.class public Ll/fsb0$e;
.super Lv/fresco/subscaleview/SubsamplingScaleImageView$f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fsb0;->E0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;Landroid/util/Pair;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lv/fresco/photodraweeview/PhotoDraweeView;

.field public final synthetic c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

.field public final synthetic d:Ll/fsb0;


# direct methods
.method public constructor <init>(Ll/fsb0;Lv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fsb0$e;->d:Ll/fsb0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fsb0$e;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/fsb0$e;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 6
    .line 7
    invoke-direct {p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$f;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Ll/fsb0$e;->a:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public b()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/fsb0$e;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-float v0, v0

    .line 10
    iget-object v1, p0, Ll/fsb0$e;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 11
    .line 12
    invoke-virtual {v1}, Lv/VDraweeView;->getOriginalWidth()F

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/high16 v2, 0x44700000    # 960.0f

    .line 17
    .line 18
    cmpl-float v1, v1, v2

    .line 19
    .line 20
    if-lez v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v1, p0, Ll/fsb0$e;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 24
    .line 25
    invoke-virtual {v1}, Lv/VDraweeView;->getOriginalWidth()F

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    :goto_0
    div-float/2addr v0, v2

    .line 30
    iget-object v1, p0, Ll/fsb0$e;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 31
    .line 32
    invoke-virtual {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->getMaxScale()F

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    cmpl-float v1, v0, v1

    .line 37
    .line 38
    if-lez v1, :cond_1

    .line 39
    .line 40
    iget-object v1, p0, Ll/fsb0$e;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setMaxScale(F)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v1, p0, Ll/fsb0$e;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setDoubleTapZoomScale(F)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ll/fsb0$e;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 51
    .line 52
    new-instance v2, Landroid/graphics/PointF;

    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    invoke-direct {v2, v3, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v0, v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->D0(FLandroid/graphics/PointF;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/fsb0$e;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 62
    .line 63
    const/high16 v1, 0x3f800000    # 1.0f

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 66
    .line 67
    .line 68
    const/4 v0, 0x0

    .line 69
    iput-boolean v0, p0, Ll/fsb0$e;->a:Z

    .line 70
    .line 71
    :cond_2
    return-void
.end method

.method public f(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsb0$e;->c:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 2
    .line 3
    const/4 p1, 0x4

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
