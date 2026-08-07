.class public Ll/ad4;
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

.method public static a(FFLandroid/graphics/Rect;Z)Landroid/graphics/Rect;
    .locals 5

    .line 1
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    iget v2, p2, Landroid/graphics/Rect;->right:I

    .line 8
    .line 9
    int-to-float v2, v2

    .line 10
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 11
    .line 12
    int-to-float p2, p2

    .line 13
    const/high16 v3, 0x447a0000    # 1000.0f

    .line 14
    .line 15
    const/high16 v4, 0x44fa0000    # 2000.0f

    .line 16
    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    mul-float/2addr v1, v4

    .line 20
    div-float/2addr v1, p1

    .line 21
    sub-float p3, p1, v1

    .line 22
    .line 23
    sub-float/2addr p3, v3

    .line 24
    float-to-int p3, p3

    .line 25
    mul-float/2addr v2, v4

    .line 26
    sub-float v1, p0, v2

    .line 27
    .line 28
    div-float/2addr v1, p0

    .line 29
    sub-float/2addr v1, v3

    .line 30
    float-to-int v1, v1

    .line 31
    mul-float/2addr p2, v4

    .line 32
    div-float/2addr p2, p1

    .line 33
    sub-float/2addr p1, p2

    .line 34
    sub-float/2addr p1, v3

    .line 35
    float-to-int p1, p1

    .line 36
    :goto_0
    sub-float p2, p0, v0

    .line 37
    .line 38
    mul-float/2addr p2, v4

    .line 39
    div-float/2addr p2, p0

    .line 40
    sub-float/2addr p2, v3

    .line 41
    float-to-int p0, p2

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    mul-float/2addr v1, v4

    .line 44
    div-float/2addr v1, p1

    .line 45
    sub-float/2addr v1, v3

    .line 46
    float-to-int p3, v1

    .line 47
    mul-float/2addr v2, v4

    .line 48
    sub-float v1, p0, v2

    .line 49
    .line 50
    div-float/2addr v1, p0

    .line 51
    sub-float/2addr v1, v3

    .line 52
    float-to-int v1, v1

    .line 53
    mul-float/2addr p2, v4

    .line 54
    div-float/2addr p2, p1

    .line 55
    sub-float/2addr p2, v3

    .line 56
    float-to-int p1, p2

    .line 57
    goto :goto_0

    .line 58
    :goto_1
    const/16 p2, -0x3e8

    .line 59
    .line 60
    const/16 v0, 0x3e8

    .line 61
    .line 62
    invoke-static {p3, p2, v0}, Ll/hhx;->a(III)I

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    invoke-static {v1, p2, v0}, Ll/hhx;->a(III)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-static {p1, p2, v0}, Ll/hhx;->a(III)I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    invoke-static {p0, p2, v0}, Ll/hhx;->a(III)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    new-instance p2, Landroid/graphics/Rect;

    .line 79
    .line 80
    invoke-direct {p2, p3, v1, p1, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 81
    .line 82
    .line 83
    return-object p2
.end method

.method public static b(FFLandroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 5

    .line 1
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    iget v2, p2, Landroid/graphics/Rect;->right:I

    .line 8
    .line 9
    int-to-float v2, v2

    .line 10
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 11
    .line 12
    int-to-float p2, p2

    .line 13
    const/4 v3, 0x0

    .line 14
    cmpl-float v4, v0, v3

    .line 15
    .line 16
    if-lez v4, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    move v0, v3

    .line 20
    :goto_0
    cmpl-float v4, v1, v3

    .line 21
    .line 22
    if-lez v4, :cond_1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    move v1, v3

    .line 26
    :goto_1
    cmpl-float v3, v2, p0

    .line 27
    .line 28
    if-lez v3, :cond_2

    .line 29
    .line 30
    move v2, p0

    .line 31
    :cond_2
    cmpl-float v3, p2, p1

    .line 32
    .line 33
    if-lez v3, :cond_3

    .line 34
    .line 35
    move p2, p1

    .line 36
    :cond_3
    const/high16 v3, 0x44fa0000    # 2000.0f

    .line 37
    .line 38
    mul-float/2addr v0, v3

    .line 39
    div-float/2addr v0, p0

    .line 40
    const/high16 v4, 0x447a0000    # 1000.0f

    .line 41
    .line 42
    sub-float/2addr v0, v4

    .line 43
    float-to-int v0, v0

    .line 44
    mul-float/2addr v1, v3

    .line 45
    div-float/2addr v1, p1

    .line 46
    sub-float/2addr v1, v4

    .line 47
    float-to-int v1, v1

    .line 48
    mul-float/2addr v2, v3

    .line 49
    div-float/2addr v2, p0

    .line 50
    sub-float/2addr v2, v4

    .line 51
    float-to-int p0, v2

    .line 52
    mul-float/2addr p2, v3

    .line 53
    div-float/2addr p2, p1

    .line 54
    sub-float/2addr p2, v4

    .line 55
    float-to-int p1, p2

    .line 56
    new-instance p2, Landroid/graphics/Rect;

    .line 57
    .line 58
    invoke-direct {p2, v0, v1, p0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 59
    .line 60
    .line 61
    return-object p2
.end method

.method public static c(Ll/crf0;Ll/crf0;I)Ll/crf0;
    .locals 3

    .line 1
    const/16 v0, 0x5a

    .line 2
    .line 3
    if-eq p2, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x10e

    .line 6
    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/crf0;->b()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    invoke-virtual {p0}, Ll/crf0;->a()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/crf0;->b()I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    invoke-virtual {p0}, Ll/crf0;->a()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    move v2, p2

    .line 28
    move p2, p0

    .line 29
    move p0, v2

    .line 30
    :goto_1
    invoke-virtual {p1}, Ll/crf0;->b()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p1}, Ll/crf0;->a()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    int-to-float p2, p2

    .line 39
    const/high16 v1, 0x3f800000    # 1.0f

    .line 40
    .line 41
    mul-float/2addr p2, v1

    .line 42
    int-to-float v0, v0

    .line 43
    div-float/2addr p2, v0

    .line 44
    int-to-float p0, p0

    .line 45
    mul-float/2addr p0, v1

    .line 46
    int-to-float p1, p1

    .line 47
    div-float/2addr p0, p1

    .line 48
    cmpg-float v1, p2, p0

    .line 49
    .line 50
    if-gez v1, :cond_2

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move p2, p0

    .line 54
    :goto_2
    mul-float/2addr v0, p2

    .line 55
    mul-float/2addr p1, p2

    .line 56
    new-instance p0, Ll/crf0;

    .line 57
    .line 58
    float-to-int p2, v0

    .line 59
    float-to-int p1, p1

    .line 60
    invoke-direct {p0, p2, p1}, Ll/crf0;-><init>(II)V

    .line 61
    .line 62
    .line 63
    return-object p0
.end method

.method public static d(Landroid/graphics/Rect;Landroid/graphics/Rect;I)Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    int-to-float v0, v0

    .line 6
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-float v2, v2

    .line 16
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    int-to-float v3, v3

    .line 21
    sub-float/2addr v2, v0

    .line 22
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    int-to-float v2, p2

    .line 27
    cmpl-float v0, v0, v2

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    if-gtz v0, :cond_2

    .line 31
    .line 32
    sub-float/2addr v3, v1

    .line 33
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    cmpl-float v0, v0, v2

    .line 38
    .line 39
    if-lez v0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 43
    .line 44
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 45
    .line 46
    sub-int/2addr v0, v1

    .line 47
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-gt v0, p2, :cond_2

    .line 52
    .line 53
    iget v0, p0, Landroid/graphics/Rect;->right:I

    .line 54
    .line 55
    iget v1, p1, Landroid/graphics/Rect;->right:I

    .line 56
    .line 57
    sub-int/2addr v0, v1

    .line 58
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-gt v0, p2, :cond_2

    .line 63
    .line 64
    iget v0, p0, Landroid/graphics/Rect;->top:I

    .line 65
    .line 66
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 67
    .line 68
    sub-int/2addr v0, v1

    .line 69
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-gt v0, p2, :cond_2

    .line 74
    .line 75
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 76
    .line 77
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 78
    .line 79
    sub-int/2addr p0, p1

    .line 80
    invoke-static {p0}, Ljava/lang/Math;->abs(I)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-le p0, p2, :cond_1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_1
    const/4 p0, 0x0

    .line 88
    return p0

    .line 89
    :cond_2
    :goto_0
    return v4
.end method

.method public static e(Ll/crf0;Ll/crf0;I)Ll/crf0;
    .locals 1

    .line 1
    const/16 v0, 0x5a

    .line 2
    .line 3
    if-eq p2, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x10e

    .line 6
    .line 7
    if-ne p2, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    new-instance p2, Ll/crf0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/crf0;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Ll/crf0;->b()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-direct {p2, v0, p0}, Ll/crf0;-><init>(II)V

    .line 20
    .line 21
    .line 22
    move-object p0, p2

    .line 23
    :cond_1
    const/4 p2, 0x0

    .line 24
    invoke-static {p0, p1, p2}, Ll/ad4;->c(Ll/crf0;Ll/crf0;I)Ll/crf0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/crf0;->b()I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    shr-int/lit8 p1, p1, 0x4

    .line 33
    .line 34
    shl-int/lit8 p1, p1, 0x4

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/crf0;->a()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    shr-int/lit8 p0, p0, 0x4

    .line 41
    .line 42
    shl-int/lit8 p0, p0, 0x4

    .line 43
    .line 44
    new-instance p2, Ll/crf0;

    .line 45
    .line 46
    invoke-direct {p2, p1, p0}, Ll/crf0;-><init>(II)V

    .line 47
    .line 48
    .line 49
    return-object p2
.end method

.method public static f(Ll/crf0;ILl/crf0;Z)Ll/crf0;
    .locals 1

    .line 1
    const/16 v0, 0x5a

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x10e

    .line 6
    .line 7
    if-ne p1, v0, :cond_1

    .line 8
    .line 9
    :cond_0
    new-instance p1, Ll/crf0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/crf0;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Ll/crf0;->b()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-direct {p1, v0, p0}, Ll/crf0;-><init>(II)V

    .line 20
    .line 21
    .line 22
    move-object p0, p1

    .line 23
    :cond_1
    const/4 p1, 0x0

    .line 24
    if-eqz p3, :cond_2

    .line 25
    .line 26
    invoke-static {p0, p2, p1}, Ll/ad4;->c(Ll/crf0;Ll/crf0;I)Ll/crf0;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/crf0;->b()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    shr-int/lit8 p1, p1, 0x4

    .line 35
    .line 36
    shl-int/lit8 p1, p1, 0x4

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/crf0;->a()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    shr-int/lit8 p0, p0, 0x4

    .line 43
    .line 44
    shl-int/lit8 p0, p0, 0x4

    .line 45
    .line 46
    new-instance p2, Ll/crf0;

    .line 47
    .line 48
    invoke-direct {p2, p1, p0}, Ll/crf0;-><init>(II)V

    .line 49
    .line 50
    .line 51
    return-object p2

    .line 52
    :cond_2
    invoke-static {p0, p2, p1}, Ll/ad4;->c(Ll/crf0;Ll/crf0;I)Ll/crf0;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0
.end method
