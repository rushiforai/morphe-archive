.class Lcom/p1/mobile/android/ui/cropiwa/CropIwaNewUIWithRatioView;
.super Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation


# virtual methods
.method public o()V
    .locals 8

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
    if-eqz v3, :cond_3

    .line 26
    .line 27
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    cmpl-float v4, v4, v2

    .line 32
    .line 33
    if-nez v4, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 37
    .line 38
    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    .line 39
    .line 40
    .line 41
    move-result v4

    .line 42
    cmpl-float v4, v4, v2

    .line 43
    .line 44
    if-eqz v4, :cond_2

    .line 45
    .line 46
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 47
    .line 48
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    cmpl-float v2, v4, v2

    .line 53
    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 57
    .line 58
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    iget-object v4, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 63
    .line 64
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    div-float/2addr v2, v4

    .line 69
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    sub-float/2addr v2, v4

    .line 74
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    float-to-double v4, v2

    .line 79
    const-wide v6, 0x3f50624dd2f1a9fcL    # 0.001

    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    cmpg-double v2, v4, v6

    .line 85
    .line 86
    if-gez v2, :cond_2

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->g:Ll/bwb;

    .line 90
    .line 91
    invoke-virtual {v2}, Ll/bwb;->p()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    int-to-float v2, v2

    .line 96
    const/high16 v4, 0x3f000000    # 0.5f

    .line 97
    .line 98
    mul-float/2addr v1, v4

    .line 99
    mul-float/2addr v0, v4

    .line 100
    mul-float/2addr v2, v4

    .line 101
    invoke-virtual {v3}, Ll/q11;->b()F

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    div-float v3, v2, v3

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/android/ui/cropiwa/CropIwaOverlayView;->e:Landroid/graphics/RectF;

    .line 108
    .line 109
    sub-float v4, v0, v2

    .line 110
    .line 111
    sub-float v5, v1, v3

    .line 112
    .line 113
    add-float/2addr v0, v2

    .line 114
    add-float/2addr v1, v3

    .line 115
    invoke-virtual {p0, v4, v5, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 116
    .line 117
    .line 118
    :cond_3
    :goto_0
    return-void
.end method
