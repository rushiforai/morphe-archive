.class public Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewProfileOverlayView;
.super Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/bwb;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;-><init>(Landroid/content/Context;Ll/bwb;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public o()V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    const/4 v2, 0x0

    .line 12
    cmpl-float v3, v0, v2

    .line 13
    .line 14
    if-eqz v3, :cond_3

    .line 15
    .line 16
    cmpl-float v3, v1, v2

    .line 17
    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->getAspectRatio()Ll/q11;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    if-nez v3, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 29
    .line 30
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    cmpl-float v4, v4, v2

    .line 35
    .line 36
    if-eqz v4, :cond_2

    .line 37
    .line 38
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 39
    .line 40
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    cmpl-float v2, v4, v2

    .line 45
    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 49
    .line 50
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 55
    .line 56
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    div-float/2addr v2, v4

    .line 61
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    sub-float/2addr v2, v3

    .line 66
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    float-to-double v2, v2

    .line 71
    const-wide v4, 0x3f50624dd2f1a9fcL    # 0.001

    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    cmpg-double v2, v2, v4

    .line 77
    .line 78
    if-gez v2, :cond_2

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_2
    const/high16 v2, 0x3f000000    # 0.5f

    .line 82
    .line 83
    mul-float v3, v0, v2

    .line 84
    .line 85
    mul-float/2addr v1, v2

    .line 86
    const/high16 v4, 0x41800000    # 16.0f

    .line 87
    .line 88
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    int-to-float v4, v4

    .line 93
    sub-float/2addr v0, v4

    .line 94
    mul-float/2addr v0, v2

    .line 95
    const/high16 v2, 0x40a00000    # 5.0f

    .line 96
    .line 97
    mul-float/2addr v2, v0

    .line 98
    const/high16 v4, 0x40800000    # 4.0f

    .line 99
    .line 100
    div-float/2addr v2, v4

    .line 101
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 102
    .line 103
    sub-float v4, v3, v0

    .line 104
    .line 105
    sub-float v5, v1, v2

    .line 106
    .line 107
    add-float/2addr v3, v0

    .line 108
    add-float/2addr v1, v2

    .line 109
    invoke-virtual {p0, v4, v5, v3, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 110
    .line 111
    .line 112
    :cond_3
    :goto_0
    return-void
.end method
