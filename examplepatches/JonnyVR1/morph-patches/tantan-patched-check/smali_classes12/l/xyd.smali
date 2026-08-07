.class public Ll/xyd;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/d13;

.field public b:Ll/t5d0;


# direct methods
.method public constructor <init>(Ll/d13;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xyd;->a:Ll/d13;

    .line 5
    .line 6
    return-void
.end method

.method public static c(Ll/s5d0;Ll/s5d0;Ll/s5d0;F)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Ll/s5d0;->b(Ll/s5d0;Ll/s5d0;)F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    div-float/2addr p1, p3

    .line 6
    invoke-static {p1}, Ll/ihx;->c(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-static {p0, p2}, Ll/s5d0;->b(Ll/s5d0;Ll/s5d0;)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    div-float/2addr p0, p3

    .line 15
    invoke-static {p0}, Ll/ihx;->c(F)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    add-int/2addr p1, p0

    .line 20
    const/4 p0, 0x2

    .line 21
    div-int/2addr p1, p0

    .line 22
    add-int/lit8 p2, p1, 0x7

    .line 23
    .line 24
    and-int/lit8 p3, p2, 0x3

    .line 25
    .line 26
    if-eqz p3, :cond_2

    .line 27
    .line 28
    if-eq p3, p0, :cond_1

    .line 29
    .line 30
    const/4 p0, 0x3

    .line 31
    if-eq p3, p0, :cond_0

    .line 32
    .line 33
    return p2

    .line 34
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    throw p0

    .line 39
    :cond_1
    add-int/lit8 p1, p1, 0x6

    .line 40
    .line 41
    return p1

    .line 42
    :cond_2
    add-int/lit8 p1, p1, 0x8

    .line 43
    .line 44
    return p1
.end method

.method public static d(Ll/s5d0;Ll/s5d0;Ll/s5d0;Ll/s5d0;I)Ll/xw60;
    .locals 18

    .line 1
    move/from16 v0, p4

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    const/high16 v1, 0x40600000    # 3.5f

    .line 5
    .line 6
    sub-float v4, v0, v1

    .line 7
    .line 8
    if-eqz p3, :cond_0

    .line 9
    .line 10
    invoke-virtual/range {p3 .. p3}, Ll/s5d0;->c()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-virtual/range {p3 .. p3}, Ll/s5d0;->d()F

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/high16 v2, 0x40400000    # 3.0f

    .line 19
    .line 20
    sub-float v2, v4, v2

    .line 21
    .line 22
    move v6, v2

    .line 23
    :goto_0
    move v14, v0

    .line 24
    move v15, v1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual/range {p1 .. p1}, Ll/s5d0;->c()F

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    invoke-virtual/range {p0 .. p0}, Ll/s5d0;->c()F

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sub-float/2addr v0, v1

    .line 35
    invoke-virtual/range {p2 .. p2}, Ll/s5d0;->c()F

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    add-float/2addr v0, v1

    .line 40
    invoke-virtual/range {p1 .. p1}, Ll/s5d0;->d()F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual/range {p0 .. p0}, Ll/s5d0;->d()F

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    sub-float/2addr v1, v2

    .line 49
    invoke-virtual/range {p2 .. p2}, Ll/s5d0;->d()F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    add-float/2addr v1, v2

    .line 54
    move v6, v4

    .line 55
    goto :goto_0

    .line 56
    :goto_1
    invoke-virtual/range {p0 .. p0}, Ll/s5d0;->c()F

    .line 57
    .line 58
    .line 59
    move-result v10

    .line 60
    invoke-virtual/range {p0 .. p0}, Ll/s5d0;->d()F

    .line 61
    .line 62
    .line 63
    move-result v11

    .line 64
    invoke-virtual/range {p1 .. p1}, Ll/s5d0;->c()F

    .line 65
    .line 66
    .line 67
    move-result v12

    .line 68
    invoke-virtual/range {p1 .. p1}, Ll/s5d0;->d()F

    .line 69
    .line 70
    .line 71
    move-result v13

    .line 72
    invoke-virtual/range {p2 .. p2}, Ll/s5d0;->c()F

    .line 73
    .line 74
    .line 75
    move-result v16

    .line 76
    invoke-virtual/range {p2 .. p2}, Ll/s5d0;->d()F

    .line 77
    .line 78
    .line 79
    move-result v17

    .line 80
    const/high16 v2, 0x40600000    # 3.5f

    .line 81
    .line 82
    const/high16 v3, 0x40600000    # 3.5f

    .line 83
    .line 84
    const/high16 v5, 0x40600000    # 3.5f

    .line 85
    .line 86
    const/high16 v8, 0x40600000    # 3.5f

    .line 87
    .line 88
    move v7, v6

    .line 89
    move v9, v4

    .line 90
    invoke-static/range {v2 .. v17}, Ll/xw60;->b(FFFFFFFFFFFFFFFF)Ll/xw60;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    return-object v0
.end method

.method public static h(Ll/d13;Ll/xw60;I)Ll/d13;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/rdk;->b()Ll/rdk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0, p2, p2, p1}, Ll/rdk;->d(Ll/d13;IILl/xw60;)Ll/d13;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method


# virtual methods
.method public final a(Ll/s5d0;Ll/s5d0;Ll/s5d0;)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xyd;->b(Ll/s5d0;Ll/s5d0;)F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p0, p1, p3}, Ll/xyd;->b(Ll/s5d0;Ll/s5d0;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-float/2addr p2, p0

    .line 10
    const/high16 p0, 0x40000000    # 2.0f

    .line 11
    .line 12
    div-float/2addr p2, p0

    .line 13
    return p2
.end method

.method public final b(Ll/s5d0;Ll/s5d0;)F
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/s5d0;->c()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    float-to-int v0, v0

    .line 6
    invoke-virtual {p1}, Ll/s5d0;->d()F

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    float-to-int v1, v1

    .line 11
    invoke-virtual {p2}, Ll/s5d0;->c()F

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    float-to-int v2, v2

    .line 16
    invoke-virtual {p2}, Ll/s5d0;->d()F

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    float-to-int v3, v3

    .line 21
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/xyd;->j(IIII)F

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p2}, Ll/s5d0;->c()F

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    float-to-int v1, v1

    .line 30
    invoke-virtual {p2}, Ll/s5d0;->d()F

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    float-to-int p2, p2

    .line 35
    invoke-virtual {p1}, Ll/s5d0;->c()F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    float-to-int v2, v2

    .line 40
    invoke-virtual {p1}, Ll/s5d0;->d()F

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    float-to-int p1, p1

    .line 45
    invoke-virtual {p0, v1, p2, v2, p1}, Ll/xyd;->j(IIII)F

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    const/high16 p2, 0x40e00000    # 7.0f

    .line 54
    .line 55
    if-eqz p1, :cond_0

    .line 56
    .line 57
    div-float/2addr p0, p2

    .line 58
    return p0

    .line 59
    :cond_0
    invoke-static {p0}, Ljava/lang/Float;->isNaN(F)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_1

    .line 64
    .line 65
    div-float/2addr v0, p2

    .line 66
    return v0

    .line 67
    :cond_1
    add-float/2addr v0, p0

    .line 68
    const/high16 p0, 0x41600000    # 14.0f

    .line 69
    .line 70
    div-float/2addr v0, p0

    .line 71
    return v0
