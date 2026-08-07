.class public Ll/fsb0$i;
.super Lv/fresco/subscaleview/SubsamplingScaleImageView$f;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fsb0;->o0(Lv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:I

.field public final synthetic c:Lv/fresco/photodraweeview/PhotoDraweeView;

.field public final synthetic d:Lv/fresco/subscaleview/SubsamplingScaleImageView;


# direct methods
.method public constructor <init>(ILv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;)V
    .locals 0

    .line 1
    iput p1, p0, Ll/fsb0$i;->b:I

    .line 2
    .line 3
    iput-object p2, p0, Ll/fsb0$i;->c:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/fsb0$i;->d:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 6
    .line 7
    invoke-direct {p0}, Lv/fresco/subscaleview/SubsamplingScaleImageView$f;-><init>()V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Ll/fsb0$i;->a:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public b()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/fsb0$i;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget v0, p0, Ll/fsb0$i;->b:I

    .line 6
    .line 7
    int-to-float v0, v0

    .line 8
    iget-object v1, p0, Ll/fsb0$i;->c:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 9
    .line 10
    invoke-virtual {v1}, Lv/VDraweeView;->getOriginalWidth()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/high16 v2, 0x44700000    # 960.0f

    .line 15
    .line 16
    cmpl-float v1, v1, v2

    .line 17
    .line 18
    if-lez v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v1, p0, Ll/fsb0$i;->c:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 22
    .line 23
    invoke-virtual {v1}, Lv/VDraweeView;->getOriginalWidth()F

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    :goto_0
    div-float/2addr v0, v2

    .line 28
    iget-object v1, p0, Ll/fsb0$i;->d:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 29
    .line 30
    invoke-virtual {v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->getMaxScale()F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    cmpl-float v1, v0, v1

    .line 35
    .line 36
    if-lez v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Ll/fsb0$i;->d:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setMaxScale(F)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v1, p0, Ll/fsb0$i;->d:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setDoubleTapZoomScale(F)V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/fsb0$i;->d:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 49
    .line 50
    new-instance v2, Landroid/graphics/PointF;

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    invoke-direct {v2, v3, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1, v0, v2}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->D0(FLandroid/graphics/PointF;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/fsb0$i;->d:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 60
    .line 61
    const/high16 v1, 0x3f800000    # 1.0f

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 64
    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    iput-boolean v0, p0, Ll/fsb0$i;->a:Z

    .line 68
    .line 69
    :cond_2
    return-void
.end method

.method public f(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsb0$i;->d:Lv/fresco/subscaleview/SubsamplingScaleImageView;

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
