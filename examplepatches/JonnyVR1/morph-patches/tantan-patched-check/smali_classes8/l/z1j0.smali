.class public Ll/z1j0;
.super Ll/hs10;
.source "SourceFile"


# instance fields
.field private a:[I

.field private b:[I

.field private c:[I

.field private d:[I


# direct methods
.method public constructor <init>([Landroid/graphics/Point;[Landroid/graphics/Point;[Landroid/graphics/Point;[Landroid/graphics/Point;)V
    .locals 8

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Ll/hs10;-><init>(I)V

    .line 3
    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/z1j0;->R1([Landroid/graphics/Point;)[F

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-direct {p0, p3}, Ll/z1j0;->R1([Landroid/graphics/Point;)[F

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    invoke-direct {p0, p2}, Ll/z1j0;->R1([Landroid/graphics/Point;)[F

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    invoke-direct {p0, p4}, Ll/z1j0;->R1([Landroid/graphics/Point;)[F

    .line 18
    .line 19
    .line 20
    move-result-object p4

    .line 21
    const/16 v0, 0x100

    .line 22
    .line 23
    new-array v1, v0, [I

    .line 24
    .line 25
    iput-object v1, p0, Ll/z1j0;->a:[I

    .line 26
    .line 27
    new-array v1, v0, [I

    .line 28
    .line 29
    iput-object v1, p0, Ll/z1j0;->b:[I

    .line 30
    .line 31
    new-array v1, v0, [I

    .line 32
    .line 33
    iput-object v1, p0, Ll/z1j0;->c:[I

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    :goto_0
    if-ge v1, v0, :cond_0

    .line 37
    .line 38
    iget-object v2, p0, Ll/z1j0;->a:[I

    .line 39
    .line 40
    int-to-float v3, v1

    .line 41
    aget v4, p1, v1

    .line 42
    .line 43
    add-float/2addr v4, v3

    .line 44
    aget v5, p4, v1

    .line 45
    .line 46
    add-float/2addr v4, v5

    .line 47
    const/4 v5, 0x0

    .line 48
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    const/high16 v6, 0x437f0000    # 255.0f

    .line 53
    .line 54
    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    float-to-int v4, v4

    .line 59
    aput v4, v2, v1

    .line 60
    .line 61
    iget-object v2, p0, Ll/z1j0;->b:[I

    .line 62
    .line 63
    aget v4, p2, v1

    .line 64
    .line 65
    add-float/2addr v4, v3

    .line 66
    aget v7, p4, v1

    .line 67
    .line 68
    add-float/2addr v4, v7

    .line 69
    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    float-to-int v4, v4

    .line 78
    aput v4, v2, v1

    .line 79
    .line 80
    iget-object v2, p0, Ll/z1j0;->c:[I

    .line 81
    .line 82
    aget v4, p3, v1

    .line 83
    .line 84
    add-float/2addr v3, v4

    .line 85
    aget v4, p4, v1

    .line 86
    .line 87
    add-float/2addr v3, v4

    .line 88
    invoke-static {v3, v5}, Ljava/lang/Math;->max(FF)F

    .line 89
    .line 90
    .line 91
    move-result v3

    .line 92
    invoke-static {v3, v6}, Ljava/lang/Math;->min(FF)F

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    float-to-int v3, v3

    .line 97
    aput v3, v2, v1

    .line 98
    .line 99
    add-int/lit8 v1, v1, 0x1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    return-void
.end method

.method private Q1()V
    .locals 12

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    if-ge v3, v0, :cond_0

    .line 8
    .line 9
    iget-object v4, p0, Ll/z1j0;->a:[I

    .line 10
    .line 11
    aget v4, v4, v3

    .line 12
    .line 13
    and-int/lit16 v4, v4, 0xff

    .line 14
    .line 15
    iget-object v5, p0, Ll/z1j0;->b:[I

    .line 16
    .line 17
    aget v5, v5, v3

    .line 18
    .line 19
    shl-int/lit8 v5, v5, 0x8

    .line 20
    .line 21
    const v6, 0xff00

    .line 22
    .line 23
    .line 24
    and-int/2addr v5, v6

    .line 25
    or-int/2addr v4, v5

    .line 26
    iget-object v5, p0, Ll/z1j0;->c:[I

    .line 27
    .line 28
    aget v5, v5, v3

    .line 29
    .line 30
    shl-int/lit8 v5, v5, 0x10

    .line 31
    .line 32
    const/high16 v6, 0xff0000

    .line 33
    .line 34
    and-int/2addr v5, v6

    .line 35
    or-int/2addr v4, v5

    .line 36
    const/high16 v5, -0x1000000

    .line 37
    .line 38
    or-int/2addr v4, v5

    .line 39
    aput v4, v1, v3

    .line 40
    .line 41
    add-int/lit8 v3, v3, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v0, 0x1

    .line 45
    new-array v3, v0, [I

    .line 46
    .line 47
    iput-object v3, p0, Ll/z1j0;->d:[I

    .line 48
    .line 49
    invoke-static {v0, v3, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/z1j0;->d:[I

    .line 53
    .line 54
    aget p0, p0, v2

    .line 55
    .line 56
    const/16 v0, 0xde1

    .line 57
    .line 58
    invoke-static {v0, p0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0x2801

    .line 62
    .line 63
    const/16 v2, 0x2600

    .line 64
    .line 65
    invoke-static {v0, p0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 66
    .line 67
    .line 68
    const/16 p0, 0x2800

    .line 69
    .line 70
    invoke-static {v0, p0, v2}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 71
    .line 72
    .line 73
    const/16 v10, 0x1401

    .line 74
    .line 75
    invoke-static {v1}, Ljava/nio/IntBuffer;->wrap([I)Ljava/nio/IntBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v11

    .line 79
    const/16 v3, 0xde1

    .line 80
    .line 81
    const/4 v4, 0x0

    .line 82
    const/16 v5, 0x1908

    .line 83
    .line 84
    const/16 v6, 0x100

    .line 85
    .line 86
    const/4 v7, 0x1

    .line 87
    const/4 v8, 0x0

    .line 88
    const/16 v9, 0x1908

    .line 89
    .line 90
    invoke-static/range {v3 .. v11}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private R1([Landroid/graphics/Point;)[F
    .locals 9

    .line 1
    new-instance v0, Ll/z1j0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/z1j0$a;-><init>(Ll/z1j0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, p1}, Ll/z1j0;->S1([Landroid/graphics/Point;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Landroid/graphics/Point;

    .line 19
    .line 20
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 21
    .line 22
    if-lez v0, :cond_0

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/graphics/Point;

    .line 29
    .line 30
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 31
    .line 32
    :goto_0
    if-ltz v0, :cond_0

    .line 33
    .line 34
    new-instance v1, Landroid/graphics/Point;

    .line 35
    .line 36
    invoke-direct {v1, v0, p1}, Landroid/graphics/Point;-><init>(II)V

    .line 37
    .line 38
    .line 39
    invoke-interface {p0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v0, v0, -0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/lit8 v0, v0, -0x1

    .line 50
    .line 51
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Landroid/graphics/Point;

    .line 56
    .line 57
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 58
    .line 59
    const/16 v1, 0xff

    .line 60
    .line 61
    if-ge v0, v1, :cond_1

    .line 62
    .line 63
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/lit8 v0, v0, -0x1

    .line 68
    .line 69
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/graphics/Point;

    .line 74
    .line 75
    iget v0, v0, Landroid/graphics/Point;->x:I

    .line 76
    .line 77
    :goto_1
    const/16 v2, 0x100

    .line 78
    .line 79
    if-ge v0, v2, :cond_1

    .line 80
    .line 81
    new-instance v2, Landroid/graphics/Point;

    .line 82
    .line 83
    invoke-direct {v2, v0, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 84
    .line 85
    .line 86
    invoke-interface {p0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    add-int/lit8 v0, v0, 0x1

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    new-array v0, v0, [F

    .line 97
    .line 98
    :goto_2
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-ge p1, v1, :cond_3

    .line 103
    .line 104
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Landroid/graphics/Point;

    .line 109
    .line 110
    new-instance v2, Landroid/graphics/Point;

    .line 111
    .line 112
    iget v3, v1, Landroid/graphics/Point;->x:I

    .line 113
    .line 114
    invoke-direct {v2, v3, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 115
    .line 116
    .line 117
    iget v3, v2, Landroid/graphics/Point;->x:I

    .line 118
    .line 119
    iget v4, v1, Landroid/graphics/Point;->x:I

    .line 120
    .line 121
    sub-int/2addr v3, v4

    .line 122
    int-to-double v3, v3

    .line 123
    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    .line 124
    .line 125
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 126
    .line 127
    .line 128
    move-result-wide v3

    .line 129
    iget v7, v2, Landroid/graphics/Point;->y:I

    .line 130
    .line 131
    iget v8, v1, Landroid/graphics/Point;->y:I

    .line 132
    .line 133
    sub-int/2addr v7, v8

    .line 134
    int-to-double v7, v7

    .line 135
    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 136
    .line 137
    .line 138
    move-result-wide v5

    .line 139
    add-double/2addr v3, v5

    .line 140
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 141
    .line 142
    .line 143
    move-result-wide v3

    .line 144
    double-to-float v3, v3

    .line 145
    iget v2, v2, Landroid/graphics/Point;->y:I

    .line 146
    .line 147
    iget v1, v1, Landroid/graphics/Point;->y:I

    .line 148
    .line 149
    if-le v2, v1, :cond_2

    .line 150
    .line 151
    neg-float v3, v3

    .line 152
    :cond_2
    aput v3, v0, p1

    .line 153
    .line 154
    add-int/lit8 p1, p1, 0x1

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_3
    return-object v0
.end method

.method private S1([Landroid/graphics/Point;)Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/graphics/Point;",
            ")",
            "Ljava/util/List<",
            "Landroid/graphics/Point;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-direct/range {p0 .. p1}, Ll/z1j0;->T1([Landroid/graphics/Point;)[D

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    array-length v2, v1

    .line 8
    const/4 v3, 0x1

    .line 9
    if-ge v2, v3, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    .line 14
    .line 15
    add-int/lit8 v5, v2, 0x1

    .line 16
    .line 17
    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 18
    .line 19
    .line 20
    const/4 v5, 0x0

    .line 21
    :goto_0
    add-int/lit8 v6, v2, -0x1

    .line 22
    .line 23
    if-ge v5, v6, :cond_4

    .line 24
    .line 25
    aget-object v6, v0, v5

    .line 26
    .line 27
    add-int/lit8 v7, v5, 0x1

    .line 28
    .line 29
    aget-object v8, v0, v7

    .line 30
    .line 31
    iget v9, v6, Landroid/graphics/Point;->x:I

    .line 32
    .line 33
    :goto_1
    iget v10, v8, Landroid/graphics/Point;->x:I

    .line 34
    .line 35
    if-ge v9, v10, :cond_3

    .line 36
    .line 37
    iget v11, v6, Landroid/graphics/Point;->x:I

    .line 38
    .line 39
    sub-int v12, v9, v11

    .line 40
    .line 41
    int-to-double v12, v12

    .line 42
    sub-int v14, v10, v11

    .line 43
    .line 44
    int-to-double v14, v14

    .line 45
    div-double/2addr v12, v14

    .line 46
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    .line 47
    .line 48
    sub-double/2addr v14, v12

    .line 49
    sub-int/2addr v10, v11

    .line 50
    int-to-double v10, v10

    .line 51
    move/from16 p0, v3

    .line 52
    .line 53
    iget v3, v6, Landroid/graphics/Point;->y:I

    .line 54
    .line 55
    move-object/from16 v16, v1

    .line 56
    .line 57
    move/from16 v17, v2

    .line 58
    .line 59
    int-to-double v1, v3

    .line 60
    mul-double/2addr v1, v14

    .line 61
    iget v3, v8, Landroid/graphics/Point;->y:I

    .line 62
    .line 63
    move-wide/from16 v18, v1

    .line 64
    .line 65
    int-to-double v1, v3

    .line 66
    mul-double/2addr v1, v12

    .line 67
    add-double v1, v18, v1

    .line 68
    .line 69
    mul-double/2addr v10, v10

    .line 70
    const-wide/high16 v18, 0x4018000000000000L    # 6.0

    .line 71
    .line 72
    div-double v10, v10, v18

    .line 73
    .line 74
    mul-double v18, v14, v14

    .line 75
    .line 76
    mul-double v18, v18, v14

    .line 77
    .line 78
    sub-double v18, v18, v14

    .line 79
    .line 80
    aget-wide v14, v16, v5

    .line 81
    .line 82
    mul-double v18, v18, v14

    .line 83
    .line 84
    mul-double v14, v12, v12

    .line 85
    .line 86
    mul-double/2addr v14, v12

    .line 87
    sub-double/2addr v14, v12

    .line 88
    aget-wide v12, v16, v7

    .line 89
    .line 90
    mul-double/2addr v14, v12

    .line 91
    add-double v18, v18, v14

    .line 92
    .line 93
    mul-double v10, v10, v18

    .line 94
    .line 95
    add-double/2addr v1, v10

    .line 96
    const-wide v10, 0x406fe00000000000L    # 255.0

    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    cmpl-double v3, v1, v10

    .line 102
    .line 103
    if-lez v3, :cond_1

    .line 104
    .line 105
    :goto_2
    move-wide v1, v10

    .line 106
    goto :goto_3

    .line 107
    :cond_1
    const-wide/16 v10, 0x0

    .line 108
    .line 109
    cmpg-double v3, v1, v10

    .line 110
    .line 111
    if-gez v3, :cond_2

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_2
    :goto_3
    new-instance v3, Landroid/graphics/Point;

    .line 115
    .line 116
    double-to-int v1, v1

    .line 117
    invoke-direct {v3, v9, v1}, Landroid/graphics/Point;-><init>(II)V

    .line 118
    .line 119
    .line 120
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    add-int/lit8 v9, v9, 0x1

    .line 124
    .line 125
    move/from16 v3, p0

    .line 126
    .line 127
    move-object/from16 v1, v16

    .line 128
    .line 129
    move/from16 v2, v17

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_3
    move v5, v7

    .line 133
    goto :goto_0

    .line 134
    :cond_4
    move/from16 p0, v3

    .line 135
    .line 136
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    const/16 v2, 0xff

    .line 141
    .line 142
    if-ne v1, v2, :cond_5

    .line 143
    .line 144
    array-length v1, v0

    .line 145
    add-int/lit8 v1, v1, -0x1

    .line 146
    .line 147
    aget-object v0, v0, v1

    .line 148
    .line 149
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    :cond_5
    return-object v4
.end method

.method private T1([Landroid/graphics/Point;)[D
    .locals 25

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-gt v1, v2, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    return-object v0

    .line 9
    :cond_0
    const/4 v3, 0x2

    .line 10
    new-array v4, v3, [I

    .line 11
    .line 12
    const/4 v5, 0x3

    .line 13
    aput v5, v4, v2

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    aput v1, v4, v5

    .line 17
    .line 18
    sget-object v6, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 19
    .line 20
    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    check-cast v4, [[D

    .line 25
    .line 26
    new-array v6, v1, [D

    .line 27
    .line 28
    aget-object v7, v4, v5

    .line 29
    .line 30
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    .line 31
    .line 32
    aput-wide v8, v7, v2

    .line 33
    .line 34
    const-wide/16 v10, 0x0

    .line 35
    .line 36
    aput-wide v10, v7, v5

    .line 37
    .line 38
    aput-wide v10, v7, v3

    .line 39
    .line 40
    move v7, v2

    .line 41
    :goto_0
    add-int/lit8 v12, v1, -0x1

    .line 42
    .line 43
    if-ge v7, v12, :cond_1

    .line 44
    .line 45
    add-int/lit8 v12, v7, -0x1

    .line 46
    .line 47
    aget-object v12, v0, v12

    .line 48
    .line 49
    aget-object v13, v0, v7

    .line 50
    .line 51
    add-int/lit8 v14, v7, 0x1

    .line 52
    .line 53
    aget-object v15, v0, v14

    .line 54
    .line 55
    aget-object v16, v4, v7

    .line 56
    .line 57
    move/from16 p0, v2

    .line 58
    .line 59
    iget v2, v13, Landroid/graphics/Point;->x:I

    .line 60
    .line 61
    move/from16 v17, v3

    .line 62
    .line 63
    iget v3, v12, Landroid/graphics/Point;->x:I

    .line 64
    .line 65
    move/from16 v18, v5

    .line 66
    .line 67
    sub-int v5, v2, v3

    .line 68
    .line 69
    move-wide/from16 v19, v8

    .line 70
    .line 71
    int-to-double v8, v5

    .line 72
    const-wide/high16 v21, 0x4018000000000000L    # 6.0

    .line 73
    .line 74
    div-double v8, v8, v21

    .line 75
    .line 76
    aput-wide v8, v16, v18

    .line 77
    .line 78
    iget v5, v15, Landroid/graphics/Point;->x:I

    .line 79
    .line 80
    sub-int v8, v5, v3

    .line 81
    .line 82
    int-to-double v8, v8

    .line 83
    const-wide/high16 v23, 0x4008000000000000L    # 3.0

    .line 84
    .line 85
    div-double v8, v8, v23

    .line 86
    .line 87
    aput-wide v8, v16, p0

    .line 88
    .line 89
    sub-int v8, v5, v2

    .line 90
    .line 91
    int-to-double v8, v8

    .line 92
    div-double v8, v8, v21

    .line 93
    .line 94
    aput-wide v8, v16, v17

    .line 95
    .line 96
    iget v8, v15, Landroid/graphics/Point;->y:I

    .line 97
    .line 98
    iget v9, v13, Landroid/graphics/Point;->y:I

    .line 99
    .line 100
    sub-int/2addr v8, v9

    .line 101
    move-wide v15, v10

    .line 102
    int-to-double v10, v8

    .line 103
    sub-int/2addr v5, v2

    .line 104
    move v8, v2

    .line 105
    move v13, v3

    .line 106
    int-to-double v2, v5

    .line 107
    div-double/2addr v10, v2

    .line 108
    iget v2, v12, Landroid/graphics/Point;->y:I

    .line 109
    .line 110
    sub-int/2addr v9, v2

    .line 111
    int-to-double v2, v9

    .line 112
    sub-int v5, v8, v13

    .line 113
    .line 114
    int-to-double v8, v5

    .line 115
    div-double/2addr v2, v8

    .line 116
    sub-double/2addr v10, v2

    .line 117
    aput-wide v10, v6, v7

    .line 118
    .line 119
    move/from16 v2, p0

    .line 120
    .line 121
    move v7, v14

    .line 122
    move-wide v10, v15

    .line 123
    move/from16 v3, v17

    .line 124
    .line 125
    move/from16 v5, v18

    .line 126
    .line 127
    move-wide/from16 v8, v19

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_1
    move/from16 p0, v2

    .line 131
    .line 132
    move/from16 v17, v3

    .line 133
    .line 134
    move/from16 v18, v5

    .line 135
    .line 136
    move-wide/from16 v19, v8

    .line 137
    .line 138
    move-wide v15, v10

    .line 139
    aput-wide v15, v6, v18

    .line 140
    .line 141
    aput-wide v15, v6, v12

    .line 142
    .line 143
    aget-object v0, v4, v12

    .line 144
    .line 145
    aput-wide v19, v0, p0

    .line 146
    .line 147
    aput-wide v15, v0, v18

    .line 148
    .line 149
    aput-wide v15, v0, v17

    .line 150
    .line 151
    move/from16 v0, p0

    .line 152
    .line 153
    :goto_1
    if-ge v0, v1, :cond_2

    .line 154
    .line 155
    aget-object v2, v4, v0

    .line 156
    .line 157
    aget-wide v7, v2, v18

    .line 158
    .line 159
    add-int/lit8 v3, v0, -0x1

    .line 160
    .line 161
    aget-object v5, v4, v3

    .line 162
    .line 163
    aget-wide v9, v5, p0

    .line 164
    .line 165
    div-double/2addr v7, v9

    .line 166
    aget-wide v9, v2, p0

    .line 167
    .line 168
    aget-wide v11, v5, v17

    .line 169
    .line 170
    mul-double/2addr v11, v7

    .line 171
    sub-double/2addr v9, v11

    .line 172
    aput-wide v9, v2, p0

    .line 173
    .line 174
    aput-wide v15, v2, v18

    .line 175
    .line 176
    aget-wide v9, v6, v0

    .line 177
    .line 178
    aget-wide v2, v6, v3

    .line 179
    .line 180
    mul-double/2addr v7, v2

    .line 181
    sub-double/2addr v9, v7

    .line 182
    aput-wide v9, v6, v0

    .line 183
    .line 184
    add-int/lit8 v0, v0, 0x1

    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_2
    add-int/lit8 v0, v1, -0x2

    .line 188
    .line 189
    :goto_2
    if-ltz v0, :cond_3

    .line 190
    .line 191
    aget-object v2, v4, v0

    .line 192
    .line 193
    aget-wide v7, v2, v17

    .line 194
    .line 195
    add-int/lit8 v3, v0, 0x1

    .line 196
    .line 197
    aget-object v5, v4, v3

    .line 198
    .line 199
    aget-wide v9, v5, p0

    .line 200
    .line 201
    div-double/2addr v7, v9

    .line 202
    aget-wide v9, v2, p0

    .line 203
    .line 204
    aget-wide v11, v5, v18

    .line 205
    .line 206
    mul-double/2addr v11, v7

    .line 207
    sub-double/2addr v9, v11

    .line 208
    aput-wide v9, v2, p0

    .line 209
    .line 210
    aput-wide v15, v2, v17

    .line 211
    .line 212
    aget-wide v9, v6, v0

    .line 213
    .line 214
    aget-wide v2, v6, v3

    .line 215
    .line 216
    mul-double/2addr v7, v2

    .line 217
    sub-double/2addr v9, v7

    .line 218
    aput-wide v9, v6, v0

    .line 219
    .line 220
    add-int/lit8 v0, v0, -0x1

    .line 221
    .line 222
    goto :goto_2

    .line 223
    :cond_3
    new-array v0, v1, [D

    .line 224
    .line 225
    move/from16 v5, v18

    .line 226
    .line 227
    :goto_3
    if-ge v5, v1, :cond_4

    .line 228
    .line 229
    aget-wide v2, v6, v5

    .line 230
    .line 231
    aget-object v7, v4, v5

    .line 232
    .line 233
    aget-wide v8, v7, p0

    .line 234
    .line 235
    div-double/2addr v2, v8

    .line 236
    aput-wide v2, v0, v5

    .line 237
    .line 238
    add-int/lit8 v5, v5, 0x1

    .line 239
    .line 240
    goto :goto_3

    .line 241
    :cond_4
    return-object v0
.end method


# virtual methods
.method public destroy()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/hs10;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/z1j0;->d:[I

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget v2, v0, v1

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    const/4 v2, 0x1

    .line 14
    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/z1j0;->d:[I

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision mediump float;\nuniform sampler2D inputImageTexture0;\nuniform sampler2D inputImageTexture1;\nvarying vec2 textureCoordinate;\nconst float halfPixelWidth = 1.0/512.0;void main(){\n   vec4 texColour = texture2D(inputImageTexture0,textureCoordinate);\n   float rVal;\n   if(texColour.r < halfPixelWidth) {     rVal = texture2D(inputImageTexture1, vec2(texColour.r + halfPixelWidth, 0.5)).r;\n   } else {\n     rVal = texture2D(inputImageTexture1, vec2(texColour.r - halfPixelWidth, 0.5)).r;\n   }\n   float gVal;\n   if(texColour.g < halfPixelWidth) {     gVal = texture2D(inputImageTexture1, vec2(texColour.g + halfPixelWidth, 0.5)).r;\n   } else {\n     gVal = texture2D(inputImageTexture1, vec2(texColour.g - halfPixelWidth, 0.5)).r;\n   }\n   float bVal;\n   if(texColour.b < halfPixelWidth) {     bVal = texture2D(inputImageTexture1, vec2(texColour.b + halfPixelWidth, 0.5)).r;\n   } else {\n     bVal = texture2D(inputImageTexture1, vec2(texColour.b - halfPixelWidth, 0.5)).r;\n   }\n   gl_FragColor = vec4(rVal,gVal,bVal,texColour.a);\n}\n"

    .line 2
    .line 3
    return-object p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x0

    .line 9
    if-lt v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/hs10;->filterLocations:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p0}, Ll/hs10;->clearRegisteredFilterLocations()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p2, v2}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0, p0, v0}, Ll/hs10;->registerFilterLocation(Ll/gfj;I)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Ll/z1j0;->d:[I

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    aget v0, v0, v2

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    :cond_2
    invoke-direct {p0}, Ll/z1j0;->Q1()V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object v0, p0, Ll/z1j0;->d:[I

    .line 45
    .line 46
    aget v0, v0, v2

    .line 47
    .line 48
    invoke-super {p0, v0, p0, p3}, Ll/hs10;->newTextureReady(ILl/gfj;Z)V

    .line 49
    .line 50
    .line 51
    invoke-super {p0, p1, p2, p3}, Ll/hs10;->newTextureReady(ILl/gfj;Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