.end method

.method public final e(Ljava/util/Map;)Ll/dzd;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/dzd;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    sget-object v0, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    .line 6
    .line 7
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/t5d0;

    .line 12
    .line 13
    :goto_0
    iput-object v0, p0, Ll/xyd;->b:Ll/t5d0;

    .line 14
    .line 15
    new-instance v1, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;

    .line 16
    .line 17
    iget-object v2, p0, Ll/xyd;->a:Ll/d13;

    .line 18
    .line 19
    invoke-direct {v1, v2, v0}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Ll/d13;Ll/t5d0;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1, p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->f(Ljava/util/Map;)Ll/koi;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Ll/xyd;->g(Ll/koi;)Ll/dzd;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public final f(FIIF)Ll/ri0;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    mul-float/2addr p4, p1

    .line 2
    float-to-int p4, p4

    .line 3
    sub-int v0, p2, p4

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 7
    .line 8
    .line 9
    move-result v4

    .line 10
    iget-object v0, p0, Ll/xyd;->a:Ll/d13;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/d13;->m()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    add-int/lit8 v0, v0, -0x1

    .line 17
    .line 18
    add-int/2addr p2, p4

    .line 19
    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    sub-int v6, p2, v4

    .line 24
    .line 25
    int-to-float p2, v6

    .line 26
    const/high16 v0, 0x40400000    # 3.0f

    .line 27
    .line 28
    mul-float/2addr v0, p1

    .line 29
    cmpg-float p2, p2, v0

    .line 30
    .line 31
    if-ltz p2, :cond_1

    .line 32
    .line 33
    sub-int p2, p3, p4

    .line 34
    .line 35
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    iget-object p2, p0, Ll/xyd;->a:Ll/d13;

    .line 40
    .line 41
    invoke-virtual {p2}, Ll/d13;->j()I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    add-int/lit8 p2, p2, -0x1

    .line 46
    .line 47
    add-int/2addr p3, p4

    .line 48
    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    sub-int v7, p2, v5

    .line 53
    .line 54
    int-to-float p2, v7

    .line 55
    cmpg-float p2, p2, v0

    .line 56
    .line 57
    if-ltz p2, :cond_0

    .line 58
    .line 59
    new-instance v2, Ll/si0;

    .line 60
    .line 61
    iget-object v3, p0, Ll/xyd;->a:Ll/d13;

    .line 62
    .line 63
    iget-object v9, p0, Ll/xyd;->b:Ll/t5d0;

    .line 64
    .line 65
    move v8, p1

    .line 66
    invoke-direct/range {v2 .. v9}, Ll/si0;-><init>(Ll/d13;IIIIFLl/t5d0;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v2}, Ll/si0;->c()Ll/ri0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    throw p0

    .line 79
    :cond_1
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    throw p0
.end method

