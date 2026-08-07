.class public final Ll/w3x0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[B

.field public static final b:[F

.field public static final c:Ljava/lang/Object;

.field public static d:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/w3x0;->a:[B

    .line 8
    .line 9
    const/16 v0, 0x11

    .line 10
    .line 11
    new-array v0, v0, [F

    .line 12
    .line 13
    fill-array-data v0, :array_1

    .line 14
    .line 15
    .line 16
    sput-object v0, Ll/w3x0;->b:[F

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/w3x0;->c:Ljava/lang/Object;

    .line 24
    .line 25
    const/16 v0, 0xa

    .line 26
    .line 27
    new-array v0, v0, [I

    .line 28
    .line 29
    sput-object v0, Ll/w3x0;->d:[I

    .line 30
    .line 31
    return-void

    .line 32
    nop

    .line 33
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
    .end array-data

    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f8ba2e9
        0x3f68ba2f
        0x3fba2e8c
        0x3f9b26ca
        0x400ba2e9
        0x3fe8ba2f
        0x403a2e8c
        0x401b26ca
        0x3fd1745d
        0x3fae8ba3
        0x3ff83e10
        0x3fcede62
        0x3faaaaab
        0x3fc00000    # 1.5f
        0x40000000    # 2.0f
    .end array-data
.end method

.method public static a([BII[Z)I
    .locals 8

    .line 1
    sub-int v0, p2, p1

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    move v3, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v3, v1

    .line 10
    :goto_0
    invoke-static {v3}, Ll/lev0;->f(Z)V

    .line 11
    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    return p2

    .line 16
    :cond_1
    aget-boolean v3, p3, v1

    .line 17
    .line 18
    if-eqz v3, :cond_2

    .line 19
    .line 20
    invoke-static {p3}, Ll/w3x0;->f([Z)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 p1, p1, -0x3

    .line 24
    .line 25
    return p1

    .line 26
    :cond_2
    if-le v0, v2, :cond_4

    .line 27
    .line 28
    aget-boolean v3, p3, v2

    .line 29
    .line 30
    if-eqz v3, :cond_4

    .line 31
    .line 32
    aget-byte v3, p0, p1

    .line 33
    .line 34
    if-eq v3, v2, :cond_3

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_3
    invoke-static {p3}, Ll/w3x0;->f([Z)V

    .line 38
    .line 39
    .line 40
    add-int/lit8 p1, p1, -0x2

    .line 41
    .line 42
    return p1

    .line 43
    :cond_4
    :goto_1
    const/4 v3, 0x2

    .line 44
    if-le v0, v3, :cond_6

    .line 45
    .line 46
    aget-boolean v4, p3, v3

    .line 47
    .line 48
    if-eqz v4, :cond_6

    .line 49
    .line 50
    aget-byte v4, p0, p1

    .line 51
    .line 52
    if-nez v4, :cond_6

    .line 53
    .line 54
    add-int/lit8 v4, p1, 0x1

    .line 55
    .line 56
    aget-byte v4, p0, v4

    .line 57
    .line 58
    if-eq v4, v2, :cond_5

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_5
    invoke-static {p3}, Ll/w3x0;->f([Z)V

    .line 62
    .line 63
    .line 64
    add-int/lit8 p1, p1, -0x1

    .line 65
    .line 66
    return p1

    .line 67
    :cond_6
    :goto_2
    add-int/lit8 v4, p2, -0x1

    .line 68
    .line 69
    add-int/2addr p1, v3

    .line 70
    :goto_3
    if-ge p1, v4, :cond_a

    .line 71
    .line 72
    aget-byte v5, p0, p1

    .line 73
    .line 74
    and-int/lit16 v6, v5, 0xfe

    .line 75
    .line 76
    if-nez v6, :cond_9

    .line 77
    .line 78
    add-int/lit8 v6, p1, -0x2

    .line 79
    .line 80
    aget-byte v7, p0, v6

    .line 81
    .line 82
    if-nez v7, :cond_8

    .line 83
    .line 84
    add-int/lit8 p1, p1, -0x1

    .line 85
    .line 86
    aget-byte p1, p0, p1

    .line 87
    .line 88
    if-nez p1, :cond_8

    .line 89
    .line 90
    if-eq v5, v2, :cond_7

    .line 91
    .line 92
    goto :goto_4

    .line 93
    :cond_7
    invoke-static {p3}, Ll/w3x0;->f([Z)V

    .line 94
    .line 95
    .line 96
    return v6

    .line 97
    :cond_8
    :goto_4
    move p1, v6

    .line 98
    :cond_9
    add-int/lit8 p1, p1, 0x3

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_a
    if-le v0, v3, :cond_c

    .line 102
    .line 103
    add-int/lit8 p1, p2, -0x3

    .line 104
    .line 105
    aget-byte p1, p0, p1

    .line 106
    .line 107
    if-nez p1, :cond_b

    .line 108
    .line 109
    add-int/lit8 p1, p2, -0x2

    .line 110
    .line 111
    aget-byte p1, p0, p1

    .line 112
    .line 113
    if-nez p1, :cond_b

    .line 114
    .line 115
    aget-byte p1, p0, v4

    .line 116
    .line 117
    if-ne p1, v2, :cond_b

    .line 118
    .line 119
    :goto_5
    move p1, v2

    .line 120
    goto :goto_6

    .line 121
    :cond_b
    move p1, v1

    .line 122
    goto :goto_6

    .line 123
    :cond_c
    if-ne v0, v3, :cond_d

    .line 124
    .line 125
    aget-boolean p1, p3, v3

    .line 126
    .line 127
    if-eqz p1, :cond_b

    .line 128
    .line 129
    add-int/lit8 p1, p2, -0x2

    .line 130
    .line 131
    aget-byte p1, p0, p1

    .line 132
    .line 133
    if-nez p1, :cond_b

    .line 134
    .line 135
    aget-byte p1, p0, v4

    .line 136
    .line 137
    if-ne p1, v2, :cond_b

    .line 138
    .line 139
    goto :goto_5

    .line 140
    :cond_d
    aget-boolean p1, p3, v2

    .line 141
    .line 142
    if-eqz p1, :cond_b

    .line 143
    .line 144
    aget-byte p1, p0, v4

    .line 145
    .line 146
    if-ne p1, v2, :cond_b

    .line 147
    .line 148
    goto :goto_5

    .line 149
    :goto_6
    aput-boolean p1, p3, v1

    .line 150
    .line 151
    if-le v0, v2, :cond_f

    .line 152
    .line 153
    add-int/lit8 p1, p2, -0x2

    .line 154
    .line 155
    aget-byte p1, p0, p1

    .line 156
    .line 157
    if-nez p1, :cond_e

    .line 158
    .line 159
    aget-byte p1, p0, v4

    .line 160
    .line 161
    if-nez p1, :cond_e

    .line 162
    .line 163
    :goto_7
    move p1, v2

    .line 164
    goto :goto_8

    .line 165
    :cond_e
    move p1, v1

    .line 166
    goto :goto_8

    .line 167
    :cond_f
    aget-boolean p1, p3, v3

    .line 168
    .line 169
    if-eqz p1, :cond_e

    .line 170
    .line 171
    aget-byte p1, p0, v4

    .line 172
    .line 173
    if-nez p1, :cond_e

    .line 174
    .line 175
    goto :goto_7

    .line 176
    :goto_8
    aput-boolean p1, p3, v2

    .line 177
    .line 178
    aget-byte p0, p0, v4

    .line 179
    .line 180
    if-nez p0, :cond_10

    .line 181
    .line 182
    move v1, v2

    .line 183
    :cond_10
    aput-boolean v1, p3, v3

    .line 184
    .line 185
    return p2
.end method

.method public static b([BI)I
    .locals 8

    .line 1
    sget-object v0, Ll/w3x0;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    move v3, v2

    .line 7
    :cond_0
    :goto_0
    if-lt v2, p1, :cond_2

    .line 8
    .line 9
    sub-int/2addr p1, v3

    .line 10
    move v2, v1

    .line 11
    move v4, v2

    .line 12
    move v5, v4

    .line 13
    :goto_1
    if-ge v2, v3, :cond_1

    .line 14
    .line 15
    :try_start_0
    sget-object v6, Ll/w3x0;->d:[I

    .line 16
    .line 17
    aget v6, v6, v2

    .line 18
    .line 19
    sub-int/2addr v6, v4

    .line 20
    invoke-static {p0, v4, p0, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    add-int/2addr v5, v6

    .line 24
    add-int/lit8 v7, v5, 0x1

    .line 25
    .line 26
    aput-byte v1, p0, v5

    .line 27
    .line 28
    add-int/lit8 v5, v5, 0x2

    .line 29
    .line 30
    aput-byte v1, p0, v7

    .line 31
    .line 32
    add-int/lit8 v6, v6, 0x3

    .line 33
    .line 34
    add-int/2addr v4, v6

    .line 35
    add-int/lit8 v2, v2, 0x1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto :goto_4

    .line 40
    :cond_1
    sub-int v1, p1, v5

    .line 41
    .line 42
    invoke-static {p0, v4, p0, v5, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    .line 44
    .line 45
    monitor-exit v0

    .line 46
    return p1

    .line 47
    :cond_2
    :goto_2
    add-int/lit8 v4, p1, -0x2

    .line 48
    .line 49
    if-ge v2, v4, :cond_4

    .line 50
    .line 51
    aget-byte v4, p0, v2

    .line 52
    .line 53
    add-int/lit8 v5, v2, 0x1

    .line 54
    .line 55
    if-nez v4, :cond_3

    .line 56
    .line 57
    aget-byte v4, p0, v5

    .line 58
    .line 59
    if-nez v4, :cond_3

    .line 60
    .line 61
    add-int/lit8 v4, v2, 0x2

    .line 62
    .line 63
    aget-byte v4, p0, v4

    .line 64
    .line 65
    const/4 v6, 0x3

    .line 66
    if-ne v4, v6, :cond_3

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_3
    move v2, v5

    .line 70
    goto :goto_2

    .line 71
    :cond_4
    move v2, p1

    .line 72
    :goto_3
    if-ge v2, p1, :cond_0

    .line 73
    .line 74
    sget-object v4, Ll/w3x0;->d:[I

    .line 75
    .line 76
    array-length v5, v4

    .line 77
    if-gt v5, v3, :cond_5

    .line 78
    .line 79
    add-int/2addr v5, v5

    .line 80
    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([II)[I

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    sput-object v4, Ll/w3x0;->d:[I

    .line 85
    .line 86
    :cond_5
    sget-object v4, Ll/w3x0;->d:[I

    .line 87
    .line 88
    add-int/lit8 v5, v3, 0x1

    .line 89
    .line 90
    aput v2, v4, v3

    .line 91
    .line 92
    add-int/lit8 v2, v2, 0x3

    .line 93
    .line 94
    move v3, v5

    .line 95
    goto :goto_0

    .line 96
    :goto_4
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    throw p0
.end method

.method public static c([BII)Ll/f0x0;
    .locals 34

    .line 1
    new-instance v0, Ll/b5x0;

    .line 2
    .line 3
    move-object/from16 v1, p0

    .line 4
    .line 5
    move/from16 v2, p1

    .line 6
    .line 7
    move/from16 v3, p2

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Ll/b5x0;-><init>([BII)V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    invoke-virtual {v0, v1}, Ll/b5x0;->e(I)V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x3

    .line 17
    invoke-virtual {v0, v2}, Ll/b5x0;->a(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 22
    .line 23
    .line 24
    const/4 v4, 0x2

    .line 25
    invoke-virtual {v0, v4}, Ll/b5x0;->a(I)I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    const/4 v5, 0x5

    .line 34
    invoke-virtual {v0, v5}, Ll/b5x0;->a(I)I

    .line 35
    .line 36
    .line 37
    move-result v8

    .line 38
    const/4 v10, 0x0

    .line 39
    const/4 v11, 0x0

    .line 40
    :goto_0
    const/16 v12, 0x20

    .line 41
    .line 42
    const/4 v13, 0x1

    .line 43
    if-ge v10, v12, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 46
    .line 47
    .line 48
    move-result v12

    .line 49
    if-eqz v12, :cond_0

    .line 50
    .line 51
    shl-int v12, v13, v10

    .line 52
    .line 53
    or-int/2addr v11, v12

    .line 54
    :cond_0
    add-int/lit8 v10, v10, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    const/4 v10, 0x6

    .line 58
    new-array v12, v10, [I

    .line 59
    .line 60
    const/4 v14, 0x0

    .line 61
    :goto_1
    const/16 v15, 0x8

    .line 62
    .line 63
    if-ge v14, v10, :cond_2

    .line 64
    .line 65
    invoke-virtual {v0, v15}, Ll/b5x0;->a(I)I

    .line 66
    .line 67
    .line 68
    move-result v15

    .line 69
    aput v15, v12, v14

    .line 70
    .line 71
    add-int/lit8 v14, v14, 0x1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    invoke-virtual {v0, v15}, Ll/b5x0;->a(I)I

    .line 75
    .line 76
    .line 77
    move-result v14

    .line 78
    move/from16 p0, v5

    .line 79
    .line 80
    const/4 v5, 0x0

    .line 81
    const/4 v9, 0x0

    .line 82
    :goto_2
    if-ge v5, v3, :cond_5

    .line 83
    .line 84
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 85
    .line 86
    .line 87
    move-result v16

    .line 88
    if-eqz v16, :cond_3

    .line 89
    .line 90
    add-int/lit8 v9, v9, 0x59

    .line 91
    .line 92
    :cond_3
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 93
    .line 94
    .line 95
    move-result v16

    .line 96
    if-eqz v16, :cond_4

    .line 97
    .line 98
    add-int/lit8 v9, v9, 0x8

    .line 99
    .line 100
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_5
    invoke-virtual {v0, v9}, Ll/b5x0;->e(I)V

    .line 104
    .line 105
    .line 106
    if-lez v3, :cond_6

    .line 107
    .line 108
    rsub-int/lit8 v5, v3, 0x8

    .line 109
    .line 110
    add-int/2addr v5, v5

    .line 111
    invoke-virtual {v0, v5}, Ll/b5x0;->e(I)V

    .line 112
    .line 113
    .line 114
    :cond_6
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 115
    .line 116
    .line 117
    move-result v5

    .line 118
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 119
    .line 120
    .line 121
    move-result v9

    .line 122
    if-ne v9, v2, :cond_7

    .line 123
    .line 124
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 125
    .line 126
    .line 127
    move v9, v2

    .line 128
    :cond_7
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 129
    .line 130
    .line 131
    move-result v16

    .line 132
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 133
    .line 134
    .line 135
    move-result v17

    .line 136
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 137
    .line 138
    .line 139
    move-result v18

    .line 140
    if-eqz v18, :cond_b

    .line 141
    .line 142
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 143
    .line 144
    .line 145
    move-result v18

    .line 146
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 147
    .line 148
    .line 149
    move-result v19

    .line 150
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 151
    .line 152
    .line 153
    move-result v20

    .line 154
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 155
    .line 156
    .line 157
    move-result v21

    .line 158
    if-eq v9, v13, :cond_9

    .line 159
    .line 160
    if-ne v9, v4, :cond_8

    .line 161
    .line 162
    move v9, v4

    .line 163
    move/from16 v22, v9

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_8
    move/from16 v22, v13

    .line 167
    .line 168
    goto :goto_3

    .line 169
    :cond_9
    move/from16 v22, v4

    .line 170
    .line 171
    :goto_3
    if-ne v9, v13, :cond_a

    .line 172
    .line 173
    move/from16 v23, v4

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_a
    move/from16 v23, v13

    .line 177
    .line 178
    :goto_4
    add-int v18, v18, v19

    .line 179
    .line 180
    mul-int v22, v22, v18

    .line 181
    .line 182
    sub-int v16, v16, v22

    .line 183
    .line 184
    add-int v20, v20, v21

    .line 185
    .line 186
    mul-int v23, v23, v20

    .line 187
    .line 188
    sub-int v17, v17, v23

    .line 189
    .line 190
    :cond_b
    move/from16 v18, v11

    .line 191
    .line 192
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 193
    .line 194
    .line 195
    move-result v11

    .line 196
    move-object/from16 v19, v12

    .line 197
    .line 198
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 199
    .line 200
    .line 201
    move-result v12

    .line 202
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 203
    .line 204
    .line 205
    move-result v20

    .line 206
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 207
    .line 208
    .line 209
    move-result v15

    .line 210
    if-eq v13, v15, :cond_c

    .line 211
    .line 212
    move v15, v3

    .line 213
    goto :goto_5

    .line 214
    :cond_c
    const/4 v15, 0x0

    .line 215
    :goto_5
    if-gt v15, v3, :cond_d

    .line 216
    .line 217
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 221
    .line 222
    .line 223
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 224
    .line 225
    .line 226
    add-int/lit8 v15, v15, 0x1

    .line 227
    .line 228
    goto :goto_5

    .line 229
    :cond_d
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 230
    .line 231
    .line 232
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 236
    .line 237
    .line 238
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 248
    .line 249
    .line 250
    move-result v3

    .line 251
    if-eqz v3, :cond_13

    .line 252
    .line 253
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 254
    .line 255
    .line 256
    move-result v3

    .line 257
    if-eqz v3, :cond_13

    .line 258
    .line 259
    const/4 v3, 0x0

    .line 260
    :goto_6
    if-ge v3, v1, :cond_13

    .line 261
    .line 262
    const/4 v15, 0x0

    .line 263
    :goto_7
    if-ge v15, v10, :cond_12

    .line 264
    .line 265
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 266
    .line 267
    .line 268
    move-result v21

    .line 269
    if-nez v21, :cond_e

    .line 270
    .line 271
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 272
    .line 273
    .line 274
    goto :goto_9

    .line 275
    :cond_e
    add-int v21, v3, v3

    .line 276
    .line 277
    add-int/lit8 v21, v21, 0x4

    .line 278
    .line 279
    shl-int v1, v13, v21

    .line 280
    .line 281
    const/16 v10, 0x40

    .line 282
    .line 283
    invoke-static {v10, v1}, Ljava/lang/Math;->min(II)I

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    if-le v3, v13, :cond_f

    .line 288
    .line 289
    invoke-virtual {v0}, Ll/b5x0;->b()I

    .line 290
    .line 291
    .line 292
    :cond_f
    const/4 v10, 0x0

    .line 293
    :goto_8
    if-ge v10, v1, :cond_10

    .line 294
    .line 295
    invoke-virtual {v0}, Ll/b5x0;->b()I

    .line 296
    .line 297
    .line 298
    add-int/lit8 v10, v10, 0x1

    .line 299
    .line 300
    goto :goto_8

    .line 301
    :cond_10
    :goto_9
    if-ne v3, v2, :cond_11

    .line 302
    .line 303
    move v1, v2

    .line 304
    goto :goto_a

    .line 305
    :cond_11
    move v1, v13

    .line 306
    :goto_a
    add-int/2addr v15, v1

    .line 307
    const/4 v1, 0x4

    .line 308
    const/4 v10, 0x6

    .line 309
    goto :goto_7

    .line 310
    :cond_12
    add-int/lit8 v3, v3, 0x1

    .line 311
    .line 312
    const/4 v1, 0x4

    .line 313
    const/4 v10, 0x6

    .line 314
    goto :goto_6

    .line 315
    :cond_13
    invoke-virtual {v0, v4}, Ll/b5x0;->e(I)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    if-eqz v1, :cond_14

    .line 323
    .line 324
    const/16 v1, 0x8

    .line 325
    .line 326
    invoke-virtual {v0, v1}, Ll/b5x0;->e(I)V

    .line 327
    .line 328
    .line 329
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 330
    .line 331
    .line 332
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 336
    .line 337
    .line 338
    :cond_14
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    const/4 v3, 0x0

    .line 343
    new-array v10, v3, [I

    .line 344
    .line 345
    new-array v15, v3, [I

    .line 346
    .line 347
    const/16 v21, -0x1

    .line 348
    .line 349
    move/from16 v22, v13

    .line 350
    .line 351
    move/from16 v2, v21

    .line 352
    .line 353
    move v13, v2

    .line 354
    :goto_b
    if-ge v3, v1, :cond_26

    .line 355
    .line 356
    if-eqz v3, :cond_21

    .line 357
    .line 358
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 359
    .line 360
    .line 361
    move-result v24

    .line 362
    if-eqz v24, :cond_21

    .line 363
    .line 364
    add-int v4, v13, v2

    .line 365
    .line 366
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 367
    .line 368
    .line 369
    move-result v25

    .line 370
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 371
    .line 372
    .line 373
    move-result v26

    .line 374
    add-int/lit8 v26, v26, 0x1

    .line 375
    .line 376
    add-int v25, v25, v25

    .line 377
    .line 378
    rsub-int/lit8 v25, v25, 0x1

    .line 379
    .line 380
    move/from16 v27, v1

    .line 381
    .line 382
    add-int/lit8 v1, v4, 0x1

    .line 383
    .line 384
    move/from16 v28, v3

    .line 385
    .line 386
    new-array v3, v1, [Z

    .line 387
    .line 388
    move-object/from16 v29, v3

    .line 389
    .line 390
    const/4 v3, 0x0

    .line 391
    :goto_c
    if-gt v3, v4, :cond_16

    .line 392
    .line 393
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 394
    .line 395
    .line 396
    move-result v30

    .line 397
    if-nez v30, :cond_15

    .line 398
    .line 399
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 400
    .line 401
    .line 402
    move-result v30

    .line 403
    aput-boolean v30, v29, v3

    .line 404
    .line 405
    goto :goto_d

    .line 406
    :cond_15
    aput-boolean v22, v29, v3

    .line 407
    .line 408
    :goto_d
    add-int/lit8 v3, v3, 0x1

    .line 409
    .line 410
    goto :goto_c

    .line 411
    :cond_16
    add-int/lit8 v3, v2, -0x1

    .line 412
    .line 413
    move/from16 v30, v3

    .line 414
    .line 415
    new-array v3, v1, [I

    .line 416
    .line 417
    new-array v1, v1, [I

    .line 418
    .line 419
    const/16 v31, 0x0

    .line 420
    .line 421
    :goto_e
    mul-int v32, v25, v26

    .line 422
    .line 423
    if-ltz v30, :cond_18

    .line 424
    .line 425
    aget v33, v15, v30

    .line 426
    .line 427
    add-int v33, v33, v32

    .line 428
    .line 429
    if-gez v33, :cond_17

    .line 430
    .line 431
    add-int v32, v13, v30

    .line 432
    .line 433
    aget-boolean v32, v29, v32

    .line 434
    .line 435
    if-eqz v32, :cond_17

    .line 436
    .line 437
    add-int/lit8 v32, v31, 0x1

    .line 438
    .line 439
    aput v33, v3, v31

    .line 440
    .line 441
    move/from16 v31, v32

    .line 442
    .line 443
    :cond_17
    add-int/lit8 v30, v30, -0x1

    .line 444
    .line 445
    goto :goto_e

    .line 446
    :cond_18
    if-gez v32, :cond_19

    .line 447
    .line 448
    aget-boolean v25, v29, v4

    .line 449
    .line 450
    if-eqz v25, :cond_19

    .line 451
    .line 452
    add-int/lit8 v25, v31, 0x1

    .line 453
    .line 454
    aput v32, v3, v31

    .line 455
    .line 456
    move/from16 v31, v25

    .line 457
    .line 458
    :cond_19
    move/from16 v25, v4

    .line 459
    .line 460
    move/from16 v26, v5

    .line 461
    .line 462
    move/from16 v4, v31

    .line 463
    .line 464
    const/4 v5, 0x0

    .line 465
    :goto_f
    if-ge v5, v13, :cond_1b

    .line 466
    .line 467
    aget v30, v10, v5

    .line 468
    .line 469
    add-int v30, v30, v32

    .line 470
    .line 471
    if-gez v30, :cond_1a

    .line 472
    .line 473
    aget-boolean v31, v29, v5

    .line 474
    .line 475
    if-eqz v31, :cond_1a

    .line 476
    .line 477
    add-int/lit8 v31, v4, 0x1

    .line 478
    .line 479
    aput v30, v3, v4

    .line 480
    .line 481
    move/from16 v4, v31

    .line 482
    .line 483
    :cond_1a
    add-int/lit8 v5, v5, 0x1

    .line 484
    .line 485
    goto :goto_f

    .line 486
    :cond_1b
    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([II)[I

    .line 487
    .line 488
    .line 489
    move-result-object v3

    .line 490
    add-int/lit8 v5, v13, -0x1

    .line 491
    .line 492
    const/16 v30, 0x0

    .line 493
    .line 494
    :goto_10
    if-ltz v5, :cond_1d

    .line 495
    .line 496
    aget v31, v10, v5

    .line 497
    .line 498
    add-int v31, v31, v32

    .line 499
    .line 500
    if-lez v31, :cond_1c

    .line 501
    .line 502
    aget-boolean v33, v29, v5

    .line 503
    .line 504
    if-eqz v33, :cond_1c

    .line 505
    .line 506
    add-int/lit8 v33, v30, 0x1

    .line 507
    .line 508
    aput v31, v1, v30

    .line 509
    .line 510
    move/from16 v30, v33

    .line 511
    .line 512
    :cond_1c
    add-int/lit8 v5, v5, -0x1

    .line 513
    .line 514
    goto :goto_10

    .line 515
    :cond_1d
    if-lez v32, :cond_1e

    .line 516
    .line 517
    aget-boolean v5, v29, v25

    .line 518
    .line 519
    if-eqz v5, :cond_1e

    .line 520
    .line 521
    add-int/lit8 v5, v30, 0x1

    .line 522
    .line 523
    aput v32, v1, v30

    .line 524
    .line 525
    move/from16 v30, v5

    .line 526
    .line 527
    :cond_1e
    move/from16 v5, v30

    .line 528
    .line 529
    const/4 v10, 0x0

    .line 530
    :goto_11
    if-ge v10, v2, :cond_20

    .line 531
    .line 532
    aget v25, v15, v10

    .line 533
    .line 534
    add-int v25, v25, v32

    .line 535
    .line 536
    if-lez v25, :cond_1f

    .line 537
    .line 538
    add-int v30, v13, v10

    .line 539
    .line 540
    aget-boolean v30, v29, v30

    .line 541
    .line 542
    if-eqz v30, :cond_1f

    .line 543
    .line 544
    add-int/lit8 v30, v5, 0x1

    .line 545
    .line 546
    aput v25, v1, v5

    .line 547
    .line 548
    move/from16 v5, v30

    .line 549
    .line 550
    :cond_1f
    add-int/lit8 v10, v10, 0x1

    .line 551
    .line 552
    goto :goto_11

    .line 553
    :cond_20
    invoke-static {v1, v5}, Ljava/util/Arrays;->copyOf([II)[I

    .line 554
    .line 555
    .line 556
    move-result-object v1

    .line 557
    move-object v15, v1

    .line 558
    move v13, v4

    .line 559
    move v2, v5

    .line 560
    :goto_12
    move-object v10, v3

    .line 561
    goto :goto_17

    .line 562
    :cond_21
    move/from16 v27, v1

    .line 563
    .line 564
    move/from16 v28, v3

    .line 565
    .line 566
    move/from16 v26, v5

    .line 567
    .line 568
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 569
    .line 570
    .line 571
    move-result v1

    .line 572
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 573
    .line 574
    .line 575
    move-result v2

    .line 576
    new-array v3, v1, [I

    .line 577
    .line 578
    const/4 v4, 0x0

    .line 579
    :goto_13
    if-ge v4, v1, :cond_23

    .line 580
    .line 581
    if-lez v4, :cond_22

    .line 582
    .line 583
    add-int/lit8 v5, v4, -0x1

    .line 584
    .line 585
    aget v5, v3, v5

    .line 586
    .line 587
    goto :goto_14

    .line 588
    :cond_22
    const/4 v5, 0x0

    .line 589
    :goto_14
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 590
    .line 591
    .line 592
    move-result v10

    .line 593
    add-int/lit8 v10, v10, 0x1

    .line 594
    .line 595
    sub-int/2addr v5, v10

    .line 596
    aput v5, v3, v4

    .line 597
    .line 598
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 599
    .line 600
    .line 601
    add-int/lit8 v4, v4, 0x1

    .line 602
    .line 603
    goto :goto_13

    .line 604
    :cond_23
    new-array v4, v2, [I

    .line 605
    .line 606
    const/4 v5, 0x0

    .line 607
    :goto_15
    if-ge v5, v2, :cond_25

    .line 608
    .line 609
    if-lez v5, :cond_24

    .line 610
    .line 611
    add-int/lit8 v10, v5, -0x1

    .line 612
    .line 613
    aget v10, v4, v10

    .line 614
    .line 615
    goto :goto_16

    .line 616
    :cond_24
    const/4 v10, 0x0

    .line 617
    :goto_16
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 618
    .line 619
    .line 620
    move-result v13

    .line 621
    add-int/lit8 v13, v13, 0x1

    .line 622
    .line 623
    add-int/2addr v10, v13

    .line 624
    aput v10, v4, v5

    .line 625
    .line 626
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 627
    .line 628
    .line 629
    add-int/lit8 v5, v5, 0x1

    .line 630
    .line 631
    goto :goto_15

    .line 632
    :cond_25
    move v13, v1

    .line 633
    move-object v15, v4

    .line 634
    goto :goto_12

    .line 635
    :goto_17
    add-int/lit8 v3, v28, 0x1

    .line 636
    .line 637
    move/from16 v5, v26

    .line 638
    .line 639
    move/from16 v1, v27

    .line 640
    .line 641
    const/4 v4, 0x2

    .line 642
    goto/16 :goto_b

    .line 643
    .line 644
    :cond_26
    move/from16 v26, v5

    .line 645
    .line 646
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 647
    .line 648
    .line 649
    move-result v1

    .line 650
    if-eqz v1, :cond_27

    .line 651
    .line 652
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 653
    .line 654
    .line 655
    move-result v1

    .line 656
    const/4 v2, 0x0

    .line 657
    :goto_18
    if-ge v2, v1, :cond_27

    .line 658
    .line 659
    add-int/lit8 v5, v20, 0x5

    .line 660
    .line 661
    invoke-virtual {v0, v5}, Ll/b5x0;->e(I)V

    .line 662
    .line 663
    .line 664
    add-int/lit8 v2, v2, 0x1

    .line 665
    .line 666
    goto :goto_18

    .line 667
    :cond_27
    const/4 v1, 0x2

    .line 668
    invoke-virtual {v0, v1}, Ll/b5x0;->e(I)V

    .line 669
    .line 670
    .line 671
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 672
    .line 673
    .line 674
    move-result v2

    .line 675
    const/high16 v3, 0x3f800000    # 1.0f

    .line 676
    .line 677
    if-eqz v2, :cond_31

    .line 678
    .line 679
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 680
    .line 681
    .line 682
    move-result v2

    .line 683
    if-eqz v2, :cond_2a

    .line 684
    .line 685
    const/16 v2, 0x8

    .line 686
    .line 687
    invoke-virtual {v0, v2}, Ll/b5x0;->a(I)I

    .line 688
    .line 689
    .line 690
    move-result v4

    .line 691
    const/16 v2, 0xff

    .line 692
    .line 693
    if-ne v4, v2, :cond_28

    .line 694
    .line 695
    const/16 v2, 0x10

    .line 696
    .line 697
    invoke-virtual {v0, v2}, Ll/b5x0;->a(I)I

    .line 698
    .line 699
    .line 700
    move-result v4

    .line 701
    invoke-virtual {v0, v2}, Ll/b5x0;->a(I)I

    .line 702
    .line 703
    .line 704
    move-result v2

    .line 705
    if-eqz v4, :cond_2a

    .line 706
    .line 707
    if-eqz v2, :cond_2a

    .line 708
    .line 709
    int-to-float v3, v4

    .line 710
    int-to-float v2, v2

    .line 711
    div-float/2addr v3, v2

    .line 712
    goto :goto_19

    .line 713
    :cond_28
    const/16 v2, 0x11

    .line 714
    .line 715
    if-ge v4, v2, :cond_29

    .line 716
    .line 717
    sget-object v2, Ll/w3x0;->b:[F

    .line 718
    .line 719
    aget v3, v2, v4

    .line 720
    .line 721
    goto :goto_19

    .line 722
    :cond_29
    new-instance v2, Ljava/lang/StringBuilder;

    .line 723
    .line 724
    const-string v5, "Unexpected aspect_ratio_idc value: "

    .line 725
    .line 726
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 727
    .line 728
    .line 729
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 730
    .line 731
    .line 732
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 733
    .line 734
    .line 735
    move-result-object v2

    .line 736
    const-string v4, "NalUnitUtil"

    .line 737
    .line 738
    invoke-static {v4, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 739
    .line 740
    .line 741
    :cond_2a
    :goto_19
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 742
    .line 743
    .line 744
    move-result v2

    .line 745
    if-eqz v2, :cond_2b

    .line 746
    .line 747
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 748
    .line 749
    .line 750
    :cond_2b
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 751
    .line 752
    .line 753
    move-result v2

    .line 754
    if-eqz v2, :cond_2e

    .line 755
    .line 756
    const/4 v2, 0x3

    .line 757
    invoke-virtual {v0, v2}, Ll/b5x0;->e(I)V

    .line 758
    .line 759
    .line 760
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 761
    .line 762
    .line 763
    move-result v2

    .line 764
    move/from16 v4, v22

    .line 765
    .line 766
    if-eq v4, v2, :cond_2c

    .line 767
    .line 768
    move v4, v1

    .line 769
    :cond_2c
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 770
    .line 771
    .line 772
    move-result v1

    .line 773
    if-eqz v1, :cond_2d

    .line 774
    .line 775
    const/16 v1, 0x8

    .line 776
    .line 777
    invoke-virtual {v0, v1}, Ll/b5x0;->a(I)I

    .line 778
    .line 779
    .line 780
    move-result v2

    .line 781
    invoke-virtual {v0, v1}, Ll/b5x0;->a(I)I

    .line 782
    .line 783
    .line 784
    move-result v5

    .line 785
    invoke-virtual {v0, v1}, Ll/b5x0;->e(I)V

    .line 786
    .line 787
    .line 788
    invoke-static {v2}, Ll/wwy0;->a(I)I

    .line 789
    .line 790
    .line 791
    move-result v21

    .line 792
    invoke-static {v5}, Ll/wwy0;->b(I)I

    .line 793
    .line 794
    .line 795
    move-result v1

    .line 796
    move v2, v1

    .line 797
    move/from16 v1, v21

    .line 798
    .line 799
    :goto_1a
    move/from16 v21, v4

    .line 800
    .line 801
    goto :goto_1b

    .line 802
    :cond_2d
    move/from16 v1, v21

    .line 803
    .line 804
    move v2, v1

    .line 805
    goto :goto_1a

    .line 806
    :cond_2e
    move/from16 v1, v21

    .line 807
    .line 808
    move v2, v1

    .line 809
    :goto_1b
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 810
    .line 811
    .line 812
    move-result v4

    .line 813
    if-eqz v4, :cond_2f

    .line 814
    .line 815
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 816
    .line 817
    .line 818
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 819
    .line 820
    .line 821
    :cond_2f
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 822
    .line 823
    .line 824
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 825
    .line 826
    .line 827
    move-result v0

    .line 828
    if-eqz v0, :cond_30

    .line 829
    .line 830
    add-int v17, v17, v17

    .line 831
    .line 832
    :cond_30
    move/from16 v20, v21

    .line 833
    .line 834
    move/from16 v21, v1

    .line 835
    .line 836
    goto :goto_1c

    .line 837
    :cond_31
    move/from16 v2, v21

    .line 838
    .line 839
    move/from16 v20, v2

    .line 840
    .line 841
    :goto_1c
    new-instance v5, Ll/f0x0;

    .line 842
    .line 843
    move v10, v9

    .line 844
    move/from16 v9, v18

    .line 845
    .line 846
    move-object/from16 v13, v19

    .line 847
    .line 848
    move/from16 v19, v21

    .line 849
    .line 850
    move/from16 v15, v26

    .line 851
    .line 852
    move/from16 v21, v2

    .line 853
    .line 854
    move/from16 v18, v3

    .line 855
    .line 856
    invoke-direct/range {v5 .. v21}, Ll/f0x0;-><init>(IZIIIII[IIIIIFIII)V

    .line 857
    .line 858
    .line 859
    return-object v5
.end method

.method public static d([BII)Ll/j1x0;
    .locals 1

    .line 1
    new-instance p1, Ll/b5x0;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-direct {p1, p0, v0, p2}, Ll/b5x0;-><init>([BII)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Ll/b5x0;->c()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-virtual {p1}, Ll/b5x0;->c()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-virtual {p1}, Ll/b5x0;->d()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ll/b5x0;->f()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    new-instance v0, Ll/j1x0;

    .line 23
    .line 24
    invoke-direct {v0, p0, p2, p1}, Ll/j1x0;-><init>(IIZ)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method public static e([BII)Ll/p2x0;
    .locals 26

    .line 1
    new-instance v0, Ll/b5x0;

    .line 2
    .line 3
    move-object/from16 v1, p0

    .line 4
    .line 5
    move/from16 v2, p1

    .line 6
    .line 7
    move/from16 v3, p2

    .line 8
    .line 9
    invoke-direct {v0, v1, v2, v3}, Ll/b5x0;-><init>([BII)V

    .line 10
    .line 11
    .line 12
    const/16 v1, 0x8

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/b5x0;->a(I)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-virtual {v0, v1}, Ll/b5x0;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result v5

    .line 22
    invoke-virtual {v0, v1}, Ll/b5x0;->a(I)I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 27
    .line 28
    .line 29
    move-result v7

    .line 30
    const/16 v3, 0x64

    .line 31
    .line 32
    const/4 v8, 0x3

    .line 33
    const/4 v10, 0x1

    .line 34
    if-eq v2, v3, :cond_1

    .line 35
    .line 36
    const/16 v3, 0x6e

    .line 37
    .line 38
    if-eq v2, v3, :cond_1

    .line 39
    .line 40
    const/16 v3, 0x7a

    .line 41
    .line 42
    if-eq v2, v3, :cond_1

    .line 43
    .line 44
    const/16 v3, 0xf4

    .line 45
    .line 46
    if-eq v2, v3, :cond_1

    .line 47
    .line 48
    const/16 v3, 0x2c

    .line 49
    .line 50
    if-eq v2, v3, :cond_1

    .line 51
    .line 52
    const/16 v3, 0x53

    .line 53
    .line 54
    if-eq v2, v3, :cond_1

    .line 55
    .line 56
    const/16 v3, 0x56

    .line 57
    .line 58
    if-eq v2, v3, :cond_1

    .line 59
    .line 60
    const/16 v3, 0x76

    .line 61
    .line 62
    if-eq v2, v3, :cond_1

    .line 63
    .line 64
    const/16 v3, 0x80

    .line 65
    .line 66
    if-eq v2, v3, :cond_1

    .line 67
    .line 68
    const/16 v3, 0x8a

    .line 69
    .line 70
    if-ne v2, v3, :cond_0

    .line 71
    .line 72
    move v2, v3

    .line 73
    goto :goto_1

    .line 74
    :cond_0
    move v3, v10

    .line 75
    const/16 p1, 0x10

    .line 76
    .line 77
    const/4 v12, 0x0

    .line 78
    const/4 v13, 0x0

    .line 79
    const/4 v14, 0x0

    .line 80
    :goto_0
    move v4, v2

    .line 81
    goto/16 :goto_7

    .line 82
    .line 83
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-ne v3, v8, :cond_2

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 90
    .line 91
    .line 92
    move-result v11

    .line 93
    move v12, v8

    .line 94
    goto :goto_2

    .line 95
    :cond_2
    move v12, v3

    .line 96
    const/4 v11, 0x0

    .line 97
    :goto_2
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 98
    .line 99
    .line 100
    move-result v13

    .line 101
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 102
    .line 103
    .line 104
    move-result v14

    .line 105
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 109
    .line 110
    .line 111
    move-result v15

    .line 112
    if-eqz v15, :cond_9

    .line 113
    .line 114
    if-eq v12, v8, :cond_3

    .line 115
    .line 116
    move v12, v1

    .line 117
    goto :goto_3

    .line 118
    :cond_3
    const/16 v12, 0xc

    .line 119
    .line 120
    :goto_3
    const/4 v15, 0x0

    .line 121
    :goto_4
    if-ge v15, v12, :cond_9

    .line 122
    .line 123
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 124
    .line 125
    .line 126
    move-result v16

    .line 127
    if-eqz v16, :cond_7

    .line 128
    .line 129
    const/4 v9, 0x6

    .line 130
    if-ge v15, v9, :cond_4

    .line 131
    .line 132
    const/16 v9, 0x10

    .line 133
    .line 134
    goto :goto_5

    .line 135
    :cond_4
    const/16 v9, 0x40

    .line 136
    .line 137
    :goto_5
    move/from16 v16, v1

    .line 138
    .line 139
    move/from16 v17, v16

    .line 140
    .line 141
    const/16 p1, 0x10

    .line 142
    .line 143
    const/4 v4, 0x0

    .line 144
    :goto_6
    if-ge v4, v9, :cond_8

    .line 145
    .line 146
    if-eqz v16, :cond_5

    .line 147
    .line 148
    invoke-virtual {v0}, Ll/b5x0;->b()I

    .line 149
    .line 150
    .line 151
    move-result v16

    .line 152
    add-int v1, v17, v16

    .line 153
    .line 154
    add-int/lit16 v1, v1, 0x100

    .line 155
    .line 156
    rem-int/lit16 v1, v1, 0x100

    .line 157
    .line 158
    move/from16 v16, v1

    .line 159
    .line 160
    :cond_5
    if-eqz v16, :cond_6

    .line 161
    .line 162
    move/from16 v17, v16

    .line 163
    .line 164
    :cond_6
    add-int/lit8 v4, v4, 0x1

    .line 165
    .line 166
    const/16 v1, 0x8

    .line 167
    .line 168
    goto :goto_6

    .line 169
    :cond_7
    const/16 p1, 0x10

    .line 170
    .line 171
    :cond_8
    add-int/lit8 v15, v15, 0x1

    .line 172
    .line 173
    const/16 v1, 0x8

    .line 174
    .line 175
    goto :goto_4

    .line 176
    :cond_9
    const/16 p1, 0x10

    .line 177
    .line 178
    move v12, v13

    .line 179
    move v13, v14

    .line 180
    move v14, v11

    .line 181
    goto :goto_0

    .line 182
    :goto_7
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    add-int/lit8 v16, v1, 0x4

    .line 187
    .line 188
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-nez v1, :cond_a

    .line 193
    .line 194
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 195
    .line 196
    .line 197
    move-result v2

    .line 198
    add-int/lit8 v2, v2, 0x4

    .line 199
    .line 200
    move/from16 v17, v1

    .line 201
    .line 202
    move/from16 v18, v2

    .line 203
    .line 204
    move v15, v10

    .line 205
    :goto_8
    const/16 v19, 0x0

    .line 206
    .line 207
    goto :goto_a

    .line 208
    :cond_a
    if-ne v1, v10, :cond_c

    .line 209
    .line 210
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    invoke-virtual {v0}, Ll/b5x0;->b()I

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ll/b5x0;->b()I

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 221
    .line 222
    .line 223
    move-result v2

    .line 224
    move v9, v10

    .line 225
    int-to-long v10, v2

    .line 226
    move v15, v9

    .line 227
    move-wide/from16 v17, v10

    .line 228
    .line 229
    const/4 v2, 0x0

    .line 230
    :goto_9
    int-to-long v9, v2

    .line 231
    cmp-long v9, v9, v17

    .line 232
    .line 233
    if-gez v9, :cond_b

    .line 234
    .line 235
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 236
    .line 237
    .line 238
    add-int/lit8 v2, v2, 0x1

    .line 239
    .line 240
    goto :goto_9

    .line 241
    :cond_b
    move/from16 v19, v1

    .line 242
    .line 243
    move/from16 v17, v15

    .line 244
    .line 245
    const/16 v18, 0x0

    .line 246
    .line 247
    goto :goto_a

    .line 248
    :cond_c
    move v15, v10

    .line 249
    move/from16 v17, v1

    .line 250
    .line 251
    const/16 v18, 0x0

    .line 252
    .line 253
    goto :goto_8

    .line 254
    :goto_a
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    add-int/2addr v2, v15

    .line 266
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 267
    .line 268
    .line 269
    move-result v9

    .line 270
    add-int/2addr v9, v15

    .line 271
    move v10, v15

    .line 272
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 273
    .line 274
    .line 275
    move-result v15

    .line 276
    rsub-int/lit8 v11, v15, 0x2

    .line 277
    .line 278
    if-nez v15, :cond_d

    .line 279
    .line 280
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 281
    .line 282
    .line 283
    :cond_d
    mul-int/2addr v9, v11

    .line 284
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 285
    .line 286
    .line 287
    mul-int/lit8 v2, v2, 0x10

    .line 288
    .line 289
    mul-int/lit8 v20, v9, 0x10

    .line 290
    .line 291
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 292
    .line 293
    .line 294
    move-result v9

    .line 295
    const/16 v21, 0x2

    .line 296
    .line 297
    if-eqz v9, :cond_11

    .line 298
    .line 299
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 300
    .line 301
    .line 302
    move-result v22

    .line 303
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 304
    .line 305
    .line 306
    move-result v23

    .line 307
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 308
    .line 309
    .line 310
    move-result v24

    .line 311
    invoke-virtual {v0}, Ll/b5x0;->c()I

    .line 312
    .line 313
    .line 314
    move-result v25

    .line 315
    if-nez v3, :cond_e

    .line 316
    .line 317
    goto :goto_d

    .line 318
    :cond_e
    move v9, v10

    .line 319
    if-ne v3, v8, :cond_f

    .line 320
    .line 321
    goto :goto_b

    .line 322
    :cond_f
    move/from16 v10, v21

    .line 323
    .line 324
    :goto_b
    if-ne v3, v9, :cond_10

    .line 325
    .line 326
    move/from16 v3, v21

    .line 327
    .line 328
    goto :goto_c

    .line 329
    :cond_10
    const/4 v3, 0x1

    .line 330
    :goto_c
    mul-int/2addr v11, v3

    .line 331
    :goto_d
    add-int v22, v22, v23

    .line 332
    .line 333
    mul-int v22, v22, v10

    .line 334
    .line 335
    sub-int v2, v2, v22

    .line 336
    .line 337
    add-int v24, v24, v25

    .line 338
    .line 339
    mul-int v24, v24, v11

    .line 340
    .line 341
    sub-int v20, v20, v24

    .line 342
    .line 343
    :cond_11
    move/from16 v10, v20

    .line 344
    .line 345
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 346
    .line 347
    .line 348
    move-result v3

    .line 349
    const/16 v20, -0x1

    .line 350
    .line 351
    if-eqz v3, :cond_19

    .line 352
    .line 353
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 354
    .line 355
    .line 356
    move-result v3

    .line 357
    if-eqz v3, :cond_12

    .line 358
    .line 359
    const/16 v3, 0x8

    .line 360
    .line 361
    invoke-virtual {v0, v3}, Ll/b5x0;->a(I)I

    .line 362
    .line 363
    .line 364
    move-result v9

    .line 365
    const/16 v3, 0xff

    .line 366
    .line 367
    if-ne v9, v3, :cond_13

    .line 368
    .line 369
    move/from16 v3, p1

    .line 370
    .line 371
    invoke-virtual {v0, v3}, Ll/b5x0;->a(I)I

    .line 372
    .line 373
    .line 374
    move-result v9

    .line 375
    invoke-virtual {v0, v3}, Ll/b5x0;->a(I)I

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    if-eqz v9, :cond_12

    .line 380
    .line 381
    if-eqz v3, :cond_12

    .line 382
    .line 383
    int-to-float v9, v9

    .line 384
    int-to-float v3, v3

    .line 385
    div-float v11, v9, v3

    .line 386
    .line 387
    goto :goto_f

    .line 388
    :cond_12
    :goto_e
    const/high16 v11, 0x3f800000    # 1.0f

    .line 389
    .line 390
    goto :goto_f

    .line 391
    :cond_13
    const/16 v3, 0x11

    .line 392
    .line 393
    if-ge v9, v3, :cond_14

    .line 394
    .line 395
    sget-object v3, Ll/w3x0;->b:[F

    .line 396
    .line 397
    aget v11, v3, v9

    .line 398
    .line 399
    goto :goto_f

    .line 400
    :cond_14
    new-instance v3, Ljava/lang/StringBuilder;

    .line 401
    .line 402
    const-string v11, "Unexpected aspect_ratio_idc value: "

    .line 403
    .line 404
    invoke-direct {v3, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 405
    .line 406
    .line 407
    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 408
    .line 409
    .line 410
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v3

    .line 414
    const-string v9, "NalUnitUtil"

    .line 415
    .line 416
    invoke-static {v9, v3}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    goto :goto_e

    .line 420
    :goto_f
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 421
    .line 422
    .line 423
    move-result v3

    .line 424
    if-eqz v3, :cond_15

    .line 425
    .line 426
    invoke-virtual {v0}, Ll/b5x0;->d()V

    .line 427
    .line 428
    .line 429
    :cond_15
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 430
    .line 431
    .line 432
    move-result v3

    .line 433
    if-eqz v3, :cond_18

    .line 434
    .line 435
    invoke-virtual {v0, v8}, Ll/b5x0;->e(I)V

    .line 436
    .line 437
    .line 438
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 439
    .line 440
    .line 441
    move-result v3

    .line 442
    const/4 v9, 0x1

    .line 443
    if-eq v9, v3, :cond_16

    .line 444
    .line 445
    goto :goto_10

    .line 446
    :cond_16
    move/from16 v21, v9

    .line 447
    .line 448
    :goto_10
    invoke-virtual {v0}, Ll/b5x0;->f()Z

    .line 449
    .line 450
    .line 451
    move-result v3

    .line 452
    if-eqz v3, :cond_17

    .line 453
    .line 454
    const/16 v3, 0x8

    .line 455
    .line 456
    invoke-virtual {v0, v3}, Ll/b5x0;->a(I)I

    .line 457
    .line 458
    .line 459
    move-result v8

    .line 460
    invoke-virtual {v0, v3}, Ll/b5x0;->a(I)I

    .line 461
    .line 462
    .line 463
    move-result v9

    .line 464
    invoke-virtual {v0, v3}, Ll/b5x0;->e(I)V

    .line 465
    .line 466
    .line 467
    invoke-static {v8}, Ll/wwy0;->a(I)I

    .line 468
    .line 469
    .line 470
    move-result v20

    .line 471
    invoke-static {v9}, Ll/wwy0;->b(I)I

    .line 472
    .line 473
    .line 474
    move-result v0

    .line 475
    move/from16 v22, v0

    .line 476
    .line 477
    goto :goto_11

    .line 478
    :cond_17
    move/from16 v22, v20

    .line 479
    .line 480
    goto :goto_11

    .line 481
    :cond_18
    move/from16 v21, v20

    .line 482
    .line 483
    move/from16 v22, v21

    .line 484
    .line 485
    goto :goto_11

    .line 486
    :cond_19
    move/from16 v21, v20

    .line 487
    .line 488
    move/from16 v22, v21

    .line 489
    .line 490
    const/high16 v11, 0x3f800000    # 1.0f

    .line 491
    .line 492
    :goto_11
    new-instance v3, Ll/p2x0;

    .line 493
    .line 494
    move v8, v1

    .line 495
    move v9, v2

    .line 496
    invoke-direct/range {v3 .. v22}, Ll/p2x0;-><init>(IIIIIIIFIIZZIIIZIII)V

    .line 497
    .line 498
    .line 499
    return-object v3
.end method

.method public static f([Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    aput-boolean v0, p0, v0

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    aput-boolean v0, p0, v1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    aput-boolean v0, p0, v1

    .line 9
    .line 10
    return-void
.end method
