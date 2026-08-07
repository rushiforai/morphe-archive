.class public Lcom/xiaomi/push/service/ar;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:I = 0x8


# instance fields
.field private a:[B

.field private b:I

.field private c:I

.field private d:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, -0x29a

    .line 5
    .line 6
    iput v0, p0, Lcom/xiaomi/push/service/ar;->d:I

    .line 7
    .line 8
    const/16 v0, 0x100

    .line 9
    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    iput-object v0, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput v0, p0, Lcom/xiaomi/push/service/ar;->c:I

    .line 16
    .line 17
    iput v0, p0, Lcom/xiaomi/push/service/ar;->b:I

    .line 18
    .line 19
    return-void
.end method

.method public static a(B)I
    .locals 0

    .line 240
    if-ltz p0, :cond_0

    return p0

    :cond_0
    add-int/lit16 p0, p0, 0x100

    return p0
.end method

.method private a()V
    .locals 1

    const/4 v0, 0x0

    .line 242
    iput v0, p0, Lcom/xiaomi/push/service/ar;->c:I

    iput v0, p0, Lcom/xiaomi/push/service/ar;->b:I

    return-void
.end method

.method private a(I[BZ)V
    .locals 7

    .line 1
    array-length v0, p2

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    const/16 v3, 0x100

    .line 5
    .line 6
    if-ge v2, v3, :cond_0

    .line 7
    .line 8
    iget-object v3, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 9
    .line 10
    int-to-byte v4, v2

    .line 11
    aput-byte v4, v3, v2

    .line 12
    .line 13
    add-int/lit8 v2, v2, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iput v1, p0, Lcom/xiaomi/push/service/ar;->c:I

    .line 17
    .line 18
    iput v1, p0, Lcom/xiaomi/push/service/ar;->b:I

    .line 19
    .line 20
    :goto_1
    iget v2, p0, Lcom/xiaomi/push/service/ar;->b:I

    .line 21
    .line 22
    const/4 v4, 0x1

    .line 23
    if-ge v2, p1, :cond_1

    .line 24
    .line 25
    iget v5, p0, Lcom/xiaomi/push/service/ar;->c:I

    .line 26
    .line 27
    iget-object v6, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 28
    .line 29
    aget-byte v2, v6, v2

    .line 30
    .line 31
    invoke-static {v2}, Lcom/xiaomi/push/service/ar;->a(B)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    add-int/2addr v5, v2

    .line 36
    iget v2, p0, Lcom/xiaomi/push/service/ar;->b:I

    .line 37
    .line 38
    rem-int/2addr v2, v0

    .line 39
    aget-byte v2, p2, v2

    .line 40
    .line 41
    invoke-static {v2}, Lcom/xiaomi/push/service/ar;->a(B)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    add-int/2addr v5, v2

    .line 46
    rem-int/2addr v5, v3

    .line 47
    iput v5, p0, Lcom/xiaomi/push/service/ar;->c:I

    .line 48
    .line 49
    iget-object v2, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 50
    .line 51
    iget v6, p0, Lcom/xiaomi/push/service/ar;->b:I

    .line 52
    .line 53
    invoke-static {v2, v6, v5}, Lcom/xiaomi/push/service/ar;->a([BII)V

    .line 54
    .line 55
    .line 56
    iget v2, p0, Lcom/xiaomi/push/service/ar;->b:I

    .line 57
    .line 58
    add-int/2addr v2, v4

    .line 59
    iput v2, p0, Lcom/xiaomi/push/service/ar;->b:I

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_1
    if-eq p1, v3, :cond_2

    .line 63
    .line 64
    iget v2, p0, Lcom/xiaomi/push/service/ar;->c:I

    .line 65
    .line 66
    iget-object v5, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 67
    .line 68
    aget-byte v5, v5, p1

    .line 69
    .line 70
    invoke-static {v5}, Lcom/xiaomi/push/service/ar;->a(B)I

    .line 71
    .line 72
    .line 73
    move-result v5

    .line 74
    add-int/2addr v2, v5

    .line 75
    rem-int v0, p1, v0

    .line 76
    .line 77
    aget-byte p2, p2, v0

    .line 78
    .line 79
    invoke-static {p2}, Lcom/xiaomi/push/service/ar;->a(B)I

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    add-int/2addr v2, p2

    .line 84
    rem-int/2addr v2, v3

    .line 85
    iput v2, p0, Lcom/xiaomi/push/service/ar;->d:I

    .line 86
    .line 87
    :cond_2
    if-eqz p3, :cond_5

    .line 88
    .line 89
    new-instance p2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string p3, "S_"

    .line 92
    .line 93
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    add-int/lit8 p3, p1, -0x1

    .line 97
    .line 98
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, ":"

    .line 102
    .line 103
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    :goto_2
    if-gt v1, p1, :cond_3

    .line 107
    .line 108
    const-string v0, " "

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 114
    .line 115
    aget-byte v0, v0, v1

    .line 116
    .line 117
    invoke-static {v0}, Lcom/xiaomi/push/service/ar;->a(B)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    add-int/lit8 v1, v1, 0x1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_3
    const-string v0, "   j_"

    .line 128
    .line 129
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v1, "="

    .line 136
    .line 137
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget v2, p0, Lcom/xiaomi/push/service/ar;->c:I

    .line 141
    .line 142
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget v0, p0, Lcom/xiaomi/push/service/ar;->d:I

    .line 155
    .line 156
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v0, "   S_"

    .line 160
    .line 161
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string v1, "[j_"

    .line 168
    .line 169
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v2, "]="

    .line 176
    .line 177
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget-object v3, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 181
    .line 182
    iget v5, p0, Lcom/xiaomi/push/service/ar;->c:I

    .line 183
    .line 184
    aget-byte v3, v3, v5

    .line 185
    .line 186
    invoke-static {v3}, Lcom/xiaomi/push/service/ar;->a(B)I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 209
    .line 210
    iget p3, p0, Lcom/xiaomi/push/service/ar;->d:I

    .line 211
    .line 212
    aget-byte p1, p1, p3

    .line 213
    .line 214
    invoke-static {p1}, Lcom/xiaomi/push/service/ar;->a(B)I

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    iget-object p0, p0, Lcom/xiaomi/push/service/ar;->a:[B

    .line 222
    .line 223
    aget-byte p0, p0, v4

    .line 224
    .line 225
    if-eqz p0, :cond_4

    .line 226
    .line 227
    const-string p0, "   S[1]!=0"

    .line 228
    .line 229
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    :cond_4
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 237
    .line 238
    .line 239
    :cond_5
    return-void
.end method

.method private a([B)V
    .locals 2

    const/16 v0, 0x100

    const/4 v1, 0x0

    .line 241
    invoke-direct {p0, v0, p1, v1}, Lcom/xiaomi/push/service/ar;->a(I[BZ)V

    return-void
.end method

.method private static a([BII)V
    .locals 2

    .line 247
    aget-byte v0, p0, p1

    .line 248
    aget-byte v1, p0, p2

    aput-byte v1, p0, p1

    .line 249
    aput-byte v0, p0, p2

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 4

    .line 265
    invoke-static {p0}, Ll/ptq0;->b(Ljava/lang/String;)[B

    move-result-object p0

    .line 266
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 267
    array-length v0, p0

    add-int/lit8 v0, v0, 0x1

    array-length v1, p1

    add-int/2addr v0, v1

    new-array v0, v0, [B

    const/4 v1, 0x0

    move v2, v1

    .line 268
    :goto_0
    array-length v3, p0

    if-ge v2, v3, :cond_0

    .line 269
    aget-byte v3, p0, v2

    aput-byte v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 270
    :cond_0
    array-length v2, p0

    const/16 v3, 0x5f

    aput-byte v3, v0, v2

    .line 271
    :goto_1
    array-length v2, p1

    if-ge v1, v2, :cond_1

    .line 272
    array-length v2, p0

    add-int/lit8 v2, v2, 0x1

    add-int/2addr v2, v1

    aget-byte v3, p1, v1

    aput-byte v3, v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-object v0
.end method

.method public static a([BLjava/lang/String;)[B
    .locals 0

    .line 263
    invoke-static {p1}, Ll/ptq0;->b(Ljava/lang/String;)[B

    move-result-object p1

    .line 264
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/ar;->a([B[B)[B

    move-result-object p0

    return-object p0
.end method

.method public static a([B[B)[B
    .locals 4

    .line 250
    array-length v0, p1

    new-array v0, v0, [B

    .line 251
    new-instance v1, Lcom/xiaomi/push/service/ar;

    invoke-direct {v1}, Lcom/xiaomi/push/service/ar;-><init>()V

    .line 252
    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/ar;->a([B)V

    .line 253
    invoke-direct {v1}, Lcom/xiaomi/push/service/ar;->a()V

    const/4 p0, 0x0

    .line 254
    :goto_0
    array-length v2, p1

    if-ge p0, v2, :cond_0

    .line 255
    aget-byte v2, p1, p0

    invoke-virtual {v1}, Lcom/xiaomi/push/service/ar;->a()B

    move-result v3

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, p0

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static a([B[BZII)[B
    .locals 5

    if-ltz p3, :cond_2

    .line 256
    array-length v0, p1

    if-gt p3, v0, :cond_2

    add-int v0, p3, p4

    array-length v1, p1

    if-gt v0, v1, :cond_2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 257
    new-array p2, p4, [B

    move v1, v0

    goto :goto_0

    :cond_0
    move-object p2, p1

    move v1, p3

    .line 258
    :goto_0
    new-instance v2, Lcom/xiaomi/push/service/ar;

    invoke-direct {v2}, Lcom/xiaomi/push/service/ar;-><init>()V

    .line 259
    invoke-direct {v2, p0}, Lcom/xiaomi/push/service/ar;->a([B)V

    .line 260
    invoke-direct {v2}, Lcom/xiaomi/push/service/ar;->a()V

    :goto_1
    if-ge v0, p4, :cond_1

    add-int p0, v1, v0

    add-int v3, p3, v0

    .line 261
    aget-byte v3, p1, v3

    invoke-virtual {v2}, Lcom/xiaomi/push/service/ar;->a()B

    move-result v4

    xor-int/2addr v3, v4

    int-to-byte v3, v3

    aput-byte v3, p2, p0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-object p2

    .line 262
    :cond_2
    const-string p0, "start = "

    const-string p1, " len = "

    invoke-static {p0, p3, p1, p4}, Ll/itq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public a()B
    .locals 3

    .line 243
    iget v0, p0, Lcom/xiaomi/push/service/ar;->b:I

    add-int/lit8 v0, v0, 0x1

    rem-int/lit16 v0, v0, 0x100

    iput v0, p0, Lcom/xiaomi/push/service/ar;->b:I

    .line 244
    iget v1, p0, Lcom/xiaomi/push/service/ar;->c:I

    iget-object v2, p0, Lcom/xiaomi/push/service/ar;->a:[B

    aget-byte v0, v2, v0

    invoke-static {v0}, Lcom/xiaomi/push/service/ar;->a(B)I

    move-result v0

    add-int/2addr v1, v0

    rem-int/lit16 v1, v1, 0x100

    iput v1, p0, Lcom/xiaomi/push/service/ar;->c:I

    .line 245
    iget-object v0, p0, Lcom/xiaomi/push/service/ar;->a:[B

    iget v2, p0, Lcom/xiaomi/push/service/ar;->b:I

    invoke-static {v0, v2, v1}, Lcom/xiaomi/push/service/ar;->a([BII)V

    .line 246
    iget-object v0, p0, Lcom/xiaomi/push/service/ar;->a:[B

    iget v1, p0, Lcom/xiaomi/push/service/ar;->b:I

    aget-byte v1, v0, v1

    invoke-static {v1}, Lcom/xiaomi/push/service/ar;->a(B)I

    move-result v1

    iget-object v2, p0, Lcom/xiaomi/push/service/ar;->a:[B

    iget p0, p0, Lcom/xiaomi/push/service/ar;->c:I

    aget-byte p0, v2, p0

    invoke-static {p0}, Lcom/xiaomi/push/service/ar;->a(B)I

    move-result p0

    add-int/2addr v1, p0

    rem-int/lit16 v1, v1, 0x100

    aget-byte p0, v0, v1

    return p0
.end method
