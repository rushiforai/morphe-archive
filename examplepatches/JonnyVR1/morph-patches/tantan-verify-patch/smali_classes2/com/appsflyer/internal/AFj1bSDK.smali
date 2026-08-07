.class public final Lcom/appsflyer/internal/AFj1bSDK;
.super Ljava/io/FilterInputStream;
.source "SourceFile"


# static fields
.field private static final AFAdRevenueData:[I

.field private static final getCurrencyIso4217Code:[I

.field private static final getMediationNetwork:[I

.field private static final getMonetizationNetwork:[I

.field private static final getRevenue:[B


# instance fields
.field private AFInAppEventType:I

.field private final areAllFieldsValid:[[B

.field private final component1:[I

.field private final component2:I

.field private final component3:[I

.field private final component4:[B

.field private final copy:I

.field private copydefault:I

.field private final equals:I

.field private hashCode:I

.field private final toString:[B

.field private values:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/appsflyer/internal/AFj1dSDK;->getMediationNetwork:[B

    .line 2
    .line 3
    sput-object v0, Lcom/appsflyer/internal/AFj1bSDK;->getRevenue:[B

    .line 4
    .line 5
    sget-object v0, Lcom/appsflyer/internal/AFj1dSDK;->getCurrencyIso4217Code:[I

    .line 6
    .line 7
    sput-object v0, Lcom/appsflyer/internal/AFj1bSDK;->getMediationNetwork:[I

    .line 8
    .line 9
    sget-object v0, Lcom/appsflyer/internal/AFj1dSDK;->AFAdRevenueData:[I

    .line 10
    .line 11
    sput-object v0, Lcom/appsflyer/internal/AFj1bSDK;->getMonetizationNetwork:[I

    .line 12
    .line 13
    sget-object v0, Lcom/appsflyer/internal/AFj1dSDK;->getRevenue:[I

    .line 14
    .line 15
    sput-object v0, Lcom/appsflyer/internal/AFj1bSDK;->AFAdRevenueData:[I

    .line 16
    .line 17
    sget-object v0, Lcom/appsflyer/internal/AFj1dSDK;->getMonetizationNetwork:[I

    .line 18
    .line 19
    sput-object v0, Lcom/appsflyer/internal/AFj1bSDK;->getCurrencyIso4217Code:[I

    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I[B[[B)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 59
    invoke-direct/range {v0 .. v5}, Lcom/appsflyer/internal/AFj1bSDK;-><init>(Ljava/io/InputStream;I[B[[BB)V

    return-void
.end method

.method private constructor <init>(Ljava/io/InputStream;I[B[[BB)V
    .locals 1

    .line 1
    new-instance p5, Ljava/io/BufferedInputStream;

    .line 2
    .line 3
    const/16 v0, 0x1000

    .line 4
    .line 5
    invoke-direct {p5, p1, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p5}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x4

    .line 12
    new-array p1, p1, [I

    .line 13
    .line 14
    iput-object p1, p0, Lcom/appsflyer/internal/AFj1bSDK;->component3:[I

    .line 15
    .line 16
    const/16 p1, 0x10

    .line 17
    .line 18
    new-array p5, p1, [B

    .line 19
    .line 20
    iput-object p5, p0, Lcom/appsflyer/internal/AFj1bSDK;->component4:[B

    .line 21
    .line 22
    new-array p5, p1, [B

    .line 23
    .line 24
    iput-object p5, p0, Lcom/appsflyer/internal/AFj1bSDK;->toString:[B

    .line 25
    .line 26
    const/4 p5, 0x1

    .line 27
    iput p5, p0, Lcom/appsflyer/internal/AFj1bSDK;->hashCode:I

    .line 28
    .line 29
    const p5, 0x7fffffff

    .line 30
    .line 31
    .line 32
    iput p5, p0, Lcom/appsflyer/internal/AFj1bSDK;->copydefault:I

    .line 33
    .line 34
    iput p1, p0, Lcom/appsflyer/internal/AFj1bSDK;->values:I

    .line 35
    .line 36
    iput p1, p0, Lcom/appsflyer/internal/AFj1bSDK;->AFInAppEventType:I

    .line 37
    .line 38
    iput p2, p0, Lcom/appsflyer/internal/AFj1bSDK;->component2:I

    .line 39
    .line 40
    invoke-static {p3, p2}, Lcom/appsflyer/internal/AFj1dSDK;->AFAdRevenueData([BI)[I

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iput-object p1, p0, Lcom/appsflyer/internal/AFj1bSDK;->component1:[I

    .line 45
    .line 46
    invoke-static {p4}, Lcom/appsflyer/internal/AFj1bSDK;->getRevenue([[B)[[B

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iput-object p1, p0, Lcom/appsflyer/internal/AFj1bSDK;->areAllFieldsValid:[[B

    .line 51
    .line 52
    const/16 p1, 0x64

    .line 53
    .line 54
    iput p1, p0, Lcom/appsflyer/internal/AFj1bSDK;->equals:I

    .line 55
    .line 56
    iput p1, p0, Lcom/appsflyer/internal/AFj1bSDK;->copy:I

    .line 57
    .line 58
    return-void
.end method

.method private AFAdRevenueData()I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->copydefault:I

    .line 2
    .line 3
    const v1, 0x7fffffff

    .line 4
    .line 5
    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->copydefault:I

    .line 15
    .line 16
    :cond_0
    iget v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->values:I

    .line 17
    .line 18
    const/16 v1, 0x10

    .line 19
    .line 20
    if-ne v0, v1, :cond_9

    .line 21
    .line 22
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->component4:[B

    .line 23
    .line 24
    iget v2, p0, Lcom/appsflyer/internal/AFj1bSDK;->copydefault:I

    .line 25
    .line 26
    int-to-byte v3, v2

    .line 27
    const/4 v4, 0x0

    .line 28
    aput-byte v3, v0, v4

    .line 29
    .line 30
    const-string v0, "unexpected block size"

    .line 31
    .line 32
    if-ltz v2, :cond_8

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    move v3, v2

    .line 36
    :cond_1
    iget-object v5, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 37
    .line 38
    iget-object v6, p0, Lcom/appsflyer/internal/AFj1bSDK;->component4:[B

    .line 39
    .line 40
    rsub-int/lit8 v7, v3, 0x10

    .line 41
    .line 42
    invoke-virtual {v5, v6, v3, v7}, Ljava/io/InputStream;->read([BII)I

    .line 43
    .line 44
    .line 45
    move-result v5

    .line 46
    if-lez v5, :cond_2

    .line 47
    .line 48
    add-int/2addr v3, v5

    .line 49
    if-lt v3, v1, :cond_1

    .line 50
    .line 51
    :cond_2
    if-lt v3, v1, :cond_7

    .line 52
    .line 53
    iget v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->equals:I

    .line 54
    .line 55
    iget v3, p0, Lcom/appsflyer/internal/AFj1bSDK;->copy:I

    .line 56
    .line 57
    if-ne v0, v3, :cond_3

    .line 58
    .line 59
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->component4:[B

    .line 60
    .line 61
    iget-object v2, p0, Lcom/appsflyer/internal/AFj1bSDK;->toString:[B

    .line 62
    .line 63
    invoke-direct {p0, v0, v2}, Lcom/appsflyer/internal/AFj1bSDK;->getCurrencyIso4217Code([B[B)V

    .line 64
    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    iget v3, p0, Lcom/appsflyer/internal/AFj1bSDK;->hashCode:I

    .line 68
    .line 69
    iget-object v5, p0, Lcom/appsflyer/internal/AFj1bSDK;->component4:[B

    .line 70
    .line 71
    if-gt v3, v0, :cond_4

    .line 72
    .line 73
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->toString:[B

    .line 74
    .line 75
    invoke-direct {p0, v5, v0}, Lcom/appsflyer/internal/AFj1bSDK;->getCurrencyIso4217Code([B[B)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_4
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->toString:[B

    .line 80
    .line 81
    array-length v3, v5

    .line 82
    invoke-static {v5, v4, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->hashCode:I

    .line 86
    .line 87
    iget v3, p0, Lcom/appsflyer/internal/AFj1bSDK;->copy:I

    .line 88
    .line 89
    if-ge v0, v3, :cond_5

    .line 90
    .line 91
    add-int/2addr v0, v2

    .line 92
    iput v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->hashCode:I

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_5
    iput v2, p0, Lcom/appsflyer/internal/AFj1bSDK;->hashCode:I

    .line 96
    .line 97
    :goto_1
    iget-object v0, p0, Ljava/io/FilterInputStream;->in:Ljava/io/InputStream;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    iput v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->copydefault:I

    .line 104
    .line 105
    iput v4, p0, Lcom/appsflyer/internal/AFj1bSDK;->values:I

    .line 106
    .line 107
    if-gez v0, :cond_6

    .line 108
    .line 109
    iget-object v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->toString:[B

    .line 110
    .line 111
    const/16 v2, 0xf

    .line 112
    .line 113
    aget-byte v0, v0, v2

    .line 114
    .line 115
    and-int/lit16 v0, v0, 0xff

    .line 116
    .line 117
    sub-int/2addr v1, v0

    .line 118
    :cond_6
    iput v1, p0, Lcom/appsflyer/internal/AFj1bSDK;->AFInAppEventType:I

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_7
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :goto_2
    const/4 p0, 0x0

    .line 125
    return p0

    .line 126
    :cond_8
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_9
    :goto_3
    iget p0, p0, Lcom/appsflyer/internal/AFj1bSDK;->AFInAppEventType:I

    .line 131
    .line 132
    return p0
.end method

.method private getCurrencyIso4217Code([B[B)V
    .locals 34

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/appsflyer/internal/AFj1bSDK;->component3:[I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    aget-byte v3, p1, v2

    .line 7
    .line 8
    shl-int/lit8 v3, v3, 0x18

    .line 9
    .line 10
    const/4 v4, 0x1

    .line 11
    aget-byte v5, p1, v4

    .line 12
    .line 13
    and-int/lit16 v5, v5, 0xff

    .line 14
    .line 15
    shl-int/lit8 v5, v5, 0x10

    .line 16
    .line 17
    or-int/2addr v3, v5

    .line 18
    const/4 v5, 0x2

    .line 19
    aget-byte v6, p1, v5

    .line 20
    .line 21
    and-int/lit16 v6, v6, 0xff

    .line 22
    .line 23
    const/16 v7, 0x8

    .line 24
    .line 25
    shl-int/2addr v6, v7

    .line 26
    or-int/2addr v3, v6

    .line 27
    const/4 v6, 0x3

    .line 28
    aget-byte v8, p1, v6

    .line 29
    .line 30
    and-int/lit16 v8, v8, 0xff

    .line 31
    .line 32
    or-int/2addr v3, v8

    .line 33
    iget-object v8, v0, Lcom/appsflyer/internal/AFj1bSDK;->component1:[I

    .line 34
    .line 35
    aget v9, v8, v2

    .line 36
    .line 37
    xor-int/2addr v3, v9

    .line 38
    aput v3, v1, v2

    .line 39
    .line 40
    const/4 v3, 0x4

    .line 41
    aget-byte v9, p1, v3

    .line 42
    .line 43
    shl-int/lit8 v9, v9, 0x18

    .line 44
    .line 45
    const/4 v10, 0x5

    .line 46
    aget-byte v11, p1, v10

    .line 47
    .line 48
    and-int/lit16 v11, v11, 0xff

    .line 49
    .line 50
    shl-int/lit8 v11, v11, 0x10

    .line 51
    .line 52
    or-int/2addr v9, v11

    .line 53
    const/4 v11, 0x6

    .line 54
    aget-byte v12, p1, v11

    .line 55
    .line 56
    and-int/lit16 v12, v12, 0xff

    .line 57
    .line 58
    shl-int/2addr v12, v7

    .line 59
    or-int/2addr v9, v12

    .line 60
    const/4 v12, 0x7

    .line 61
    aget-byte v13, p1, v12

    .line 62
    .line 63
    and-int/lit16 v13, v13, 0xff

    .line 64
    .line 65
    or-int/2addr v9, v13

    .line 66
    aget v13, v8, v4

    .line 67
    .line 68
    xor-int/2addr v9, v13

    .line 69
    aput v9, v1, v4

    .line 70
    .line 71
    aget-byte v9, p1, v7

    .line 72
    .line 73
    shl-int/lit8 v9, v9, 0x18

    .line 74
    .line 75
    const/16 v13, 0x9

    .line 76
    .line 77
    aget-byte v14, p1, v13

    .line 78
    .line 79
    and-int/lit16 v14, v14, 0xff

    .line 80
    .line 81
    shl-int/lit8 v14, v14, 0x10

    .line 82
    .line 83
    or-int/2addr v9, v14

    .line 84
    const/16 v14, 0xa

    .line 85
    .line 86
    aget-byte v15, p1, v14

    .line 87
    .line 88
    and-int/lit16 v15, v15, 0xff

    .line 89
    .line 90
    shl-int/2addr v15, v7

    .line 91
    or-int/2addr v9, v15

    .line 92
    const/16 v15, 0xb

    .line 93
    .line 94
    move/from16 v16, v2

    .line 95
    .line 96
    aget-byte v2, p1, v15

    .line 97
    .line 98
    and-int/lit16 v2, v2, 0xff

    .line 99
    .line 100
    or-int/2addr v2, v9

    .line 101
    aget v9, v8, v5

    .line 102
    .line 103
    xor-int/2addr v2, v9

    .line 104
    aput v2, v1, v5

    .line 105
    .line 106
    const/16 v2, 0xc

    .line 107
    .line 108
    aget-byte v9, p1, v2

    .line 109
    .line 110
    shl-int/lit8 v9, v9, 0x18

    .line 111
    .line 112
    const/16 v17, 0xd

    .line 113
    .line 114
    move/from16 v18, v2

    .line 115
    .line 116
    aget-byte v2, p1, v17

    .line 117
    .line 118
    and-int/lit16 v2, v2, 0xff

    .line 119
    .line 120
    shl-int/lit8 v2, v2, 0x10

    .line 121
    .line 122
    or-int/2addr v2, v9

    .line 123
    const/16 v9, 0xe

    .line 124
    .line 125
    move/from16 v19, v3

    .line 126
    .line 127
    aget-byte v3, p1, v9

    .line 128
    .line 129
    and-int/lit16 v3, v3, 0xff

    .line 130
    .line 131
    shl-int/2addr v3, v7

    .line 132
    or-int/2addr v2, v3

    .line 133
    const/16 v20, 0xf

    .line 134
    .line 135
    aget-byte v3, p1, v20

    .line 136
    .line 137
    and-int/lit16 v3, v3, 0xff

    .line 138
    .line 139
    or-int/2addr v2, v3

    .line 140
    aget v3, v8, v6

    .line 141
    .line 142
    xor-int/2addr v2, v3

    .line 143
    aput v2, v1, v6

    .line 144
    .line 145
    move v1, v4

    .line 146
    move/from16 v2, v19

    .line 147
    .line 148
    :goto_0
    iget v3, v0, Lcom/appsflyer/internal/AFj1bSDK;->component2:I

    .line 149
    .line 150
    if-ge v1, v3, :cond_0

    .line 151
    .line 152
    sget-object v3, Lcom/appsflyer/internal/AFj1bSDK;->getMediationNetwork:[I

    .line 153
    .line 154
    iget-object v8, v0, Lcom/appsflyer/internal/AFj1bSDK;->component3:[I

    .line 155
    .line 156
    move/from16 v21, v4

    .line 157
    .line 158
    iget-object v4, v0, Lcom/appsflyer/internal/AFj1bSDK;->areAllFieldsValid:[[B

    .line 159
    .line 160
    aget-object v22, v4, v16

    .line 161
    .line 162
    aget-byte v23, v22, v16

    .line 163
    .line 164
    aget v23, v8, v23

    .line 165
    .line 166
    ushr-int/lit8 v23, v23, 0x18

    .line 167
    .line 168
    aget v23, v3, v23

    .line 169
    .line 170
    sget-object v24, Lcom/appsflyer/internal/AFj1bSDK;->getMonetizationNetwork:[I

    .line 171
    .line 172
    aget-object v25, v4, v21

    .line 173
    .line 174
    aget-byte v26, v25, v16

    .line 175
    .line 176
    aget v26, v8, v26

    .line 177
    .line 178
    move/from16 v27, v5

    .line 179
    .line 180
    ushr-int/lit8 v5, v26, 0x10

    .line 181
    .line 182
    and-int/lit16 v5, v5, 0xff

    .line 183
    .line 184
    aget v5, v24, v5

    .line 185
    .line 186
    xor-int v5, v23, v5

    .line 187
    .line 188
    sget-object v23, Lcom/appsflyer/internal/AFj1bSDK;->AFAdRevenueData:[I

    .line 189
    .line 190
    aget-object v26, v4, v27

    .line 191
    .line 192
    aget-byte v28, v26, v16

    .line 193
    .line 194
    aget v28, v8, v28

    .line 195
    .line 196
    move/from16 v29, v6

    .line 197
    .line 198
    ushr-int/lit8 v6, v28, 0x8

    .line 199
    .line 200
    and-int/lit16 v6, v6, 0xff

    .line 201
    .line 202
    aget v6, v23, v6

    .line 203
    .line 204
    xor-int/2addr v5, v6

    .line 205
    sget-object v6, Lcom/appsflyer/internal/AFj1bSDK;->getCurrencyIso4217Code:[I

    .line 206
    .line 207
    aget-object v4, v4, v29

    .line 208
    .line 209
    aget-byte v28, v4, v16

    .line 210
    .line 211
    move/from16 v30, v7

    .line 212
    .line 213
    aget v7, v8, v28

    .line 214
    .line 215
    and-int/lit16 v7, v7, 0xff

    .line 216
    .line 217
    aget v7, v6, v7

    .line 218
    .line 219
    xor-int/2addr v5, v7

    .line 220
    iget-object v7, v0, Lcom/appsflyer/internal/AFj1bSDK;->component1:[I

    .line 221
    .line 222
    aget v28, v7, v2

    .line 223
    .line 224
    xor-int v5, v5, v28

    .line 225
    .line 226
    aget-byte v28, v22, v21

    .line 227
    .line 228
    aget v28, v8, v28

    .line 229
    .line 230
    ushr-int/lit8 v28, v28, 0x18

    .line 231
    .line 232
    aget v28, v3, v28

    .line 233
    .line 234
    aget-byte v31, v25, v21

    .line 235
    .line 236
    aget v31, v8, v31

    .line 237
    .line 238
    move/from16 v32, v9

    .line 239
    .line 240
    ushr-int/lit8 v9, v31, 0x10

    .line 241
    .line 242
    and-int/lit16 v9, v9, 0xff

    .line 243
    .line 244
    aget v9, v24, v9

    .line 245
    .line 246
    xor-int v9, v28, v9

    .line 247
    .line 248
    aget-byte v28, v26, v21

    .line 249
    .line 250
    aget v28, v8, v28

    .line 251
    .line 252
    move/from16 v31, v10

    .line 253
    .line 254
    ushr-int/lit8 v10, v28, 0x8

    .line 255
    .line 256
    and-int/lit16 v10, v10, 0xff

    .line 257
    .line 258
    aget v10, v23, v10

    .line 259
    .line 260
    xor-int/2addr v9, v10

    .line 261
    aget-byte v10, v4, v21

    .line 262
    .line 263
    aget v10, v8, v10

    .line 264
    .line 265
    and-int/lit16 v10, v10, 0xff

    .line 266
    .line 267
    aget v10, v6, v10

    .line 268
    .line 269
    xor-int/2addr v9, v10

    .line 270
    add-int/lit8 v10, v2, 0x1

    .line 271
    .line 272
    aget v10, v7, v10

    .line 273
    .line 274
    xor-int/2addr v9, v10

    .line 275
    aget-byte v10, v22, v27

    .line 276
    .line 277
    aget v10, v8, v10

    .line 278
    .line 279
    ushr-int/lit8 v10, v10, 0x18

    .line 280
    .line 281
    aget v10, v3, v10

    .line 282
    .line 283
    aget-byte v28, v25, v27

    .line 284
    .line 285
    aget v28, v8, v28

    .line 286
    .line 287
    move/from16 v33, v11

    .line 288
    .line 289
    ushr-int/lit8 v11, v28, 0x10

    .line 290
    .line 291
    and-int/lit16 v11, v11, 0xff

    .line 292
    .line 293
    aget v11, v24, v11

    .line 294
    .line 295
    xor-int/2addr v10, v11

    .line 296
    aget-byte v11, v26, v27

    .line 297
    .line 298
    aget v11, v8, v11

    .line 299
    .line 300
    ushr-int/lit8 v11, v11, 0x8

    .line 301
    .line 302
    and-int/lit16 v11, v11, 0xff

    .line 303
    .line 304
    aget v11, v23, v11

    .line 305
    .line 306
    xor-int/2addr v10, v11

    .line 307
    aget-byte v11, v4, v27

    .line 308
    .line 309
    aget v11, v8, v11

    .line 310
    .line 311
    and-int/lit16 v11, v11, 0xff

    .line 312
    .line 313
    aget v11, v6, v11

    .line 314
    .line 315
    xor-int/2addr v10, v11

    .line 316
    add-int/lit8 v11, v2, 0x2

    .line 317
    .line 318
    aget v11, v7, v11

    .line 319
    .line 320
    xor-int/2addr v10, v11

    .line 321
    aget-byte v11, v22, v29

    .line 322
    .line 323
    aget v11, v8, v11

    .line 324
    .line 325
    ushr-int/lit8 v11, v11, 0x18

    .line 326
    .line 327
    aget v3, v3, v11

    .line 328
    .line 329
    aget-byte v11, v25, v29

    .line 330
    .line 331
    aget v11, v8, v11

    .line 332
    .line 333
    ushr-int/lit8 v11, v11, 0x10

    .line 334
    .line 335
    and-int/lit16 v11, v11, 0xff

    .line 336
    .line 337
    aget v11, v24, v11

    .line 338
    .line 339
    xor-int/2addr v3, v11

    .line 340
    aget-byte v11, v26, v29

    .line 341
    .line 342
    aget v11, v8, v11

    .line 343
    .line 344
    ushr-int/lit8 v11, v11, 0x8

    .line 345
    .line 346
    and-int/lit16 v11, v11, 0xff

    .line 347
    .line 348
    aget v11, v23, v11

    .line 349
    .line 350
    xor-int/2addr v3, v11

    .line 351
    aget-byte v4, v4, v29

    .line 352
    .line 353
    aget v4, v8, v4

    .line 354
    .line 355
    and-int/lit16 v4, v4, 0xff

    .line 356
    .line 357
    aget v4, v6, v4

    .line 358
    .line 359
    xor-int/2addr v3, v4

    .line 360
    add-int/lit8 v4, v2, 0x3

    .line 361
    .line 362
    aget v4, v7, v4

    .line 363
    .line 364
    xor-int/2addr v3, v4

    .line 365
    aput v5, v8, v16

    .line 366
    .line 367
    aput v9, v8, v21

    .line 368
    .line 369
    aput v10, v8, v27

    .line 370
    .line 371
    aput v3, v8, v29

    .line 372
    .line 373
    add-int/lit8 v1, v1, 0x1

    .line 374
    .line 375
    add-int/lit8 v2, v2, 0x4

    .line 376
    .line 377
    move/from16 v4, v21

    .line 378
    .line 379
    move/from16 v5, v27

    .line 380
    .line 381
    move/from16 v6, v29

    .line 382
    .line 383
    move/from16 v7, v30

    .line 384
    .line 385
    move/from16 v10, v31

    .line 386
    .line 387
    move/from16 v9, v32

    .line 388
    .line 389
    move/from16 v11, v33

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :cond_0
    move/from16 v21, v4

    .line 394
    .line 395
    move/from16 v27, v5

    .line 396
    .line 397
    move/from16 v29, v6

    .line 398
    .line 399
    move/from16 v30, v7

    .line 400
    .line 401
    move/from16 v32, v9

    .line 402
    .line 403
    move/from16 v31, v10

    .line 404
    .line 405
    move/from16 v33, v11

    .line 406
    .line 407
    iget-object v1, v0, Lcom/appsflyer/internal/AFj1bSDK;->component1:[I

    .line 408
    .line 409
    aget v3, v1, v2

    .line 410
    .line 411
    sget-object v4, Lcom/appsflyer/internal/AFj1bSDK;->getRevenue:[B

    .line 412
    .line 413
    iget-object v5, v0, Lcom/appsflyer/internal/AFj1bSDK;->component3:[I

    .line 414
    .line 415
    iget-object v0, v0, Lcom/appsflyer/internal/AFj1bSDK;->areAllFieldsValid:[[B

    .line 416
    .line 417
    aget-object v6, v0, v16

    .line 418
    .line 419
    aget-byte v7, v6, v16

    .line 420
    .line 421
    aget v7, v5, v7

    .line 422
    .line 423
    ushr-int/lit8 v7, v7, 0x18

    .line 424
    .line 425
    aget-byte v7, v4, v7

    .line 426
    .line 427
    ushr-int/lit8 v8, v3, 0x18

    .line 428
    .line 429
    xor-int/2addr v7, v8

    .line 430
    int-to-byte v7, v7

    .line 431
    aput-byte v7, p2, v16

    .line 432
    .line 433
    aget-object v7, v0, v21

    .line 434
    .line 435
    aget-byte v8, v7, v16

    .line 436
    .line 437
    aget v8, v5, v8

    .line 438
    .line 439
    ushr-int/lit8 v8, v8, 0x10

    .line 440
    .line 441
    and-int/lit16 v8, v8, 0xff

    .line 442
    .line 443
    aget-byte v8, v4, v8

    .line 444
    .line 445
    ushr-int/lit8 v9, v3, 0x10

    .line 446
    .line 447
    xor-int/2addr v8, v9

    .line 448
    int-to-byte v8, v8

    .line 449
    aput-byte v8, p2, v21

    .line 450
    .line 451
    aget-object v8, v0, v27

    .line 452
    .line 453
    aget-byte v9, v8, v16

    .line 454
    .line 455
    aget v9, v5, v9

    .line 456
    .line 457
    ushr-int/lit8 v9, v9, 0x8

    .line 458
    .line 459
    and-int/lit16 v9, v9, 0xff

    .line 460
    .line 461
    aget-byte v9, v4, v9

    .line 462
    .line 463
    ushr-int/lit8 v10, v3, 0x8

    .line 464
    .line 465
    xor-int/2addr v9, v10

    .line 466
    int-to-byte v9, v9

    .line 467
    aput-byte v9, p2, v27

    .line 468
    .line 469
    aget-object v0, v0, v29

    .line 470
    .line 471
    aget-byte v9, v0, v16

    .line 472
    .line 473
    aget v9, v5, v9

    .line 474
    .line 475
    and-int/lit16 v9, v9, 0xff

    .line 476
    .line 477
    aget-byte v9, v4, v9

    .line 478
    .line 479
    xor-int/2addr v3, v9

    .line 480
    int-to-byte v3, v3

    .line 481
    aput-byte v3, p2, v29

    .line 482
    .line 483
    add-int/lit8 v3, v2, 0x1

    .line 484
    .line 485
    aget v3, v1, v3

    .line 486
    .line 487
    aget-byte v9, v6, v21

    .line 488
    .line 489
    aget v9, v5, v9

    .line 490
    .line 491
    ushr-int/lit8 v9, v9, 0x18

    .line 492
    .line 493
    aget-byte v9, v4, v9

    .line 494
    .line 495
    ushr-int/lit8 v10, v3, 0x18

    .line 496
    .line 497
    xor-int/2addr v9, v10

    .line 498
    int-to-byte v9, v9

    .line 499
    aput-byte v9, p2, v19

    .line 500
    .line 501
    aget-byte v9, v7, v21

    .line 502
    .line 503
    aget v9, v5, v9

    .line 504
    .line 505
    ushr-int/lit8 v9, v9, 0x10

    .line 506
    .line 507
    and-int/lit16 v9, v9, 0xff

    .line 508
    .line 509
    aget-byte v9, v4, v9

    .line 510
    .line 511
    ushr-int/lit8 v10, v3, 0x10

    .line 512
    .line 513
    xor-int/2addr v9, v10

    .line 514
    int-to-byte v9, v9

    .line 515
    aput-byte v9, p2, v31

    .line 516
    .line 517
    aget-byte v9, v8, v21

    .line 518
    .line 519
    aget v9, v5, v9

    .line 520
    .line 521
    ushr-int/lit8 v9, v9, 0x8

    .line 522
    .line 523
    and-int/lit16 v9, v9, 0xff

    .line 524
    .line 525
    aget-byte v9, v4, v9

    .line 526
    .line 527
    ushr-int/lit8 v10, v3, 0x8

    .line 528
    .line 529
    xor-int/2addr v9, v10

    .line 530
    int-to-byte v9, v9

    .line 531
    aput-byte v9, p2, v33

    .line 532
    .line 533
    aget-byte v9, v0, v21

    .line 534
    .line 535
    aget v9, v5, v9

    .line 536
    .line 537
    and-int/lit16 v9, v9, 0xff

    .line 538
    .line 539
    aget-byte v9, v4, v9

    .line 540
    .line 541
    xor-int/2addr v3, v9

    .line 542
    int-to-byte v3, v3

    .line 543
    aput-byte v3, p2, v12

    .line 544
    .line 545
    add-int/lit8 v3, v2, 0x2

    .line 546
    .line 547
    aget v3, v1, v3

    .line 548
    .line 549
    aget-byte v9, v6, v27

    .line 550
    .line 551
    aget v9, v5, v9

    .line 552
    .line 553
    ushr-int/lit8 v9, v9, 0x18

    .line 554
    .line 555
    aget-byte v9, v4, v9

    .line 556
    .line 557
    ushr-int/lit8 v10, v3, 0x18

    .line 558
    .line 559
    xor-int/2addr v9, v10

    .line 560
    int-to-byte v9, v9

    .line 561
    aput-byte v9, p2, v30

    .line 562
    .line 563
    aget-byte v9, v7, v27

    .line 564
    .line 565
    aget v9, v5, v9

    .line 566
    .line 567
    ushr-int/lit8 v9, v9, 0x10

    .line 568
    .line 569
    and-int/lit16 v9, v9, 0xff

    .line 570
    .line 571
    aget-byte v9, v4, v9

    .line 572
    .line 573
    ushr-int/lit8 v10, v3, 0x10

    .line 574
    .line 575
    xor-int/2addr v9, v10

    .line 576
    int-to-byte v9, v9

    .line 577
    aput-byte v9, p2, v13

    .line 578
    .line 579
    aget-byte v9, v8, v27

    .line 580
    .line 581
    aget v9, v5, v9

    .line 582
    .line 583
    ushr-int/lit8 v9, v9, 0x8

    .line 584
    .line 585
    and-int/lit16 v9, v9, 0xff

    .line 586
    .line 587
    aget-byte v9, v4, v9

    .line 588
    .line 589
    ushr-int/lit8 v10, v3, 0x8

    .line 590
    .line 591
    xor-int/2addr v9, v10

    .line 592
    int-to-byte v9, v9

    .line 593
    aput-byte v9, p2, v14

    .line 594
    .line 595
    aget-byte v9, v0, v27

    .line 596
    .line 597
    aget v9, v5, v9

    .line 598
    .line 599
    and-int/lit16 v9, v9, 0xff

    .line 600
    .line 601
    aget-byte v9, v4, v9

    .line 602
    .line 603
    xor-int/2addr v3, v9

    .line 604
    int-to-byte v3, v3

    .line 605
    aput-byte v3, p2, v15

    .line 606
    .line 607
    add-int/lit8 v2, v2, 0x3

    .line 608
    .line 609
    aget v1, v1, v2

    .line 610
    .line 611
    aget-byte v2, v6, v29

    .line 612
    .line 613
    aget v2, v5, v2

    .line 614
    .line 615
    ushr-int/lit8 v2, v2, 0x18

    .line 616
    .line 617
    aget-byte v2, v4, v2

    .line 618
    .line 619
    ushr-int/lit8 v3, v1, 0x18

    .line 620
    .line 621
    xor-int/2addr v2, v3

    .line 622
    int-to-byte v2, v2

    .line 623
    aput-byte v2, p2, v18

    .line 624
    .line 625
    aget-byte v2, v7, v29

    .line 626
    .line 627
    aget v2, v5, v2

    .line 628
    .line 629
    ushr-int/lit8 v2, v2, 0x10

    .line 630
    .line 631
    and-int/lit16 v2, v2, 0xff

    .line 632
    .line 633
    aget-byte v2, v4, v2

    .line 634
    .line 635
    ushr-int/lit8 v3, v1, 0x10

    .line 636
    .line 637
    xor-int/2addr v2, v3

    .line 638
    int-to-byte v2, v2

    .line 639
    aput-byte v2, p2, v17

    .line 640
    .line 641
    aget-byte v2, v8, v29

    .line 642
    .line 643
    aget v2, v5, v2

    .line 644
    .line 645
    ushr-int/lit8 v2, v2, 0x8

    .line 646
    .line 647
    and-int/lit16 v2, v2, 0xff

    .line 648
    .line 649
    aget-byte v2, v4, v2

    .line 650
    .line 651
    ushr-int/lit8 v3, v1, 0x8

    .line 652
    .line 653
    xor-int/2addr v2, v3

    .line 654
    int-to-byte v2, v2

    .line 655
    aput-byte v2, p2, v32

    .line 656
    .line 657
    aget-byte v0, v0, v29

    .line 658
    .line 659
    aget v0, v5, v0

    .line 660
    .line 661
    and-int/lit16 v0, v0, 0xff

    .line 662
    .line 663
    aget-byte v0, v4, v0

    .line 664
    .line 665
    xor-int/2addr v0, v1

    .line 666
    int-to-byte v0, v0

    .line 667
    aput-byte v0, p2, v20

    .line 668
    .line 669
    return-void
.end method

.method private static getRevenue([[B)[[B
    .locals 7

    .line 1
    array-length v0, p0

    .line 2
    new-array v0, v0, [[B

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    move v2, v1

    .line 6
    :goto_0
    array-length v3, p0

    .line 7
    if-ge v2, v3, :cond_1

    .line 8
    .line 9
    aget-object v3, p0, v2

    .line 10
    .line 11
    array-length v3, v3

    .line 12
    new-array v3, v3, [B

    .line 13
    .line 14
    aput-object v3, v0, v2

    .line 15
    .line 16
    move v3, v1

    .line 17
    :goto_1
    aget-object v4, p0, v2

    .line 18
    .line 19
    array-length v5, v4

    .line 20
    if-ge v3, v5, :cond_0

    .line 21
    .line 22
    aget-object v5, v0, v2

    .line 23
    .line 24
    aget-byte v4, v4, v3

    .line 25
    .line 26
    int-to-byte v6, v3

    .line 27
    aput-byte v6, v5, v4

    .line 28
    .line 29
    add-int/lit8 v3, v3, 0x1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object v0
.end method


# virtual methods
.method public final available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/appsflyer/internal/AFj1bSDK;->AFAdRevenueData()I

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->AFInAppEventType:I

    .line 5
    .line 6
    iget p0, p0, Lcom/appsflyer/internal/AFj1bSDK;->values:I

    .line 7
    .line 8
    sub-int/2addr v0, p0

    .line 9
    return v0
.end method

.method public final close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final declared-synchronized mark(I)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    return-void
.end method

.method public final markSupported()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    invoke-direct {p0}, Lcom/appsflyer/internal/AFj1bSDK;->AFAdRevenueData()I

    .line 39
    iget v0, p0, Lcom/appsflyer/internal/AFj1bSDK;->values:I

    iget v1, p0, Lcom/appsflyer/internal/AFj1bSDK;->AFInAppEventType:I

    if-lt v0, v1, :cond_0

    const/4 p0, -0x1

    return p0

    .line 40
    :cond_0
    iget-object v1, p0, Lcom/appsflyer/internal/AFj1bSDK;->toString:[B

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/appsflyer/internal/AFj1bSDK;->values:I

    aget-byte p0, v1, v0

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public final read([B)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 37
    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Ljava/io/InputStream;->read([BII)I

    move-result p0

    return p0
.end method

.method public final read([BII)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    add-int v0, p2, p3

    .line 2
    .line 3
    move v1, p2

    .line 4
    :goto_0
    if-ge v1, v0, :cond_2

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/appsflyer/internal/AFj1bSDK;->AFAdRevenueData()I

    .line 7
    .line 8
    .line 9
    iget v2, p0, Lcom/appsflyer/internal/AFj1bSDK;->values:I

    .line 10
    .line 11
    iget v3, p0, Lcom/appsflyer/internal/AFj1bSDK;->AFInAppEventType:I

    .line 12
    .line 13
    if-lt v2, v3, :cond_1

    .line 14
    .line 15
    if-ne v1, p2, :cond_0

    .line 16
    .line 17
    const/4 p0, -0x1

    .line 18
    return p0

    .line 19
    :cond_0
    sub-int/2addr v0, v1

    .line 20
    sub-int/2addr p3, v0

    .line 21
    return p3

    .line 22
    :cond_1
    add-int/lit8 v3, v1, 0x1

    .line 23
    .line 24
    iget-object v4, p0, Lcom/appsflyer/internal/AFj1bSDK;->toString:[B

    .line 25
    .line 26
    add-int/lit8 v5, v2, 0x1

    .line 27
    .line 28
    iput v5, p0, Lcom/appsflyer/internal/AFj1bSDK;->values:I

    .line 29
    .line 30
    aget-byte v2, v4, v2

    .line 31
    .line 32
    aput-byte v2, p1, v1

    .line 33
    .line 34
    move v1, v3

    .line 35
    goto :goto_0

    .line 36
    :cond_2
    return p3
.end method

.method public final declared-synchronized reset()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    monitor-exit p0

    .line 3
    return-void
.end method

.method public final skip(J)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    :goto_0
    cmp-long v2, v0, p1

    .line 4
    .line 5
    if-gez v2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, -0x1

    .line 12
    if-eq v2, v3, :cond_0

    .line 13
    .line 14
    const-wide/16 v2, 0x1

    .line 15
    .line 16
    add-long/2addr v0, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-wide v0
.end method
