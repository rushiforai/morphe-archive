.class Lcom/momo/mcamera/mask/skin/AIFaceTriangulation$Util;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/skin/AIFaceTriangulation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Util"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000([F)[F
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation$Util;->landmark96To104([F)[F

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static curve4([Landroid/graphics/PointF;FFFFFFFF)V
    .locals 7

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aput-object v0, p0, v1

    .line 8
    .line 9
    const/high16 v0, 0x40000000    # 2.0f

    .line 10
    .line 11
    mul-float v2, p3, v0

    .line 12
    .line 13
    sub-float v2, p1, v2

    .line 14
    .line 15
    add-float/2addr v2, p5

    .line 16
    mul-float/2addr v0, p4

    .line 17
    sub-float v0, p2, v0

    .line 18
    .line 19
    add-float/2addr v0, p6

    .line 20
    sub-float p5, p3, p5

    .line 21
    .line 22
    const/high16 v3, 0x40400000    # 3.0f

    .line 23
    .line 24
    mul-float/2addr p5, v3

    .line 25
    sub-float/2addr p5, p1

    .line 26
    add-float/2addr p5, p7

    .line 27
    sub-float p6, p4, p6

    .line 28
    .line 29
    mul-float/2addr p6, v3

    .line 30
    sub-float/2addr p6, p2

    .line 31
    add-float/2addr p6, p8

    .line 32
    sub-float/2addr p3, p1

    .line 33
    const v3, 0x3edb6db8

    .line 34
    .line 35
    .line 36
    mul-float/2addr p3, v3

    .line 37
    const v4, 0x3d7ac689

    .line 38
    .line 39
    .line 40
    mul-float v5, v2, v4

    .line 41
    .line 42
    add-float/2addr p3, v5

    .line 43
    const v5, 0x3b3f112c

    .line 44
    .line 45
    .line 46
    mul-float v6, p5, v5

    .line 47
    .line 48
    add-float/2addr p3, v6

    .line 49
    sub-float/2addr p4, p2

    .line 50
    mul-float/2addr p4, v3

    .line 51
    mul-float/2addr v4, v0

    .line 52
    add-float/2addr p4, v4

    .line 53
    mul-float/2addr v5, p6

    .line 54
    add-float/2addr p4, v5

    .line 55
    const v3, 0x3dfac689

    .line 56
    .line 57
    .line 58
    mul-float/2addr v2, v3

    .line 59
    const v4, 0x3c8f4ce1

    .line 60
    .line 61
    .line 62
    mul-float/2addr p5, v4

    .line 63
    add-float/2addr v2, p5

    .line 64
    mul-float/2addr v0, v3

    .line 65
    mul-float/2addr p6, v4

    .line 66
    add-float/2addr v0, p6

    .line 67
    :goto_0
    add-int/lit8 v3, v1, 0x1

    .line 68
    .line 69
    const/4 v4, 0x6

    .line 70
    if-ge v1, v4, :cond_0

    .line 71
    .line 72
    add-float/2addr p1, p3

    .line 73
    add-float/2addr p2, p4

    .line 74
    add-float/2addr p3, v2

    .line 75
    add-float/2addr p4, v0

    .line 76
    add-float/2addr v2, p5

    .line 77
    add-float/2addr v0, p6

    .line 78
    new-instance v1, Landroid/graphics/PointF;

    .line 79
    .line 80
    invoke-direct {v1, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 81
    .line 82
    .line 83
    aput-object v1, p0, v3

    .line 84
    .line 85
    move v1, v3

    .line 86
    goto :goto_0

    .line 87
    :cond_0
    new-instance p1, Landroid/graphics/PointF;

    .line 88
    .line 89
    invoke-direct {p1, p7, p8}, Landroid/graphics/PointF;-><init>(FF)V

    .line 90
    .line 91
    .line 92
    const/4 p2, 0x7

    .line 93
    aput-object p1, p0, p2

    .line 94
    .line 95
    return-void
.end method

.method private static extend96Points([F)[F
    .locals 11

    .line 1
    const/16 v0, 0xc8

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/16 v2, 0x60

    .line 7
    .line 8
    invoke-static {p0, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    const/4 v3, 0x4

    .line 12
    new-array v5, v3, [F

    .line 13
    .line 14
    new-array v6, v3, [F

    .line 15
    .line 16
    const v9, 0x4019999a    # 2.4f

    .line 17
    .line 18
    .line 19
    const/4 v10, 0x0

    .line 20
    const/16 v7, 0x42

    .line 21
    .line 22
    const/16 v8, 0x31

    .line 23
    .line 24
    move-object v4, p0

    .line 25
    invoke-static/range {v4 .. v10}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation$Util;->interuptPoints([F[F[FIIFI)V

    .line 26
    .line 27
    .line 28
    const v9, 0x405d70a4    # 3.46f

    .line 29
    .line 30
    .line 31
    const/4 v10, 0x1

    .line 32
    const/16 v8, 0x2d

    .line 33
    .line 34
    invoke-static/range {v4 .. v10}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation$Util;->interuptPoints([F[F[FIIFI)V

    .line 35
    .line 36
    .line 37
    const/4 v10, 0x2

    .line 38
    const/16 v7, 0x47

    .line 39
    .line 40
    const/16 v8, 0x33

    .line 41
    .line 42
    invoke-static/range {v4 .. v10}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation$Util;->interuptPoints([F[F[FIIFI)V

    .line 43
    .line 44
    .line 45
    const v9, 0x4019999a    # 2.4f

    .line 46
    .line 47
    .line 48
    const/4 v10, 0x3

    .line 49
    const/16 v8, 0x3b

    .line 50
    .line 51
    invoke-static/range {v4 .. v10}, Lcom/momo/mcamera/mask/skin/AIFaceTriangulation$Util;->interuptPoints([F[F[FIIFI)V

    .line 52
    .line 53
    .line 54
    invoke-static {v5, v1, v0, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 55
    .line 56
    .line 57
    const/16 p0, 0x64

    .line 58
    .line 59
    invoke-static {v4, v2, v0, p0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 60
    .line 61
    .line 62
    const/16 p0, 0xc4

    .line 63
    .line 64
    invoke-static {v6, v1, v0, p0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method private static interuptPoints([F[F[FIIFI)V
    .locals 3

    .line 1
    aget v0, p0, p4

    .line 2
    .line 3
    aget v1, p0, p3

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    add-int/lit8 p4, p4, 0x60

    .line 7
    .line 8
    aget p4, p0, p4

    .line 9
    .line 10
    add-int/lit8 p3, p3, 0x60

    .line 11
    .line 12
    aget v2, p0, p3

    .line 13
    .line 14
    sub-float/2addr p4, v2

    .line 15
    mul-float/2addr v0, p5

    .line 16
    add-float/2addr v1, v0

    .line 17
    aput v1, p1, p6

    .line 18
    .line 19
    aget p0, p0, p3

    .line 20
    .line 21
    mul-float/2addr p5, p4

    .line 22
    add-float/2addr p0, p5

    .line 23
    aput p0, p2, p6

    .line 24
    .line 25
    return-void
.end method

.method private static landmark96To104([F)[F
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    const/16 v2, 0xc0

    .line 4
    .line 5
    if-eq v0, v2, :cond_0

    .line 6
    .line 7
    new-array p0, v1, [F

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const/16 v0, 0x10

    .line 11
    .line 12
    new-array v3, v0, [F

    .line 13
    .line 14
    fill-array-data v3, :array_0

    .line 15
    .line 16
    .line 17
    const/16 v4, 0xd0

    .line 18
    .line 19
    new-array v4, v4, [F

    .line 20
    .line 21
    invoke-static {p0, v1, v4, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    invoke-static {v3, v1, v4, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    return-object v4

    .line 28
    nop

    .line 29
    :array_0
    .array-data 4
        0x3e20ac08
        0x3e5b2e56
        0x3e82c604
        0x3e1db604
        0x3eb336c9
        0x3de622d1
        0x3ee298f6
        0x3db72986
        0x3f08eea8
        0x3daf280a
        0x3f20fa2d
        0x3dcec72b
        0x3f39e78d
        0x3e0b574c
        0x3f542efa
        0x3e43c3d7
    .end array-data
.end method