.method public final g(Ll/koi;)Ll/dzd;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/koi;->b()Ll/ioi;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/koi;->c()Ll/ioi;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Ll/koi;->a()Ll/ioi;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, v0, v1, p1}, Ll/xyd;->a(Ll/s5d0;Ll/s5d0;Ll/s5d0;)F

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/high16 v3, 0x3f800000    # 1.0f

    .line 18
    .line 19
    cmpg-float v4, v2, v3

    .line 20
    .line 21
    if-ltz v4, :cond_2

    .line 22
    .line 23
    invoke-static {v0, v1, p1, v2}, Ll/xyd;->c(Ll/s5d0;Ll/s5d0;Ll/s5d0;F)I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-static {v4}, Ll/o9l0;->g(I)Ll/o9l0;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-virtual {v5}, Ll/o9l0;->e()I

    .line 32
    .line 33
    .line 34
    move-result v6

    .line 35
    add-int/lit8 v6, v6, -0x7

    .line 36
    .line 37
    invoke-virtual {v5}, Ll/o9l0;->d()[I

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    array-length v5, v5

    .line 42
    const/4 v7, 0x4

    .line 43
    if-lez v5, :cond_0

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/s5d0;->c()F

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-virtual {v0}, Ll/s5d0;->c()F

    .line 50
    .line 51
    .line 52
    move-result v8

    .line 53
    sub-float/2addr v5, v8

    .line 54
    invoke-virtual {p1}, Ll/s5d0;->c()F

    .line 55
    .line 56
    .line 57
    move-result v8

    .line 58
    add-float/2addr v5, v8

    .line 59
    invoke-virtual {v1}, Ll/s5d0;->d()F

    .line 60
    .line 61
    .line 62
    move-result v8

    .line 63
    invoke-virtual {v0}, Ll/s5d0;->d()F

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    sub-float/2addr v8, v9

    .line 68
    invoke-virtual {p1}, Ll/s5d0;->d()F

    .line 69
    .line 70
    .line 71
    move-result v9

    .line 72
    add-float/2addr v8, v9

    .line 73
    const/high16 v9, 0x40400000    # 3.0f

    .line 74
    .line 75
    int-to-float v6, v6

    .line 76
    div-float/2addr v9, v6

    .line 77
    sub-float/2addr v3, v9

    .line 78
    invoke-virtual {v0}, Ll/s5d0;->c()F

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    invoke-virtual {v0}, Ll/s5d0;->c()F

    .line 83
    .line 84
    .line 85
    move-result v9

    .line 86
    sub-float/2addr v5, v9

    .line 87
    mul-float/2addr v5, v3

    .line 88
    add-float/2addr v6, v5

    .line 89
    float-to-int v5, v6

    .line 90
    invoke-virtual {v0}, Ll/s5d0;->d()F

    .line 91
    .line 92
    .line 93
    move-result v6

    .line 94
    invoke-virtual {v0}, Ll/s5d0;->d()F

    .line 95
    .line 96
    .line 97
    move-result v9

    .line 98
    sub-float/2addr v8, v9

    .line 99
    mul-float/2addr v3, v8

    .line 100
    add-float/2addr v6, v3

    .line 101
    float-to-int v3, v6

    .line 102
    move v6, v7

    .line 103
    :goto_0
    const/16 v8, 0x10

    .line 104
    .line 105
    if-gt v6, v8, :cond_0

    .line 106
    .line 107
    int-to-float v8, v6

    .line 108
    :try_start_0
    invoke-virtual {p0, v2, v5, v3, v8}, Ll/xyd;->f(FIIF)Ll/ri0;

    .line 109
    .line 110
    .line 111
    move-result-object v2
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 112
    goto :goto_1

    .line 113
    :catch_0
    shl-int/lit8 v6, v6, 0x1

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_0
    const/4 v2, 0x0

    .line 117
    :goto_1
    invoke-static {v0, v1, p1, v2, v4}, Ll/xyd;->d(Ll/s5d0;Ll/s5d0;Ll/s5d0;Ll/s5d0;I)Ll/xw60;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    iget-object p0, p0, Ll/xyd;->a:Ll/d13;

    .line 122
    .line 123
    invoke-static {p0, v3, v4}, Ll/xyd;->h(Ll/d13;Ll/xw60;I)Ll/d13;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const/4 v3, 0x2

    .line 128
    const/4 v4, 0x0

    .line 129
    const/4 v5, 0x3

    .line 130
    const/4 v6, 0x1

    .line 131
    if-nez v2, :cond_1

    .line 132
    .line 133
    new-array v2, v5, [Ll/s5d0;

    .line 134
    .line 135
    aput-object p1, v2, v4

    .line 136
    .line 137
    aput-object v0, v2, v6

    .line 138
    .line 139
    aput-object v1, v2, v3

    .line 140
    .line 141
    goto :goto_2

    .line 142
    :cond_1
    new-array v7, v7, [Ll/s5d0;

    .line 143
    .line 144
    aput-object p1, v7, v4

    .line 145
    .line 146
    aput-object v0, v7, v6

    .line 147
    .line 148
    aput-object v1, v7, v3

    .line 149
    .line 150
    aput-object v2, v7, v5

    .line 151
    .line 152
    move-object v2, v7

    .line 153
    :goto_2
    new-instance p1, Ll/dzd;

    .line 154
    .line 155
    invoke-direct {p1, p0, v2}, Ll/dzd;-><init>(Ll/d13;[Ll/s5d0;)V

    .line 156
    .line 157
    .line 158
    return-object p1

    .line 159
    :cond_2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    throw p0
.end method

.method public final i(IIII)F
    .locals 17

    .line 1
    sub-int v0, p4, p2

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sub-int v1, p3, p1

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v3, 0x1

    .line 14
    if-le v0, v1, :cond_0

    .line 15
    .line 16
    move v0, v3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    :goto_0
    if-eqz v0, :cond_1

    .line 20
    .line 21
    move/from16 v4, p1

    .line 22
    .line 23
    move/from16 v1, p2

    .line 24
    .line 25
    move/from16 v6, p3

    .line 26
    .line 27
    move/from16 v5, p4

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move/from16 v1, p1

    .line 31
    .line 32
    move/from16 v4, p2

    .line 33
    .line 34
    move/from16 v5, p3

    .line 35
    .line 36
    move/from16 v6, p4

    .line 37
    .line 38
    :goto_1
    sub-int v7, v5, v1

    .line 39
    .line 40
    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    .line 41
    .line 42
    .line 43
    move-result v7

    .line 44
    sub-int v8, v6, v4

    .line 45
    .line 46
    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    neg-int v9, v7

    .line 51
    const/4 v10, 0x2

    .line 52
    div-int/2addr v9, v10

    .line 53
    const/4 v11, -0x1

    .line 54
    if-ge v1, v5, :cond_2

    .line 55
    .line 56
    move v12, v3

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move v12, v11

    .line 59
    :goto_2
    if-ge v4, v6, :cond_3

    .line 60
    .line 61
    move v11, v3

    .line 62
    :cond_3
    add-int/2addr v5, v12

    .line 63
    move v13, v1

    .line 64
    move v14, v4

    .line 65
    const/4 v15, 0x0

    .line 66
    :goto_3
    if-eq v13, v5, :cond_b

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    move v2, v14

    .line 71
    goto :goto_4

    .line 72
    :cond_4
    move v2, v13

    .line 73
    :goto_4
    if-eqz v0, :cond_5

    .line 74
    .line 75
    move v10, v13

    .line 76
    goto :goto_5

    .line 77
    :cond_5
    move v10, v14

    .line 78
    :goto_5
    move/from16 v16, v0

    .line 79
    .line 80
    if-ne v15, v3, :cond_6

    .line 81
    .line 82
    move v0, v3

    .line 83
    move/from16 p2, v7

    .line 84
    .line 85
    move-object/from16 v3, p0

    .line 86
    .line 87
    goto :goto_6

    .line 88
    :cond_6
    const/4 v0, 0x0

    .line 89
    move-object/from16 v3, p0

    .line 90
    .line 91
    move/from16 p2, v7

    .line 92
    .line 93
    :goto_6
    iget-object v7, v3, Ll/xyd;->a:Ll/d13;

    .line 94
    .line 95
    invoke-virtual {v7, v2, v10}, Ll/d13;->d(II)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-ne v0, v2, :cond_8

    .line 100
    .line 101
    const/4 v0, 0x2

    .line 102
    if-ne v15, v0, :cond_7

    .line 103
    .line 104
    invoke-static {v13, v14, v1, v4}, Ll/ihx;->b(IIII)F

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    return v0

    .line 109
    :cond_7
    add-int/lit8 v15, v15, 0x1

    .line 110
    .line 111
    :cond_8
    add-int/2addr v9, v8

    .line 112
    if-lez v9, :cond_a

    .line 113
    .line 114
    if-eq v14, v6, :cond_9

    .line 115
    .line 116
    add-int/2addr v14, v11

    .line 117
    sub-int v9, v9, p2

    .line 118
    .line 119
    goto :goto_7

    .line 120
    :cond_9
    const/4 v0, 0x2

    .line 121
    goto :goto_8

    .line 122
    :cond_a
    :goto_7
    add-int/2addr v13, v12

    .line 123
    move/from16 v7, p2

    .line 124
    .line 125
    move/from16 v0, v16

    .line 126
    .line 127
    const/4 v3, 0x1

    .line 128
    const/4 v10, 0x2

    .line 129
    goto :goto_3

    .line 130
    :cond_b
    move v0, v10

    .line 131
    :goto_8
    if-ne v15, v0, :cond_c

    .line 132
    .line 133
    invoke-static {v5, v6, v1, v4}, Ll/ihx;->b(IIII)F

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    return v0

    .line 138
    :cond_c
    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 139
    .line 140
    return v0
.end method

.method public final j(IIII)F
    .locals 5

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/xyd;->i(IIII)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sub-int/2addr p3, p1

    .line 6
    sub-int p3, p1, p3

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    if-gez p3, :cond_0

    .line 12
    .line 13
    int-to-float v3, p1

    .line 14
    sub-int p3, p1, p3

    .line 15
    .line 16
    int-to-float p3, p3

    .line 17
    div-float/2addr v3, p3

    .line 18
    move p3, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v3, p0, Ll/xyd;->a:Ll/d13;

    .line 21
    .line 22
    invoke-virtual {v3}, Ll/d13;->m()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-lt p3, v3, :cond_1

    .line 27
    .line 28
    iget-object v3, p0, Ll/xyd;->a:Ll/d13;

    .line 29
    .line 30
    invoke-virtual {v3}, Ll/d13;->m()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    add-int/lit8 v3, v3, -0x1

    .line 35
    .line 36
    sub-int/2addr v3, p1

    .line 37
    int-to-float v3, v3

    .line 38
    sub-int/2addr p3, p1

    .line 39
    int-to-float p3, p3

    .line 40
    div-float/2addr v3, p3

    .line 41
    iget-object p3, p0, Ll/xyd;->a:Ll/d13;

    .line 42
    .line 43
    invoke-virtual {p3}, Ll/d13;->m()I

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    add-int/lit8 p3, p3, -0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    move v3, v2

    .line 51
    :goto_0
    int-to-float v4, p2

    .line 52
    sub-int/2addr p4, p2

    .line 53
    int-to-float p4, p4

    .line 54
    mul-float/2addr p4, v3

    .line 55
    sub-float p4, v4, p4

    .line 56
    .line 57
    float-to-int p4, p4

    .line 58
    if-gez p4, :cond_2

    .line 59
    .line 60
    sub-int p4, p2, p4

    .line 61
    .line 62
    int-to-float p4, p4

    .line 63
    div-float/2addr v4, p4

    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iget-object v1, p0, Ll/xyd;->a:Ll/d13;

    .line 66
    .line 67
    invoke-virtual {v1}, Ll/d13;->j()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-lt p4, v1, :cond_3

    .line 72
    .line 73
    iget-object v1, p0, Ll/xyd;->a:Ll/d13;

    .line 74
    .line 75
    invoke-virtual {v1}, Ll/d13;->j()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/lit8 v1, v1, -0x1

    .line 80
    .line 81
    sub-int/2addr v1, p2

    .line 82
    int-to-float v1, v1

    .line 83
    sub-int/2addr p4, p2

    .line 84
    int-to-float p4, p4

    .line 85
    div-float v4, v1, p4

    .line 86
    .line 87
    iget-object p4, p0, Ll/xyd;->a:Ll/d13;

    .line 88
    .line 89
    invoke-virtual {p4}, Ll/d13;->j()I

    .line 90
    .line 91
    .line 92
    move-result p4

    .line 93
    add-int/lit8 v1, p4, -0x1

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    move v1, p4

    .line 97
    move v4, v2

    .line 98
    :goto_1
    int-to-float p4, p1

    .line 99
    sub-int/2addr p3, p1

    .line 100
    int-to-float p3, p3

    .line 101
    mul-float/2addr p3, v4

    .line 102
    add-float/2addr p4, p3

    .line 103
    float-to-int p3, p4

    .line 104
    invoke-virtual {p0, p1, p2, p3, v1}, Ll/xyd;->i(IIII)F

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    add-float/2addr v0, p0

    .line 109
    sub-float/2addr v0, v2

    .line 110
    return v0
.end method
