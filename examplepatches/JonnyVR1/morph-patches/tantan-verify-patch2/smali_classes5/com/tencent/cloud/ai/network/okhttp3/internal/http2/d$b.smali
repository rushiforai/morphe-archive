.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/e;

.field public final b:Z

.field public c:I

.field public d:Z

.field public e:I

.field public f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(IZLcom/tencent/cloud/ai/network/okio/e;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const v0, 0x7fffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->c:I

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    new-array v0, v0, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 14
    .line 15
    const/4 v0, 0x7

    .line 16
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->h:I

    .line 20
    .line 21
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->i:I

    .line 22
    .line 23
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->e:I

    .line 24
    .line 25
    iput-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->b:Z

    .line 26
    .line 27
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/e;)V
    .locals 2

    const/16 v0, 0x1000

    const/4 v1, 0x1

    .line 30
    invoke-direct {p0, v0, v1, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;-><init>(IZLcom/tencent/cloud/ai/network/okio/e;)V

    return-void
.end method


# virtual methods
.method public final a(I)I
    .locals 4

    const/4 v0, 0x0

    if-lez p1, :cond_1

    .line 237
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    if-lt v1, v2, :cond_0

    if-lez p1, :cond_0

    .line 238
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    aget-object v2, v2, v1

    iget v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->c:I

    sub-int/2addr p1, v2

    .line 239
    iget v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->i:I

    sub-int/2addr v3, v2

    iput v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->i:I

    .line 240
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->h:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->h:I

    add-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 241
    :cond_0
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    add-int/lit8 v2, v2, 0x1

    add-int v1, v2, v0

    iget v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->h:I

    invoke-static {p1, v2, p1, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 242
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    add-int/lit8 v1, v1, 0x1

    add-int v2, v1, v0

    const/4 v3, 0x0

    invoke-static {p1, v1, v2, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    .line 243
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    :cond_1
    return v0
.end method

.method public final a()V
    .locals 2

    .line 258
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 259
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    const/4 v0, 0x0

    .line 260
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->h:I

    .line 261
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->i:I

    return-void
.end method

.method public a(III)V
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    if-ge p1, p2, :cond_0

    or-int p0, p3, p1

    .line 263
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    return-void

    :cond_0
    or-int/2addr p3, p2

    .line 264
    invoke-virtual {v0, p3}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    sub-int/2addr p1, p2

    .line 265
    :goto_0
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    const/16 p3, 0x80

    if-lt p1, p3, :cond_1

    and-int/lit8 v0, p1, 0x7f

    or-int/2addr p3, v0

    .line 266
    invoke-virtual {p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    ushr-int/lit8 p1, p1, 0x7

    goto :goto_0

    .line 267
    :cond_1
    invoke-virtual {p2, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    return-void
.end method

.method public final a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;)V
    .locals 6

    .line 244
    iget v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->c:I

    .line 245
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->e:I

    if-le v0, v1, :cond_0

    .line 246
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a()V

    return-void

    .line 247
    :cond_0
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->i:I

    add-int/2addr v2, v0

    sub-int/2addr v2, v1

    .line 248
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(I)I

    .line 249
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->h:I

    add-int/lit8 v1, v1, 0x1

    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v3, v2

    if-le v1, v3, :cond_1

    .line 250
    array-length v1, v2

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 251
    array-length v3, v2

    array-length v4, v2

    const/4 v5, 0x0

    invoke-static {v2, v5, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 252
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    array-length v2, v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    .line 253
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 254
    :cond_1
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    add-int/lit8 v2, v1, -0x1

    iput v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    .line 255
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    aput-object p1, v2, v1

    .line 256
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->h:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->h:I

    .line 257
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->i:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->i:I

    return-void
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/ByteString;)V
    .locals 11

    .line 268
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->b:Z

    const/16 v1, 0x7f

    const/4 v2, 0x0

    if-eqz v0, :cond_4

    .line 269
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;

    .line 270
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v3, 0x0

    move v0, v2

    move-wide v5, v3

    .line 271
    :goto_0
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v7

    const/16 v8, 0xff

    if-ge v0, v7, :cond_0

    .line 272
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->getByte(I)B

    move-result v7

    and-int/2addr v7, v8

    .line 273
    sget-object v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->c:[B

    aget-byte v7, v8, v7

    int-to-long v7, v7

    add-long/2addr v5, v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const-wide/16 v9, 0x7

    add-long/2addr v5, v9

    const/4 v0, 0x3

    shr-long/2addr v5, v0

    long-to-int v0, v5

    .line 274
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v5

    if-ge v0, v5, :cond_4

    .line 275
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 276
    sget-object v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;

    .line 277
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-wide v4, v3

    move v3, v2

    .line 278
    :goto_1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v6

    if-ge v2, v6, :cond_2

    .line 279
    invoke-virtual {p1, v2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->getByte(I)B

    move-result v6

    and-int/2addr v6, v8

    .line 280
    sget-object v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->b:[I

    aget v7, v7, v6

    .line 281
    sget-object v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/s;->c:[B

    aget-byte v6, v9, v6

    shl-long/2addr v4, v6

    int-to-long v9, v7

    or-long/2addr v4, v9

    add-int/2addr v3, v6

    :goto_2
    const/16 v6, 0x8

    if-lt v3, v6, :cond_1

    add-int/lit8 v3, v3, -0x8

    shr-long v6, v4, v3

    long-to-int v6, v6

    .line 282
    invoke-virtual {v0, v6}, Lcom/tencent/cloud/ai/network/okio/e;->c(I)Lcom/tencent/cloud/ai/network/okio/f;

    goto :goto_2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    if-lez v3, :cond_3

    rsub-int/lit8 p1, v3, 0x8

    shl-long/2addr v4, p1

    ushr-int p1, v8, v3

    int-to-long v2, p1

    or-long/2addr v2, v4

    long-to-int p1, v2

    .line 283
    invoke-virtual {v0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->c(I)Lcom/tencent/cloud/ai/network/okio/f;

    .line 284
    :cond_3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->m()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object p1

    .line 285
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v0

    const/16 v2, 0x80

    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(III)V

    .line 286
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->b(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/e;

    return-void

    .line 287
    :cond_4
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v0

    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(III)V

    .line 288
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->b(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/e;

    return-void
.end method

.method public a(Ljava/util/List;)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->c:I

    .line 7
    .line 8
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->e:I

    .line 9
    .line 10
    const/16 v3, 0x20

    .line 11
    .line 12
    const/16 v4, 0x1f

    .line 13
    .line 14
    if-ge v0, v2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, v0, v4, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(III)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->d:Z

    .line 20
    .line 21
    const v0, 0x7fffffff

    .line 22
    .line 23
    .line 24
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->c:I

    .line 25
    .line 26
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->e:I

    .line 27
    .line 28
    invoke-virtual {p0, v0, v4, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(III)V

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    move v2, v1

    .line 36
    :goto_0
    if-ge v2, v0, :cond_b

    .line 37
    .line 38
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    check-cast v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 43
    .line 44
    iget-object v4, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 45
    .line 46
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->toAsciiLowercase()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iget-object v5, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 51
    .line 52
    sget-object v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->b:Ljava/util/Map;

    .line 53
    .line 54
    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    check-cast v6, Ljava/lang/Integer;

    .line 59
    .line 60
    const/4 v7, 0x1

    .line 61
    const/4 v8, -0x1

    .line 62
    if-eqz v6, :cond_4

    .line 63
    .line 64
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 65
    .line 66
    .line 67
    move-result v6

    .line 68
    add-int/lit8 v9, v6, 0x1

    .line 69
    .line 70
    if-le v9, v7, :cond_3

    .line 71
    .line 72
    const/16 v10, 0x8

    .line 73
    .line 74
    if-ge v9, v10, :cond_3

    .line 75
    .line 76
    sget-object v10, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 77
    .line 78
    aget-object v11, v10, v6

    .line 79
    .line 80
    iget-object v11, v11, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 81
    .line 82
    invoke-static {v11, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v11

    .line 86
    if-eqz v11, :cond_2

    .line 87
    .line 88
    move v6, v9

    .line 89
    goto :goto_1

    .line 90
    :cond_2
    aget-object v10, v10, v9

    .line 91
    .line 92
    iget-object v10, v10, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 93
    .line 94
    invoke-static {v10, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v10

    .line 98
    if-eqz v10, :cond_3

    .line 99
    .line 100
    add-int/lit8 v6, v6, 0x2

    .line 101
    .line 102
    move v12, v9

    .line 103
    move v9, v6

    .line 104
    move v6, v12

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    move v6, v9

    .line 107
    move v9, v8

    .line 108
    goto :goto_1

    .line 109
    :cond_4
    move v6, v8

    .line 110
    move v9, v6

    .line 111
    :goto_1
    if-ne v9, v8, :cond_7

    .line 112
    .line 113
    iget v10, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    .line 114
    .line 115
    add-int/2addr v10, v7

    .line 116
    iget-object v7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 117
    .line 118
    array-length v7, v7

    .line 119
    :goto_2
    if-ge v10, v7, :cond_7

    .line 120
    .line 121
    iget-object v11, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 122
    .line 123
    aget-object v11, v11, v10

    .line 124
    .line 125
    iget-object v11, v11, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->a:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 126
    .line 127
    invoke-static {v11, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v11

    .line 131
    if-eqz v11, :cond_6

    .line 132
    .line 133
    iget-object v11, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->f:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 134
    .line 135
    aget-object v11, v11, v10

    .line 136
    .line 137
    iget-object v11, v11, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 138
    .line 139
    invoke-static {v11, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v11

    .line 143
    if-eqz v11, :cond_5

    .line 144
    .line 145
    iget v7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    .line 146
    .line 147
    sub-int/2addr v10, v7

    .line 148
    sget-object v7, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 149
    .line 150
    array-length v7, v7

    .line 151
    add-int v9, v10, v7

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_5
    if-ne v6, v8, :cond_6

    .line 155
    .line 156
    iget v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->g:I

    .line 157
    .line 158
    sub-int v6, v10, v6

    .line 159
    .line 160
    sget-object v11, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d;->a:[Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;

    .line 161
    .line 162
    array-length v11, v11

    .line 163
    add-int/2addr v6, v11

    .line 164
    :cond_6
    add-int/lit8 v10, v10, 0x1

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_7
    :goto_3
    if-eq v9, v8, :cond_8

    .line 168
    .line 169
    const/16 v3, 0x7f

    .line 170
    .line 171
    const/16 v4, 0x80

    .line 172
    .line 173
    invoke-virtual {p0, v9, v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(III)V

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :cond_8
    const/16 v7, 0x40

    .line 178
    .line 179
    if-ne v6, v8, :cond_9

    .line 180
    .line 181
    iget-object v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 182
    .line 183
    invoke-virtual {v6, v7}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;)V

    .line 193
    .line 194
    .line 195
    goto :goto_4

    .line 196
    :cond_9
    sget-object v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->d:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 197
    .line 198
    invoke-virtual {v4, v8}, Lcom/tencent/cloud/ai/network/okio/ByteString;->startsWith(Lcom/tencent/cloud/ai/network/okio/ByteString;)Z

    .line 199
    .line 200
    .line 201
    move-result v8

    .line 202
    if-eqz v8, :cond_a

    .line 203
    .line 204
    sget-object v8, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;->i:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 205
    .line 206
    invoke-virtual {v8, v4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    if-nez v4, :cond_a

    .line 211
    .line 212
    const/16 v3, 0xf

    .line 213
    .line 214
    invoke-virtual {p0, v6, v3, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(III)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 218
    .line 219
    .line 220
    goto :goto_4

    .line 221
    :cond_a
    const/16 v4, 0x3f

    .line 222
    .line 223
    invoke-virtual {p0, v6, v4, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(III)V

    .line 224
    .line 225
    .line 226
    invoke-virtual {p0, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/d$b;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/c;)V

    .line 230
    .line 231
    .line 232
    :goto_4
    add-int/lit8 v2, v2, 0x1

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_b
    return-void
.end method
