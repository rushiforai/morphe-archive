.class public Lorg/spongycastle/math/ec/custom/sec/SecT233Field;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final M41:J = 0x1ffffffffffL

.field private static final M59:J = 0x7ffffffffffffffL


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

.method public static add([J[J[J)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    aget-wide v3, p1, v0

    .line 5
    .line 6
    xor-long/2addr v1, v3

    .line 7
    aput-wide v1, p2, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget-wide v1, p0, v0

    .line 11
    .line 12
    aget-wide v3, p1, v0

    .line 13
    .line 14
    xor-long/2addr v1, v3

    .line 15
    aput-wide v1, p2, v0

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    aget-wide v1, p0, v0

    .line 19
    .line 20
    aget-wide v3, p1, v0

    .line 21
    .line 22
    xor-long/2addr v1, v3

    .line 23
    aput-wide v1, p2, v0

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    aget-wide v1, p0, v0

    .line 27
    .line 28
    aget-wide p0, p1, v0

    .line 29
    .line 30
    xor-long/2addr p0, v1

    .line 31
    aput-wide p0, p2, v0

    .line 32
    .line 33
    return-void
.end method

.method public static addExt([J[J[J)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    aget-wide v3, p1, v0

    .line 5
    .line 6
    xor-long/2addr v1, v3

    .line 7
    aput-wide v1, p2, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget-wide v1, p0, v0

    .line 11
    .line 12
    aget-wide v3, p1, v0

    .line 13
    .line 14
    xor-long/2addr v1, v3

    .line 15
    aput-wide v1, p2, v0

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    aget-wide v1, p0, v0

    .line 19
    .line 20
    aget-wide v3, p1, v0

    .line 21
    .line 22
    xor-long/2addr v1, v3

    .line 23
    aput-wide v1, p2, v0

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    aget-wide v1, p0, v0

    .line 27
    .line 28
    aget-wide v3, p1, v0

    .line 29
    .line 30
    xor-long/2addr v1, v3

    .line 31
    aput-wide v1, p2, v0

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    aget-wide v1, p0, v0

    .line 35
    .line 36
    aget-wide v3, p1, v0

    .line 37
    .line 38
    xor-long/2addr v1, v3

    .line 39
    aput-wide v1, p2, v0

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    aget-wide v1, p0, v0

    .line 43
    .line 44
    aget-wide v3, p1, v0

    .line 45
    .line 46
    xor-long/2addr v1, v3

    .line 47
    aput-wide v1, p2, v0

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    aget-wide v1, p0, v0

    .line 51
    .line 52
    aget-wide v3, p1, v0

    .line 53
    .line 54
    xor-long/2addr v1, v3

    .line 55
    aput-wide v1, p2, v0

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    aget-wide v1, p0, v0

    .line 59
    .line 60
    aget-wide p0, p1, v0

    .line 61
    .line 62
    xor-long/2addr p0, v1

    .line 63
    aput-wide p0, p2, v0

    .line 64
    .line 65
    return-void
.end method

.method public static addOne([J[J)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const-wide/16 v3, 0x1

    .line 5
    .line 6
    xor-long/2addr v1, v3

    .line 7
    aput-wide v1, p1, v0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    aget-wide v1, p0, v0

    .line 11
    .line 12
    aput-wide v1, p1, v0

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    aget-wide v1, p0, v0

    .line 16
    .line 17
    aput-wide v1, p1, v0

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    aget-wide v1, p0, v0

    .line 21
    .line 22
    aput-wide v1, p1, v0

    .line 23
    .line 24
    return-void
.end method

.method public static fromBigInteger(Ljava/math/BigInteger;)[J
    .locals 1

    .line 1
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat256;->fromBigInteger64(Ljava/math/BigInteger;)[J

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->reduce23([JI)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public static implCompactExt([J)V
    .locals 26

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    aget-wide v4, p0, v3

    .line 6
    .line 7
    const/4 v6, 0x2

    .line 8
    aget-wide v7, p0, v6

    .line 9
    .line 10
    const/4 v9, 0x3

    .line 11
    aget-wide v10, p0, v9

    .line 12
    .line 13
    const/4 v12, 0x4

    .line 14
    aget-wide v13, p0, v12

    .line 15
    .line 16
    const/4 v15, 0x5

    .line 17
    aget-wide v16, p0, v15

    .line 18
    .line 19
    const/16 v18, 0x6

    .line 20
    .line 21
    aget-wide v19, p0, v18

    .line 22
    .line 23
    const/16 v21, 0x7

    .line 24
    .line 25
    aget-wide v22, p0, v21

    .line 26
    .line 27
    const/16 v24, 0x3b

    .line 28
    .line 29
    shl-long v24, v4, v24

    .line 30
    .line 31
    xor-long v1, v1, v24

    .line 32
    .line 33
    aput-wide v1, p0, v0

    .line 34
    .line 35
    ushr-long v0, v4, v15

    .line 36
    .line 37
    const/16 v2, 0x36

    .line 38
    .line 39
    shl-long v4, v7, v2

    .line 40
    .line 41
    xor-long/2addr v0, v4

    .line 42
    aput-wide v0, p0, v3

    .line 43
    .line 44
    const/16 v0, 0xa

    .line 45
    .line 46
    ushr-long v0, v7, v0

    .line 47
    .line 48
    const/16 v2, 0x31

    .line 49
    .line 50
    shl-long v2, v10, v2

    .line 51
    .line 52
    xor-long/2addr v0, v2

    .line 53
    aput-wide v0, p0, v6

    .line 54
    .line 55
    const/16 v0, 0xf

    .line 56
    .line 57
    ushr-long v0, v10, v0

    .line 58
    .line 59
    const/16 v2, 0x2c

    .line 60
    .line 61
    shl-long v2, v13, v2

    .line 62
    .line 63
    xor-long/2addr v0, v2

    .line 64
    aput-wide v0, p0, v9

    .line 65
    .line 66
    const/16 v0, 0x14

    .line 67
    .line 68
    ushr-long v0, v13, v0

    .line 69
    .line 70
    const/16 v2, 0x27

    .line 71
    .line 72
    shl-long v2, v16, v2

    .line 73
    .line 74
    xor-long/2addr v0, v2

    .line 75
    aput-wide v0, p0, v12

    .line 76
    .line 77
    const/16 v0, 0x19

    .line 78
    .line 79
    ushr-long v0, v16, v0

    .line 80
    .line 81
    const/16 v2, 0x22

    .line 82
    .line 83
    shl-long v2, v19, v2

    .line 84
    .line 85
    xor-long/2addr v0, v2

    .line 86
    aput-wide v0, p0, v15

    .line 87
    .line 88
    const/16 v0, 0x1e

    .line 89
    .line 90
    ushr-long v0, v19, v0

    .line 91
    .line 92
    const/16 v2, 0x1d

    .line 93
    .line 94
    shl-long v2, v22, v2

    .line 95
    .line 96
    xor-long/2addr v0, v2

    .line 97
    aput-wide v0, p0, v18

    .line 98
    .line 99
    const/16 v0, 0x23

    .line 100
    .line 101
    ushr-long v0, v22, v0

    .line 102
    .line 103
    aput-wide v0, p0, v21

    .line 104
    .line 105
    return-void
.end method

.method public static implExpand([J[J)V
    .locals 16

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    aget-wide v4, p0, v3

    .line 6
    .line 7
    const/4 v6, 0x2

    .line 8
    aget-wide v7, p0, v6

    .line 9
    .line 10
    const/4 v9, 0x3

    .line 11
    aget-wide v10, p0, v9

    .line 12
    .line 13
    const-wide v12, 0x7ffffffffffffffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    and-long v14, v1, v12

    .line 19
    .line 20
    aput-wide v14, p1, v0

    .line 21
    .line 22
    const/16 v0, 0x3b

    .line 23
    .line 24
    ushr-long v0, v1, v0

    .line 25
    .line 26
    const/4 v2, 0x5

    .line 27
    shl-long v14, v4, v2

    .line 28
    .line 29
    xor-long/2addr v0, v14

    .line 30
    and-long/2addr v0, v12

    .line 31
    aput-wide v0, p1, v3

    .line 32
    .line 33
    const/16 v0, 0x36

    .line 34
    .line 35
    ushr-long v0, v4, v0

    .line 36
    .line 37
    const/16 v2, 0xa

    .line 38
    .line 39
    shl-long v2, v7, v2

    .line 40
    .line 41
    xor-long/2addr v0, v2

    .line 42
    and-long/2addr v0, v12

    .line 43
    aput-wide v0, p1, v6

    .line 44
    .line 45
    const/16 v0, 0x31

    .line 46
    .line 47
    ushr-long v0, v7, v0

    .line 48
    .line 49
    const/16 v2, 0xf

    .line 50
    .line 51
    shl-long v2, v10, v2

    .line 52
    .line 53
    xor-long/2addr v0, v2

    .line 54
    aput-wide v0, p1, v9

    .line 55
    .line 56
    return-void
.end method

.method public static implMultiply([J[J[J)V
    .locals 20

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v1, v0, [J

    .line 3
    .line 4
    new-array v2, v0, [J

    .line 5
    .line 6
    move-object/from16 v3, p0

    .line 7
    .line 8
    invoke-static {v3, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implExpand([J[J)V

    .line 9
    .line 10
    .line 11
    move-object/from16 v3, p1

    .line 12
    .line 13
    invoke-static {v3, v2}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implExpand([J[J)V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    aget-wide v4, v1, v3

    .line 18
    .line 19
    aget-wide v6, v2, v3

    .line 20
    .line 21
    const/4 v9, 0x0

    .line 22
    move-object/from16 v8, p2

    .line 23
    .line 24
    invoke-static/range {v4 .. v9}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 25
    .line 26
    .line 27
    const/4 v4, 0x1

    .line 28
    aget-wide v10, v1, v4

    .line 29
    .line 30
    aget-wide v12, v2, v4

    .line 31
    .line 32
    const/4 v15, 0x1

    .line 33
    move-object/from16 v14, p2

    .line 34
    .line 35
    invoke-static/range {v10 .. v15}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 36
    .line 37
    .line 38
    const/4 v5, 0x2

    .line 39
    aget-wide v10, v1, v5

    .line 40
    .line 41
    aget-wide v12, v2, v5

    .line 42
    .line 43
    const/4 v15, 0x2

    .line 44
    invoke-static/range {v10 .. v15}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 45
    .line 46
    .line 47
    const/4 v6, 0x3

    .line 48
    aget-wide v10, v1, v6

    .line 49
    .line 50
    aget-wide v12, v2, v6

    .line 51
    .line 52
    const/4 v15, 0x3

    .line 53
    invoke-static/range {v10 .. v15}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 54
    .line 55
    .line 56
    const/4 v7, 0x5

    .line 57
    move v8, v7

    .line 58
    :goto_0
    if-lez v8, :cond_0

    .line 59
    .line 60
    aget-wide v9, p2, v8

    .line 61
    .line 62
    add-int/lit8 v11, v8, -0x1

    .line 63
    .line 64
    aget-wide v11, p2, v11

    .line 65
    .line 66
    xor-long/2addr v9, v11

    .line 67
    aput-wide v9, p2, v8

    .line 68
    .line 69
    add-int/lit8 v8, v8, -0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    aget-wide v8, v1, v3

    .line 73
    .line 74
    aget-wide v10, v1, v4

    .line 75
    .line 76
    xor-long/2addr v10, v8

    .line 77
    aget-wide v8, v2, v3

    .line 78
    .line 79
    aget-wide v12, v2, v4

    .line 80
    .line 81
    xor-long/2addr v12, v8

    .line 82
    const/4 v15, 0x1

    .line 83
    move-object/from16 v14, p2

    .line 84
    .line 85
    invoke-static/range {v10 .. v15}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 86
    .line 87
    .line 88
    aget-wide v8, v1, v5

    .line 89
    .line 90
    aget-wide v10, v1, v6

    .line 91
    .line 92
    xor-long/2addr v10, v8

    .line 93
    aget-wide v8, v2, v5

    .line 94
    .line 95
    aget-wide v12, v2, v6

    .line 96
    .line 97
    xor-long/2addr v12, v8

    .line 98
    const/4 v15, 0x3

    .line 99
    invoke-static/range {v10 .. v15}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 100
    .line 101
    .line 102
    const/4 v8, 0x7

    .line 103
    :goto_1
    if-le v8, v4, :cond_1

    .line 104
    .line 105
    aget-wide v9, p2, v8

    .line 106
    .line 107
    add-int/lit8 v11, v8, -0x2

    .line 108
    .line 109
    aget-wide v11, p2, v11

    .line 110
    .line 111
    xor-long/2addr v9, v11

    .line 112
    aput-wide v9, p2, v8

    .line 113
    .line 114
    add-int/lit8 v8, v8, -0x1

    .line 115
    .line 116
    goto :goto_1

    .line 117
    :cond_1
    aget-wide v8, v1, v3

    .line 118
    .line 119
    aget-wide v10, v1, v5

    .line 120
    .line 121
    xor-long/2addr v8, v10

    .line 122
    aget-wide v10, v1, v4

    .line 123
    .line 124
    aget-wide v12, v1, v6

    .line 125
    .line 126
    xor-long v18, v10, v12

    .line 127
    .line 128
    aget-wide v10, v2, v3

    .line 129
    .line 130
    aget-wide v12, v2, v5

    .line 131
    .line 132
    xor-long v16, v10, v12

    .line 133
    .line 134
    aget-wide v10, v2, v4

    .line 135
    .line 136
    aget-wide v1, v2, v6

    .line 137
    .line 138
    xor-long/2addr v1, v10

    .line 139
    xor-long v10, v8, v18

    .line 140
    .line 141
    xor-long v12, v16, v1

    .line 142
    .line 143
    const/4 v15, 0x3

    .line 144
    move-object/from16 v14, p2

    .line 145
    .line 146
    invoke-static/range {v10 .. v15}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 147
    .line 148
    .line 149
    new-array v10, v6, [J

    .line 150
    .line 151
    move-wide/from16 v14, v16

    .line 152
    .line 153
    const/16 v17, 0x0

    .line 154
    .line 155
    move-wide v12, v8

    .line 156
    move-object/from16 v16, v10

    .line 157
    .line 158
    invoke-static/range {v12 .. v17}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 159
    .line 160
    .line 161
    move-wide/from16 v14, v18

    .line 162
    .line 163
    const/16 v19, 0x1

    .line 164
    .line 165
    move-object/from16 v18, v16

    .line 166
    .line 167
    move-wide/from16 v16, v1

    .line 168
    .line 169
    invoke-static/range {v14 .. v19}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMulwAcc(JJ[JI)V

    .line 170
    .line 171
    .line 172
    move-object/from16 v16, v18

    .line 173
    .line 174
    aget-wide v1, v16, v3

    .line 175
    .line 176
    aget-wide v3, v16, v4

    .line 177
    .line 178
    aget-wide v8, v16, v5

    .line 179
    .line 180
    aget-wide v10, p2, v5

    .line 181
    .line 182
    xor-long/2addr v10, v1

    .line 183
    aput-wide v10, p2, v5

    .line 184
    .line 185
    aget-wide v10, p2, v6

    .line 186
    .line 187
    xor-long/2addr v1, v3

    .line 188
    xor-long/2addr v1, v10

    .line 189
    aput-wide v1, p2, v6

    .line 190
    .line 191
    aget-wide v1, p2, v0

    .line 192
    .line 193
    xor-long/2addr v3, v8

    .line 194
    xor-long/2addr v1, v3

    .line 195
    aput-wide v1, p2, v0

    .line 196
    .line 197
    aget-wide v0, p2, v7

    .line 198
    .line 199
    xor-long/2addr v0, v8

    .line 200
    aput-wide v0, p2, v7

    .line 201
    .line 202
    invoke-static/range {p2 .. p2}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implCompactExt([J)V

    .line 203
    .line 204
    .line 205
    return-void
.end method

.method public static implMulwAcc(JJ[JI)V
    .locals 17

    .line 1
    move-wide/from16 v0, p0

    .line 2
    .line 3
    const/16 v2, 0x8

    .line 4
    .line 5
    new-array v2, v2, [J

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    aput-wide p2, v2, v3

    .line 9
    .line 10
    shl-long v4, p2, v3

    .line 11
    .line 12
    const/4 v6, 0x2

    .line 13
    aput-wide v4, v2, v6

    .line 14
    .line 15
    xor-long v4, v4, p2

    .line 16
    .line 17
    const/4 v7, 0x3

    .line 18
    aput-wide v4, v2, v7

    .line 19
    .line 20
    shl-long v8, p2, v6

    .line 21
    .line 22
    const/4 v6, 0x4

    .line 23
    aput-wide v8, v2, v6

    .line 24
    .line 25
    xor-long v8, v8, p2

    .line 26
    .line 27
    const/4 v6, 0x5

    .line 28
    aput-wide v8, v2, v6

    .line 29
    .line 30
    shl-long/2addr v4, v3

    .line 31
    const/4 v8, 0x6

    .line 32
    aput-wide v4, v2, v8

    .line 33
    .line 34
    xor-long v4, v4, p2

    .line 35
    .line 36
    const/4 v8, 0x7

    .line 37
    aput-wide v4, v2, v8

    .line 38
    .line 39
    long-to-int v4, v0

    .line 40
    and-int/lit8 v5, v4, 0x7

    .line 41
    .line 42
    aget-wide v9, v2, v5

    .line 43
    .line 44
    ushr-int/2addr v4, v7

    .line 45
    and-int/2addr v4, v8

    .line 46
    aget-wide v4, v2, v4

    .line 47
    .line 48
    shl-long/2addr v4, v7

    .line 49
    xor-long/2addr v4, v9

    .line 50
    const-wide/16 v9, 0x0

    .line 51
    .line 52
    const/16 v11, 0x36

    .line 53
    .line 54
    :cond_0
    ushr-long v12, v0, v11

    .line 55
    .line 56
    long-to-int v12, v12

    .line 57
    and-int/lit8 v13, v12, 0x7

    .line 58
    .line 59
    aget-wide v13, v2, v13

    .line 60
    .line 61
    ushr-int/2addr v12, v7

    .line 62
    and-int/2addr v12, v8

    .line 63
    aget-wide v15, v2, v12

    .line 64
    .line 65
    shl-long/2addr v15, v7

    .line 66
    xor-long v12, v13, v15

    .line 67
    .line 68
    shl-long v14, v12, v11

    .line 69
    .line 70
    xor-long/2addr v4, v14

    .line 71
    neg-int v14, v11

    .line 72
    ushr-long/2addr v12, v14

    .line 73
    xor-long/2addr v9, v12

    .line 74
    add-int/lit8 v11, v11, -0x6

    .line 75
    .line 76
    if-gtz v11, :cond_0

    .line 77
    .line 78
    aget-wide v0, p4, p5

    .line 79
    .line 80
    const-wide v7, 0x7ffffffffffffffL

    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    and-long/2addr v7, v4

    .line 86
    xor-long/2addr v0, v7

    .line 87
    aput-wide v0, p4, p5

    .line 88
    .line 89
    add-int/lit8 v0, p5, 0x1

    .line 90
    .line 91
    aget-wide v1, p4, v0

    .line 92
    .line 93
    const/16 v3, 0x3b

    .line 94
    .line 95
    ushr-long v3, v4, v3

    .line 96
    .line 97
    shl-long v5, v9, v6

    .line 98
    .line 99
    xor-long/2addr v3, v5

    .line 100
    xor-long/2addr v1, v3

    .line 101
    aput-wide v1, p4, v0

    .line 102
    .line 103
    return-void
.end method

.method public static implSquare([J[J)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    invoke-static {v1, v2, p1, v0}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    aget-wide v0, p0, v0

    .line 9
    .line 10
    const/4 v2, 0x2

    .line 11
    invoke-static {v0, v1, p1, v2}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 12
    .line 13
    .line 14
    aget-wide v0, p0, v2

    .line 15
    .line 16
    const/4 v2, 0x4

    .line 17
    invoke-static {v0, v1, p1, v2}, Lorg/spongycastle/math/raw/Interleave;->expand64To128(J[JI)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x3

    .line 21
    aget-wide v0, p0, v0

    .line 22
    .line 23
    long-to-int p0, v0

    .line 24
    invoke-static {p0}, Lorg/spongycastle/math/raw/Interleave;->expand32to64(I)J

    .line 25
    .line 26
    .line 27
    move-result-wide v2

    .line 28
    const/4 p0, 0x6

    .line 29
    aput-wide v2, p1, p0

    .line 30
    .line 31
    const/16 p0, 0x20

    .line 32
    .line 33
    ushr-long/2addr v0, p0

    .line 34
    long-to-int p0, v0

    .line 35
    invoke-static {p0}, Lorg/spongycastle/math/raw/Interleave;->expand16to32(I)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    int-to-long v0, p0

    .line 40
    const-wide v2, 0xffffffffL

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    and-long/2addr v0, v2

    .line 46
    const/4 p0, 0x7

    .line 47
    aput-wide v0, p1, p0

    .line 48
    .line 49
    return-void
.end method

.method public static invert([J[J)V
    .locals 3

    .line 1
    invoke-static {p0}, Lorg/spongycastle/math/raw/Nat256;->isZero64([J)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->create64()[J

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->create64()[J

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->square([J[J)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->square([J[J)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x3

    .line 28
    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->squareN([JI[J)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->square([J[J)V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 38
    .line 39
    .line 40
    const/4 v2, 0x7

    .line 41
    invoke-static {v1, v2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->squareN([JI[J)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 45
    .line 46
    .line 47
    const/16 v2, 0xe

    .line 48
    .line 49
    invoke-static {v0, v2, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->squareN([JI[J)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 53
    .line 54
    .line 55
    invoke-static {v1, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->square([J[J)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0x1d

    .line 62
    .line 63
    invoke-static {v1, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->squareN([JI[J)V

    .line 64
    .line 65
    .line 66
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 67
    .line 68
    .line 69
    const/16 p0, 0x3a

    .line 70
    .line 71
    invoke-static {v0, p0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->squareN([JI[J)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v0, v1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 75
    .line 76
    .line 77
    const/16 p0, 0x74

    .line 78
    .line 79
    invoke-static {v1, p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->squareN([JI[J)V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->multiply([J[J[J)V

    .line 83
    .line 84
    .line 85
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->square([J[J)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static multiply([J[J[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMultiply([J[J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->reduce([J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static multiplyAddToExt([J[J[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implMultiply([J[J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {p2, v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->addExt([J[J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static reduce([J[J)V
    .locals 27

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v1, p0, v0

    .line 3
    .line 4
    const/4 v3, 0x1

    .line 5
    aget-wide v4, p0, v3

    .line 6
    .line 7
    const/4 v6, 0x2

    .line 8
    aget-wide v7, p0, v6

    .line 9
    .line 10
    const/4 v9, 0x3

    .line 11
    aget-wide v10, p0, v9

    .line 12
    .line 13
    const/4 v12, 0x4

    .line 14
    aget-wide v12, p0, v12

    .line 15
    .line 16
    const/4 v14, 0x5

    .line 17
    aget-wide v14, p0, v14

    .line 18
    .line 19
    const/16 v16, 0x6

    .line 20
    .line 21
    aget-wide v16, p0, v16

    .line 22
    .line 23
    const/16 v18, 0x7

    .line 24
    .line 25
    aget-wide v18, p0, v18

    .line 26
    .line 27
    const/16 v20, 0x17

    .line 28
    .line 29
    shl-long v21, v18, v20

    .line 30
    .line 31
    xor-long v10, v10, v21

    .line 32
    .line 33
    const/16 v21, 0x29

    .line 34
    .line 35
    ushr-long v22, v18, v21

    .line 36
    .line 37
    const/16 v24, 0x21

    .line 38
    .line 39
    shl-long v25, v18, v24

    .line 40
    .line 41
    xor-long v22, v22, v25

    .line 42
    .line 43
    xor-long v12, v12, v22

    .line 44
    .line 45
    const/16 v22, 0x1f

    .line 46
    .line 47
    ushr-long v18, v18, v22

    .line 48
    .line 49
    xor-long v14, v14, v18

    .line 50
    .line 51
    shl-long v18, v16, v20

    .line 52
    .line 53
    xor-long v7, v7, v18

    .line 54
    .line 55
    ushr-long v18, v16, v21

    .line 56
    .line 57
    shl-long v25, v16, v24

    .line 58
    .line 59
    xor-long v18, v18, v25

    .line 60
    .line 61
    xor-long v10, v10, v18

    .line 62
    .line 63
    ushr-long v16, v16, v22

    .line 64
    .line 65
    xor-long v12, v12, v16

    .line 66
    .line 67
    shl-long v16, v14, v20

    .line 68
    .line 69
    xor-long v4, v4, v16

    .line 70
    .line 71
    ushr-long v16, v14, v21

    .line 72
    .line 73
    shl-long v18, v14, v24

    .line 74
    .line 75
    xor-long v16, v16, v18

    .line 76
    .line 77
    xor-long v7, v7, v16

    .line 78
    .line 79
    ushr-long v14, v14, v22

    .line 80
    .line 81
    xor-long/2addr v10, v14

    .line 82
    shl-long v14, v12, v20

    .line 83
    .line 84
    xor-long/2addr v1, v14

    .line 85
    ushr-long v14, v12, v21

    .line 86
    .line 87
    shl-long v16, v12, v24

    .line 88
    .line 89
    xor-long v14, v14, v16

    .line 90
    .line 91
    xor-long/2addr v4, v14

    .line 92
    ushr-long v12, v12, v22

    .line 93
    .line 94
    xor-long/2addr v7, v12

    .line 95
    ushr-long v12, v10, v21

    .line 96
    .line 97
    xor-long/2addr v1, v12

    .line 98
    aput-wide v1, p1, v0

    .line 99
    .line 100
    const/16 v0, 0xa

    .line 101
    .line 102
    shl-long v0, v12, v0

    .line 103
    .line 104
    xor-long/2addr v0, v4

    .line 105
    aput-wide v0, p1, v3

    .line 106
    .line 107
    aput-wide v7, p1, v6

    .line 108
    .line 109
    const-wide v0, 0x1ffffffffffL

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    and-long/2addr v0, v10

    .line 115
    aput-wide v0, p1, v9

    .line 116
    .line 117
    return-void
.end method

.method public static reduce23([JI)V
    .locals 8

    .line 1
    add-int/lit8 v0, p1, 0x3

    .line 2
    .line 3
    aget-wide v1, p0, v0

    .line 4
    .line 5
    const/16 v3, 0x29

    .line 6
    .line 7
    ushr-long v3, v1, v3

    .line 8
    .line 9
    aget-wide v5, p0, p1

    .line 10
    .line 11
    xor-long/2addr v5, v3

    .line 12
    aput-wide v5, p0, p1

    .line 13
    .line 14
    add-int/lit8 p1, p1, 0x1

    .line 15
    .line 16
    aget-wide v5, p0, p1

    .line 17
    .line 18
    const/16 v7, 0xa

    .line 19
    .line 20
    shl-long/2addr v3, v7

    .line 21
    xor-long/2addr v3, v5

    .line 22
    aput-wide v3, p0, p1

    .line 23
    .line 24
    const-wide v3, 0x1ffffffffffL

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    and-long/2addr v1, v3

    .line 30
    aput-wide v1, p0, v0

    .line 31
    .line 32
    return-void
.end method

.method public static sqrt([J[J)V
    .locals 27

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget-wide v2, p0, v1

    .line 5
    .line 6
    invoke-static {v2, v3}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    .line 7
    .line 8
    .line 9
    move-result-wide v2

    .line 10
    const/4 v4, 0x1

    .line 11
    aget-wide v5, p0, v4

    .line 12
    .line 13
    invoke-static {v5, v6}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    .line 14
    .line 15
    .line 16
    move-result-wide v5

    .line 17
    const-wide v7, 0xffffffffL

    .line 18
    .line 19
    .line 20
    .line 21
    .line 22
    and-long v9, v2, v7

    .line 23
    .line 24
    const/16 v11, 0x20

    .line 25
    .line 26
    shl-long v12, v5, v11

    .line 27
    .line 28
    or-long/2addr v9, v12

    .line 29
    ushr-long/2addr v2, v11

    .line 30
    const-wide v12, -0x100000000L

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    and-long/2addr v5, v12

    .line 36
    or-long/2addr v2, v5

    .line 37
    const/4 v5, 0x2

    .line 38
    aget-wide v5, p0, v5

    .line 39
    .line 40
    invoke-static {v5, v6}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    .line 41
    .line 42
    .line 43
    move-result-wide v5

    .line 44
    const/4 v14, 0x3

    .line 45
    aget-wide v15, p0, v14

    .line 46
    .line 47
    invoke-static/range {v15 .. v16}, Lorg/spongycastle/math/raw/Interleave;->unshuffle(J)J

    .line 48
    .line 49
    .line 50
    move-result-wide v15

    .line 51
    and-long/2addr v7, v5

    .line 52
    shl-long v17, v15, v11

    .line 53
    .line 54
    or-long v7, v7, v17

    .line 55
    .line 56
    ushr-long/2addr v5, v11

    .line 57
    and-long/2addr v12, v15

    .line 58
    or-long/2addr v5, v12

    .line 59
    const/16 v12, 0x1b

    .line 60
    .line 61
    ushr-long v15, v5, v12

    .line 62
    .line 63
    ushr-long v12, v2, v12

    .line 64
    .line 65
    const/16 v17, 0x25

    .line 66
    .line 67
    shl-long v18, v5, v17

    .line 68
    .line 69
    or-long v12, v12, v18

    .line 70
    .line 71
    xor-long/2addr v5, v12

    .line 72
    shl-long v12, v2, v17

    .line 73
    .line 74
    xor-long/2addr v2, v12

    .line 75
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->createExt64()[J

    .line 76
    .line 77
    .line 78
    move-result-object v12

    .line 79
    const/16 v13, 0x75

    .line 80
    .line 81
    move/from16 v17, v1

    .line 82
    .line 83
    const/16 v1, 0xbf

    .line 84
    .line 85
    filled-new-array {v11, v13, v1}, [I

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    move/from16 v11, v17

    .line 90
    .line 91
    :goto_0
    if-ge v11, v14, :cond_0

    .line 92
    .line 93
    aget v13, v1, v11

    .line 94
    .line 95
    ushr-int/lit8 v18, v13, 0x6

    .line 96
    .line 97
    and-int/lit8 v13, v13, 0x3f

    .line 98
    .line 99
    aget-wide v19, v12, v18

    .line 100
    .line 101
    shl-long v21, v2, v13

    .line 102
    .line 103
    xor-long v19, v19, v21

    .line 104
    .line 105
    aput-wide v19, v12, v18

    .line 106
    .line 107
    add-int/lit8 v19, v18, 0x1

    .line 108
    .line 109
    aget-wide v20, v12, v19

    .line 110
    .line 111
    shl-long v22, v5, v13

    .line 112
    .line 113
    move/from16 v24, v4

    .line 114
    .line 115
    neg-int v4, v13

    .line 116
    ushr-long v25, v2, v4

    .line 117
    .line 118
    or-long v22, v22, v25

    .line 119
    .line 120
    xor-long v20, v20, v22

    .line 121
    .line 122
    aput-wide v20, v12, v19

    .line 123
    .line 124
    add-int/lit8 v19, v18, 0x2

    .line 125
    .line 126
    aget-wide v20, v12, v19

    .line 127
    .line 128
    shl-long v22, v15, v13

    .line 129
    .line 130
    ushr-long v25, v5, v4

    .line 131
    .line 132
    or-long v22, v22, v25

    .line 133
    .line 134
    xor-long v20, v20, v22

    .line 135
    .line 136
    aput-wide v20, v12, v19

    .line 137
    .line 138
    add-int/lit8 v18, v18, 0x3

    .line 139
    .line 140
    aget-wide v19, v12, v18

    .line 141
    .line 142
    ushr-long v21, v15, v4

    .line 143
    .line 144
    xor-long v19, v19, v21

    .line 145
    .line 146
    aput-wide v19, v12, v18

    .line 147
    .line 148
    add-int/lit8 v11, v11, 0x1

    .line 149
    .line 150
    move/from16 v4, v24

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_0
    move/from16 v24, v4

    .line 154
    .line 155
    invoke-static {v12, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->reduce([J[J)V

    .line 156
    .line 157
    .line 158
    aget-wide v1, v0, v17

    .line 159
    .line 160
    xor-long/2addr v1, v9

    .line 161
    aput-wide v1, v0, v17

    .line 162
    .line 163
    aget-wide v1, v0, v24

    .line 164
    .line 165
    xor-long/2addr v1, v7

    .line 166
    aput-wide v1, v0, v24

    .line 167
    .line 168
    return-void
.end method

.method public static square([J[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implSquare([J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->reduce([J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static squareAddToExt([J[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implSquare([J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {p1, v0, p1}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->addExt([J[J[J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static squareN([JI[J)V
    .locals 1

    .line 1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat256;->createExt64()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implSquare([J[J)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->reduce([J[J)V

    .line 9
    .line 10
    .line 11
    :goto_0
    add-int/lit8 p1, p1, -0x1

    .line 12
    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    invoke-static {p2, v0}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->implSquare([J[J)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, p2}, Lorg/spongycastle/math/ec/custom/sec/SecT233Field;->reduce([J[J)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public static trace([J)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    aget-wide v0, p0, v0

    .line 3
    .line 4
    const/4 v2, 0x2

    .line 5
    aget-wide v2, p0, v2

    .line 6
    .line 7
    const/16 p0, 0x1f

    .line 8
    .line 9
    ushr-long/2addr v2, p0

    .line 10
    xor-long/2addr v0, v2

    .line 11
    long-to-int p0, v0

    .line 12
    and-int/lit8 p0, p0, 0x1

    .line 13
    .line 14
    return p0
.end method
