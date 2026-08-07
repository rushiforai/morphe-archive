.class public Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bytedance/realx/video/RendererCommon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "VideoLayoutMeasure"
.end annotation


# instance fields
.field private scalingTypeMatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

.field private scalingTypeMismatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/bytedance/realx/video/RendererCommon$ScalingType;->SCALE_ASPECT_BALANCED:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->scalingTypeMatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->scalingTypeMismatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public measure(IIII)Landroid/graphics/Point;
    .locals 6

    .line 1
    const v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    invoke-static {v0, p1}, Landroid/view/View;->getDefaultSize(II)I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    invoke-static {v0, p2}, Landroid/view/View;->getDefaultSize(II)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz p3, :cond_6

    .line 13
    .line 14
    if-eqz p4, :cond_6

    .line 15
    .line 16
    if-eqz v1, :cond_6

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    goto :goto_2

    .line 21
    :cond_0
    int-to-float p3, p3

    .line 22
    int-to-float p4, p4

    .line 23
    div-float/2addr p3, p4

    .line 24
    int-to-float p4, v1

    .line 25
    int-to-float v2, v0

    .line 26
    div-float/2addr p4, v2

    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    cmpl-float v3, p3, v2

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    const/4 v5, 0x1

    .line 33
    if-lez v3, :cond_1

    .line 34
    .line 35
    move v3, v5

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move v3, v4

    .line 38
    :goto_0
    cmpl-float p4, p4, v2

    .line 39
    .line 40
    if-lez p4, :cond_2

    .line 41
    .line 42
    move v4, v5

    .line 43
    :cond_2
    if-ne v3, v4, :cond_3

    .line 44
    .line 45
    iget-object p0, p0, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->scalingTypeMatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    iget-object p0, p0, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->scalingTypeMismatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 49
    .line 50
    :goto_1
    invoke-static {p0, p3, v1, v0}, Lcom/bytedance/realx/video/RendererCommon;->getDisplaySize(Lcom/bytedance/realx/video/RendererCommon$ScalingType;FII)Landroid/graphics/Point;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const/high16 p3, 0x40000000    # 2.0f

    .line 59
    .line 60
    if-ne p1, p3, :cond_4

    .line 61
    .line 62
    iput v1, p0, Landroid/graphics/Point;->x:I

    .line 63
    .line 64
    :cond_4
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-ne p1, p3, :cond_5

    .line 69
    .line 70
    iput v0, p0, Landroid/graphics/Point;->y:I

    .line 71
    .line 72
    :cond_5
    return-object p0

    .line 73
    :cond_6
    :goto_2
    new-instance p0, Landroid/graphics/Point;

    .line 74
    .line 75
    invoke-direct {p0, v1, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 76
    .line 77
    .line 78
    return-object p0
.end method

.method public setScalingType(Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->scalingTypeMatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->scalingTypeMismatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 4
    .line 5
    return-void
.end method

.method public setScalingType(Lcom/bytedance/realx/video/RendererCommon$ScalingType;Lcom/bytedance/realx/video/RendererCommon$ScalingType;)V
    .locals 0

    .line 6
    iput-object p1, p0, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->scalingTypeMatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    .line 7
    iput-object p2, p0, Lcom/bytedance/realx/video/RendererCommon$VideoLayoutMeasure;->scalingTypeMismatchOrientation:Lcom/bytedance/realx/video/RendererCommon$ScalingType;

    return-void
.end method
