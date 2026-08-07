.class public Lio/agora/rtc2/video/CoordinatesTransform;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static calculateFocusArea(FFF)Landroid/graphics/Rect;
    .locals 5

    .line 1
    const/high16 v0, 0x43960000    # 300.0f

    .line 2
    .line 3
    mul-float/2addr p2, v0

    .line 4
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 5
    .line 6
    .line 7
    move-result-object p2

    .line 8
    invoke-virtual {p2}, Ljava/lang/Float;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    const/high16 v0, 0x44fa0000    # 2000.0f

    .line 13
    .line 14
    mul-float/2addr p0, v0

    .line 15
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 16
    .line 17
    sub-float/2addr p0, v1

    .line 18
    float-to-int p0, p0

    .line 19
    mul-float/2addr p1, v0

    .line 20
    sub-float/2addr p1, v1

    .line 21
    float-to-int p1, p1

    .line 22
    div-int/lit8 p2, p2, 0x2

    .line 23
    .line 24
    new-instance v0, Landroid/graphics/RectF;

    .line 25
    .line 26
    sub-int v1, p0, p2

    .line 27
    .line 28
    const/16 v2, -0x3e8

    .line 29
    .line 30
    const/16 v3, 0x3e8

    .line 31
    .line 32
    invoke-static {v1, v2, v3}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(III)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    int-to-float v1, v1

    .line 37
    sub-int v4, p1, p2

    .line 38
    .line 39
    invoke-static {v4, v2, v3}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(III)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    int-to-float v4, v4

    .line 44
    add-int/2addr p0, p2

    .line 45
    invoke-static {p0, v2, v3}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(III)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    int-to-float p0, p0

    .line 50
    add-int/2addr p1, p2

    .line 51
    invoke-static {p1, v2, v3}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(III)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    int-to-float p1, p1

    .line 56
    invoke-direct {v0, v1, v4, p0, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 57
    .line 58
    .line 59
    new-instance p0, Landroid/graphics/Rect;

    .line 60
    .line 61
    iget p1, v0, Landroid/graphics/RectF;->left:F

    .line 62
    .line 63
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iget p2, v0, Landroid/graphics/RectF;->top:F

    .line 68
    .line 69
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 74
    .line 75
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    .line 80
    .line 81
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    invoke-direct {p0, p1, p2, v1, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 86
    .line 87
    .line 88
    return-object p0
.end method

.method public static calculateMeteringArea(FFIIF)Landroid/graphics/Rect;
    .locals 4

    .line 1
    const/high16 v0, 0x43960000    # 300.0f

    .line 2
    .line 3
    mul-float/2addr p4, v0

    .line 4
    invoke-static {p4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 5
    .line 6
    .line 7
    move-result-object p4

    .line 8
    invoke-virtual {p4}, Ljava/lang/Float;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p4

    .line 12
    int-to-float v0, p2

    .line 13
    mul-float/2addr p0, v0

    .line 14
    div-int/lit8 v0, p2, 0x2

    .line 15
    .line 16
    int-to-float v0, v0

    .line 17
    sub-float/2addr p0, v0

    .line 18
    float-to-int p0, p0

    .line 19
    int-to-float v0, p3

    .line 20
    mul-float/2addr p1, v0

    .line 21
    div-int/lit8 v0, p3, 0x2

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    sub-float/2addr p1, v0

    .line 25
    float-to-int p1, p1

    .line 26
    div-int/lit8 p4, p4, 0x2

    .line 27
    .line 28
    new-instance v0, Landroid/graphics/RectF;

    .line 29
    .line 30
    sub-int v1, p0, p4

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-static {v1, v2, p2}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(III)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    int-to-float v1, v1

    .line 38
    sub-int v3, p1, p4

    .line 39
    .line 40
    invoke-static {v3, v2, p3}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(III)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    int-to-float v3, v3

    .line 45
    add-int/2addr p0, p4

    .line 46
    invoke-static {p0, v2, p2}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(III)I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    int-to-float p0, p0

    .line 51
    add-int/2addr p1, p4

    .line 52
    invoke-static {p1, v2, p3}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(III)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    int-to-float p1, p1

    .line 57
    invoke-direct {v0, v1, v3, p0, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 58
    .line 59
    .line 60
    new-instance p0, Landroid/graphics/Rect;

    .line 61
    .line 62
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_0

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_0
    return-object p0

    .line 82
    :cond_1
    :goto_0
    new-instance p0, Landroid/graphics/Rect;

    .line 83
    .line 84
    invoke-direct {p0, v2, v2, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 85
    .line 86
    .line 87
    return-object p0
.end method

.method public static cameraToNormalized(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 3
    .param p0    # Landroid/graphics/RectF;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 6
    .line 7
    const/high16 v2, -0x3b860000    # -1000.0f

    .line 8
    .line 9
    cmpg-float v1, v1, v2

    .line 10
    .line 11
    if-ltz v1, :cond_2

    .line 12
    .line 13
    iget v1, p0, Landroid/graphics/RectF;->top:F

    .line 14
    .line 15
    cmpg-float v1, v1, v2

    .line 16
    .line 17
    if-ltz v1, :cond_2

    .line 18
    .line 19
    iget v1, p0, Landroid/graphics/RectF;->right:F

    .line 20
    .line 21
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 22
    .line 23
    cmpl-float v1, v1, v2

    .line 24
    .line 25
    if-gtz v1, :cond_2

    .line 26
    .line 27
    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    .line 28
    .line 29
    cmpl-float v1, v1, v2

    .line 30
    .line 31
    if-lez v1, :cond_1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    .line 35
    .line 36
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 37
    .line 38
    .line 39
    new-instance p0, Landroid/graphics/Matrix;

    .line 40
    .line 41
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 42
    .line 43
    .line 44
    const v1, 0x3a03126f    # 5.0E-4f

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, v1, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 48
    .line 49
    .line 50
    const/high16 v1, 0x3f000000    # 0.5f

    .line 51
    .line 52
    invoke-virtual {p0, v1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_0
    return-object v0
.end method

.method public static clamp(FFF)F
    .locals 0

    .line 1
    invoke-static {p2, p0}, Ljava/lang/Math;->min(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static clamp(III)I
    .locals 0

    .line 10
    invoke-static {p2, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public static normalizedFaceRect(Landroid/graphics/Rect;IZ)Landroid/graphics/RectF;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0, p2, p1}, Lio/agora/rtc2/video/CoordinatesTransform;->prepareMatrix(Landroid/graphics/Matrix;ZI)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-direct {p1, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 15
    .line 16
    .line 17
    return-object p1
.end method

.method public static normalizedToCamera(Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 3
    .param p0    # Landroid/graphics/RectF;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    cmpg-float v1, v1, v2

    .line 9
    .line 10
    if-ltz v1, :cond_2

    .line 11
    .line 12
    iget v1, p0, Landroid/graphics/RectF;->top:F

    .line 13
    .line 14
    cmpg-float v1, v1, v2

    .line 15
    .line 16
    if-ltz v1, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    cmpl-float v1, v1, v2

    .line 25
    .line 26
    if-gtz v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    cmpl-float v1, v1, v2

    .line 33
    .line 34
    if-lez v1, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Landroid/graphics/Matrix;

    .line 43
    .line 44
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 45
    .line 46
    .line 47
    const/high16 v1, 0x44fa0000    # 2000.0f

    .line 48
    .line 49
    invoke-virtual {p0, v1, v1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 50
    .line 51
    .line 52
    const/high16 v1, -0x3b860000    # -1000.0f

    .line 53
    .line 54
    invoke-virtual {p0, v1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 58
    .line 59
    .line 60
    :cond_2
    :goto_0
    return-object v0
.end method

.method public static normalizedToSensor(Landroid/graphics/RectF;IIIIIZ)Landroid/graphics/RectF;
    .locals 6
    .param p0    # Landroid/graphics/RectF;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p5, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object p5

    .line 5
    :cond_0
    iget v0, p0, Landroid/graphics/RectF;->left:F

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    cmpg-float v0, v0, v1

    .line 9
    .line 10
    if-ltz v0, :cond_5

    .line 11
    .line 12
    iget v0, p0, Landroid/graphics/RectF;->top:F

    .line 13
    .line 14
    cmpg-float v0, v0, v1

    .line 15
    .line 16
    if-ltz v0, :cond_5

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    cmpl-float v0, v0, v2

    .line 25
    .line 26
    if-gtz v0, :cond_5

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    cmpl-float v0, v0, v2

    .line 33
    .line 34
    if-lez v0, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    new-instance p5, Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-direct {p5, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Landroid/graphics/Matrix;

    .line 43
    .line 44
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 45
    .line 46
    .line 47
    if-eqz p6, :cond_4

    .line 48
    .line 49
    int-to-float p6, p3

    .line 50
    int-to-float p1, p1

    .line 51
    div-float p1, p6, p1

    .line 52
    .line 53
    int-to-float v0, p4

    .line 54
    int-to-float p2, p2

    .line 55
    div-float p2, v0, p2

    .line 56
    .line 57
    div-float v3, p1, p2

    .line 58
    .line 59
    cmpl-float v4, v3, v2

    .line 60
    .line 61
    const/high16 v5, 0x40000000    # 2.0f

    .line 62
    .line 63
    if-lez v4, :cond_2

    .line 64
    .line 65
    sub-float/2addr v3, v2

    .line 66
    div-float/2addr v3, v5

    .line 67
    invoke-virtual {p0, v3, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 68
    .line 69
    .line 70
    mul-float/2addr p6, p2

    .line 71
    div-float/2addr p6, p1

    .line 72
    float-to-int p3, p6

    .line 73
    goto :goto_0

    .line 74
    :cond_2
    cmpg-float p6, v3, v2

    .line 75
    .line 76
    if-gez p6, :cond_3

    .line 77
    .line 78
    div-float p4, p2, p1

    .line 79
    .line 80
    sub-float/2addr p4, v2

    .line 81
    div-float/2addr p4, v5

    .line 82
    invoke-virtual {p0, v1, p4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 83
    .line 84
    .line 85
    mul-float/2addr v0, p1

    .line 86
    div-float/2addr v0, p2

    .line 87
    float-to-int p4, v0

    .line 88
    :cond_3
    :goto_0
    invoke-virtual {p0, p5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 89
    .line 90
    .line 91
    :cond_4
    int-to-float p1, p3

    .line 92
    int-to-float p2, p4

    .line 93
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, p5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 97
    .line 98
    .line 99
    :cond_5
    :goto_1
    return-object p5
.end method

.method public static normalizedToView(Landroid/graphics/RectF;IIIIZII)Landroid/graphics/RectF;
    .locals 7
    .param p0    # Landroid/graphics/RectF;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    cmpg-float v1, v1, v2

    .line 9
    .line 10
    if-ltz v1, :cond_f

    .line 11
    .line 12
    iget v1, p0, Landroid/graphics/RectF;->top:F

    .line 13
    .line 14
    cmpg-float v1, v1, v2

    .line 15
    .line 16
    if-ltz v1, :cond_f

    .line 17
    .line 18
    iget v1, p0, Landroid/graphics/RectF;->right:F

    .line 19
    .line 20
    const/high16 v3, 0x3f800000    # 1.0f

    .line 21
    .line 22
    cmpl-float v1, v1, v3

    .line 23
    .line 24
    if-gtz v1, :cond_f

    .line 25
    .line 26
    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    .line 27
    .line 28
    cmpl-float v1, v1, v3

    .line 29
    .line 30
    if-gtz v1, :cond_f

    .line 31
    .line 32
    rem-int/lit8 v1, p6, 0x5a

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    goto/16 :goto_6

    .line 37
    .line 38
    :cond_1
    if-lez p6, :cond_2

    .line 39
    .line 40
    rem-int/lit16 p6, p6, 0x168

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_2
    rem-int/lit16 p6, p6, 0x168

    .line 44
    .line 45
    add-int/lit16 p6, p6, 0x168

    .line 46
    .line 47
    :goto_0
    new-instance v0, Landroid/graphics/RectF;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 50
    .line 51
    .line 52
    new-instance p0, Landroid/graphics/Matrix;

    .line 53
    .line 54
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 55
    .line 56
    .line 57
    if-eqz p5, :cond_3

    .line 58
    .line 59
    iget p5, v0, Landroid/graphics/RectF;->left:F

    .line 60
    .line 61
    iget v1, v0, Landroid/graphics/RectF;->right:F

    .line 62
    .line 63
    sub-float v1, v3, v1

    .line 64
    .line 65
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 66
    .line 67
    sub-float p5, v3, p5

    .line 68
    .line 69
    iput p5, v0, Landroid/graphics/RectF;->right:F

    .line 70
    .line 71
    :cond_3
    neg-int p5, p6

    .line 72
    int-to-float p5, p5

    .line 73
    invoke-virtual {p0, p5}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 74
    .line 75
    .line 76
    const/16 p5, 0x10e

    .line 77
    .line 78
    const/16 v1, 0x5a

    .line 79
    .line 80
    if-eq p6, v1, :cond_6

    .line 81
    .line 82
    const/16 v4, 0xb4

    .line 83
    .line 84
    if-eq p6, v4, :cond_5

    .line 85
    .line 86
    if-eq p6, p5, :cond_4

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    invoke-virtual {p0, v3, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 90
    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_5
    invoke-virtual {p0, v3, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_6
    invoke-virtual {p0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 98
    .line 99
    .line 100
    :goto_1
    int-to-float v4, p1

    .line 101
    int-to-float v5, p2

    .line 102
    invoke-virtual {p0, v4, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 106
    .line 107
    .line 108
    if-eq p6, v1, :cond_8

    .line 109
    .line 110
    if-ne p6, p5, :cond_7

    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_7
    int-to-float v6, p3

    .line 114
    goto :goto_3

    .line 115
    :cond_8
    :goto_2
    int-to-float v6, p4

    .line 116
    :goto_3
    if-eq p6, v1, :cond_a

    .line 117
    .line 118
    if-ne p6, p5, :cond_9

    .line 119
    .line 120
    goto :goto_4

    .line 121
    :cond_9
    int-to-float p3, p4

    .line 122
    goto :goto_5

    .line 123
    :cond_a
    :goto_4
    int-to-float p3, p3

    .line 124
    :goto_5
    div-float p4, v4, v6

    .line 125
    .line 126
    div-float p3, v5, p3

    .line 127
    .line 128
    const/4 p5, 0x1

    .line 129
    const/4 p6, 0x2

    .line 130
    if-eq p7, p5, :cond_d

    .line 131
    .line 132
    if-eq p7, p6, :cond_b

    .line 133
    .line 134
    return-object v0

    .line 135
    :cond_b
    cmpl-float p5, p4, p3

    .line 136
    .line 137
    if-lez p5, :cond_c

    .line 138
    .line 139
    div-float/2addr p3, p4

    .line 140
    div-int/2addr p1, p6

    .line 141
    int-to-float p1, p1

    .line 142
    div-int/2addr p2, p6

    .line 143
    int-to-float p2, p2

    .line 144
    invoke-virtual {p0, p3, v3, p1, p2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 148
    .line 149
    .line 150
    iget p0, v0, Landroid/graphics/RectF;->right:F

    .line 151
    .line 152
    invoke-static {p0, v2, v4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    iput p0, v0, Landroid/graphics/RectF;->right:F

    .line 157
    .line 158
    iget p0, v0, Landroid/graphics/RectF;->left:F

    .line 159
    .line 160
    invoke-static {p0, v2, v4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    iput p0, v0, Landroid/graphics/RectF;->left:F

    .line 165
    .line 166
    return-object v0

    .line 167
    :cond_c
    div-float/2addr p4, p3

    .line 168
    div-int/2addr p1, p6

    .line 169
    int-to-float p1, p1

    .line 170
    div-int/2addr p2, p6

    .line 171
    int-to-float p2, p2

    .line 172
    invoke-virtual {p0, v3, p4, p1, p2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 176
    .line 177
    .line 178
    iget p0, v0, Landroid/graphics/RectF;->top:F

    .line 179
    .line 180
    invoke-static {p0, v2, v5}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    iput p0, v0, Landroid/graphics/RectF;->top:F

    .line 185
    .line 186
    iget p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 187
    .line 188
    invoke-static {p0, v2, v5}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 193
    .line 194
    return-object v0

    .line 195
    :cond_d
    cmpl-float p5, p4, p3

    .line 196
    .line 197
    if-lez p5, :cond_e

    .line 198
    .line 199
    div-float/2addr p4, p3

    .line 200
    div-int/2addr p1, p6

    .line 201
    int-to-float p1, p1

    .line 202
    div-int/2addr p2, p6

    .line 203
    int-to-float p2, p2

    .line 204
    invoke-virtual {p0, v3, p4, p1, p2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 208
    .line 209
    .line 210
    iget p0, v0, Landroid/graphics/RectF;->top:F

    .line 211
    .line 212
    invoke-static {p0, v2, v5}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    iput p0, v0, Landroid/graphics/RectF;->top:F

    .line 217
    .line 218
    iget p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 219
    .line 220
    invoke-static {p0, v2, v5}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 221
    .line 222
    .line 223
    move-result p0

    .line 224
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 225
    .line 226
    return-object v0

    .line 227
    :cond_e
    div-float/2addr p3, p4

    .line 228
    div-int/2addr p1, p6

    .line 229
    int-to-float p1, p1

    .line 230
    div-int/2addr p2, p6

    .line 231
    int-to-float p2, p2

    .line 232
    invoke-virtual {p0, p3, v3, p1, p2}, Landroid/graphics/Matrix;->setScale(FFFF)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 236
    .line 237
    .line 238
    iget p0, v0, Landroid/graphics/RectF;->right:F

    .line 239
    .line 240
    invoke-static {p0, v2, v4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 241
    .line 242
    .line 243
    move-result p0

    .line 244
    iput p0, v0, Landroid/graphics/RectF;->right:F

    .line 245
    .line 246
    iget p0, v0, Landroid/graphics/RectF;->left:F

    .line 247
    .line 248
    invoke-static {p0, v2, v4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 249
    .line 250
    .line 251
    move-result p0

    .line 252
    iput p0, v0, Landroid/graphics/RectF;->left:F

    .line 253
    .line 254
    :cond_f
    :goto_6
    return-object v0
.end method

.method private static prepareMatrix(Landroid/graphics/Matrix;ZI)V
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/high16 p1, -0x40800000    # -1.0f

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move p1, v0

    .line 9
    :goto_0
    invoke-virtual {p0, p1, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 10
    .line 11
    .line 12
    int-to-float p1, p2

    .line 13
    invoke-virtual {p0, p1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 14
    .line 15
    .line 16
    const p1, 0x3a03126f    # 5.0E-4f

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1, p1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 20
    .line 21
    .line 22
    const/high16 p1, 0x3f000000    # 0.5f

    .line 23
    .line 24
    invoke-virtual {p0, p1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static sensorToNormalized(Landroid/graphics/RectF;IIIIZ)Landroid/graphics/RectF;
    .locals 7
    .param p0    # Landroid/graphics/RectF;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    cmpg-float v1, v1, v2

    .line 9
    .line 10
    if-ltz v1, :cond_5

    .line 11
    .line 12
    iget v1, p0, Landroid/graphics/RectF;->top:F

    .line 13
    .line 14
    cmpg-float v1, v1, v2

    .line 15
    .line 16
    if-ltz v1, :cond_5

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v3, p1

    .line 23
    cmpl-float v1, v1, v3

    .line 24
    .line 25
    if-gtz v1, :cond_5

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    int-to-float v4, p2

    .line 32
    cmpl-float v1, v1, v4

    .line 33
    .line 34
    if-lez v1, :cond_1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    new-instance v0, Landroid/graphics/RectF;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 40
    .line 41
    .line 42
    new-instance p0, Landroid/graphics/Matrix;

    .line 43
    .line 44
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 45
    .line 46
    .line 47
    const/high16 v1, 0x3f800000    # 1.0f

    .line 48
    .line 49
    if-eqz p5, :cond_4

    .line 50
    .line 51
    int-to-float p3, p3

    .line 52
    div-float p3, v3, p3

    .line 53
    .line 54
    int-to-float p4, p4

    .line 55
    div-float p4, v4, p4

    .line 56
    .line 57
    div-float p5, p3, p4

    .line 58
    .line 59
    cmpl-float v5, p5, v1

    .line 60
    .line 61
    const/high16 v6, 0x40000000    # 2.0f

    .line 62
    .line 63
    if-lez v5, :cond_2

    .line 64
    .line 65
    div-float p1, p4, p3

    .line 66
    .line 67
    sub-float/2addr p1, v1

    .line 68
    mul-float/2addr p1, v3

    .line 69
    div-float/2addr p1, v6

    .line 70
    invoke-virtual {p0, p1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 71
    .line 72
    .line 73
    mul-float/2addr v3, p4

    .line 74
    div-float/2addr v3, p3

    .line 75
    float-to-int p1, v3

    .line 76
    goto :goto_0

    .line 77
    :cond_2
    cmpg-float v3, p5, v1

    .line 78
    .line 79
    if-gez v3, :cond_3

    .line 80
    .line 81
    sub-float/2addr p5, v1

    .line 82
    mul-float/2addr p5, v4

    .line 83
    div-float/2addr p5, v6

    .line 84
    invoke-virtual {p0, v2, p5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 85
    .line 86
    .line 87
    mul-float/2addr v4, p3

    .line 88
    div-float/2addr v4, p4

    .line 89
    float-to-int p2, v4

    .line 90
    :cond_3
    :goto_0
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 91
    .line 92
    .line 93
    :cond_4
    int-to-float p1, p1

    .line 94
    div-float p1, v1, p1

    .line 95
    .line 96
    int-to-float p2, p2

    .line 97
    div-float p2, v1, p2

    .line 98
    .line 99
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 103
    .line 104
    .line 105
    iget p0, v0, Landroid/graphics/RectF;->left:F

    .line 106
    .line 107
    invoke-static {p0, v2, v1}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 108
    .line 109
    .line 110
    move-result p0

    .line 111
    iput p0, v0, Landroid/graphics/RectF;->left:F

    .line 112
    .line 113
    iget p0, v0, Landroid/graphics/RectF;->right:F

    .line 114
    .line 115
    invoke-static {p0, v2, v1}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 116
    .line 117
    .line 118
    move-result p0

    .line 119
    iput p0, v0, Landroid/graphics/RectF;->right:F

    .line 120
    .line 121
    iget p0, v0, Landroid/graphics/RectF;->top:F

    .line 122
    .line 123
    invoke-static {p0, v2, v1}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    iput p0, v0, Landroid/graphics/RectF;->top:F

    .line 128
    .line 129
    iget p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 130
    .line 131
    invoke-static {p0, v2, v1}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 136
    .line 137
    :cond_5
    :goto_1
    return-object v0
.end method

.method public static sensorToNormalizedPreview(Landroid/graphics/Rect;IILandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4

    .line 1
    if-le p1, p2, :cond_0

    .line 2
    .line 3
    int-to-double v0, p1

    .line 4
    int-to-double p1, p2

    .line 5
    :goto_0
    div-double/2addr v0, p1

    .line 6
    goto :goto_1

    .line 7
    :cond_0
    int-to-double v0, p2

    .line 8
    int-to-double p1, p1

    .line 9
    goto :goto_0

    .line 10
    :goto_1
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    int-to-double p1, p1

    .line 15
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    int-to-double v2, v2

    .line 20
    div-double/2addr p1, v2

    .line 21
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    cmpl-double p1, v0, p1

    .line 30
    .line 31
    if-lez p1, :cond_1

    .line 32
    .line 33
    int-to-double p1, v2

    .line 34
    div-double/2addr p1, v0

    .line 35
    double-to-int v3, p1

    .line 36
    goto :goto_2

    .line 37
    :cond_1
    int-to-double p1, v3

    .line 38
    mul-double/2addr p1, v0

    .line 39
    double-to-int v2, p1

    .line 40
    :goto_2
    invoke-virtual {p3}, Landroid/graphics/Rect;->width()I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    sub-int p1, v2, p1

    .line 45
    .line 46
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    invoke-virtual {p3}, Landroid/graphics/Rect;->height()I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    sub-int p2, v3, p2

    .line 55
    .line 56
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    new-instance v0, Landroid/graphics/RectF;

    .line 61
    .line 62
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 63
    .line 64
    .line 65
    new-instance p0, Landroid/graphics/Matrix;

    .line 66
    .line 67
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 68
    .line 69
    .line 70
    iget v1, p3, Landroid/graphics/Rect;->left:I

    .line 71
    .line 72
    neg-int v1, v1

    .line 73
    div-int/lit8 p1, p1, 0x2

    .line 74
    .line 75
    sub-int/2addr v1, p1

    .line 76
    int-to-float p1, v1

    .line 77
    iget p3, p3, Landroid/graphics/Rect;->top:I

    .line 78
    .line 79
    neg-int p3, p3

    .line 80
    div-int/lit8 p2, p2, 0x2

    .line 81
    .line 82
    sub-int/2addr p3, p2

    .line 83
    int-to-float p2, p3

    .line 84
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 85
    .line 86
    .line 87
    neg-int p1, v2

    .line 88
    div-int/lit8 p1, p1, 0x2

    .line 89
    .line 90
    int-to-float p1, p1

    .line 91
    neg-int p2, v3

    .line 92
    div-int/lit8 p2, p2, 0x2

    .line 93
    .line 94
    int-to-float p2, p2

    .line 95
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 96
    .line 97
    .line 98
    int-to-float p1, v2

    .line 99
    const/high16 p2, 0x44fa0000    # 2000.0f

    .line 100
    .line 101
    div-float p1, p2, p1

    .line 102
    .line 103
    int-to-float p3, v3

    .line 104
    div-float/2addr p2, p3

    .line 105
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 106
    .line 107
    .line 108
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 109
    .line 110
    .line 111
    new-instance p0, Landroid/graphics/Rect;

    .line 112
    .line 113
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, p0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    .line 117
    .line 118
    .line 119
    return-object p0
.end method

.method public static viewToNormalized(Landroid/graphics/RectF;IIIIZII)Landroid/graphics/RectF;
    .locals 5
    .param p0    # Landroid/graphics/RectF;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    if-lez p1, :cond_f

    .line 6
    .line 7
    if-gtz p2, :cond_1

    .line 8
    .line 9
    goto/16 :goto_6

    .line 10
    .line 11
    :cond_1
    iget v1, p0, Landroid/graphics/RectF;->left:F

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    cmpg-float v1, v1, v2

    .line 15
    .line 16
    if-ltz v1, :cond_f

    .line 17
    .line 18
    iget v1, p0, Landroid/graphics/RectF;->top:F

    .line 19
    .line 20
    cmpg-float v1, v1, v2

    .line 21
    .line 22
    if-ltz v1, :cond_f

    .line 23
    .line 24
    iget v1, p0, Landroid/graphics/RectF;->right:F

    .line 25
    .line 26
    int-to-float p1, p1

    .line 27
    cmpl-float v1, v1, p1

    .line 28
    .line 29
    if-gtz v1, :cond_f

    .line 30
    .line 31
    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    .line 32
    .line 33
    int-to-float p2, p2

    .line 34
    cmpl-float v1, v1, p2

    .line 35
    .line 36
    if-gtz v1, :cond_f

    .line 37
    .line 38
    rem-int/lit8 v1, p6, 0x5a

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    goto/16 :goto_6

    .line 43
    .line 44
    :cond_2
    if-lez p6, :cond_3

    .line 45
    .line 46
    rem-int/lit16 p6, p6, 0x168

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    rem-int/lit16 p6, p6, 0x168

    .line 50
    .line 51
    add-int/lit16 p6, p6, 0x168

    .line 52
    .line 53
    :goto_0
    new-instance v0, Landroid/graphics/RectF;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Landroid/graphics/Matrix;

    .line 59
    .line 60
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 61
    .line 62
    .line 63
    int-to-float v1, p6

    .line 64
    invoke-virtual {p0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 65
    .line 66
    .line 67
    const/16 v1, 0x10e

    .line 68
    .line 69
    const/16 v3, 0x5a

    .line 70
    .line 71
    if-eq p6, v3, :cond_5

    .line 72
    .line 73
    if-ne p6, v1, :cond_4

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    move v4, p1

    .line 77
    goto :goto_2

    .line 78
    :cond_5
    :goto_1
    move v4, p2

    .line 79
    :goto_2
    if-eq p6, v3, :cond_7

    .line 80
    .line 81
    if-ne p6, v1, :cond_6

    .line 82
    .line 83
    goto :goto_3

    .line 84
    :cond_6
    move p1, p2

    .line 85
    :cond_7
    :goto_3
    int-to-float p2, p3

    .line 86
    div-float p2, v4, p2

    .line 87
    .line 88
    int-to-float p3, p4

    .line 89
    div-float p3, p1, p3

    .line 90
    .line 91
    const/high16 p4, 0x3f800000    # 1.0f

    .line 92
    .line 93
    div-float v4, p4, v4

    .line 94
    .line 95
    div-float p1, p4, p1

    .line 96
    .line 97
    invoke-virtual {p0, v4, p1}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 98
    .line 99
    .line 100
    if-eq p6, v3, :cond_a

    .line 101
    .line 102
    const/16 p1, 0xb4

    .line 103
    .line 104
    if-eq p6, p1, :cond_9

    .line 105
    .line 106
    if-eq p6, v1, :cond_8

    .line 107
    .line 108
    goto :goto_4

    .line 109
    :cond_8
    invoke-virtual {p0, v2, p4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 110
    .line 111
    .line 112
    goto :goto_4

    .line 113
    :cond_9
    invoke-virtual {p0, p4, p4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 114
    .line 115
    .line 116
    goto :goto_4

    .line 117
    :cond_a
    invoke-virtual {p0, p4, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 118
    .line 119
    .line 120
    :goto_4
    const/4 p1, 0x1

    .line 121
    const/high16 p6, 0x3f000000    # 0.5f

    .line 122
    .line 123
    if-eq p7, p1, :cond_d

    .line 124
    .line 125
    const/4 p1, 0x2

    .line 126
    if-eq p7, p1, :cond_b

    .line 127
    .line 128
    goto :goto_5

    .line 129
    :cond_b
    cmpl-float p1, p2, p3

    .line 130
    .line 131
    if-lez p1, :cond_c

    .line 132
    .line 133
    div-float/2addr p2, p3

    .line 134
    invoke-virtual {p0, p2, p4, p6, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 138
    .line 139
    .line 140
    iget p0, v0, Landroid/graphics/RectF;->right:F

    .line 141
    .line 142
    invoke-static {p0, v2, p4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    iput p0, v0, Landroid/graphics/RectF;->right:F

    .line 147
    .line 148
    iget p0, v0, Landroid/graphics/RectF;->left:F

    .line 149
    .line 150
    invoke-static {p0, v2, p4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 151
    .line 152
    .line 153
    move-result p0

    .line 154
    iput p0, v0, Landroid/graphics/RectF;->left:F

    .line 155
    .line 156
    goto :goto_5

    .line 157
    :cond_c
    div-float/2addr p3, p2

    .line 158
    invoke-virtual {p0, p4, p3}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 162
    .line 163
    .line 164
    iget p0, v0, Landroid/graphics/RectF;->top:F

    .line 165
    .line 166
    invoke-static {p0, v2, p4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    iput p0, v0, Landroid/graphics/RectF;->top:F

    .line 171
    .line 172
    iget p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 173
    .line 174
    invoke-static {p0, v2, p4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 179
    .line 180
    goto :goto_5

    .line 181
    :cond_d
    cmpl-float p1, p2, p3

    .line 182
    .line 183
    if-lez p1, :cond_e

    .line 184
    .line 185
    div-float/2addr p3, p2

    .line 186
    invoke-virtual {p0, p4, p3, v2, p6}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 190
    .line 191
    .line 192
    iget p0, v0, Landroid/graphics/RectF;->top:F

    .line 193
    .line 194
    invoke-static {p0, v2, p4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    iput p0, v0, Landroid/graphics/RectF;->top:F

    .line 199
    .line 200
    iget p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 201
    .line 202
    invoke-static {p0, v2, p4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    iput p0, v0, Landroid/graphics/RectF;->bottom:F

    .line 207
    .line 208
    goto :goto_5

    .line 209
    :cond_e
    div-float/2addr p2, p3

    .line 210
    invoke-virtual {p0, p2, p4, p6, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 214
    .line 215
    .line 216
    iget p0, v0, Landroid/graphics/RectF;->right:F

    .line 217
    .line 218
    invoke-static {p0, v2, p4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    iput p0, v0, Landroid/graphics/RectF;->right:F

    .line 223
    .line 224
    iget p0, v0, Landroid/graphics/RectF;->left:F

    .line 225
    .line 226
    invoke-static {p0, v2, p4}, Lio/agora/rtc2/video/CoordinatesTransform;->clamp(FFF)F

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    iput p0, v0, Landroid/graphics/RectF;->left:F

    .line 231
    .line 232
    :goto_5
    if-eqz p5, :cond_f

    .line 233
    .line 234
    iget p0, v0, Landroid/graphics/RectF;->left:F

    .line 235
    .line 236
    iget p1, v0, Landroid/graphics/RectF;->right:F

    .line 237
    .line 238
    sub-float p1, p4, p1

    .line 239
    .line 240
    iput p1, v0, Landroid/graphics/RectF;->left:F

    .line 241
    .line 242
    sub-float/2addr p4, p0

    .line 243
    iput p4, v0, Landroid/graphics/RectF;->right:F

    .line 244
    .line 245
    :cond_f
    :goto_6
    return-object v0
.end method
