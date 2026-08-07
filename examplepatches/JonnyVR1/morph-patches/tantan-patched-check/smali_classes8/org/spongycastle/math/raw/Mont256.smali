.class public abstract Lorg/spongycastle/math/raw/Mont256;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M:J = 0xffffffffL


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

.method public static inverse32(I)I
    .locals 2

    mul-int v0, p0, p0

    rsub-int/lit8 v0, v0, 0x2

    mul-int/2addr v0, p0

    mul-int v1, p0, v0

    rsub-int/lit8 v1, v1, 0x2

    mul-int/2addr v0, v1

    mul-int v1, p0, v0

    rsub-int/lit8 v1, v1, 0x2

    mul-int/2addr v0, v1

    mul-int/2addr p0, v0

    rsub-int/lit8 p0, p0, 0x2

    mul-int/2addr v0, p0

    return v0
.end method

.method public static multAdd([I[I[I[II)V
    .locals 28

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget v3, p1, v2

    .line 7
    .line 8
    int-to-long v3, v3

    .line 9
    const-wide v5, 0xffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    and-long/2addr v3, v5

    .line 15
    move v7, v2

    .line 16
    move v8, v7

    .line 17
    :goto_0
    const/16 v9, 0x8

    .line 18
    .line 19
    if-ge v7, v9, :cond_1

    .line 20
    .line 21
    aget v10, v0, v2

    .line 22
    .line 23
    int-to-long v10, v10

    .line 24
    and-long/2addr v10, v5

    .line 25
    aget v12, p0, v7

    .line 26
    .line 27
    int-to-long v12, v12

    .line 28
    and-long/2addr v12, v5

    .line 29
    mul-long v14, v12, v3

    .line 30
    .line 31
    and-long v16, v14, v5

    .line 32
    .line 33
    add-long v10, v16, v10

    .line 34
    .line 35
    move/from16 v16, v2

    .line 36
    .line 37
    long-to-int v2, v10

    .line 38
    mul-int v2, v2, p4

    .line 39
    .line 40
    move-wide/from16 v17, v5

    .line 41
    .line 42
    int-to-long v5, v2

    .line 43
    and-long v5, v5, v17

    .line 44
    .line 45
    aget v2, v1, v16

    .line 46
    .line 47
    move-wide/from16 v20, v10

    .line 48
    .line 49
    int-to-long v9, v2

    .line 50
    and-long v9, v9, v17

    .line 51
    .line 52
    mul-long/2addr v9, v5

    .line 53
    and-long v22, v9, v17

    .line 54
    .line 55
    add-long v20, v20, v22

    .line 56
    .line 57
    const/16 v2, 0x20

    .line 58
    .line 59
    ushr-long v20, v20, v2

    .line 60
    .line 61
    ushr-long/2addr v14, v2

    .line 62
    add-long v20, v20, v14

    .line 63
    .line 64
    ushr-long/2addr v9, v2

    .line 65
    add-long v20, v20, v9

    .line 66
    .line 67
    const/4 v9, 0x1

    .line 68
    const/16 v10, 0x8

    .line 69
    .line 70
    :goto_1
    if-ge v9, v10, :cond_0

    .line 71
    .line 72
    aget v11, p1, v9

    .line 73
    .line 74
    int-to-long v14, v11

    .line 75
    and-long v14, v14, v17

    .line 76
    .line 77
    mul-long/2addr v14, v12

    .line 78
    aget v11, v1, v9

    .line 79
    .line 80
    move-wide/from16 v22, v3

    .line 81
    .line 82
    move v4, v2

    .line 83
    int-to-long v2, v11

    .line 84
    and-long v2, v2, v17

    .line 85
    .line 86
    mul-long/2addr v2, v5

    .line 87
    and-long v24, v14, v17

    .line 88
    .line 89
    and-long v26, v2, v17

    .line 90
    .line 91
    add-long v24, v24, v26

    .line 92
    .line 93
    aget v11, v0, v9

    .line 94
    .line 95
    move-wide/from16 v26, v5

    .line 96
    .line 97
    move v6, v4

    .line 98
    int-to-long v4, v11

    .line 99
    and-long v4, v4, v17

    .line 100
    .line 101
    add-long v24, v24, v4

    .line 102
    .line 103
    add-long v4, v20, v24

    .line 104
    .line 105
    add-int/lit8 v11, v9, -0x1

    .line 106
    .line 107
    move/from16 v19, v6

    .line 108
    .line 109
    long-to-int v6, v4

    .line 110
    aput v6, v0, v11

    .line 111
    .line 112
    ushr-long v4, v4, v19

    .line 113
    .line 114
    ushr-long v14, v14, v19

    .line 115
    .line 116
    add-long/2addr v4, v14

    .line 117
    ushr-long v2, v2, v19

    .line 118
    .line 119
    add-long v20, v4, v2

    .line 120
    .line 121
    add-int/lit8 v9, v9, 0x1

    .line 122
    .line 123
    move/from16 v2, v19

    .line 124
    .line 125
    move-wide/from16 v3, v22

    .line 126
    .line 127
    move-wide/from16 v5, v26

    .line 128
    .line 129
    goto :goto_1

    .line 130
    :cond_0
    move/from16 v19, v2

    .line 131
    .line 132
    move-wide/from16 v22, v3

    .line 133
    .line 134
    int-to-long v2, v8

    .line 135
    and-long v2, v2, v17

    .line 136
    .line 137
    add-long v2, v20, v2

    .line 138
    .line 139
    const/4 v4, 0x7

    .line 140
    long-to-int v5, v2

    .line 141
    aput v5, v0, v4

    .line 142
    .line 143
    ushr-long v2, v2, v19

    .line 144
    .line 145
    long-to-int v8, v2

    .line 146
    add-int/lit8 v7, v7, 0x1

    .line 147
    .line 148
    move/from16 v2, v16

    .line 149
    .line 150
    move-wide/from16 v5, v17

    .line 151
    .line 152
    move-wide/from16 v3, v22

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_1
    if-nez v8, :cond_3

    .line 157
    .line 158
    invoke-static/range {p2 .. p3}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_2

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_2
    return-void

    .line 166
    :cond_3
    :goto_2
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/raw/Nat256;->sub([I[I[I)I

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public static multAddXF([I[I[I[I)V
    .locals 26

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget v3, p1, v2

    .line 7
    .line 8
    int-to-long v3, v3

    .line 9
    const-wide v5, 0xffffffffL

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    and-long/2addr v3, v5

    .line 15
    move v7, v2

    .line 16
    move v8, v7

    .line 17
    :goto_0
    const/16 v9, 0x8

    .line 18
    .line 19
    if-ge v7, v9, :cond_1

    .line 20
    .line 21
    aget v10, p0, v7

    .line 22
    .line 23
    int-to-long v10, v10

    .line 24
    and-long/2addr v10, v5

    .line 25
    mul-long v12, v10, v3

    .line 26
    .line 27
    aget v14, v0, v2

    .line 28
    .line 29
    int-to-long v14, v14

    .line 30
    and-long/2addr v14, v5

    .line 31
    add-long/2addr v12, v14

    .line 32
    and-long v14, v12, v5

    .line 33
    .line 34
    const/16 v16, 0x20

    .line 35
    .line 36
    ushr-long v12, v12, v16

    .line 37
    .line 38
    add-long/2addr v12, v14

    .line 39
    const/16 v17, 0x1

    .line 40
    .line 41
    move/from16 v2, v17

    .line 42
    .line 43
    :goto_1
    if-ge v2, v9, :cond_0

    .line 44
    .line 45
    move-wide/from16 v18, v5

    .line 46
    .line 47
    aget v5, p1, v2

    .line 48
    .line 49
    int-to-long v5, v5

    .line 50
    and-long v5, v5, v18

    .line 51
    .line 52
    mul-long/2addr v5, v10

    .line 53
    aget v9, v1, v2

    .line 54
    .line 55
    move-wide/from16 v20, v3

    .line 56
    .line 57
    move v4, v2

    .line 58
    int-to-long v2, v9

    .line 59
    and-long v2, v2, v18

    .line 60
    .line 61
    mul-long/2addr v2, v14

    .line 62
    and-long v22, v5, v18

    .line 63
    .line 64
    and-long v24, v2, v18

    .line 65
    .line 66
    add-long v22, v22, v24

    .line 67
    .line 68
    aget v9, v0, v4

    .line 69
    .line 70
    move-wide/from16 v24, v2

    .line 71
    .line 72
    int-to-long v2, v9

    .line 73
    and-long v2, v2, v18

    .line 74
    .line 75
    add-long v22, v22, v2

    .line 76
    .line 77
    add-long v12, v12, v22

    .line 78
    .line 79
    add-int/lit8 v2, v4, -0x1

    .line 80
    .line 81
    long-to-int v3, v12

    .line 82
    aput v3, v0, v2

    .line 83
    .line 84
    ushr-long v2, v12, v16

    .line 85
    .line 86
    ushr-long v5, v5, v16

    .line 87
    .line 88
    add-long/2addr v2, v5

    .line 89
    ushr-long v5, v24, v16

    .line 90
    .line 91
    add-long v12, v2, v5

    .line 92
    .line 93
    add-int/lit8 v2, v4, 0x1

    .line 94
    .line 95
    move-wide/from16 v5, v18

    .line 96
    .line 97
    move-wide/from16 v3, v20

    .line 98
    .line 99
    const/16 v9, 0x8

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_0
    move-wide/from16 v20, v3

    .line 103
    .line 104
    move-wide/from16 v18, v5

    .line 105
    .line 106
    int-to-long v2, v8

    .line 107
    and-long v2, v2, v18

    .line 108
    .line 109
    add-long/2addr v12, v2

    .line 110
    const/4 v2, 0x7

    .line 111
    long-to-int v3, v12

    .line 112
    aput v3, v0, v2

    .line 113
    .line 114
    ushr-long v2, v12, v16

    .line 115
    .line 116
    long-to-int v8, v2

    .line 117
    add-int/lit8 v7, v7, 0x1

    .line 118
    .line 119
    move-wide/from16 v3, v20

    .line 120
    .line 121
    const/4 v2, 0x0

    .line 122
    goto :goto_0

    .line 123
    :cond_1
    if-nez v8, :cond_3

    .line 124
    .line 125
    invoke-static/range {p2 .. p3}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    if-eqz v2, :cond_2

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_2
    return-void

    .line 133
    :cond_3
    :goto_2
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/raw/Nat256;->sub([I[I[I)I

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public static reduce([I[II)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    const/16 v4, 0x8

    .line 8
    .line 9
    if-ge v3, v4, :cond_1

    .line 10
    .line 11
    aget v5, v0, v2

    .line 12
    .line 13
    mul-int v6, v5, p2

    .line 14
    .line 15
    int-to-long v6, v6

    .line 16
    const-wide v8, 0xffffffffL

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    and-long/2addr v6, v8

    .line 22
    aget v10, v1, v2

    .line 23
    .line 24
    int-to-long v10, v10

    .line 25
    and-long/2addr v10, v8

    .line 26
    mul-long/2addr v10, v6

    .line 27
    int-to-long v12, v5

    .line 28
    and-long/2addr v12, v8

    .line 29
    add-long/2addr v10, v12

    .line 30
    const/16 v5, 0x20

    .line 31
    .line 32
    ushr-long/2addr v10, v5

    .line 33
    const/4 v12, 0x1

    .line 34
    :goto_1
    if-ge v12, v4, :cond_0

    .line 35
    .line 36
    aget v13, v1, v12

    .line 37
    .line 38
    int-to-long v13, v13

    .line 39
    and-long/2addr v13, v8

    .line 40
    mul-long/2addr v13, v6

    .line 41
    aget v15, v0, v12

    .line 42
    .line 43
    move/from16 v16, v3

    .line 44
    .line 45
    int-to-long v2, v15

    .line 46
    and-long/2addr v2, v8

    .line 47
    add-long/2addr v13, v2

    .line 48
    add-long/2addr v10, v13

    .line 49
    add-int/lit8 v2, v12, -0x1

    .line 50
    .line 51
    long-to-int v3, v10

    .line 52
    aput v3, v0, v2

    .line 53
    .line 54
    ushr-long/2addr v10, v5

    .line 55
    add-int/lit8 v12, v12, 0x1

    .line 56
    .line 57
    move/from16 v3, v16

    .line 58
    .line 59
    const/4 v2, 0x0

    .line 60
    goto :goto_1

    .line 61
    :cond_0
    move/from16 v16, v3

    .line 62
    .line 63
    const/4 v2, 0x7

    .line 64
    long-to-int v3, v10

    .line 65
    aput v3, v0, v2

    .line 66
    .line 67
    add-int/lit8 v3, v16, 0x1

    .line 68
    .line 69
    const/4 v2, 0x0

    .line 70
    goto :goto_0

    .line 71
    :cond_1
    invoke-static/range {p0 .. p1}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    if-eqz v2, :cond_2

    .line 76
    .line 77
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/raw/Nat256;->sub([I[I[I)I

    .line 78
    .line 79
    .line 80
    :cond_2
    return-void
.end method

.method public static reduceXF([I[I)V
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/16 v2, 0x8

    .line 4
    .line 5
    if-ge v1, v2, :cond_1

    .line 6
    .line 7
    aget v3, p0, v0

    .line 8
    .line 9
    int-to-long v3, v3

    .line 10
    const-wide v5, 0xffffffffL

    .line 11
    .line 12
    .line 13
    .line 14
    .line 15
    and-long/2addr v3, v5

    .line 16
    const/4 v7, 0x1

    .line 17
    move-wide v8, v3

    .line 18
    :goto_1
    if-ge v7, v2, :cond_0

    .line 19
    .line 20
    aget v10, p1, v7

    .line 21
    .line 22
    int-to-long v10, v10

    .line 23
    and-long/2addr v10, v5

    .line 24
    mul-long/2addr v10, v3

    .line 25
    aget v12, p0, v7

    .line 26
    .line 27
    int-to-long v12, v12

    .line 28
    and-long/2addr v12, v5

    .line 29
    add-long/2addr v10, v12

    .line 30
    add-long/2addr v8, v10

    .line 31
    add-int/lit8 v10, v7, -0x1

    .line 32
    .line 33
    long-to-int v11, v8

    .line 34
    aput v11, p0, v10

    .line 35
    .line 36
    const/16 v10, 0x20

    .line 37
    .line 38
    ushr-long/2addr v8, v10

    .line 39
    add-int/lit8 v7, v7, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    const/4 v2, 0x7

    .line 43
    long-to-int v3, v8

    .line 44
    aput v3, p0, v2

    .line 45
    .line 46
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    invoke-static {p0, p1}, Lorg/spongycastle/math/raw/Nat256;->gte([I[I)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    invoke-static {p0, p1, p0}, Lorg/spongycastle/math/raw/Nat256;->sub([I[I[I)I

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method
