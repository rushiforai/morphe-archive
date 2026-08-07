.class public final Ll/jol;
.super Ll/i4k;
.source "SourceFile"


# instance fields
.field public e:Ll/d13;


# direct methods
.method public constructor <init>(Ll/uhw;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i4k;-><init>(Ll/uhw;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i([BIIII)[[I
    .locals 18

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    add-int/lit8 v3, p4, -0x8

    .line 8
    .line 9
    add-int/lit8 v4, p3, -0x8

    .line 10
    .line 11
    const/4 v5, 0x2

    .line 12
    new-array v6, v5, [I

    .line 13
    .line 14
    const/4 v7, 0x1

    .line 15
    aput v0, v6, v7

    .line 16
    .line 17
    const/4 v8, 0x0

    .line 18
    aput v1, v6, v8

    .line 19
    .line 20
    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    invoke-static {v9, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    check-cast v6, [[I

    .line 27
    .line 28
    move v9, v8

    .line 29
    :goto_0
    if-ge v9, v1, :cond_a

    .line 30
    .line 31
    shl-int/lit8 v10, v9, 0x3

    .line 32
    .line 33
    if-le v10, v3, :cond_0

    .line 34
    .line 35
    move v10, v3

    .line 36
    :cond_0
    move v11, v8

    .line 37
    :goto_1
    if-ge v11, v0, :cond_9

    .line 38
    .line 39
    shl-int/lit8 v12, v11, 0x3

    .line 40
    .line 41
    if-le v12, v4, :cond_1

    .line 42
    .line 43
    move v12, v4

    .line 44
    :cond_1
    mul-int v13, v10, p3

    .line 45
    .line 46
    add-int/2addr v13, v12

    .line 47
    const/16 v12, 0xff

    .line 48
    .line 49
    move/from16 p4, v5

    .line 50
    .line 51
    move/from16 v17, v7

    .line 52
    .line 53
    move v14, v8

    .line 54
    move v15, v14

    .line 55
    move/from16 v16, v15

    .line 56
    .line 57
    move v5, v12

    .line 58
    :goto_2
    if-ge v14, v2, :cond_7

    .line 59
    .line 60
    move v7, v8

    .line 61
    move/from16 v8, v16

    .line 62
    .line 63
    :goto_3
    if-ge v7, v2, :cond_4

    .line 64
    .line 65
    add-int v16, v13, v7

    .line 66
    .line 67
    aget-byte v2, p0, v16

    .line 68
    .line 69
    and-int/2addr v2, v12

    .line 70
    add-int/2addr v15, v2

    .line 71
    if-ge v2, v5, :cond_2

    .line 72
    .line 73
    move v5, v2

    .line 74
    :cond_2
    if-le v2, v8, :cond_3

    .line 75
    .line 76
    move v8, v2

    .line 77
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 78
    .line 79
    const/16 v2, 0x8

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_4
    sub-int v2, v8, v5

    .line 83
    .line 84
    const/16 v7, 0x18

    .line 85
    .line 86
    if-le v2, v7, :cond_6

    .line 87
    .line 88
    :cond_5
    add-int/lit8 v14, v14, 0x1

    .line 89
    .line 90
    add-int v13, v13, p3

    .line 91
    .line 92
    const/16 v2, 0x8

    .line 93
    .line 94
    if-ge v14, v2, :cond_6

    .line 95
    .line 96
    const/4 v7, 0x0

    .line 97
    :goto_4
    if-ge v7, v2, :cond_5

    .line 98
    .line 99
    add-int v16, v13, v7

    .line 100
    .line 101
    aget-byte v2, p0, v16

    .line 102
    .line 103
    and-int/2addr v2, v12

    .line 104
    add-int/2addr v15, v2

    .line 105
    add-int/lit8 v7, v7, 0x1

    .line 106
    .line 107
    const/16 v2, 0x8

    .line 108
    .line 109
    goto :goto_4

    .line 110
    :cond_6
    add-int/lit8 v14, v14, 0x1

    .line 111
    .line 112
    add-int v13, v13, p3

    .line 113
    .line 114
    move/from16 v16, v8

    .line 115
    .line 116
    const/16 v2, 0x8

    .line 117
    .line 118
    const/4 v8, 0x0

    .line 119
    goto :goto_2

    .line 120
    :cond_7
    shr-int/lit8 v2, v15, 0x6

    .line 121
    .line 122
    sub-int v7, v16, v5

    .line 123
    .line 124
    const/16 v8, 0x18

    .line 125
    .line 126
    if-gt v7, v8, :cond_8

    .line 127
    .line 128
    div-int/lit8 v2, v5, 0x2

    .line 129
    .line 130
    if-lez v9, :cond_8

    .line 131
    .line 132
    if-lez v11, :cond_8

    .line 133
    .line 134
    add-int/lit8 v7, v9, -0x1

    .line 135
    .line 136
    aget-object v7, v6, v7

    .line 137
    .line 138
    aget v8, v7, v11

    .line 139
    .line 140
    aget-object v12, v6, v9

    .line 141
    .line 142
    add-int/lit8 v13, v11, -0x1

    .line 143
    .line 144
    aget v12, v12, v13

    .line 145
    .line 146
    mul-int/lit8 v12, v12, 0x2

    .line 147
    .line 148
    add-int/2addr v8, v12

    .line 149
    aget v7, v7, v13

    .line 150
    .line 151
    add-int/2addr v8, v7

    .line 152
    div-int/lit8 v7, v8, 0x4

    .line 153
    .line 154
    if-ge v5, v7, :cond_8

    .line 155
    .line 156
    move v2, v7

    .line 157
    :cond_8
    aget-object v5, v6, v9

    .line 158
    .line 159
    aput v2, v5, v11

    .line 160
    .line 161
    add-int/lit8 v11, v11, 0x1

    .line 162
    .line 163
    move/from16 v5, p4

    .line 164
    .line 165
    move/from16 v7, v17

    .line 166
    .line 167
    const/16 v2, 0x8

    .line 168
    .line 169
    const/4 v8, 0x0

    .line 170
    goto/16 :goto_1

    .line 171
    .line 172
    :cond_9
    move/from16 p4, v5

    .line 173
    .line 174
    move/from16 v17, v7

    .line 175
    .line 176
    add-int/lit8 v9, v9, 0x1

    .line 177
    .line 178
    const/16 v2, 0x8

    .line 179
    .line 180
    const/4 v8, 0x0

    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_a
    return-object v6
.end method

.method public static j([BIIII[[ILl/d13;)V
    .locals 17

    .line 1
    move/from16 v0, p1

    .line 2
    .line 3
    move/from16 v1, p2

    .line 4
    .line 5
    add-int/lit8 v2, p4, -0x8

    .line 6
    .line 7
    add-int/lit8 v3, p3, -0x8

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    move v5, v4

    .line 11
    :goto_0
    if-ge v5, v1, :cond_4

    .line 12
    .line 13
    shl-int/lit8 v6, v5, 0x3

    .line 14
    .line 15
    if-le v6, v2, :cond_0

    .line 16
    .line 17
    move v9, v2

    .line 18
    goto :goto_1

    .line 19
    :cond_0
    move v9, v6

    .line 20
    :goto_1
    add-int/lit8 v6, v1, -0x3

    .line 21
    .line 22
    const/4 v13, 0x2

    .line 23
    invoke-static {v5, v13, v6}, Ll/jol;->k(III)I

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    move v14, v4

    .line 28
    :goto_2
    if-ge v14, v0, :cond_3

    .line 29
    .line 30
    shl-int/lit8 v7, v14, 0x3

    .line 31
    .line 32
    if-le v7, v3, :cond_1

    .line 33
    .line 34
    move v8, v3

    .line 35
    goto :goto_3

    .line 36
    :cond_1
    move v8, v7

    .line 37
    :goto_3
    add-int/lit8 v7, v0, -0x3

    .line 38
    .line 39
    invoke-static {v14, v13, v7}, Ll/jol;->k(III)I

    .line 40
    .line 41
    .line 42
    move-result v7

    .line 43
    const/4 v10, -0x2

    .line 44
    move v11, v4

    .line 45
    :goto_4
    if-gt v10, v13, :cond_2

    .line 46
    .line 47
    add-int v12, v6, v10

    .line 48
    .line 49
    aget-object v12, p5, v12

    .line 50
    .line 51
    add-int/lit8 v15, v7, -0x2

    .line 52
    .line 53
    aget v15, v12, v15

    .line 54
    .line 55
    add-int/lit8 v16, v7, -0x1

    .line 56
    .line 57
    aget v16, v12, v16

    .line 58
    .line 59
    add-int v15, v15, v16

    .line 60
    .line 61
    aget v16, v12, v7

    .line 62
    .line 63
    add-int v15, v15, v16

    .line 64
    .line 65
    add-int/lit8 v16, v7, 0x1

    .line 66
    .line 67
    aget v16, v12, v16

    .line 68
    .line 69
    add-int v15, v15, v16

    .line 70
    .line 71
    add-int/lit8 v16, v7, 0x2

    .line 72
    .line 73
    aget v12, v12, v16

    .line 74
    .line 75
    add-int/2addr v15, v12

    .line 76
    add-int/2addr v11, v15

    .line 77
    add-int/lit8 v10, v10, 0x1

    .line 78
    .line 79
    goto :goto_4

    .line 80
    :cond_2
    div-int/lit8 v10, v11, 0x19

    .line 81
    .line 82
    move-object/from16 v7, p0

    .line 83
    .line 84
    move/from16 v11, p3

    .line 85
    .line 86
    move-object/from16 v12, p6

    .line 87
    .line 88
    invoke-static/range {v7 .. v12}, Ll/jol;->l([BIIIILl/d13;)V

    .line 89
    .line 90
    .line 91
    add-int/lit8 v14, v14, 0x1

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_3
    add-int/lit8 v5, v5, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_4
    return-void
.end method

.method public static k(III)I
    .locals 0

    .line 1
    if-ge p0, p1, :cond_0

    .line 2
    .line 3
    return p1

    .line 4
    :cond_0
    if-le p0, p2, :cond_1

    .line 5
    .line 6
    return p2

    .line 7
    :cond_1
    return p0
.end method

.method public static l([BIIIILl/d13;)V
    .locals 7

    .line 1
    mul-int v0, p2, p4

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    const/16 v3, 0x8

    .line 7
    .line 8
    if-ge v2, v3, :cond_2

    .line 9
    .line 10
    move v4, v1

    .line 11
    :goto_1
    if-ge v4, v3, :cond_1

    .line 12
    .line 13
    add-int v5, v0, v4

    .line 14
    .line 15
    aget-byte v5, p0, v5

    .line 16
    .line 17
    and-int/lit16 v5, v5, 0xff

    .line 18
    .line 19
    if-gt v5, p3, :cond_0

    .line 20
    .line 21
    add-int v5, p1, v4

    .line 22
    .line 23
    add-int v6, p2, v2

    .line 24
    .line 25
    invoke-virtual {p5, v5, v6}, Ll/d13;->o(II)V

    .line 26
    .line 27
    .line 28
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    add-int/2addr v0, p4

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    return-void
.end method


# virtual methods
.method public a(Ll/uhw;)Ll/by2;
    .locals 0

    .line 1
    new-instance p0, Ll/jol;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/jol;-><init>(Ll/uhw;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public b()Ll/d13;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jol;->e:Ll/d13;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/by2;->e()Ll/uhw;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Ll/uhw;->d()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    invoke-virtual {v0}, Ll/uhw;->a()I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    const/16 v1, 0x28

    .line 19
    .line 20
    if-lt v4, v1, :cond_3

    .line 21
    .line 22
    if-lt v5, v1, :cond_3

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/uhw;->b()[B

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    shr-int/lit8 v0, v4, 0x3

    .line 29
    .line 30
    and-int/lit8 v2, v4, 0x7

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    add-int/lit8 v0, v0, 0x1

    .line 35
    .line 36
    :cond_1
    move v2, v0

    .line 37
    shr-int/lit8 v0, v5, 0x3

    .line 38
    .line 39
    and-int/lit8 v3, v5, 0x7

    .line 40
    .line 41
    if-eqz v3, :cond_2

    .line 42
    .line 43
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    :cond_2
    move v3, v0

    .line 46
    invoke-static {v1, v2, v3, v4, v5}, Ll/jol;->i([BIIII)[[I

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    new-instance v7, Ll/d13;

    .line 51
    .line 52
    invoke-direct {v7, v4, v5}, Ll/d13;-><init>(II)V

    .line 53
    .line 54
    .line 55
    invoke-static/range {v1 .. v7}, Ll/jol;->j([BIIII[[ILl/d13;)V

    .line 56
    .line 57
    .line 58
    iput-object v7, p0, Ll/jol;->e:Ll/d13;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    invoke-super {p0}, Ll/i4k;->b()Ll/d13;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Ll/jol;->e:Ll/d13;

    .line 66
    .line 67
    :goto_0
    iget-object p0, p0, Ll/jol;->e:Ll/d13;

    .line 68
    .line 69
    return-object p0
.end method
