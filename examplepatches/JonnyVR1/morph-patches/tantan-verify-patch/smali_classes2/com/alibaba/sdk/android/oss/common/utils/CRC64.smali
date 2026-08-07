.class public Lcom/alibaba/sdk/android/oss/common/utils/CRC64;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/zip/Checksum;


# static fields
.field private static final GF2_DIM:I = 0x40

.field private static final POLY:J = -0x3693a86a2878f0beL

.field private static final table:[[J


# instance fields
.field private value:J


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    const/16 v2, 0x100

    .line 6
    .line 7
    aput v2, v0, v1

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const/16 v4, 0x8

    .line 11
    .line 12
    aput v4, v0, v3

    .line 13
    .line 14
    sget-object v5, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 15
    .line 16
    invoke-static {v5, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, [[J

    .line 21
    .line 22
    sput-object v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->table:[[J

    .line 23
    .line 24
    move v0, v3

    .line 25
    :goto_0
    if-ge v0, v2, :cond_2

    .line 26
    .line 27
    int-to-long v5, v0

    .line 28
    move v7, v3

    .line 29
    :goto_1
    if-ge v7, v4, :cond_1

    .line 30
    .line 31
    const-wide/16 v8, 0x1

    .line 32
    .line 33
    and-long v10, v5, v8

    .line 34
    .line 35
    cmp-long v8, v10, v8

    .line 36
    .line 37
    if-nez v8, :cond_0

    .line 38
    .line 39
    ushr-long/2addr v5, v1

    .line 40
    const-wide v8, -0x3693a86a2878f0beL    # -5.0564049839430436E45

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    xor-long/2addr v5, v8

    .line 46
    goto :goto_2

    .line 47
    :cond_0
    ushr-long/2addr v5, v1

    .line 48
    :goto_2
    add-int/lit8 v7, v7, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    sget-object v7, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->table:[[J

    .line 52
    .line 53
    aget-object v7, v7, v3

    .line 54
    .line 55
    aput-wide v5, v7, v0

    .line 56
    .line 57
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    move v0, v3

    .line 61
    :goto_3
    if-ge v0, v2, :cond_4

    .line 62
    .line 63
    sget-object v5, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->table:[[J

    .line 64
    .line 65
    aget-object v5, v5, v3

    .line 66
    .line 67
    aget-wide v6, v5, v0

    .line 68
    .line 69
    move v5, v1

    .line 70
    :goto_4
    if-ge v5, v4, :cond_3

    .line 71
    .line 72
    sget-object v8, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->table:[[J

    .line 73
    .line 74
    aget-object v9, v8, v3

    .line 75
    .line 76
    const-wide/16 v10, 0xff

    .line 77
    .line 78
    and-long/2addr v10, v6

    .line 79
    long-to-int v10, v10

    .line 80
    aget-wide v10, v9, v10

    .line 81
    .line 82
    ushr-long/2addr v6, v4

    .line 83
    xor-long/2addr v6, v10

    .line 84
    aget-object v8, v8, v5

    .line 85
    .line 86
    aput-wide v6, v8, v0

    .line 87
    .line 88
    add-int/lit8 v5, v5, 0x1

    .line 89
    .line 90
    goto :goto_4

    .line 91
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 92
    .line 93
    goto :goto_3

    .line 94
    :cond_4
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 7
    .line 8
    return-void
.end method

.method public static combine(JJJ)J
    .locals 12

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p4, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    return-wide p0

    .line 8
    :cond_0
    const/16 v2, 0x40

    .line 9
    .line 10
    new-array v3, v2, [J

    .line 11
    .line 12
    new-array v4, v2, [J

    .line 13
    .line 14
    const/4 v5, 0x0

    .line 15
    const-wide v6, -0x3693a86a2878f0beL    # -5.0564049839430436E45

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    aput-wide v6, v4, v5

    .line 21
    .line 22
    const/4 v5, 0x1

    .line 23
    const-wide/16 v6, 0x1

    .line 24
    .line 25
    move v8, v5

    .line 26
    move-wide v9, v6

    .line 27
    :goto_0
    if-ge v8, v2, :cond_1

    .line 28
    .line 29
    aput-wide v9, v4, v8

    .line 30
    .line 31
    shl-long/2addr v9, v5

    .line 32
    add-int/lit8 v8, v8, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {v3, v4}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->gf2MatrixSquare([J[J)V

    .line 36
    .line 37
    .line 38
    invoke-static {v4, v3}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->gf2MatrixSquare([J[J)V

    .line 39
    .line 40
    .line 41
    move-wide/from16 v8, p4

    .line 42
    .line 43
    :cond_2
    invoke-static {v3, v4}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->gf2MatrixSquare([J[J)V

    .line 44
    .line 45
    .line 46
    and-long v10, v8, v6

    .line 47
    .line 48
    cmp-long v2, v10, v6

    .line 49
    .line 50
    if-nez v2, :cond_3

    .line 51
    .line 52
    invoke-static {v3, p0, p1}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->gf2MatrixTimes([JJ)J

    .line 53
    .line 54
    .line 55
    move-result-wide p0

    .line 56
    :cond_3
    ushr-long v10, v8, v5

    .line 57
    .line 58
    cmp-long v2, v10, v0

    .line 59
    .line 60
    if-nez v2, :cond_4

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_4
    invoke-static {v4, v3}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->gf2MatrixSquare([J[J)V

    .line 64
    .line 65
    .line 66
    and-long/2addr v10, v6

    .line 67
    cmp-long v2, v10, v6

    .line 68
    .line 69
    if-nez v2, :cond_5

    .line 70
    .line 71
    invoke-static {v4, p0, p1}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->gf2MatrixTimes([JJ)J

    .line 72
    .line 73
    .line 74
    move-result-wide p0

    .line 75
    :cond_5
    const/4 v2, 0x2

    .line 76
    ushr-long/2addr v8, v2

    .line 77
    cmp-long v2, v8, v0

    .line 78
    .line 79
    if-nez v2, :cond_2

    .line 80
    .line 81
    :goto_1
    xor-long/2addr p0, p2

    .line 82
    return-wide p0
.end method

.method private static gf2MatrixSquare([J[J)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/16 v1, 0x40

    .line 3
    .line 4
    if-ge v0, v1, :cond_0

    .line 5
    .line 6
    aget-wide v1, p1, v0

    .line 7
    .line 8
    invoke-static {p1, v1, v2}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->gf2MatrixTimes([JJ)J

    .line 9
    .line 10
    .line 11
    move-result-wide v1

    .line 12
    aput-wide v1, p0, v0

    .line 13
    .line 14
    add-int/lit8 v0, v0, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void
.end method

.method private static gf2MatrixTimes([JJ)J
    .locals 9

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    move-wide v3, v0

    .line 5
    :goto_0
    cmp-long v5, p1, v0

    .line 6
    .line 7
    if-eqz v5, :cond_1

    .line 8
    .line 9
    const-wide/16 v5, 0x1

    .line 10
    .line 11
    and-long v7, p1, v5

    .line 12
    .line 13
    cmp-long v5, v7, v5

    .line 14
    .line 15
    if-nez v5, :cond_0

    .line 16
    .line 17
    aget-wide v5, p0, v2

    .line 18
    .line 19
    xor-long/2addr v3, v5

    .line 20
    :cond_0
    const/4 v5, 0x1

    .line 21
    ushr-long/2addr p1, v5

    .line 22
    add-int/lit8 v2, v2, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return-wide v3
.end method


# virtual methods
.method public getValue()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public reset()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 4
    .line 5
    return-void
.end method

.method public update(I)V
    .locals 3

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v0, 0x1

    .line 220
    new-array v1, v0, [B

    const/4 v2, 0x0

    aput-byte p1, v1, v2

    .line 221
    invoke-virtual {p0, v1, v0}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->update([BI)V

    return-void
.end method

.method public update([BI)V
    .locals 1

    const/4 v0, 0x0

    .line 219
    invoke-virtual {p0, p1, v0, p2}, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->update([BII)V

    return-void
.end method

.method public update([BII)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 4
    .line 5
    not-long v1, v1

    .line 6
    iput-wide v1, v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 7
    .line 8
    move/from16 v1, p2

    .line 9
    .line 10
    move/from16 v2, p3

    .line 11
    .line 12
    :goto_0
    const/16 v5, 0x8

    .line 13
    .line 14
    const-wide/16 v6, 0xff

    .line 15
    .line 16
    if-lt v2, v5, :cond_0

    .line 17
    .line 18
    sget-object v8, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->table:[[J

    .line 19
    .line 20
    const/4 v9, 0x7

    .line 21
    aget-object v9, v8, v9

    .line 22
    .line 23
    iget-wide v10, v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 24
    .line 25
    and-long v12, v10, v6

    .line 26
    .line 27
    aget-byte v14, p1, v1

    .line 28
    .line 29
    and-int/lit16 v14, v14, 0xff

    .line 30
    .line 31
    int-to-long v14, v14

    .line 32
    xor-long/2addr v12, v14

    .line 33
    long-to-int v12, v12

    .line 34
    aget-wide v12, v9, v12

    .line 35
    .line 36
    const/4 v9, 0x6

    .line 37
    aget-object v9, v8, v9

    .line 38
    .line 39
    ushr-long v14, v10, v5

    .line 40
    .line 41
    and-long/2addr v14, v6

    .line 42
    add-int/lit8 v5, v1, 0x1

    .line 43
    .line 44
    aget-byte v5, p1, v5

    .line 45
    .line 46
    and-int/lit16 v5, v5, 0xff

    .line 47
    .line 48
    const/16 p2, 0x0

    .line 49
    .line 50
    const/16 p3, 0x1

    .line 51
    .line 52
    int-to-long v3, v5

    .line 53
    xor-long/2addr v3, v14

    .line 54
    long-to-int v3, v3

    .line 55
    aget-wide v3, v9, v3

    .line 56
    .line 57
    xor-long/2addr v3, v12

    .line 58
    const/4 v5, 0x5

    .line 59
    aget-object v5, v8, v5

    .line 60
    .line 61
    const/16 v9, 0x10

    .line 62
    .line 63
    ushr-long v12, v10, v9

    .line 64
    .line 65
    and-long/2addr v12, v6

    .line 66
    add-int/lit8 v9, v1, 0x2

    .line 67
    .line 68
    aget-byte v9, p1, v9

    .line 69
    .line 70
    and-int/lit16 v9, v9, 0xff

    .line 71
    .line 72
    int-to-long v14, v9

    .line 73
    xor-long/2addr v12, v14

    .line 74
    long-to-int v9, v12

    .line 75
    aget-wide v12, v5, v9

    .line 76
    .line 77
    xor-long/2addr v3, v12

    .line 78
    const/4 v5, 0x4

    .line 79
    aget-object v5, v8, v5

    .line 80
    .line 81
    const/16 v9, 0x18

    .line 82
    .line 83
    ushr-long v12, v10, v9

    .line 84
    .line 85
    and-long/2addr v12, v6

    .line 86
    add-int/lit8 v9, v1, 0x3

    .line 87
    .line 88
    aget-byte v9, p1, v9

    .line 89
    .line 90
    and-int/lit16 v9, v9, 0xff

    .line 91
    .line 92
    int-to-long v14, v9

    .line 93
    xor-long/2addr v12, v14

    .line 94
    long-to-int v9, v12

    .line 95
    aget-wide v12, v5, v9

    .line 96
    .line 97
    xor-long/2addr v3, v12

    .line 98
    const/4 v5, 0x3

    .line 99
    aget-object v5, v8, v5

    .line 100
    .line 101
    const/16 v9, 0x20

    .line 102
    .line 103
    ushr-long v12, v10, v9

    .line 104
    .line 105
    and-long/2addr v12, v6

    .line 106
    add-int/lit8 v9, v1, 0x4

    .line 107
    .line 108
    aget-byte v9, p1, v9

    .line 109
    .line 110
    and-int/lit16 v9, v9, 0xff

    .line 111
    .line 112
    int-to-long v14, v9

    .line 113
    xor-long/2addr v12, v14

    .line 114
    long-to-int v9, v12

    .line 115
    aget-wide v12, v5, v9

    .line 116
    .line 117
    xor-long/2addr v3, v12

    .line 118
    const/4 v5, 0x2

    .line 119
    aget-object v5, v8, v5

    .line 120
    .line 121
    const/16 v9, 0x28

    .line 122
    .line 123
    ushr-long v12, v10, v9

    .line 124
    .line 125
    and-long/2addr v12, v6

    .line 126
    add-int/lit8 v9, v1, 0x5

    .line 127
    .line 128
    aget-byte v9, p1, v9

    .line 129
    .line 130
    and-int/lit16 v9, v9, 0xff

    .line 131
    .line 132
    int-to-long v14, v9

    .line 133
    xor-long/2addr v12, v14

    .line 134
    long-to-int v9, v12

    .line 135
    aget-wide v12, v5, v9

    .line 136
    .line 137
    xor-long/2addr v3, v12

    .line 138
    aget-object v5, v8, p3

    .line 139
    .line 140
    const/16 v9, 0x30

    .line 141
    .line 142
    ushr-long v12, v10, v9

    .line 143
    .line 144
    and-long/2addr v6, v12

    .line 145
    add-int/lit8 v9, v1, 0x6

    .line 146
    .line 147
    aget-byte v9, p1, v9

    .line 148
    .line 149
    and-int/lit16 v9, v9, 0xff

    .line 150
    .line 151
    int-to-long v12, v9

    .line 152
    xor-long/2addr v6, v12

    .line 153
    long-to-int v6, v6

    .line 154
    aget-wide v6, v5, v6

    .line 155
    .line 156
    xor-long/2addr v3, v6

    .line 157
    aget-object v5, v8, p2

    .line 158
    .line 159
    const/16 v6, 0x38

    .line 160
    .line 161
    ushr-long v6, v10, v6

    .line 162
    .line 163
    add-int/lit8 v8, v1, 0x7

    .line 164
    .line 165
    aget-byte v8, p1, v8

    .line 166
    .line 167
    and-int/lit16 v8, v8, 0xff

    .line 168
    .line 169
    int-to-long v8, v8

    .line 170
    xor-long/2addr v6, v8

    .line 171
    long-to-int v6, v6

    .line 172
    aget-wide v6, v5, v6

    .line 173
    .line 174
    xor-long/2addr v3, v6

    .line 175
    iput-wide v3, v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 176
    .line 177
    add-int/lit8 v1, v1, 0x8

    .line 178
    .line 179
    add-int/lit8 v2, v2, -0x8

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_0
    const/16 p2, 0x0

    .line 184
    .line 185
    const/16 p3, 0x1

    .line 186
    .line 187
    :goto_1
    if-lez v2, :cond_1

    .line 188
    .line 189
    sget-object v3, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->table:[[J

    .line 190
    .line 191
    aget-object v3, v3, p2

    .line 192
    .line 193
    iget-wide v8, v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 194
    .line 195
    aget-byte v4, p1, v1

    .line 196
    .line 197
    int-to-long v10, v4

    .line 198
    xor-long/2addr v10, v8

    .line 199
    and-long/2addr v10, v6

    .line 200
    long-to-int v4, v10

    .line 201
    aget-wide v10, v3, v4

    .line 202
    .line 203
    ushr-long v3, v8, v5

    .line 204
    .line 205
    xor-long/2addr v3, v10

    .line 206
    iput-wide v3, v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 207
    .line 208
    add-int/lit8 v1, v1, 0x1

    .line 209
    .line 210
    add-int/lit8 v2, v2, -0x1

    .line 211
    .line 212
    goto :goto_1

    .line 213
    :cond_1
    iget-wide v1, v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 214
    .line 215
    not-long v1, v1

    .line 216
    iput-wide v1, v0, Lcom/alibaba/sdk/android/oss/common/utils/CRC64;->value:J

    .line 217
    .line 218
    return-void
.end method
