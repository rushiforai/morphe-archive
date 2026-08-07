.class public final Lcom/appsflyer/internal/AFg1xSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static $10:I = 0x0

.field private static $11:I = 0x1

.field private static AFAdRevenueData:[C = null

.field private static getCurrencyIso4217Code:I = 0x1

.field private static getRevenue:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/appsflyer/internal/AFg1xSDK;->getMonetizationNetwork()V

    .line 2
    .line 3
    .line 4
    sget v0, Lcom/appsflyer/internal/AFg1xSDK;->getCurrencyIso4217Code:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0xf

    .line 7
    .line 8
    rem-int/lit16 v0, v0, 0x80

    .line 9
    .line 10
    sput v0, Lcom/appsflyer/internal/AFg1xSDK;->getRevenue:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static AFAdRevenueData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 7
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    sget v0, Lcom/appsflyer/internal/AFg1xSDK;->getRevenue:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x23

    .line 4
    .line 5
    rem-int/lit16 v1, v0, 0x80

    .line 6
    .line 7
    sput v1, Lcom/appsflyer/internal/AFg1xSDK;->getCurrencyIso4217Code:I

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    rem-int/2addr v0, v1

    .line 11
    const/16 v2, 0xc

    .line 12
    .line 13
    const-string v3, "\u2063"

    .line 14
    .line 15
    const-string v4, ""

    .line 16
    .line 17
    const/4 v5, 0x0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    const/4 v0, 0x5

    .line 21
    new-array v6, v0, [Ljava/lang/String;

    .line 22
    .line 23
    aput-object p1, v6, v5

    .line 24
    .line 25
    aput-object p2, v6, v5

    .line 26
    .line 27
    const/4 p1, 0x4

    .line 28
    aput-object p3, v6, p1

    .line 29
    .line 30
    aput-object p4, v6, v1

    .line 31
    .line 32
    aput-object v4, v6, v0

    .line 33
    .line 34
    invoke-static {v3, v6}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1, p0}, Lcom/appsflyer/internal/AFb1iSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    const/16 p2, 0x76

    .line 47
    .line 48
    if-ge p1, p2, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    filled-new-array {p1, p2, p3, p4, v4}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {v3, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1, p0}, Lcom/appsflyer/internal/AFb1iSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-ge p1, v2, :cond_2

    .line 68
    .line 69
    :goto_0
    sget p1, Lcom/appsflyer/internal/AFg1xSDK;->getCurrencyIso4217Code:I

    .line 70
    .line 71
    add-int/lit8 p1, p1, 0x5d

    .line 72
    .line 73
    rem-int/lit16 p1, p1, 0x80

    .line 74
    .line 75
    sput p1, Lcom/appsflyer/internal/AFg1xSDK;->getRevenue:I

    .line 76
    .line 77
    add-int/lit8 p1, p1, 0x2b

    .line 78
    .line 79
    rem-int/lit16 p2, p1, 0x80

    .line 80
    .line 81
    sput p2, Lcom/appsflyer/internal/AFg1xSDK;->getCurrencyIso4217Code:I

    .line 82
    .line 83
    rem-int/2addr p1, v1

    .line 84
    if-nez p1, :cond_1

    .line 85
    .line 86
    const/16 p1, 0x16

    .line 87
    .line 88
    div-int/2addr p1, v5

    .line 89
    :cond_1
    return-object p0

    .line 90
    :cond_2
    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    return-object p0
.end method

.method private static a([IZLjava/lang/String;[Ljava/lang/Object;)V
    .locals 17

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    sget v1, Lcom/appsflyer/internal/AFg1xSDK;->$10:I

    .line 4
    .line 5
    add-int/lit8 v1, v1, 0x3d

    .line 6
    .line 7
    rem-int/lit16 v1, v1, 0x80

    .line 8
    .line 9
    sput v1, Lcom/appsflyer/internal/AFg1xSDK;->$11:I

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v1, "ISO-8859-1"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    :cond_0
    check-cast v0, [B

    .line 20
    .line 21
    new-instance v1, Lcom/appsflyer/internal/AFk1xSDK;

    .line 22
    .line 23
    invoke-direct {v1}, Lcom/appsflyer/internal/AFk1xSDK;-><init>()V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    aget v3, p0, v2

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    aget v5, p0, v4

    .line 31
    .line 32
    const/4 v6, 0x2

    .line 33
    aget v7, p0, v6

    .line 34
    .line 35
    const/4 v8, 0x3

    .line 36
    aget v8, p0, v8

    .line 37
    .line 38
    sget-object v9, Lcom/appsflyer/internal/AFg1xSDK;->AFAdRevenueData:[C

    .line 39
    .line 40
    if-eqz v9, :cond_3

    .line 41
    .line 42
    sget v10, Lcom/appsflyer/internal/AFg1xSDK;->$10:I

    .line 43
    .line 44
    add-int/lit8 v10, v10, 0x29

    .line 45
    .line 46
    rem-int/lit16 v11, v10, 0x80

    .line 47
    .line 48
    sput v11, Lcom/appsflyer/internal/AFg1xSDK;->$11:I

    .line 49
    .line 50
    rem-int/2addr v10, v6

    .line 51
    if-nez v10, :cond_1

    .line 52
    .line 53
    array-length v10, v9

    .line 54
    new-array v11, v10, [C

    .line 55
    .line 56
    move v12, v4

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    array-length v10, v9

    .line 59
    new-array v11, v10, [C

    .line 60
    .line 61
    move v12, v2

    .line 62
    :goto_0
    if-ge v12, v10, :cond_2

    .line 63
    .line 64
    aget-char v13, v9, v12

    .line 65
    .line 66
    int-to-long v13, v13

    .line 67
    const-wide v15, 0x175297e3d95c3522L    # 2.487366552316839E-196

    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    xor-long/2addr v13, v15

    .line 73
    long-to-int v13, v13

    .line 74
    int-to-char v13, v13

    .line 75
    aput-char v13, v11, v12

    .line 76
    .line 77
    add-int/lit8 v12, v12, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    move-object v9, v11

    .line 81
    :cond_3
    new-array v10, v5, [C

    .line 82
    .line 83
    invoke-static {v9, v3, v10, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 84
    .line 85
    .line 86
    if-eqz v0, :cond_6

    .line 87
    .line 88
    new-array v3, v5, [C

    .line 89
    .line 90
    iput v2, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 91
    .line 92
    move v9, v2

    .line 93
    :goto_1
    iget v11, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 94
    .line 95
    if-ge v11, v5, :cond_5

    .line 96
    .line 97
    aget-byte v12, v0, v11

    .line 98
    .line 99
    if-ne v12, v4, :cond_4

    .line 100
    .line 101
    aget-char v12, v10, v11

    .line 102
    .line 103
    mul-int/2addr v12, v6

    .line 104
    add-int/2addr v12, v4

    .line 105
    sub-int/2addr v12, v9

    .line 106
    int-to-char v9, v12

    .line 107
    aput-char v9, v3, v11

    .line 108
    .line 109
    goto :goto_2

    .line 110
    :cond_4
    aget-char v12, v10, v11

    .line 111
    .line 112
    mul-int/2addr v12, v6

    .line 113
    sub-int/2addr v12, v9

    .line 114
    int-to-char v9, v12

    .line 115
    aput-char v9, v3, v11

    .line 116
    .line 117
    sget v9, Lcom/appsflyer/internal/AFg1xSDK;->$10:I

    .line 118
    .line 119
    add-int/lit8 v9, v9, 0x67

    .line 120
    .line 121
    rem-int/lit16 v9, v9, 0x80

    .line 122
    .line 123
    sput v9, Lcom/appsflyer/internal/AFg1xSDK;->$11:I

    .line 124
    .line 125
    :goto_2
    aget-char v9, v3, v11

    .line 126
    .line 127
    add-int/lit8 v11, v11, 0x1

    .line 128
    .line 129
    iput v11, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_5
    move-object v10, v3

    .line 133
    :cond_6
    if-lez v8, :cond_7

    .line 134
    .line 135
    new-array v0, v5, [C

    .line 136
    .line 137
    invoke-static {v10, v2, v0, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 138
    .line 139
    .line 140
    sub-int v3, v5, v8

    .line 141
    .line 142
    invoke-static {v0, v2, v10, v3, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 143
    .line 144
    .line 145
    invoke-static {v0, v8, v10, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 146
    .line 147
    .line 148
    :cond_7
    if-eqz p1, :cond_9

    .line 149
    .line 150
    new-array v0, v5, [C

    .line 151
    .line 152
    iput v2, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 153
    .line 154
    :goto_3
    iget v3, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 155
    .line 156
    if-ge v3, v5, :cond_8

    .line 157
    .line 158
    sget v8, Lcom/appsflyer/internal/AFg1xSDK;->$10:I

    .line 159
    .line 160
    add-int/lit8 v8, v8, 0x43

    .line 161
    .line 162
    rem-int/lit16 v8, v8, 0x80

    .line 163
    .line 164
    sput v8, Lcom/appsflyer/internal/AFg1xSDK;->$11:I

    .line 165
    .line 166
    sub-int v8, v5, v3

    .line 167
    .line 168
    sub-int/2addr v8, v4

    .line 169
    aget-char v8, v10, v8

    .line 170
    .line 171
    aput-char v8, v0, v3

    .line 172
    .line 173
    add-int/lit8 v3, v3, 0x1

    .line 174
    .line 175
    iput v3, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_8
    move-object v10, v0

    .line 179
    :cond_9
    if-lez v7, :cond_a

    .line 180
    .line 181
    iput v2, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 182
    .line 183
    :goto_4
    iget v0, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 184
    .line 185
    if-ge v0, v5, :cond_a

    .line 186
    .line 187
    sget v3, Lcom/appsflyer/internal/AFg1xSDK;->$10:I

    .line 188
    .line 189
    add-int/lit8 v3, v3, 0x75

    .line 190
    .line 191
    rem-int/lit16 v3, v3, 0x80

    .line 192
    .line 193
    sput v3, Lcom/appsflyer/internal/AFg1xSDK;->$11:I

    .line 194
    .line 195
    aget-char v3, v10, v0

    .line 196
    .line 197
    aget v4, p0, v6

    .line 198
    .line 199
    sub-int/2addr v3, v4

    .line 200
    int-to-char v3, v3

    .line 201
    aput-char v3, v10, v0

    .line 202
    .line 203
    add-int/lit8 v0, v0, 0x1

    .line 204
    .line 205
    iput v0, v1, Lcom/appsflyer/internal/AFk1xSDK;->getCurrencyIso4217Code:I

    .line 206
    .line 207
    goto :goto_4

    .line 208
    :cond_a
    new-instance v0, Ljava/lang/String;

    .line 209
    .line 210
    invoke-direct {v0, v10}, Ljava/lang/String;-><init>([C)V

    .line 211
    .line 212
    .line 213
    aput-object v0, p3, v2

    .line 214
    .line 215
    return-void
.end method

.method private static getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1aSDK;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFi1vSDK;
    .locals 5
    .param p0    # Lcom/appsflyer/internal/AFh1aSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-nez p1, :cond_1

    .line 4
    .line 5
    new-instance p1, Lcom/appsflyer/internal/AFi1vSDK;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/appsflyer/internal/AFh1aSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1eSDK;

    .line 8
    .line 9
    sget-object p2, Lcom/appsflyer/internal/AFh1eSDK;->getRevenue:Lcom/appsflyer/internal/AFh1eSDK;

    .line 10
    .line 11
    if-ne p0, p2, :cond_0

    .line 12
    .line 13
    move v0, v1

    .line 14
    :cond_0
    sget-object p0, Lcom/appsflyer/internal/AFi1uSDK;->AFAdRevenueData:Lcom/appsflyer/internal/AFi1uSDK;

    .line 15
    .line 16
    invoke-direct {p1, v0, p0}, Lcom/appsflyer/internal/AFi1vSDK;-><init>(ZLcom/appsflyer/internal/AFi1uSDK;)V

    .line 17
    .line 18
    .line 19
    return-object p1

    .line 20
    :cond_1
    const/16 v2, 0x91

    .line 21
    .line 22
    const/16 v3, 0x29

    .line 23
    .line 24
    const/16 v4, 0x40

    .line 25
    .line 26
    filled-new-array {v0, v4, v2, v3}, [I

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-array v3, v1, [Ljava/lang/Object;

    .line 31
    .line 32
    const-string v4, "\u0001\u0001\u0000\u0000\u0001\u0000\u0001\u0001\u0000\u0001\u0000\u0000\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u0001\u0000\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0000\u0000\u0001\u0001\u0001\u0001\u0001\u0001\u0000\u0000\u0001\u0001\u0000\u0000\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0000\u0000"

    .line 33
    .line 34
    invoke-static {v2, v1, v4, v3}, Lcom/appsflyer/internal/AFg1xSDK;->a([IZLjava/lang/String;[Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    aget-object v0, v3, v0

    .line 38
    .line 39
    check-cast v0, Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/appsflyer/internal/AFh1aSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFh1eSDK;

    .line 46
    .line 47
    sget-object v2, Lcom/appsflyer/internal/AFh1eSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFh1eSDK;

    .line 48
    .line 49
    if-ne v1, v2, :cond_2

    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    const-string p2, ""

    .line 66
    .line 67
    move-object p3, v0

    .line 68
    :goto_0
    iget-object p0, p0, Lcom/appsflyer/internal/AFh1aSDK;->AFAdRevenueData:Ljava/lang/String;

    .line 69
    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->reverse()Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    const-string v0, "android"

    .line 84
    .line 85
    const-string v1, "v1"

    .line 86
    .line 87
    invoke-static {p3, p0, v0, v1, p2}, Lcom/appsflyer/internal/AFg1xSDK;->AFAdRevenueData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    new-instance p1, Lcom/appsflyer/internal/AFi1vSDK;

    .line 96
    .line 97
    if-eqz p0, :cond_3

    .line 98
    .line 99
    sget-object p2, Lcom/appsflyer/internal/AFi1uSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFi1uSDK;

    .line 100
    .line 101
    goto :goto_1

    .line 102
    :cond_3
    sget-object p2, Lcom/appsflyer/internal/AFi1uSDK;->getRevenue:Lcom/appsflyer/internal/AFi1uSDK;

    .line 103
    .line 104
    :goto_1
    invoke-direct {p1, p0, p2}, Lcom/appsflyer/internal/AFi1vSDK;-><init>(ZLcom/appsflyer/internal/AFi1uSDK;)V

    .line 105
    .line 106
    .line 107
    return-object p1
.end method

.method public static getMonetizationNetwork()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [C

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/appsflyer/internal/AFg1xSDK;->AFAdRevenueData:[C

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 2
        0x3541s
        0x35e5s
        0x35e5s
        0x35ees
        0x35ees
        0x35e4s
        0x35e7s
        0x35e4s
        0x35e5s
        0x35e6s
        0x35e6s
        0x35e7s
        0x35e7s
        0x35ecs
        0x35efs
        0x35e1s
        0x35e1s
        0x35e5s
        0x35e5s
        0x35e5s
        0x35e4s
        0x35e6s
        0x35e7s
        0x35e4s
        0x35e7s
        0x35e1s
        0x35e6s
        0x35e7s
        0x35e6s
        0x35e4s
        0x35ebs
        0x35ebs
        0x35e5s
        0x35e7s
        0x35e5s
        0x35e5s
        0x35e7s
        0x35e6s
        0x35e4s
        0x35e4s
        0x35e6s
        0x35e9s
        0x35e8s
        0x35e1s
        0x35e6s
        0x35e7s
        0x35e6s
        0x35e8s
        0x35efs
        0x35e7s
        0x35e0s
        0x35e7s
        0x35eas
        0x35eas
        0x35e4s
        0x35e6s
        0x35e4s
        0x35e4s
        0x35e6s
        0x35e1s
        0x35e7s
        0x35efs
        0x35ees
        0x35ecs
    .end array-data
.end method


# virtual methods
.method public final getMonetizationNetwork(Lcom/appsflyer/internal/AFh1aSDK;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFi1vSDK;
    .locals 2
    .param p1    # Lcom/appsflyer/internal/AFh1aSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const/4 p0, 0x0

    if-eqz p1, :cond_1

    .line 11
    sget v0, Lcom/appsflyer/internal/AFg1xSDK;->getRevenue:I

    add-int/lit8 v0, v0, 0x71

    rem-int/lit16 v1, v0, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1xSDK;->getCurrencyIso4217Code:I

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_0

    const/16 v0, 0x33

    div-int/2addr v0, p0

    if-eqz p3, :cond_1

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    :goto_0
    if-eqz p4, :cond_1

    add-int/lit8 v1, v1, 0x5b

    rem-int/lit16 v1, v1, 0x80

    sput v1, Lcom/appsflyer/internal/AFg1xSDK;->getRevenue:I

    invoke-static {p1, p2, p3, p4}, Lcom/appsflyer/internal/AFg1xSDK;->getCurrencyIso4217Code(Lcom/appsflyer/internal/AFh1aSDK;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/appsflyer/internal/AFi1vSDK;

    move-result-object p0

    return-object p0

    .line 12
    :cond_1
    new-instance p1, Lcom/appsflyer/internal/AFi1vSDK;

    sget-object p2, Lcom/appsflyer/internal/AFi1uSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFi1uSDK;

    invoke-direct {p1, p0, p2}, Lcom/appsflyer/internal/AFi1vSDK;-><init>(ZLcom/appsflyer/internal/AFi1uSDK;)V

    return-object p1
.end method
