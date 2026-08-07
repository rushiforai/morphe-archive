.class public final Ll/wyd;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[I

.field public static final b:[I

.field public static final c:[I

.field public static final d:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x5

    .line 3
    const/4 v2, 0x0

    .line 4
    const/4 v3, 0x4

    .line 5
    filled-new-array {v2, v3, v0, v1}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/wyd;->a:[I

    .line 10
    .line 11
    const/4 v0, 0x7

    .line 12
    const/4 v1, 0x3

    .line 13
    const/4 v2, 0x6

    .line 14
    const/4 v3, 0x2

    .line 15
    filled-new-array {v2, v3, v0, v1}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    sput-object v0, Ll/wyd;->b:[I

    .line 20
    .line 21
    const/16 v0, 0x8

    .line 22
    .line 23
    new-array v0, v0, [I

    .line 24
    .line 25
    fill-array-data v0, :array_0

    .line 26
    .line 27
    .line 28
    sput-object v0, Ll/wyd;->c:[I

    .line 29
    .line 30
    const/16 v0, 0x9

    .line 31
    .line 32
    new-array v0, v0, [I

    .line 33
    .line 34
    fill-array-data v0, :array_1

    .line 35
    .line 36
    .line 37
    sput-object v0, Ll/wyd;->d:[I

    .line 38
    .line 39
    return-void

    .line 40
    nop

    .line 41
    :array_0
    .array-data 4
        0x8
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x3
    .end array-data

    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    :array_1
    .array-data 4
        0x7
        0x1
        0x1
        0x3
        0x1
        0x1
        0x1
        0x2
        0x1
    .end array-data
.end method

.method public static a([Ll/s5d0;[Ll/s5d0;[I)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p2

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    aget v1, p2, v0

    .line 6
    .line 7
    aget-object v2, p1, v0

    .line 8
    .line 9
    aput-object v2, p0, v1

    .line 10
    .line 11
    add-int/lit8 v0, v0, 0x1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void
.end method

.method public static b(ZLl/d13;)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ll/d13;",
            ")",
            "Ljava/util/List<",
            "[",
            "Ll/s5d0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    move v3, v2

    .line 9
    :goto_0
    move v4, v3

    .line 10
    :goto_1
    invoke-virtual {p1}, Ll/d13;->j()I

    .line 11
    .line 12
    .line 13
    move-result v5

    .line 14
    if-ge v2, v5, :cond_5

    .line 15
    .line 16
    invoke-static {p1, v2, v3}, Ll/wyd;->f(Ll/d13;II)[Ll/s5d0;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    aget-object v5, v3, v1

    .line 21
    .line 22
    const/4 v6, 0x1

    .line 23
    if-nez v5, :cond_3

    .line 24
    .line 25
    const/4 v5, 0x3

    .line 26
    aget-object v7, v3, v5

    .line 27
    .line 28
    if-nez v7, :cond_3

    .line 29
    .line 30
    if-eqz v4, :cond_5

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    :cond_0
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    check-cast v4, [Ll/s5d0;

    .line 47
    .line 48
    aget-object v7, v4, v6

    .line 49
    .line 50
    if-eqz v7, :cond_1

    .line 51
    .line 52
    int-to-float v2, v2

    .line 53
    invoke-virtual {v7}, Ll/s5d0;->d()F

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    invoke-static {v2, v7}, Ljava/lang/Math;->max(FF)F

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    float-to-int v2, v2

    .line 62
    :cond_1
    aget-object v4, v4, v5

    .line 63
    .line 64
    if-eqz v4, :cond_0

    .line 65
    .line 66
    invoke-virtual {v4}, Ll/s5d0;->d()F

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    float-to-int v4, v4

    .line 71
    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    goto :goto_2

    .line 76
    :cond_2
    add-int/lit8 v2, v2, 0x5

    .line 77
    .line 78
    move v3, v1

    .line 79
    goto :goto_0

    .line 80
    :cond_3
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    const/4 v2, 0x2

    .line 86
    aget-object v4, v3, v2

    .line 87
    .line 88
    if-eqz v4, :cond_4

    .line 89
    .line 90
    invoke-virtual {v4}, Ll/s5d0;->c()F

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    float-to-int v4, v4

    .line 95
    aget-object v2, v3, v2

    .line 96
    .line 97
    invoke-virtual {v2}, Ll/s5d0;->d()F

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    :goto_3
    float-to-int v2, v2

    .line 102
    move v3, v4

    .line 103
    move v4, v6

    .line 104
    goto :goto_1

    .line 105
    :cond_4
    const/4 v2, 0x4

    .line 106
    aget-object v4, v3, v2

    .line 107
    .line 108
    invoke-virtual {v4}, Ll/s5d0;->c()F

    .line 109
    .line 110
    .line 111
    move-result v4

    .line 112
    float-to-int v4, v4

    .line 113
    aget-object v2, v3, v2

    .line 114
    .line 115
    invoke-virtual {v2}, Ll/s5d0;->d()F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    goto :goto_3

    .line 120
    :cond_5
    return-object v0
.end method

.method public static c(Ll/cy2;Ljava/util/Map;Z)Ll/x860;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cy2;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;Z)",
            "Ll/x860;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/cy2;->a()Ll/d13;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p2, p0}, Ll/wyd;->b(ZLl/d13;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/d13;->b()Ll/d13;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/d13;->n()V

    .line 20
    .line 21
    .line 22
    invoke-static {p2, p0}, Ll/wyd;->b(ZLl/d13;)Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    :cond_0
    new-instance p2, Ll/x860;

    .line 27
    .line 28
    invoke-direct {p2, p0, p1}, Ll/x860;-><init>(Ll/d13;Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    return-object p2
.end method

.method public static d(Ll/d13;IIIZ[I[I)[I
    .locals 8

    .line 1
    array-length v0, p6

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {p6, v1, v0, v1}, Ljava/util/Arrays;->fill([IIII)V

    .line 4
    .line 5
    .line 6
    move v0, v1

    .line 7
    :goto_0
    invoke-virtual {p0, p1, p2}, Ll/d13;->d(II)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    add-int/lit8 v2, v0, 0x1

    .line 16
    .line 17
    const/4 v3, 0x3

    .line 18
    if-ge v0, v3, :cond_0

    .line 19
    .line 20
    add-int/lit8 p1, p1, -0x1

    .line 21
    .line 22
    move v0, v2

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    array-length v0, p5

    .line 25
    move v2, p4

    .line 26
    move v3, v1

    .line 27
    move p4, p1

    .line 28
    :goto_1
    const v4, 0x3ed70a3d    # 0.42f

    .line 29
    .line 30
    .line 31
    const v5, 0x3f4ccccd    # 0.8f

    .line 32
    .line 33
    .line 34
    const/4 v6, 0x1

    .line 35
    if-ge p1, p3, :cond_4

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2}, Ll/d13;->d(II)Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eq v7, v2, :cond_1

    .line 42
    .line 43
    aget v4, p6, v3

    .line 44
    .line 45
    add-int/2addr v4, v6

    .line 46
    aput v4, p6, v3

    .line 47
    .line 48
    goto :goto_3

    .line 49
    :cond_1
    add-int/lit8 v7, v0, -0x1

    .line 50
    .line 51
    if-ne v3, v7, :cond_3

    .line 52
    .line 53
    invoke-static {p6, p5, v5}, Ll/wyd;->g([I[IF)F

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    cmpg-float v4, v5, v4

    .line 58
    .line 59
    if-gez v4, :cond_2

    .line 60
    .line 61
    filled-new-array {p4, p1}, [I

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_2
    aget v4, p6, v1

    .line 67
    .line 68
    aget v5, p6, v6

    .line 69
    .line 70
    add-int/2addr v4, v5

    .line 71
    add-int/2addr p4, v4

    .line 72
    add-int/lit8 v4, v3, -0x1

    .line 73
    .line 74
    const/4 v5, 0x2

    .line 75
    invoke-static {p6, v5, p6, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 76
    .line 77
    .line 78
    aput v1, p6, v4

    .line 79
    .line 80
    aput v1, p6, v3

    .line 81
    .line 82
    add-int/lit8 v3, v3, -0x1

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    add-int/lit8 v3, v3, 0x1

    .line 86
    .line 87
    :goto_2
    aput v6, p6, v3

    .line 88
    .line 89
    xor-int/lit8 v2, v2, 0x1

    .line 90
    .line 91
    :goto_3
    add-int/lit8 p1, p1, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    sub-int/2addr v0, v6

    .line 95
    if-ne v3, v0, :cond_5

    .line 96
    .line 97
    invoke-static {p6, p5, v5}, Ll/wyd;->g([I[IF)F

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    cmpg-float p0, p0, v4

    .line 102
    .line 103
    if-gez p0, :cond_5

    .line 104
    .line 105
    sub-int/2addr p1, v6

    .line 106
    filled-new-array {p4, p1}, [I

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0

    .line 111
    :cond_5
    const/4 p0, 0x0

    .line 112
    return-object p0
.end method

.method public static e(Ll/d13;IIII[I)[Ll/s5d0;
    .locals 15

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    new-array v1, v1, [Ll/s5d0;

    .line 5
    .line 6
    move-object/from16 v7, p5

    .line 7
    .line 8
    array-length v2, v7

    .line 9
    new-array v8, v2, [I

    .line 10
    .line 11
    move/from16 v4, p3

    .line 12
    .line 13
    :goto_0
    const/4 v9, 0x1

    .line 14
    const/4 v10, 0x0

    .line 15
    if-ge v4, v0, :cond_2

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    move-object v2, p0

    .line 19
    move/from16 v5, p2

    .line 20
    .line 21
    move/from16 v3, p4

    .line 22
    .line 23
    invoke-static/range {v2 .. v8}, Ll/wyd;->d(Ll/d13;IIIZ[I[I)[I

    .line 24
    .line 25
    .line 26
    move-result-object v6

    .line 27
    if-eqz v6, :cond_1

    .line 28
    .line 29
    :goto_1
    move v11, v4

    .line 30
    move-object v12, v6

    .line 31
    if-lez v11, :cond_0

    .line 32
    .line 33
    add-int/lit8 v4, v11, -0x1

    .line 34
    .line 35
    const/4 v6, 0x0

    .line 36
    move-object v2, p0

    .line 37
    move/from16 v5, p2

    .line 38
    .line 39
    move/from16 v3, p4

    .line 40
    .line 41
    move-object/from16 v7, p5

    .line 42
    .line 43
    invoke-static/range {v2 .. v8}, Ll/wyd;->d(Ll/d13;IIIZ[I[I)[I

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    if-eqz v6, :cond_0

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_0
    new-instance v2, Ll/s5d0;

    .line 51
    .line 52
    aget v3, v12, v10

    .line 53
    .line 54
    int-to-float v3, v3

    .line 55
    int-to-float v4, v11

    .line 56
    invoke-direct {v2, v3, v4}, Ll/s5d0;-><init>(FF)V

    .line 57
    .line 58
    .line 59
    aput-object v2, v1, v10

    .line 60
    .line 61
    new-instance v2, Ll/s5d0;

    .line 62
    .line 63
    aget v3, v12, v9

    .line 64
    .line 65
    int-to-float v3, v3

    .line 66
    invoke-direct {v2, v3, v4}, Ll/s5d0;-><init>(FF)V

    .line 67
    .line 68
    .line 69
    aput-object v2, v1, v9

    .line 70
    .line 71
    move v2, v9

    .line 72
    goto :goto_2

    .line 73
    :cond_1
    add-int/lit8 v4, v4, 0x5

    .line 74
    .line 75
    move-object/from16 v7, p5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    move v11, v4

    .line 79
    move v2, v10

    .line 80
    :goto_2
    add-int/lit8 v3, v11, 0x1

    .line 81
    .line 82
    if-eqz v2, :cond_5

    .line 83
    .line 84
    const/4 v12, 0x2

    .line 85
    new-array v2, v12, [I

    .line 86
    .line 87
    aget-object v4, v1, v10

    .line 88
    .line 89
    invoke-virtual {v4}, Ll/s5d0;->c()F

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    float-to-int v4, v4

    .line 94
    aput v4, v2, v10

    .line 95
    .line 96
    aget-object v4, v1, v9

    .line 97
    .line 98
    invoke-virtual {v4}, Ll/s5d0;->c()F

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    float-to-int v4, v4

    .line 103
    aput v4, v2, v9

    .line 104
    .line 105
    move-object v13, v2

    .line 106
    move v4, v3

    .line 107
    move v14, v10

    .line 108
    :goto_3
    if-ge v4, v0, :cond_4

    .line 109
    .line 110
    aget v3, v13, v10

    .line 111
    .line 112
    const/4 v6, 0x0

    .line 113
    move-object v2, p0

    .line 114
    move/from16 v5, p2

    .line 115
    .line 116
    move-object/from16 v7, p5

    .line 117
    .line 118
    invoke-static/range {v2 .. v8}, Ll/wyd;->d(Ll/d13;IIIZ[I[I)[I

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    if-eqz v3, :cond_3

    .line 123
    .line 124
    aget v2, v13, v10

    .line 125
    .line 126
    aget v5, v3, v10

    .line 127
    .line 128
    sub-int/2addr v2, v5

    .line 129
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    const/4 v5, 0x5

    .line 134
    if-ge v2, v5, :cond_3

    .line 135
    .line 136
    aget v2, v13, v9

    .line 137
    .line 138
    aget v6, v3, v9

    .line 139
    .line 140
    sub-int/2addr v2, v6

    .line 141
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-ge v2, v5, :cond_3

    .line 146
    .line 147
    move-object v13, v3

    .line 148
    move v14, v10

    .line 149
    goto :goto_4

    .line 150
    :cond_3
    const/16 v2, 0x19

    .line 151
    .line 152
    if-gt v14, v2, :cond_4

    .line 153
    .line 154
    add-int/lit8 v14, v14, 0x1

    .line 155
    .line 156
    :goto_4
    add-int/lit8 v4, v4, 0x1

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_4
    add-int/2addr v14, v9

    .line 160
    sub-int v3, v4, v14

    .line 161
    .line 162
    new-instance p0, Ll/s5d0;

    .line 163
    .line 164
    aget v0, v13, v10

    .line 165
    .line 166
    int-to-float v0, v0

    .line 167
    int-to-float v2, v3

    .line 168
    invoke-direct {p0, v0, v2}, Ll/s5d0;-><init>(FF)V

    .line 169
    .line 170
    .line 171
    aput-object p0, v1, v12

    .line 172
    .line 173
    new-instance p0, Ll/s5d0;

    .line 174
    .line 175
    aget v0, v13, v9

    .line 176
    .line 177
    int-to-float v0, v0

    .line 178
    invoke-direct {p0, v0, v2}, Ll/s5d0;-><init>(FF)V

    .line 179
    .line 180
    .line 181
    const/4 v0, 0x3

    .line 182
    aput-object p0, v1, v0

    .line 183
    .line 184
    :cond_5
    sub-int/2addr v3, v11

    .line 185
    const/16 p0, 0xa

    .line 186
    .line 187
    if-ge v3, p0, :cond_6

    .line 188
    .line 189
    const/4 p0, 0x0

    .line 190
    invoke-static {v1, p0}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    .line 192
    .line 193
    :cond_6
    return-object v1
.end method

.method public static f(Ll/d13;II)[Ll/s5d0;
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/d13;->j()I

    .line 2
    .line 3
    .line 4
    move-result v1

    .line 5
    invoke-virtual {p0}, Ll/d13;->m()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    new-array v6, v0, [Ll/s5d0;

    .line 12
    .line 13
    sget-object v5, Ll/wyd;->c:[I

    .line 14
    .line 15
    move-object v0, p0

    .line 16
    move v3, p1

    .line 17
    move v4, p2

    .line 18
    invoke-static/range {v0 .. v5}, Ll/wyd;->e(Ll/d13;IIII[I)[Ll/s5d0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p1, Ll/wyd;->a:[I

    .line 23
    .line 24
    invoke-static {v6, p0, p1}, Ll/wyd;->a([Ll/s5d0;[Ll/s5d0;[I)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x4

    .line 28
    aget-object p1, v6, p0

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/s5d0;->c()F

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    float-to-int p2, p1

    .line 37
    aget-object p0, v6, p0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/s5d0;->d()F

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    float-to-int p1, p0

    .line 44
    move v3, p1

    .line 45
    move v4, p2

    .line 46
    :cond_0
    sget-object v5, Ll/wyd;->d:[I

    .line 47
    .line 48
    invoke-static/range {v0 .. v5}, Ll/wyd;->e(Ll/d13;IIII[I)[Ll/s5d0;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget-object p1, Ll/wyd;->b:[I

    .line 53
    .line 54
    invoke-static {v6, p0, p1}, Ll/wyd;->a([Ll/s5d0;[Ll/s5d0;[I)V

    .line 55
    .line 56
    .line 57
    return-object v6
.end method

.method public static g([I[IF)F
    .locals 9

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    move v4, v3

    .line 6
    :goto_0
    if-ge v2, v0, :cond_0

    .line 7
    .line 8
    aget v5, p0, v2

    .line 9
    .line 10
    add-int/2addr v3, v5

    .line 11
    aget v5, p1, v2

    .line 12
    .line 13
    add-int/2addr v4, v5

    .line 14
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/high16 v2, 0x7f800000    # Float.POSITIVE_INFINITY

    .line 18
    .line 19
    if-ge v3, v4, :cond_1

    .line 20
    .line 21
    return v2

    .line 22
    :cond_1
    int-to-float v3, v3

    .line 23
    int-to-float v4, v4

    .line 24
    div-float v4, v3, v4

    .line 25
    .line 26
    mul-float/2addr p2, v4

    .line 27
    const/4 v5, 0x0

    .line 28
    :goto_1
    if-ge v1, v0, :cond_4

    .line 29
    .line 30
    aget v6, p0, v1

    .line 31
    .line 32
    aget v7, p1, v1

    .line 33
    .line 34
    int-to-float v7, v7

    .line 35
    mul-float/2addr v7, v4

    .line 36
    int-to-float v6, v6

    .line 37
    cmpl-float v8, v6, v7

    .line 38
    .line 39
    if-lez v8, :cond_2

    .line 40
    .line 41
    sub-float/2addr v6, v7

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    sub-float v6, v7, v6

    .line 44
    .line 45
    :goto_2
    cmpl-float v7, v6, p2

    .line 46
    .line 47
    if-lez v7, :cond_3

    .line 48
    .line 49
    return v2

    .line 50
    :cond_3
    add-float/2addr v5, v6

    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_4
    div-float/2addr v5, v3

    .line 55
    return v5
.end method
