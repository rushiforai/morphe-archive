.class public final Ll/jod;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lke;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/jod$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:[B

.field public final b:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ll/jod$b;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/p1l0;

.field public d:Ll/kke;

.field public e:I

.field public f:I

.field public g:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Ll/jod;->a:[B

    .line 9
    .line 10
    new-instance v0, Ljava/util/ArrayDeque;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/jod;->b:Ljava/util/ArrayDeque;

    .line 16
    .line 17
    new-instance v0, Ll/p1l0;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/p1l0;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/jod;->c:Ll/p1l0;

    .line 23
    .line 24
    return-void
.end method

.method public static f(Ll/asf;I)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    new-array v0, p1, [B

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-interface {p0, v0, v1, p1}, Ll/asf;->readFully([BII)V

    .line 10
    .line 11
    .line 12
    :goto_0
    if-lez p1, :cond_1

    .line 13
    .line 14
    add-int/lit8 p0, p1, -0x1

    .line 15
    .line 16
    aget-byte p0, v0, p0

    .line 17
    .line 18
    if-nez p0, :cond_1

    .line 19
    .line 20
    add-int/lit8 p1, p1, -0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    new-instance p0, Ljava/lang/String;

    .line 24
    .line 25
    invoke-direct {p0, v0, v1, p1}, Ljava/lang/String;-><init>([BII)V

    .line 26
    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public a(Ll/asf;)Z
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jod;->d:Ll/kke;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    :goto_0
    iget-object v0, p0, Ll/jod;->b:Ljava/util/ArrayDeque;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/jod$b;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-static {v0}, Ll/jod$b;->a(Ll/jod$b;)J

    .line 22
    .line 23
    .line 24
    move-result-wide v4

    .line 25
    cmp-long v0, v2, v4

    .line 26
    .line 27
    if-ltz v0, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/jod;->d:Ll/kke;

    .line 30
    .line 31
    iget-object p0, p0, Ll/jod;->b:Ljava/util/ArrayDeque;

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Ll/jod$b;

    .line 38
    .line 39
    invoke-static {p0}, Ll/jod$b;->b(Ll/jod$b;)I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-interface {p1, p0}, Ll/kke;->a(I)V

    .line 44
    .line 45
    .line 46
    return v1

    .line 47
    :cond_0
    iget v0, p0, Ll/jod;->e:I

    .line 48
    .line 49
    const/4 v2, 0x4

    .line 50
    const/4 v3, 0x0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    iget-object v0, p0, Ll/jod;->c:Ll/p1l0;

    .line 54
    .line 55
    invoke-virtual {v0, p1, v1, v3, v2}, Ll/p1l0;->d(Ll/asf;ZZI)J

    .line 56
    .line 57
    .line 58
    move-result-wide v4

    .line 59
    const-wide/16 v6, -0x2

    .line 60
    .line 61
    cmp-long v0, v4, v6

    .line 62
    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ll/jod;->c(Ll/asf;)J

    .line 66
    .line 67
    .line 68
    move-result-wide v4

    .line 69
    :cond_1
    const-wide/16 v6, -0x1

    .line 70
    .line 71
    cmp-long v0, v4, v6

    .line 72
    .line 73
    if-nez v0, :cond_2

    .line 74
    .line 75
    return v3

    .line 76
    :cond_2
    long-to-int v0, v4

    .line 77
    iput v0, p0, Ll/jod;->f:I

    .line 78
    .line 79
    iput v1, p0, Ll/jod;->e:I

    .line 80
    .line 81
    :cond_3
    iget v0, p0, Ll/jod;->e:I

    .line 82
    .line 83
    const/4 v4, 0x2

    .line 84
    if-ne v0, v1, :cond_4

    .line 85
    .line 86
    iget-object v0, p0, Ll/jod;->c:Ll/p1l0;

    .line 87
    .line 88
    const/16 v5, 0x8

    .line 89
    .line 90
    invoke-virtual {v0, p1, v3, v1, v5}, Ll/p1l0;->d(Ll/asf;ZZI)J

    .line 91
    .line 92
    .line 93
    move-result-wide v5

    .line 94
    iput-wide v5, p0, Ll/jod;->g:J

    .line 95
    .line 96
    iput v4, p0, Ll/jod;->e:I

    .line 97
    .line 98
    :cond_4
    iget-object v0, p0, Ll/jod;->d:Ll/kke;

    .line 99
    .line 100
    iget v5, p0, Ll/jod;->f:I

    .line 101
    .line 102
    invoke-interface {v0, v5}, Ll/kke;->f(I)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_e

    .line 107
    .line 108
    const/4 v5, 0x0

    .line 109
    if-eq v0, v1, :cond_d

    .line 110
    .line 111
    const-wide/16 v6, 0x8

    .line 112
    .line 113
    if-eq v0, v4, :cond_b

    .line 114
    .line 115
    const/4 v4, 0x3

    .line 116
    if-eq v0, v4, :cond_9

    .line 117
    .line 118
    if-eq v0, v2, :cond_8

    .line 119
    .line 120
    const/4 v2, 0x5

    .line 121
    if-ne v0, v2, :cond_7

    .line 122
    .line 123
    iget-wide v8, p0, Ll/jod;->g:J

    .line 124
    .line 125
    const-wide/16 v10, 0x4

    .line 126
    .line 127
    cmp-long v0, v8, v10

    .line 128
    .line 129
    if-eqz v0, :cond_6

    .line 130
    .line 131
    cmp-long v0, v8, v6

    .line 132
    .line 133
    if-nez v0, :cond_5

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_5
    new-instance p1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    const-string v0, "Invalid float size: "

    .line 139
    .line 140
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-wide v0, p0, Ll/jod;->g:J

    .line 144
    .line 145
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-static {p0, v5}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    throw p0

    .line 157
    :cond_6
    :goto_1
    iget-object v0, p0, Ll/jod;->d:Ll/kke;

    .line 158
    .line 159
    iget v2, p0, Ll/jod;->f:I

    .line 160
    .line 161
    long-to-int v4, v8

    .line 162
    invoke-virtual {p0, p1, v4}, Ll/jod;->d(Ll/asf;I)D

    .line 163
    .line 164
    .line 165
    move-result-wide v4

    .line 166
    invoke-interface {v0, v2, v4, v5}, Ll/kke;->b(ID)V

    .line 167
    .line 168
    .line 169
    iput v3, p0, Ll/jod;->e:I

    .line 170
    .line 171
    return v1

    .line 172
    :cond_7
    new-instance p0, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    const-string p1, "Invalid element type "

    .line 175
    .line 176
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    invoke-static {p0, v5}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    throw p0

    .line 191
    :cond_8
    iget-object v0, p0, Ll/jod;->d:Ll/kke;

    .line 192
    .line 193
    iget v2, p0, Ll/jod;->f:I

    .line 194
    .line 195
    iget-wide v4, p0, Ll/jod;->g:J

    .line 196
    .line 197
    long-to-int v4, v4

    .line 198
    invoke-interface {v0, v2, v4, p1}, Ll/kke;->h(IILl/asf;)V

    .line 199
    .line 200
    .line 201
    iput v3, p0, Ll/jod;->e:I

    .line 202
    .line 203
    return v1

    .line 204
    :cond_9
    iget-wide v6, p0, Ll/jod;->g:J

    .line 205
    .line 206
    const-wide/32 v8, 0x7fffffff

    .line 207
    .line 208
    .line 209
    cmp-long v0, v6, v8

    .line 210
    .line 211
    if-gtz v0, :cond_a

    .line 212
    .line 213
    iget-object v0, p0, Ll/jod;->d:Ll/kke;

    .line 214
    .line 215
    iget v2, p0, Ll/jod;->f:I

    .line 216
    .line 217
    long-to-int v4, v6

    .line 218
    invoke-static {p1, v4}, Ll/jod;->f(Ll/asf;I)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-interface {v0, v2, p1}, Ll/kke;->d(ILjava/lang/String;)V

    .line 223
    .line 224
    .line 225
    iput v3, p0, Ll/jod;->e:I

    .line 226
    .line 227
    return v1

    .line 228
    :cond_a
    new-instance p1, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    const-string v0, "String element size: "

    .line 231
    .line 232
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-wide v0, p0, Ll/jod;->g:J

    .line 236
    .line 237
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    invoke-static {p0, v5}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    throw p0

    .line 249
    :cond_b
    iget-wide v8, p0, Ll/jod;->g:J

    .line 250
    .line 251
    cmp-long v0, v8, v6

    .line 252
    .line 253
    if-gtz v0, :cond_c

    .line 254
    .line 255
    iget-object v0, p0, Ll/jod;->d:Ll/kke;

    .line 256
    .line 257
    iget v2, p0, Ll/jod;->f:I

    .line 258
    .line 259
    long-to-int v4, v8

    .line 260
    invoke-virtual {p0, p1, v4}, Ll/jod;->e(Ll/asf;I)J

    .line 261
    .line 262
    .line 263
    move-result-wide v4

    .line 264
    invoke-interface {v0, v2, v4, v5}, Ll/kke;->c(IJ)V

    .line 265
    .line 266
    .line 267
    iput v3, p0, Ll/jod;->e:I

    .line 268
    .line 269
    return v1

    .line 270
    :cond_c
    new-instance p1, Ljava/lang/StringBuilder;

    .line 271
    .line 272
    const-string v0, "Invalid integer size: "

    .line 273
    .line 274
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    iget-wide v0, p0, Ll/jod;->g:J

    .line 278
    .line 279
    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-static {p0, v5}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    throw p0

    .line 291
    :cond_d
    invoke-interface {p1}, Ll/asf;->getPosition()J

    .line 292
    .line 293
    .line 294
    move-result-wide v6

    .line 295
    iget-wide v8, p0, Ll/jod;->g:J

    .line 296
    .line 297
    add-long/2addr v8, v6

    .line 298
    iget-object p1, p0, Ll/jod;->b:Ljava/util/ArrayDeque;

    .line 299
    .line 300
    new-instance v0, Ll/jod$b;

    .line 301
    .line 302
    iget v2, p0, Ll/jod;->f:I

    .line 303
    .line 304
    invoke-direct {v0, v2, v8, v9, v5}, Ll/jod$b;-><init>(IJLl/jod$a;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {p1, v0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    iget-object v4, p0, Ll/jod;->d:Ll/kke;

    .line 311
    .line 312
    iget v5, p0, Ll/jod;->f:I

    .line 313
    .line 314
    iget-wide v8, p0, Ll/jod;->g:J

    .line 315
    .line 316
    invoke-interface/range {v4 .. v9}, Ll/kke;->e(IJJ)V

    .line 317
    .line 318
    .line 319
    iput v3, p0, Ll/jod;->e:I

    .line 320
    .line 321
    return v1

    .line 322
    :cond_e
    iget-wide v0, p0, Ll/jod;->g:J

    .line 323
    .line 324
    long-to-int v0, v0

    .line 325
    invoke-interface {p1, v0}, Ll/asf;->o(I)V

    .line 326
    .line 327
    .line 328
    iput v3, p0, Ll/jod;->e:I

    .line 329
    .line 330
    goto/16 :goto_0
.end method

.method public b(Ll/kke;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jod;->d:Ll/kke;

    .line 2
    .line 3
    return-void
.end method

.method public final c(Ll/asf;)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "processor"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/asf;->h()V

    .line 2
    .line 3
    .line 4
    :goto_0
    iget-object v0, p0, Ll/jod;->a:[B

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x4

    .line 8
    invoke-interface {p1, v0, v1, v2}, Ll/asf;->f([BII)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/jod;->a:[B

    .line 12
    .line 13
    aget-byte v0, v0, v1

    .line 14
    .line 15
    invoke-static {v0}, Ll/p1l0;->c(I)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v3, -0x1

    .line 20
    if-eq v0, v3, :cond_0

    .line 21
    .line 22
    if-gt v0, v2, :cond_0

    .line 23
    .line 24
    iget-object v2, p0, Ll/jod;->a:[B

    .line 25
    .line 26
    invoke-static {v2, v0, v1}, Ll/p1l0;->a([BIZ)J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    long-to-int v1, v1

    .line 31
    iget-object v2, p0, Ll/jod;->d:Ll/kke;

    .line 32
    .line 33
    invoke-interface {v2, v1}, Ll/kke;->g(I)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    invoke-interface {p1, v0}, Ll/asf;->o(I)V

    .line 40
    .line 41
    .line 42
    int-to-long p0, v1

    .line 43
    return-wide p0

    .line 44
    :cond_0
    const/4 v0, 0x1

    .line 45
    invoke-interface {p1, v0}, Ll/asf;->o(I)V

    .line 46
    .line 47
    .line 48
    goto :goto_0
.end method

.method public final d(Ll/asf;I)D
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/jod;->e(Ll/asf;I)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    const/4 v0, 0x4

    .line 6
    if-ne p2, v0, :cond_0

    .line 7
    .line 8
    long-to-int p0, p0

    .line 9
    invoke-static {p0}, Ljava/lang/Float;->intBitsToFloat(I)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    float-to-double p0, p0

    .line 14
    return-wide p0

    .line 15
    :cond_0
    invoke-static {p0, p1}, Ljava/lang/Double;->longBitsToDouble(J)D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    return-wide p0
.end method

.method public final e(Ll/asf;I)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/jod;->a:[B

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {p1, v0, v1, p2}, Ll/asf;->readFully([BII)V

    .line 5
    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    :goto_0
    if-ge v1, p2, :cond_0

    .line 10
    .line 11
    const/16 p1, 0x8

    .line 12
    .line 13
    shl-long/2addr v2, p1

    .line 14
    iget-object p1, p0, Ll/jod;->a:[B

    .line 15
    .line 16
    aget-byte p1, p1, v1

    .line 17
    .line 18
    and-int/lit16 p1, p1, 0xff

    .line 19
    .line 20
    int-to-long v4, p1

    .line 21
    or-long/2addr v2, v4

    .line 22
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-wide v2
.end method

.method public reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/jod;->e:I

    .line 3
    .line 4
    iget-object v0, p0, Ll/jod;->b:Ljava/util/ArrayDeque;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/jod;->c:Ll/p1l0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/p1l0;->e()V

    .line 12
    .line 13
    .line 14
    return-void
.end method
