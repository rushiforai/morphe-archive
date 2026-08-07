.class public Lcom/momo/mcamera/util/ImageProcessUtil;
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

.method public static transformLandMark104Points([F[F)V
    .locals 10

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_3

    .line 7
    :cond_0
    new-instance v0, Landroid/graphics/PointF;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aget v2, p1, v1

    .line 11
    .line 12
    const/16 v3, 0x68

    .line 13
    .line 14
    aget v3, p1, v3

    .line 15
    .line 16
    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Landroid/graphics/PointF;

    .line 20
    .line 21
    const/16 v3, 0x12

    .line 22
    .line 23
    aget v4, p1, v3

    .line 24
    .line 25
    const/16 v5, 0x7a

    .line 26
    .line 27
    aget v5, p1, v5

    .line 28
    .line 29
    invoke-direct {v2, v4, v5}, Landroid/graphics/PointF;-><init>(FF)V

    .line 30
    .line 31
    .line 32
    new-instance v4, Landroid/graphics/PointF;

    .line 33
    .line 34
    iget v5, v0, Landroid/graphics/PointF;->x:F

    .line 35
    .line 36
    iget v6, v2, Landroid/graphics/PointF;->x:F

    .line 37
    .line 38
    add-float/2addr v5, v6

    .line 39
    const/high16 v6, 0x40000000    # 2.0f

    .line 40
    .line 41
    div-float/2addr v5, v6

    .line 42
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 43
    .line 44
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 45
    .line 46
    add-float/2addr v0, v2

    .line 47
    div-float/2addr v0, v6

    .line 48
    invoke-direct {v4, v5, v0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 49
    .line 50
    .line 51
    array-length v0, p1

    .line 52
    invoke-static {p1, v1, p0, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    :goto_0
    if-ge v1, v3, :cond_3

    .line 56
    .line 57
    new-instance v0, Landroid/graphics/PointF;

    .line 58
    .line 59
    aget v2, p1, v1

    .line 60
    .line 61
    add-int/lit8 v5, v1, 0x68

    .line 62
    .line 63
    aget v6, p1, v5

    .line 64
    .line 65
    invoke-direct {v0, v2, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 66
    .line 67
    .line 68
    const/high16 v2, 0x41000000    # 8.0f

    .line 69
    .line 70
    const v6, 0x3df5c28f    # 0.12f

    .line 71
    .line 72
    .line 73
    const/16 v7, 0x9

    .line 74
    .line 75
    const/high16 v8, 0x3f800000    # 1.0f

    .line 76
    .line 77
    if-ge v1, v7, :cond_1

    .line 78
    .line 79
    int-to-float v7, v1

    .line 80
    :goto_1
    div-float/2addr v7, v2

    .line 81
    sub-float v2, v8, v7

    .line 82
    .line 83
    mul-float/2addr v2, v6

    .line 84
    add-float/2addr v2, v8

    .line 85
    goto :goto_2

    .line 86
    :cond_1
    if-le v1, v7, :cond_2

    .line 87
    .line 88
    const/high16 v7, 0x41900000    # 18.0f

    .line 89
    .line 90
    int-to-float v9, v1

    .line 91
    sub-float/2addr v7, v9

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    move v2, v8

    .line 94
    :goto_2
    sub-float/2addr v8, v2

    .line 95
    iget v6, v4, Landroid/graphics/PointF;->x:F

    .line 96
    .line 97
    mul-float/2addr v6, v8

    .line 98
    iget v7, v0, Landroid/graphics/PointF;->x:F

    .line 99
    .line 100
    mul-float/2addr v7, v2

    .line 101
    add-float/2addr v6, v7

    .line 102
    aput v6, p0, v1

    .line 103
    .line 104
    iget v6, v4, Landroid/graphics/PointF;->y:F

    .line 105
    .line 106
    mul-float/2addr v8, v6

    .line 107
    iget v0, v0, Landroid/graphics/PointF;->y:F

    .line 108
    .line 109
    mul-float/2addr v2, v0

    .line 110
    add-float/2addr v8, v2

    .line 111
    aput v8, p0, v5

    .line 112
    .line 113
    add-int/lit8 v1, v1, 0x1

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_3
    :goto_3
    return-void
.end method
