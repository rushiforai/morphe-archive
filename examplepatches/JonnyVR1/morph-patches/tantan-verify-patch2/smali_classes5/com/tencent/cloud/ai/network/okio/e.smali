.class public final Lcom/tencent/cloud/ai/network/okio/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/g;
.implements Lcom/tencent/cloud/ai/network/okio/f;
.implements Ljava/lang/Cloneable;
.implements Ljava/nio/channels/ByteChannel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okio/e$b;
    }
.end annotation


# static fields
.field public static final c:[B


# instance fields
.field public a:Lcom/tencent/cloud/ai/network/okio/s;

.field public b:J


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/tencent/cloud/ai/network/okio/e;->c:[B

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 1
        0x30t
        0x31t
        0x32t
        0x33t
        0x34t
        0x35t
        0x36t
        0x37t
        0x38t
        0x39t
        0x61t
        0x62t
        0x63t
        0x64t
        0x65t
        0x66t
    .end array-data
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


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/p;)I
    .locals 11

    .line 246
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    if-nez v1, :cond_0

    .line 247
    sget-object p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->EMPTY:Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {p1, p0}, Ljava/util/AbstractList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    return p0

    .line 248
    :cond_0
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okio/p;->a:[Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 249
    array-length v6, p1

    const/4 v7, 0x0

    move v8, v7

    :goto_0
    if-ge v8, v6, :cond_3

    .line 250
    aget-object v3, p1, v8

    .line 251
    iget-wide v4, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v0

    int-to-long v9, v0

    cmp-long v0, v4, v9

    if-ltz v0, :cond_1

    iget v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v5

    const/4 v4, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/s;ILcom/tencent/cloud/ai/network/okio/ByteString;II)Z

    move-result p0

    if-eqz p0, :cond_2

    .line 252
    :try_start_0
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result p0

    int-to-long p0, p0

    invoke-virtual {v0, p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->d(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return v8

    :catch_0
    move-exception v0

    move-object p0, v0

    .line 253
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    return v7

    :cond_1
    move-object v0, p0

    :cond_2
    add-int/lit8 v8, v8, 0x1

    move-object p0, v0

    goto :goto_0

    :cond_3
    const/4 p0, -0x1

    return p0
.end method

.method public a([BII)I
    .locals 7

    .line 268
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 269
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    if-nez v0, :cond_0

    const/4 p0, -0x1

    return p0

    .line 270
    :cond_0
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 271
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    invoke-static {v1, v2, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 272
    iget p1, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    add-int/2addr p1, p3

    iput p1, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 273
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    int-to-long v3, p3

    sub-long/2addr v1, v3

    iput-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 274
    iget p2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    if-ne p1, p2, :cond_1

    .line 275
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 276
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    :cond_1
    return p3
.end method

.method public a(B)J
    .locals 6

    const-wide/16 v2, 0x0

    const-wide v4, 0x7fffffffffffffffL

    move-object v0, p0

    move v1, p1

    .line 293
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/e;->a(BJJ)J

    move-result-wide p0

    return-wide p0
.end method

.method public a(BJJ)J
    .locals 13

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_9

    cmp-long v2, p4, p2

    if-ltz v2, :cond_9

    .line 294
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long v4, p4, v2

    if-lez v4, :cond_0

    move-wide v4, v2

    goto :goto_0

    :cond_0
    move-wide/from16 v4, p4

    :goto_0
    cmp-long v6, p2, v4

    const-wide/16 v7, -0x1

    if-nez v6, :cond_1

    return-wide v7

    .line 295
    :cond_1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    if-nez p0, :cond_2

    return-wide v7

    :cond_2
    sub-long v9, v2, p2

    cmp-long v6, v9, p2

    if-gez v6, :cond_4

    :goto_1
    cmp-long v0, v2, p2

    if-lez v0, :cond_3

    .line 296
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 297
    iget v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    sub-long/2addr v2, v0

    goto :goto_1

    :cond_3
    :goto_2
    move-wide v0, p2

    goto :goto_4

    .line 298
    :cond_4
    :goto_3
    iget v2, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v3, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v2, v3

    int-to-long v2, v2

    add-long/2addr v2, v0

    cmp-long v6, v2, p2

    if-gez v6, :cond_5

    .line 299
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    move-wide v0, v2

    goto :goto_3

    :cond_5
    move-wide v2, v0

    goto :goto_2

    :goto_4
    cmp-long v6, v2, v4

    if-gez v6, :cond_8

    .line 300
    iget-object v6, p0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 301
    iget v9, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    int-to-long v9, v9

    iget v11, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    int-to-long v11, v11

    add-long/2addr v11, v4

    sub-long/2addr v11, v2

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    long-to-int v9, v9

    .line 302
    iget v10, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    int-to-long v10, v10

    add-long/2addr v10, v0

    sub-long/2addr v10, v2

    long-to-int v0, v10

    :goto_5
    if-ge v0, v9, :cond_7

    .line 303
    aget-byte v1, v6, v0

    if-ne v1, p1, :cond_6

    .line 304
    iget p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v0, p0

    int-to-long p0, v0

    add-long/2addr p0, v2

    return-wide p0

    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 305
    :cond_7
    iget v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    add-long/2addr v2, v0

    .line 306
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    move-wide v0, v2

    goto :goto_4

    :cond_8
    return-wide v7

    .line 307
    :cond_9
    iget-wide p0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 308
    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static/range {p4 .. p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    filled-new-array {p0, p1, v2}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "size=%s fromIndex=%s toIndex=%s"

    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return-wide v0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/ByteString;)J
    .locals 11

    .line 309
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    if-nez v0, :cond_0

    goto/16 :goto_9

    .line 310
    :cond_0
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-gez v5, :cond_1

    :goto_0
    cmp-long v5, v1, v3

    if-lez v5, :cond_2

    .line 311
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 312
    iget v5, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v6, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    sub-long/2addr v1, v5

    goto :goto_0

    :cond_1
    move-wide v1, v3

    .line 313
    :goto_1
    iget v5, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v6, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v5, v6

    int-to-long v5, v5

    add-long/2addr v5, v1

    cmp-long v7, v5, v3

    if-gez v7, :cond_2

    .line 314
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    move-wide v1, v5

    goto :goto_1

    .line 315
    :cond_2
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v5

    const/4 v6, 0x2

    const/4 v7, 0x0

    if-ne v5, v6, :cond_6

    .line 316
    invoke-virtual {p1, v7}, Lcom/tencent/cloud/ai/network/okio/ByteString;->getByte(I)B

    move-result v5

    const/4 v6, 0x1

    .line 317
    invoke-virtual {p1, v6}, Lcom/tencent/cloud/ai/network/okio/ByteString;->getByte(I)B

    move-result p1

    .line 318
    :goto_2
    iget-wide v6, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long v6, v1, v6

    if-gez v6, :cond_a

    .line 319
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 320
    iget v7, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    int-to-long v7, v7

    add-long/2addr v7, v3

    sub-long/2addr v7, v1

    long-to-int v3, v7

    iget v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    :goto_3
    if-ge v3, v4, :cond_5

    .line 321
    aget-byte v7, v6, v3

    if-eq v7, v5, :cond_4

    if-ne v7, p1, :cond_3

    goto :goto_4

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 322
    :cond_4
    :goto_4
    iget p0, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    :goto_5
    sub-int/2addr v3, p0

    int-to-long p0, v3

    add-long/2addr p0, v1

    return-wide p0

    .line 323
    :cond_5
    iget v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v3, v1

    .line 324
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    move-wide v1, v3

    goto :goto_2

    .line 325
    :cond_6
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a()[B

    move-result-object p1

    .line 326
    :goto_6
    iget-wide v5, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long v5, v1, v5

    if-gez v5, :cond_a

    .line 327
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 328
    iget v6, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    int-to-long v8, v6

    add-long/2addr v8, v3

    sub-long/2addr v8, v1

    long-to-int v3, v8

    iget v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    :goto_7
    if-ge v3, v4, :cond_9

    .line 329
    aget-byte v6, v5, v3

    .line 330
    array-length v8, p1

    move v9, v7

    :goto_8
    if-ge v9, v8, :cond_8

    aget-byte v10, p1, v9

    if-ne v6, v10, :cond_7

    .line 331
    iget p0, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    goto :goto_5

    :cond_7
    add-int/lit8 v9, v9, 0x1

    goto :goto_8

    :cond_8
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    .line 332
    :cond_9
    iget v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v3, v1

    .line 333
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    move-wide v1, v3

    goto :goto_6

    :cond_a
    :goto_9
    const-wide/16 p0, -0x1

    return-wide p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 4

    const-wide/16 v0, 0x0

    if-eqz p1, :cond_3

    cmp-long v2, p2, v0

    if-ltz v2, :cond_2

    .line 289
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long v0, v2, v0

    if-nez v0, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_0
    cmp-long v0, p2, v2

    if-lez v0, :cond_1

    move-wide p2, v2

    .line 290
    :cond_1
    invoke-virtual {p1, p0, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    return-wide p2

    .line 291
    :cond_2
    const-string p0, "byteCount < 0: "

    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    return-wide v0

    .line 292
    :cond_3
    const-string p0, "sink == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-wide v0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/w;)J
    .locals 6

    const-wide/16 v0, 0x0

    if-eqz p1, :cond_1

    :goto_0
    const-wide/16 v2, 0x2000

    .line 287
    invoke-interface {p1, p0, v2, v3}, Lcom/tencent/cloud/ai/network/okio/w;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-eqz v4, :cond_0

    add-long/2addr v0, v2

    goto :goto_0

    :cond_0
    return-wide v0

    .line 288
    :cond_1
    const-string p0, "source == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-wide v0
.end method

.method public a(J)Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 245
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->g(J)[B

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/e$b;)Lcom/tencent/cloud/ai/network/okio/e$b;
    .locals 1

    .line 341
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okio/e$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    if-nez v0, :cond_0

    .line 342
    iput-object p0, p1, Lcom/tencent/cloud/ai/network/okio/e$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    const/4 p0, 0x1

    .line 343
    iput-boolean p0, p1, Lcom/tencent/cloud/ai/network/okio/e$b;->b:Z

    return-object p1

    .line 344
    :cond_0
    const-string p0, "already attached to a buffer"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a()Lcom/tencent/cloud/ai/network/okio/e;
    .locals 0

    .line 277
    return-object p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okio/e;JJ)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 6

    if-eqz p1, :cond_4

    .line 232
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    move-wide v2, p2

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    const-wide/16 p2, 0x0

    cmp-long p4, v4, p2

    if-nez p4, :cond_0

    goto :goto_3

    .line 233
    :cond_0
    iget-wide p4, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    add-long/2addr p4, v4

    iput-wide p4, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 234
    iget-object p4, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 235
    :goto_0
    iget p5, p4, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v0, p4, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr p5, v0

    int-to-long v0, p5

    cmp-long p5, v2, v0

    if-ltz p5, :cond_1

    sub-long/2addr v2, v0

    iget-object p4, p4, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    goto :goto_0

    :cond_1
    move-object v0, p4

    move-wide p4, v4

    :goto_1
    cmp-long v1, p4, p2

    if-lez v1, :cond_3

    .line 236
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/s;->b()Lcom/tencent/cloud/ai/network/okio/s;

    move-result-object v1

    .line 237
    iget v4, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    int-to-long v4, v4

    add-long/2addr v4, v2

    long-to-int v2, v4

    iput v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    long-to-int v3, p4

    add-int/2addr v2, v3

    .line 238
    iget v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iput v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 239
    iget-object v2, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    if-nez v2, :cond_2

    .line 240
    iput-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    iput-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    iput-object v1, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    goto :goto_2

    .line 241
    :cond_2
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    invoke-virtual {v2, v1}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;)Lcom/tencent/cloud/ai/network/okio/s;

    .line 242
    :goto_2
    iget v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v2, v1

    int-to-long v1, v2

    sub-long/2addr p4, v1

    .line 243
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    move-wide v2, p2

    goto :goto_1

    :cond_3
    :goto_3
    return-object p0

    .line 244
    :cond_4
    const-string p0, "out == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Ljava/lang/String;II)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p2, :cond_c

    .line 3
    .line 4
    if-lt p3, p2, :cond_b

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-gt p3, v1, :cond_a

    .line 11
    .line 12
    :goto_0
    if-ge p2, p3, :cond_9

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/16 v1, 0x80

    .line 19
    .line 20
    if-ge v0, v1, :cond_2

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 28
    .line 29
    iget v4, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 30
    .line 31
    sub-int/2addr v4, p2

    .line 32
    rsub-int v5, v4, 0x2000

    .line 33
    .line 34
    invoke-static {p3, v5}, Ljava/lang/Math;->min(II)I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    add-int/lit8 v6, p2, 0x1

    .line 39
    .line 40
    add-int/2addr p2, v4

    .line 41
    int-to-byte v0, v0

    .line 42
    aput-byte v0, v3, p2

    .line 43
    .line 44
    :goto_1
    move p2, v6

    .line 45
    if-ge p2, v5, :cond_1

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-lt v0, v1, :cond_0

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_0
    add-int/lit8 v6, p2, 0x1

    .line 55
    .line 56
    add-int/2addr p2, v4

    .line 57
    int-to-byte v0, v0

    .line 58
    aput-byte v0, v3, p2

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_1
    :goto_2
    add-int/2addr v4, p2

    .line 62
    iget v0, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 63
    .line 64
    sub-int/2addr v4, v0

    .line 65
    add-int/2addr v0, v4

    .line 66
    iput v0, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 67
    .line 68
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 69
    .line 70
    int-to-long v2, v4

    .line 71
    add-long/2addr v0, v2

    .line 72
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_2
    const/16 v2, 0x800

    .line 76
    .line 77
    if-ge v0, v2, :cond_3

    .line 78
    .line 79
    shr-int/lit8 v2, v0, 0x6

    .line 80
    .line 81
    or-int/lit16 v2, v2, 0xc0

    .line 82
    .line 83
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 84
    .line 85
    .line 86
    and-int/lit8 v0, v0, 0x3f

    .line 87
    .line 88
    or-int/2addr v0, v1

    .line 89
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 90
    .line 91
    .line 92
    :goto_3
    add-int/lit8 p2, p2, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_3
    const v2, 0xd800

    .line 96
    .line 97
    .line 98
    const/16 v3, 0x3f

    .line 99
    .line 100
    if-lt v0, v2, :cond_8

    .line 101
    .line 102
    const v2, 0xdfff

    .line 103
    .line 104
    .line 105
    if-le v0, v2, :cond_4

    .line 106
    .line 107
    goto :goto_6

    .line 108
    :cond_4
    add-int/lit8 v4, p2, 0x1

    .line 109
    .line 110
    if-ge v4, p3, :cond_5

    .line 111
    .line 112
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    goto :goto_4

    .line 117
    :cond_5
    const/4 v5, 0x0

    .line 118
    :goto_4
    const v6, 0xdbff

    .line 119
    .line 120
    .line 121
    if-gt v0, v6, :cond_7

    .line 122
    .line 123
    const v6, 0xdc00

    .line 124
    .line 125
    .line 126
    if-lt v5, v6, :cond_7

    .line 127
    .line 128
    if-le v5, v2, :cond_6

    .line 129
    .line 130
    goto :goto_5

    .line 131
    :cond_6
    const v2, -0xd801

    .line 132
    .line 133
    .line 134
    and-int/2addr v0, v2

    .line 135
    shl-int/lit8 v0, v0, 0xa

    .line 136
    .line 137
    const v2, -0xdc01

    .line 138
    .line 139
    .line 140
    and-int/2addr v2, v5

    .line 141
    or-int/2addr v0, v2

    .line 142
    const/high16 v2, 0x10000

    .line 143
    .line 144
    add-int/2addr v0, v2

    .line 145
    shr-int/lit8 v2, v0, 0x12

    .line 146
    .line 147
    or-int/lit16 v2, v2, 0xf0

    .line 148
    .line 149
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 150
    .line 151
    .line 152
    shr-int/lit8 v2, v0, 0xc

    .line 153
    .line 154
    and-int/2addr v2, v3

    .line 155
    or-int/2addr v2, v1

    .line 156
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 157
    .line 158
    .line 159
    shr-int/lit8 v2, v0, 0x6

    .line 160
    .line 161
    and-int/2addr v2, v3

    .line 162
    or-int/2addr v2, v1

    .line 163
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 164
    .line 165
    .line 166
    and-int/2addr v0, v3

    .line 167
    or-int/2addr v0, v1

    .line 168
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 169
    .line 170
    .line 171
    add-int/lit8 p2, p2, 0x2

    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :cond_7
    :goto_5
    invoke-virtual {p0, v3}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 176
    .line 177
    .line 178
    move p2, v4

    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :cond_8
    :goto_6
    shr-int/lit8 v2, v0, 0xc

    .line 182
    .line 183
    or-int/lit16 v2, v2, 0xe0

    .line 184
    .line 185
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 186
    .line 187
    .line 188
    shr-int/lit8 v2, v0, 0x6

    .line 189
    .line 190
    and-int/2addr v2, v3

    .line 191
    or-int/2addr v2, v1

    .line 192
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 193
    .line 194
    .line 195
    and-int/lit8 v0, v0, 0x3f

    .line 196
    .line 197
    or-int/2addr v0, v1

    .line 198
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 199
    .line 200
    .line 201
    goto :goto_3

    .line 202
    :cond_9
    return-object p0

    .line 203
    :cond_a
    const-string p0, " > "

    .line 204
    .line 205
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    const-string p2, "endIndex > string.length: "

    .line 210
    .line 211
    invoke-static {p2, p3, p0, p1}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 212
    .line 213
    .line 214
    return-object v0

    .line 215
    :cond_b
    const-string p0, "endIndex < beginIndex: "

    .line 216
    .line 217
    const-string p1, " < "

    .line 218
    .line 219
    invoke-static {p0, p3, p1, p2}, Ll/itq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 220
    .line 221
    .line 222
    return-object v0

    .line 223
    :cond_c
    const-string p0, "beginIndex < 0: "

    .line 224
    .line 225
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 226
    .line 227
    .line 228
    return-object v0
.end method

.method public a(Ljava/lang/String;IILjava/nio/charset/Charset;)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 2

    if-ltz p2, :cond_4

    const/4 v0, 0x0

    if-lt p3, p2, :cond_3

    .line 278
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-gt p3, v1, :cond_2

    if-eqz p4, :cond_1

    .line 279
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/y;->a:Ljava/nio/charset/Charset;

    invoke-virtual {p4, v0}, Ljava/nio/charset/Charset;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->a(Ljava/lang/String;II)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0

    .line 280
    :cond_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, p4}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    .line 281
    array-length p2, p1

    const/4 p3, 0x0

    invoke-virtual {p0, p1, p3, p2}, Lcom/tencent/cloud/ai/network/okio/e;->b([BII)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0

    .line 282
    :cond_1
    const-string p0, "charset == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object v0

    .line 283
    :cond_2
    const-string p0, " > "

    .line 284
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    const-string p2, "endIndex > string.length: "

    invoke-static {p2, p3, p0, p1}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    return-object v0

    .line 285
    :cond_3
    const-string p0, "endIndex < beginIndex: "

    const-string p1, " < "

    invoke-static {p0, p3, p1, p2}, Ll/itq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    return-object v0

    .line 286
    :cond_4
    new-instance p0, Ljava/lang/IllegalAccessError;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "beginIndex < 0: "

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic a(I)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 230
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->g(I)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 231
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic a([B)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 229
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->b([B)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0
.end method

.method public a(JLjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 6

    .line 256
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    const-wide/16 v2, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    const/4 p1, 0x0

    if-eqz p3, :cond_4

    const-wide/32 v0, 0x7fffffff

    cmp-long p2, v4, v0

    if-gtz p2, :cond_3

    const-wide/16 p1, 0x0

    cmp-long p1, v4, p1

    if-nez p1, :cond_0

    const-string p0, ""

    return-object p0

    .line 257
    :cond_0
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 258
    iget p2, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    int-to-long v0, p2

    add-long/2addr v0, v4

    iget v2, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    int-to-long v2, v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    .line 259
    new-instance p1, Ljava/lang/String;

    invoke-virtual {p0, v4, v5}, Lcom/tencent/cloud/ai/network/okio/e;->g(J)[B

    move-result-object p0

    invoke-direct {p1, p0, p3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object p1

    .line 260
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    long-to-int v2, v4

    invoke-direct {v0, v1, p2, v2, p3}, Ljava/lang/String;-><init>([BIILjava/nio/charset/Charset;)V

    .line 261
    iget p2, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    int-to-long p2, p2

    add-long/2addr p2, v4

    long-to-int p2, p2

    iput p2, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 262
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    sub-long/2addr v1, v4

    iput-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 263
    iget p3, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    if-ne p2, p3, :cond_2

    .line 264
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    move-result-object p2

    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 265
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    :cond_2
    return-object v0

    .line 266
    :cond_3
    const-string p0, "byteCount > Integer.MAX_VALUE: "

    invoke-static {p0, v4, v5}, Ll/fcg0;->a(Ljava/lang/String;J)V

    return-object p1

    .line 267
    :cond_4
    const-string p0, "charset == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return-object p1
.end method

.method public a(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2

    .line 254
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/tencent/cloud/ai/network/okio/e;->a(JLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 255
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final a(Lcom/tencent/cloud/ai/network/okio/s;ILcom/tencent/cloud/ai/network/okio/ByteString;II)Z
    .locals 4

    .line 334
    iget p0, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 335
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    :goto_0
    if-ge p4, p5, :cond_2

    if-ne p2, p0, :cond_0

    .line 336
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 337
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 338
    iget p2, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 339
    iget v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    move-object v3, p1

    move-object p1, p0

    move p0, v0

    move-object v0, v3

    .line 340
    :cond_0
    aget-byte v1, v0, p2

    invoke-virtual {p3, p4}, Lcom/tencent/cloud/ai/network/okio/ByteString;->getByte(I)B

    move-result v2

    if-eq v1, v2, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_1
    add-int/lit8 p2, p2, 0x1

    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public b()I
    .locals 0

    .line 56
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readInt()I

    move-result p0

    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/y;->a(I)I

    move-result p0

    return p0
.end method

.method public b(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 0

    if-eqz p1, :cond_0

    .line 61
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->a(Lcom/tencent/cloud/ai/network/okio/e;)V

    return-object p0

    .line 62
    :cond_0
    const-string p0, "byteString == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 2

    .line 63
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/tencent/cloud/ai/network/okio/e;->a(Ljava/lang/String;II)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0
.end method

.method public b([B)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 2

    if-eqz p1, :cond_0

    .line 64
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/tencent/cloud/ai/network/okio/e;->b([BII)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0

    .line 65
    :cond_0
    const-string p0, "source == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public b([BII)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 7

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    array-length v0, p1

    .line 4
    int-to-long v1, v0

    .line 5
    int-to-long v3, p2

    .line 6
    int-to-long v5, p3

    .line 7
    invoke-static/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 8
    .line 9
    .line 10
    add-int/2addr p3, p2

    .line 11
    :goto_0
    if-ge p2, p3, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sub-int v1, p3, p2

    .line 19
    .line 20
    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 21
    .line 22
    rsub-int v2, v2, 0x2000

    .line 23
    .line 24
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 29
    .line 30
    iget v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 31
    .line 32
    invoke-static {p1, p2, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    add-int/2addr p2, v1

    .line 36
    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 37
    .line 38
    add-int/2addr v2, v1

    .line 39
    iput v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-wide p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 43
    .line 44
    add-long/2addr p1, v5

    .line 45
    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_1
    const-string p0, "source == null"

    .line 49
    .line 50
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    return-object p0
.end method

.method public bridge synthetic b(I)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 66
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->f(I)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0
.end method

.method public b(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 3

    .line 57
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long v2, v0, p2

    if-ltz v2, :cond_0

    .line 58
    invoke-virtual {p1, p0, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    return-void

    .line 59
    :cond_0
    invoke-virtual {p1, p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 60
    invoke-static {}, Ll/vg3;->a()V

    return-void
.end method

.method public b(J)Z
    .locals 2

    .line 55
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long p0, v0, p1

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public c()J
    .locals 14

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_9

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    move v1, v0

    .line 11
    move-wide v4, v2

    .line 12
    :cond_0
    iget-object v6, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 13
    .line 14
    iget-object v7, v6, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 15
    .line 16
    iget v8, v6, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 17
    .line 18
    iget v9, v6, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 19
    .line 20
    :goto_0
    if-ge v8, v9, :cond_6

    .line 21
    .line 22
    aget-byte v10, v7, v8

    .line 23
    .line 24
    const/16 v11, 0x30

    .line 25
    .line 26
    if-lt v10, v11, :cond_1

    .line 27
    .line 28
    const/16 v11, 0x39

    .line 29
    .line 30
    if-gt v10, v11, :cond_1

    .line 31
    .line 32
    add-int/lit8 v11, v10, -0x30

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const/16 v11, 0x61

    .line 36
    .line 37
    if-lt v10, v11, :cond_2

    .line 38
    .line 39
    const/16 v11, 0x66

    .line 40
    .line 41
    if-gt v10, v11, :cond_2

    .line 42
    .line 43
    add-int/lit8 v11, v10, -0x57

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    const/16 v11, 0x41

    .line 47
    .line 48
    if-lt v10, v11, :cond_4

    .line 49
    .line 50
    const/16 v11, 0x46

    .line 51
    .line 52
    if-gt v10, v11, :cond_4

    .line 53
    .line 54
    add-int/lit8 v11, v10, -0x37

    .line 55
    .line 56
    :goto_1
    const-wide/high16 v12, -0x1000000000000000L    # -3.105036184601418E231

    .line 57
    .line 58
    and-long/2addr v12, v4

    .line 59
    cmp-long v12, v12, v2

    .line 60
    .line 61
    if-nez v12, :cond_3

    .line 62
    .line 63
    const/4 v10, 0x4

    .line 64
    shl-long/2addr v4, v10

    .line 65
    int-to-long v10, v11

    .line 66
    or-long/2addr v4, v10

    .line 67
    add-int/lit8 v8, v8, 0x1

    .line 68
    .line 69
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    new-instance p0, Lcom/tencent/cloud/ai/network/okio/e;

    .line 73
    .line 74
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v4, v5}, Lcom/tencent/cloud/ai/network/okio/e;->j(J)Lcom/tencent/cloud/ai/network/okio/e;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0, v10}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    const-string v0, "Number too large: "

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->n()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-static {v0, p0}, Ll/ug3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-wide v2

    .line 95
    :cond_4
    if-eqz v0, :cond_5

    .line 96
    .line 97
    const/4 v1, 0x1

    .line 98
    goto :goto_2

    .line 99
    :cond_5
    const-string p0, "Expected leading [0-9a-fA-F] character but was 0x"

    .line 100
    .line 101
    invoke-static {v10}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {p0, v0}, Ll/ug3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    return-wide v2

    .line 109
    :cond_6
    :goto_2
    if-ne v8, v9, :cond_7

    .line 110
    .line 111
    invoke-virtual {v6}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    iput-object v7, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 116
    .line 117
    invoke-static {v6}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    .line 118
    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_7
    iput v8, v6, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 122
    .line 123
    :goto_3
    if-nez v1, :cond_8

    .line 124
    .line 125
    iget-object v6, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 126
    .line 127
    if-nez v6, :cond_0

    .line 128
    .line 129
    :cond_8
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 130
    .line 131
    int-to-long v6, v0

    .line 132
    sub-long/2addr v1, v6

    .line 133
    iput-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 134
    .line 135
    return-wide v4

    .line 136
    :cond_9
    const-string p0, "size == 0"

    .line 137
    .line 138
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    return-wide v2
.end method

.method public bridge synthetic c(I)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 142
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0
.end method

.method public c(J)Ljava/lang/String;
    .locals 10

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_3

    const-wide v0, 0x7fffffffffffffffL

    cmp-long v2, p1, v0

    const-wide/16 v6, 0x1

    if-nez v2, :cond_0

    :goto_0
    move-wide v4, v0

    goto :goto_1

    :cond_0
    add-long v0, p1, v6

    goto :goto_0

    :goto_1
    const/16 v1, 0xa

    const-wide/16 v2, 0x0

    move-object v0, p0

    .line 143
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/e;->a(BJJ)J

    move-result-wide v1

    const-wide/16 v8, -0x1

    cmp-long v3, v1, v8

    if-eqz v3, :cond_1

    .line 144
    invoke-virtual {p0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/e;->i(J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 145
    :cond_1
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long v1, v4, v1

    if-gez v1, :cond_2

    sub-long v1, v4, v6

    .line 146
    invoke-virtual {p0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    move-result v1

    const/16 v2, 0xd

    if-ne v1, v2, :cond_2

    invoke-virtual {p0, v4, v5}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_2

    .line 147
    invoke-virtual {p0, v4, v5}, Lcom/tencent/cloud/ai/network/okio/e;->i(J)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 148
    :cond_2
    new-instance v1, Lcom/tencent/cloud/ai/network/okio/e;

    invoke-direct {v1}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    const-wide/16 v2, 0x20

    .line 149
    iget-wide v4, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 150
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    const-wide/16 v2, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)Lcom/tencent/cloud/ai/network/okio/e;

    .line 151
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 152
    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    .line 153
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/e;->m()Lcom/tencent/cloud/ai/network/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Ll/xg3;->a(JLjava/lang/Object;)V

    :goto_2
    const/4 v0, 0x0

    return-object v0

    .line 154
    :cond_3
    const-string v0, "limit < 0: "

    invoke-static {v0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    goto :goto_2
.end method

.method public clone()Ljava/lang/Object;
    .locals 5

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v1, v1, v3

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/s;->b()Lcom/tencent/cloud/ai/network/okio/s;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 22
    .line 23
    iput-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 24
    .line 25
    iput-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 30
    .line 31
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 32
    .line 33
    if-eq v1, v2, :cond_1

    .line 34
    .line 35
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/s;->b()Lcom/tencent/cloud/ai/network/okio/s;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v2, v3}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;)Lcom/tencent/cloud/ai/network/okio/s;

    .line 44
    .line 45
    .line 46
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 50
    .line 51
    iput-wide v1, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 52
    .line 53
    return-object v0
.end method

.method public close()V
    .locals 0

    return-void
.end method

.method public d(I)Lcom/tencent/cloud/ai/network/okio/s;
    .locals 2

    const/4 v0, 0x1

    if-lt p1, v0, :cond_3

    const/16 v0, 0x2000

    if-gt p1, v0, :cond_3

    .line 55
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    if-nez v1, :cond_0

    .line 56
    invoke-static {}, Lcom/tencent/cloud/ai/network/okio/t;->a()Lcom/tencent/cloud/ai/network/okio/s;

    move-result-object p1

    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 57
    iput-object p1, p1, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    iput-object p1, p1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    return-object p1

    .line 58
    :cond_0
    iget-object p0, v1, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 59
    iget v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    add-int/2addr v1, p1

    if-gt v1, v0, :cond_2

    iget-boolean p1, p0, Lcom/tencent/cloud/ai/network/okio/s;->e:Z

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    return-object p0

    .line 60
    :cond_2
    :goto_0
    invoke-static {}, Lcom/tencent/cloud/ai/network/okio/t;->a()Lcom/tencent/cloud/ai/network/okio/s;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;)Lcom/tencent/cloud/ai/network/okio/s;

    move-result-object p0

    return-object p0

    .line 61
    :cond_3
    invoke-static {}, Ll/fig0;->a()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public d()Ljava/io/InputStream;
    .locals 1

    .line 54
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/e$a;

    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/e$a;-><init>(Lcom/tencent/cloud/ai/network/okio/e;)V

    return-object v0
.end method

.method public d(J)V
    .locals 5

    .line 1
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 12
    .line 13
    iget v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 14
    .line 15
    sub-int/2addr v1, v0

    .line 16
    int-to-long v0, v1

    .line 17
    invoke-static {p1, p2, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    long-to-int v0, v0

    .line 22
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 23
    .line 24
    int-to-long v3, v0

    .line 25
    sub-long/2addr v1, v3

    .line 26
    iput-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 27
    .line 28
    sub-long/2addr p1, v3

    .line 29
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 30
    .line 31
    iget v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 32
    .line 33
    add-int/2addr v2, v0

    .line 34
    iput v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 35
    .line 36
    iget v0, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 37
    .line 38
    if-ne v2, v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 45
    .line 46
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    invoke-static {}, Ll/vg3;->a()V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public e(I)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 7
    .line 8
    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 9
    .line 10
    add-int/lit8 v3, v2, 0x1

    .line 11
    .line 12
    iput v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 13
    .line 14
    int-to-byte p1, p1

    .line 15
    aput-byte p1, v1, v2

    .line 16
    .line 17
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 18
    .line 19
    const-wide/16 v2, 0x1

    .line 20
    .line 21
    add-long/2addr v0, v2

    .line 22
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 23
    .line 24
    return-object p0
.end method

.method public bridge synthetic e(J)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 26
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/e;->j(J)Lcom/tencent/cloud/ai/network/okio/e;

    move-result-object p0

    return-object p0
.end method

.method public e()Ljava/lang/String;
    .locals 2

    const-wide v0, 0x7fffffffffffffffL

    .line 25
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->c(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 13

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    check-cast p1, Lcom/tencent/cloud/ai/network/okio/e;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    return v2

    .line 22
    :cond_2
    const-wide/16 v5, 0x0

    .line 23
    .line 24
    cmp-long v1, v3, v5

    .line 25
    .line 26
    if-nez v1, :cond_3

    .line 27
    .line 28
    return v0

    .line 29
    :cond_3
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 32
    .line 33
    iget v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 34
    .line 35
    iget v4, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 36
    .line 37
    :goto_0
    iget-wide v7, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 38
    .line 39
    cmp-long v7, v5, v7

    .line 40
    .line 41
    if-gez v7, :cond_8

    .line 42
    .line 43
    iget v7, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 44
    .line 45
    sub-int/2addr v7, v3

    .line 46
    iget v8, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 47
    .line 48
    sub-int/2addr v8, v4

    .line 49
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    .line 50
    .line 51
    .line 52
    move-result v7

    .line 53
    int-to-long v7, v7

    .line 54
    move v9, v2

    .line 55
    :goto_1
    int-to-long v10, v9

    .line 56
    cmp-long v10, v10, v7

    .line 57
    .line 58
    if-gez v10, :cond_5

    .line 59
    .line 60
    iget-object v10, v1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 61
    .line 62
    add-int/lit8 v11, v3, 0x1

    .line 63
    .line 64
    aget-byte v3, v10, v3

    .line 65
    .line 66
    iget-object v10, p1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 67
    .line 68
    add-int/lit8 v12, v4, 0x1

    .line 69
    .line 70
    aget-byte v4, v10, v4

    .line 71
    .line 72
    if-eq v3, v4, :cond_4

    .line 73
    .line 74
    return v2

    .line 75
    :cond_4
    add-int/lit8 v9, v9, 0x1

    .line 76
    .line 77
    move v3, v11

    .line 78
    move v4, v12

    .line 79
    goto :goto_1

    .line 80
    :cond_5
    iget v9, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 81
    .line 82
    if-ne v3, v9, :cond_6

    .line 83
    .line 84
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 85
    .line 86
    iget v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 87
    .line 88
    :cond_6
    iget v9, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 89
    .line 90
    if-ne v4, v9, :cond_7

    .line 91
    .line 92
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 93
    .line 94
    iget v4, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 95
    .line 96
    :cond_7
    add-long/2addr v5, v7

    .line 97
    goto :goto_0

    .line 98
    :cond_8
    return v0
.end method

.method public f(I)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 7

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 7
    .line 8
    iget v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x18

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    add-int/lit8 v5, v3, 0x2

    .line 20
    .line 21
    ushr-int/lit8 v6, p1, 0x10

    .line 22
    .line 23
    and-int/lit16 v6, v6, 0xff

    .line 24
    .line 25
    int-to-byte v6, v6

    .line 26
    aput-byte v6, v2, v4

    .line 27
    .line 28
    add-int/lit8 v4, v3, 0x3

    .line 29
    .line 30
    ushr-int/lit8 v6, p1, 0x8

    .line 31
    .line 32
    and-int/lit16 v6, v6, 0xff

    .line 33
    .line 34
    int-to-byte v6, v6

    .line 35
    aput-byte v6, v2, v5

    .line 36
    .line 37
    add-int/2addr v3, v0

    .line 38
    and-int/lit16 p1, p1, 0xff

    .line 39
    .line 40
    int-to-byte p1, p1

    .line 41
    aput-byte p1, v2, v4

    .line 42
    .line 43
    iput v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 44
    .line 45
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 46
    .line 47
    const-wide/16 v2, 0x4

    .line 48
    .line 49
    add-long/2addr v0, v2

    .line 50
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 51
    .line 52
    return-object p0
.end method

.method public f()Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 54
    return-object p0
.end method

.method public f(J)V
    .locals 2

    .line 53
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    cmp-long p0, v0, p1

    if-ltz p0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    return-void
.end method

.method public flush()V
    .locals 0

    return-void
.end method

.method public g(I)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 7
    .line 8
    iget v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 9
    .line 10
    add-int/lit8 v4, v3, 0x1

    .line 11
    .line 12
    ushr-int/lit8 v5, p1, 0x8

    .line 13
    .line 14
    and-int/lit16 v5, v5, 0xff

    .line 15
    .line 16
    int-to-byte v5, v5

    .line 17
    aput-byte v5, v2, v3

    .line 18
    .line 19
    add-int/2addr v3, v0

    .line 20
    and-int/lit16 p1, p1, 0xff

    .line 21
    .line 22
    int-to-byte p1, p1

    .line 23
    aput-byte p1, v2, v4

    .line 24
    .line 25
    iput v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 26
    .line 27
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 28
    .line 29
    const-wide/16 v2, 0x2

    .line 30
    .line 31
    add-long/2addr v0, v2

    .line 32
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 33
    .line 34
    return-object p0
.end method

.method public g()Z
    .locals 4

    .line 39
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public g(J)[B
    .locals 6

    .line 35
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    const-wide/16 v2, 0x0

    move-wide v4, p1

    invoke-static/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    const-wide/32 p1, 0x7fffffff

    cmp-long p1, v4, p1

    if-gtz p1, :cond_0

    long-to-int p1, v4

    .line 36
    new-array p1, p1, [B

    .line 37
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->readFully([B)V

    return-object p1

    .line 38
    :cond_0
    const-string p0, "byteCount > Integer.MAX_VALUE: "

    invoke-static {p0, v4, v5}, Ll/fcg0;->a(Ljava/lang/String;J)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public h(J)B
    .locals 6

    .line 111
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    const-wide/16 v4, 0x1

    move-wide v2, p1

    invoke-static/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 112
    iget-wide p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    sub-long v0, p1, v2

    cmp-long v0, v0, v2

    .line 113
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    if-lez v0, :cond_1

    move-wide p1, v2

    .line 114
    :goto_0
    iget v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v0, v1

    int-to-long v2, v0

    cmp-long v0, p1, v2

    if-gez v0, :cond_0

    .line 115
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    long-to-int p1, p1

    add-int/2addr v1, p1

    aget-byte p0, p0, v1

    return p0

    :cond_0
    sub-long/2addr p1, v2

    .line 116
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    goto :goto_0

    :cond_1
    sub-long p1, v2, p1

    .line 117
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 118
    :goto_1
    iget v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v0, v1

    int-to-long v2, v0

    add-long/2addr p1, v2

    const-wide/16 v2, 0x0

    cmp-long v0, p1, v2

    if-ltz v0, :cond_2

    .line 119
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    long-to-int p1, p1

    add-int/2addr v1, p1

    aget-byte p0, p0, v1

    return p0

    .line 120
    :cond_2
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    goto :goto_1
.end method

.method public h(I)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 3

    .line 1
    const/16 v0, 0x80

    .line 2
    .line 3
    if-ge p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 6
    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/16 v1, 0x800

    .line 10
    .line 11
    const/16 v2, 0x3f

    .line 12
    .line 13
    if-ge p1, v1, :cond_1

    .line 14
    .line 15
    shr-int/lit8 v1, p1, 0x6

    .line 16
    .line 17
    or-int/lit16 v1, v1, 0xc0

    .line 18
    .line 19
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 20
    .line 21
    .line 22
    and-int/2addr p1, v2

    .line 23
    or-int/2addr p1, v0

    .line 24
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    const/high16 v1, 0x10000

    .line 29
    .line 30
    if-ge p1, v1, :cond_3

    .line 31
    .line 32
    const v1, 0xd800

    .line 33
    .line 34
    .line 35
    if-lt p1, v1, :cond_2

    .line 36
    .line 37
    const v1, 0xdfff

    .line 38
    .line 39
    .line 40
    if-gt p1, v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 43
    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    shr-int/lit8 v1, p1, 0xc

    .line 47
    .line 48
    or-int/lit16 v1, v1, 0xe0

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 51
    .line 52
    .line 53
    shr-int/lit8 v1, p1, 0x6

    .line 54
    .line 55
    and-int/2addr v1, v2

    .line 56
    or-int/2addr v1, v0

    .line 57
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 58
    .line 59
    .line 60
    and-int/2addr p1, v2

    .line 61
    or-int/2addr p1, v0

    .line 62
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_3
    const v1, 0x10ffff

    .line 67
    .line 68
    .line 69
    if-gt p1, v1, :cond_4

    .line 70
    .line 71
    shr-int/lit8 v1, p1, 0x12

    .line 72
    .line 73
    or-int/lit16 v1, v1, 0xf0

    .line 74
    .line 75
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 76
    .line 77
    .line 78
    shr-int/lit8 v1, p1, 0xc

    .line 79
    .line 80
    and-int/2addr v1, v2

    .line 81
    or-int/2addr v1, v0

    .line 82
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 83
    .line 84
    .line 85
    shr-int/lit8 v1, p1, 0x6

    .line 86
    .line 87
    and-int/2addr v1, v2

    .line 88
    or-int/2addr v1, v0

    .line 89
    invoke-virtual {p0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 90
    .line 91
    .line 92
    and-int/2addr p1, v2

    .line 93
    or-int/2addr p1, v0

    .line 94
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 95
    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_4
    const-string p0, "Unexpected code point: "

    .line 99
    .line 100
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {p0, p1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 105
    .line 106
    .line 107
    const/4 p0, 0x0

    .line 108
    return-object p0
.end method

.method public h()[B
    .locals 2

    .line 109
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->g(J)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 110
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v1, 0x1

    .line 8
    :cond_1
    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 9
    .line 10
    iget v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 11
    .line 12
    :goto_0
    if-ge v2, v3, :cond_2

    .line 13
    .line 14
    mul-int/lit8 v1, v1, 0x1f

    .line 15
    .line 16
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 17
    .line 18
    aget-byte v4, v4, v2

    .line 19
    .line 20
    add-int/2addr v1, v4

    .line 21
    add-int/lit8 v2, v2, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 27
    .line 28
    if-ne v0, v2, :cond_1

    .line 29
    .line 30
    return v1
.end method

.method public i()Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 41
    return-object p0
.end method

.method public i(J)Ljava/lang/String;
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    const-wide/16 v1, 0x1

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    sub-long v3, p1, v1

    .line 10
    .line 11
    invoke-virtual {p0, v3, v4}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v5, 0xd

    .line 16
    .line 17
    if-ne v0, v5, :cond_0

    .line 18
    .line 19
    sget-object p1, Lcom/tencent/cloud/ai/network/okio/y;->a:Ljava/nio/charset/Charset;

    .line 20
    .line 21
    invoke-virtual {p0, v3, v4, p1}, Lcom/tencent/cloud/ai/network/okio/e;->a(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-wide/16 v0, 0x2

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->d(J)V

    .line 28
    .line 29
    .line 30
    return-object p1

    .line 31
    :cond_0
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/y;->a:Ljava/nio/charset/Charset;

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2, v0}, Lcom/tencent/cloud/ai/network/okio/e;->a(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/e;->d(J)V

    .line 38
    .line 39
    .line 40
    return-object p1
.end method

.method public isOpen()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public j(J)Lcom/tencent/cloud/ai/network/okio/e;
    .locals 9

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x30

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/e;->e(I)Lcom/tencent/cloud/ai/network/okio/e;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Long;->highestOneBit(J)J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x4

    .line 23
    div-int/2addr v0, v1

    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 31
    .line 32
    iget v4, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 33
    .line 34
    add-int v5, v4, v0

    .line 35
    .line 36
    add-int/lit8 v5, v5, -0x1

    .line 37
    .line 38
    :goto_0
    if-lt v5, v4, :cond_1

    .line 39
    .line 40
    sget-object v6, Lcom/tencent/cloud/ai/network/okio/e;->c:[B

    .line 41
    .line 42
    const-wide/16 v7, 0xf

    .line 43
    .line 44
    and-long/2addr v7, p1

    .line 45
    long-to-int v7, v7

    .line 46
    aget-byte v6, v6, v7

    .line 47
    .line 48
    aput-byte v6, v3, v5

    .line 49
    .line 50
    ushr-long/2addr p1, v1

    .line 51
    add-int/lit8 v5, v5, -0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget p1, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 55
    .line 56
    add-int/2addr p1, v0

    .line 57
    iput p1, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 58
    .line 59
    iget-wide p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 60
    .line 61
    int-to-long v0, v0

    .line 62
    add-long/2addr p1, v0

    .line 63
    iput-wide p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 64
    .line 65
    return-object p0
.end method

.method public j()S
    .locals 0

    .line 66
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readShort()S

    move-result p0

    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/y;->a(S)S

    move-result p0

    return p0
.end method

.method public k()V
    .locals 2

    .line 1
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->d(J)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l()J
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    return-wide v2

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 13
    .line 14
    iget v2, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 15
    .line 16
    const/16 v3, 0x2000

    .line 17
    .line 18
    if-ge v2, v3, :cond_1

    .line 19
    .line 20
    iget-boolean v3, p0, Lcom/tencent/cloud/ai/network/okio/s;->e:Z

    .line 21
    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    iget p0, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 25
    .line 26
    sub-int/2addr v2, p0

    .line 27
    int-to-long v2, v2

    .line 28
    sub-long/2addr v0, v2

    .line 29
    :cond_1
    return-wide v0
.end method

.method public m()Lcom/tencent/cloud/ai/network/okio/ByteString;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->h()[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;-><init>([B)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public n()Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    sget-object v2, Lcom/tencent/cloud/ai/network/okio/y;->a:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/e;->a(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public read(Ljava/nio/ByteBuffer;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, -0x1

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 12
    .line 13
    iget v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 14
    .line 15
    sub-int/2addr v2, v3

    .line 16
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 21
    .line 22
    iget v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 23
    .line 24
    invoke-virtual {p1, v2, v3, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 25
    .line 26
    .line 27
    iget p1, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 28
    .line 29
    add-int/2addr p1, v1

    .line 30
    iput p1, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 31
    .line 32
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 33
    .line 34
    int-to-long v4, v1

    .line 35
    sub-long/2addr v2, v4

    .line 36
    iput-wide v2, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 37
    .line 38
    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 39
    .line 40
    if-ne p1, v2, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 47
    .line 48
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return v1
.end method

.method public readByte()B
    .locals 9

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_1

    .line 8
    .line 9
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 10
    .line 11
    iget v3, v2, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 12
    .line 13
    iget v4, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 14
    .line 15
    iget-object v5, v2, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 16
    .line 17
    add-int/lit8 v6, v3, 0x1

    .line 18
    .line 19
    aget-byte v3, v5, v3

    .line 20
    .line 21
    const-wide/16 v7, 0x1

    .line 22
    .line 23
    sub-long/2addr v0, v7

    .line 24
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 25
    .line 26
    if-ne v6, v4, :cond_0

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 33
    .line 34
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    .line 35
    .line 36
    .line 37
    return v3

    .line 38
    :cond_0
    iput v6, v2, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 39
    .line 40
    return v3

    .line 41
    :cond_1
    const-string p0, "size == 0"

    .line 42
    .line 43
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const/4 p0, 0x0

    .line 47
    return p0
.end method

.method public readFully([B)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p1

    .line 3
    if-ge v0, v1, :cond_1

    .line 4
    .line 5
    array-length v1, p1

    .line 6
    sub-int/2addr v1, v0

    .line 7
    invoke-virtual {p0, p1, v0, v1}, Lcom/tencent/cloud/ai/network/okio/e;->a([BII)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, -0x1

    .line 12
    if-eq v1, v2, :cond_0

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public readInt()I
    .locals 12

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x4

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-ltz v4, :cond_2

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 10
    .line 11
    iget v5, v4, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 12
    .line 13
    iget v6, v4, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 14
    .line 15
    sub-int v7, v6, v5

    .line 16
    .line 17
    const/4 v8, 0x4

    .line 18
    if-ge v7, v8, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    and-int/lit16 v0, v0, 0xff

    .line 25
    .line 26
    shl-int/lit8 v0, v0, 0x18

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    and-int/lit16 v1, v1, 0xff

    .line 33
    .line 34
    shl-int/lit8 v1, v1, 0x10

    .line 35
    .line 36
    or-int/2addr v0, v1

    .line 37
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    and-int/lit16 v1, v1, 0xff

    .line 42
    .line 43
    shl-int/lit8 v1, v1, 0x8

    .line 44
    .line 45
    or-int/2addr v0, v1

    .line 46
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    and-int/lit16 p0, p0, 0xff

    .line 51
    .line 52
    or-int/2addr p0, v0

    .line 53
    return p0

    .line 54
    :cond_0
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 55
    .line 56
    add-int/lit8 v9, v5, 0x1

    .line 57
    .line 58
    aget-byte v10, v7, v5

    .line 59
    .line 60
    and-int/lit16 v10, v10, 0xff

    .line 61
    .line 62
    shl-int/lit8 v10, v10, 0x18

    .line 63
    .line 64
    add-int/lit8 v11, v5, 0x2

    .line 65
    .line 66
    aget-byte v9, v7, v9

    .line 67
    .line 68
    and-int/lit16 v9, v9, 0xff

    .line 69
    .line 70
    shl-int/lit8 v9, v9, 0x10

    .line 71
    .line 72
    or-int/2addr v9, v10

    .line 73
    add-int/lit8 v10, v5, 0x3

    .line 74
    .line 75
    aget-byte v11, v7, v11

    .line 76
    .line 77
    and-int/lit16 v11, v11, 0xff

    .line 78
    .line 79
    shl-int/lit8 v11, v11, 0x8

    .line 80
    .line 81
    or-int/2addr v9, v11

    .line 82
    add-int/2addr v5, v8

    .line 83
    aget-byte v7, v7, v10

    .line 84
    .line 85
    and-int/lit16 v7, v7, 0xff

    .line 86
    .line 87
    or-int/2addr v7, v9

    .line 88
    sub-long/2addr v0, v2

    .line 89
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 90
    .line 91
    if-ne v5, v6, :cond_1

    .line 92
    .line 93
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 98
    .line 99
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    .line 100
    .line 101
    .line 102
    return v7

    .line 103
    :cond_1
    iput v5, v4, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 104
    .line 105
    return v7

    .line 106
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 107
    .line 108
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 109
    .line 110
    new-instance p0, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    const-string v3, "size < 4: "

    .line 113
    .line 114
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    throw v0
.end method

.method public readLong()J
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 4
    .line 5
    const-wide/16 v3, 0x8

    .line 6
    .line 7
    cmp-long v5, v1, v3

    .line 8
    .line 9
    if-ltz v5, :cond_2

    .line 10
    .line 11
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 12
    .line 13
    iget v6, v5, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 14
    .line 15
    iget v7, v5, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 16
    .line 17
    sub-int v8, v7, v6

    .line 18
    .line 19
    const/16 v9, 0x20

    .line 20
    .line 21
    const/16 v10, 0x8

    .line 22
    .line 23
    if-ge v8, v10, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->readInt()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    int-to-long v1, v1

    .line 30
    const-wide v3, 0xffffffffL

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    and-long/2addr v1, v3

    .line 36
    shl-long/2addr v1, v9

    .line 37
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->readInt()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-long v5, v0

    .line 42
    and-long/2addr v3, v5

    .line 43
    or-long v0, v1, v3

    .line 44
    .line 45
    return-wide v0

    .line 46
    :cond_0
    iget-object v8, v5, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 47
    .line 48
    add-int/lit8 v11, v6, 0x1

    .line 49
    .line 50
    aget-byte v12, v8, v6

    .line 51
    .line 52
    int-to-long v12, v12

    .line 53
    const-wide/16 v14, 0xff

    .line 54
    .line 55
    and-long/2addr v12, v14

    .line 56
    const/16 v16, 0x38

    .line 57
    .line 58
    shl-long v12, v12, v16

    .line 59
    .line 60
    add-int/lit8 v16, v6, 0x2

    .line 61
    .line 62
    aget-byte v11, v8, v11

    .line 63
    .line 64
    move-wide/from16 v17, v3

    .line 65
    .line 66
    int-to-long v3, v11

    .line 67
    and-long/2addr v3, v14

    .line 68
    const/16 v11, 0x30

    .line 69
    .line 70
    shl-long/2addr v3, v11

    .line 71
    or-long/2addr v3, v12

    .line 72
    add-int/lit8 v11, v6, 0x3

    .line 73
    .line 74
    aget-byte v12, v8, v16

    .line 75
    .line 76
    int-to-long v12, v12

    .line 77
    and-long/2addr v12, v14

    .line 78
    const/16 v16, 0x28

    .line 79
    .line 80
    shl-long v12, v12, v16

    .line 81
    .line 82
    or-long/2addr v3, v12

    .line 83
    add-int/lit8 v12, v6, 0x4

    .line 84
    .line 85
    aget-byte v11, v8, v11

    .line 86
    .line 87
    move/from16 v16, v9

    .line 88
    .line 89
    move v13, v10

    .line 90
    int-to-long v9, v11

    .line 91
    and-long/2addr v9, v14

    .line 92
    shl-long v9, v9, v16

    .line 93
    .line 94
    or-long/2addr v3, v9

    .line 95
    add-int/lit8 v9, v6, 0x5

    .line 96
    .line 97
    aget-byte v10, v8, v12

    .line 98
    .line 99
    int-to-long v10, v10

    .line 100
    and-long/2addr v10, v14

    .line 101
    const/16 v12, 0x18

    .line 102
    .line 103
    shl-long/2addr v10, v12

    .line 104
    or-long/2addr v3, v10

    .line 105
    add-int/lit8 v10, v6, 0x6

    .line 106
    .line 107
    aget-byte v9, v8, v9

    .line 108
    .line 109
    int-to-long v11, v9

    .line 110
    and-long/2addr v11, v14

    .line 111
    const/16 v9, 0x10

    .line 112
    .line 113
    shl-long/2addr v11, v9

    .line 114
    or-long/2addr v3, v11

    .line 115
    add-int/lit8 v9, v6, 0x7

    .line 116
    .line 117
    aget-byte v10, v8, v10

    .line 118
    .line 119
    int-to-long v10, v10

    .line 120
    and-long/2addr v10, v14

    .line 121
    shl-long/2addr v10, v13

    .line 122
    or-long/2addr v3, v10

    .line 123
    add-int/2addr v6, v13

    .line 124
    aget-byte v8, v8, v9

    .line 125
    .line 126
    int-to-long v8, v8

    .line 127
    and-long/2addr v8, v14

    .line 128
    or-long/2addr v3, v8

    .line 129
    sub-long v1, v1, v17

    .line 130
    .line 131
    iput-wide v1, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 132
    .line 133
    if-ne v6, v7, :cond_1

    .line 134
    .line 135
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 140
    .line 141
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    .line 142
    .line 143
    .line 144
    return-wide v3

    .line 145
    :cond_1
    iput v6, v5, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 146
    .line 147
    return-wide v3

    .line 148
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 149
    .line 150
    iget-wide v2, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 151
    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    const-string v4, "size < 8: "

    .line 155
    .line 156
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    throw v1
.end method

.method public readShort()S
    .locals 11

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x2

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-ltz v4, :cond_2

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 10
    .line 11
    iget v5, v4, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 12
    .line 13
    iget v6, v4, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 14
    .line 15
    sub-int v7, v6, v5

    .line 16
    .line 17
    const/4 v8, 0x2

    .line 18
    if-ge v7, v8, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    and-int/lit16 v0, v0, 0xff

    .line 25
    .line 26
    shl-int/lit8 v0, v0, 0x8

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/e;->readByte()B

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    and-int/lit16 p0, p0, 0xff

    .line 33
    .line 34
    or-int/2addr p0, v0

    .line 35
    int-to-short p0, p0

    .line 36
    return p0

    .line 37
    :cond_0
    iget-object v7, v4, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 38
    .line 39
    add-int/lit8 v9, v5, 0x1

    .line 40
    .line 41
    aget-byte v10, v7, v5

    .line 42
    .line 43
    and-int/lit16 v10, v10, 0xff

    .line 44
    .line 45
    shl-int/lit8 v10, v10, 0x8

    .line 46
    .line 47
    add-int/2addr v5, v8

    .line 48
    aget-byte v7, v7, v9

    .line 49
    .line 50
    and-int/lit16 v7, v7, 0xff

    .line 51
    .line 52
    or-int/2addr v7, v10

    .line 53
    sub-long/2addr v0, v2

    .line 54
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 55
    .line 56
    if-ne v5, v6, :cond_1

    .line 57
    .line 58
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 63
    .line 64
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    iput v5, v4, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 69
    .line 70
    :goto_0
    int-to-short p0, v7

    .line 71
    return p0

    .line 72
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 73
    .line 74
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 75
    .line 76
    new-instance p0, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v3, "size < 2: "

    .line 79
    .line 80
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw v0
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    sget-object p0, Lcom/tencent/cloud/ai/network/okio/x;->d:Lcom/tencent/cloud/ai/network/okio/x;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 2
    .line 3
    const-wide/32 v2, 0x7fffffff

    .line 4
    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-gtz v2, :cond_1

    .line 9
    .line 10
    long-to-int v0, v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lcom/tencent/cloud/ai/network/okio/ByteString;->EMPTY:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v1, Lcom/tencent/cloud/ai/network/okio/u;

    .line 17
    .line 18
    invoke-direct {v1, p0, v0}, Lcom/tencent/cloud/ai/network/okio/u;-><init>(Lcom/tencent/cloud/ai/network/okio/e;I)V

    .line 19
    .line 20
    .line 21
    move-object p0, v1

    .line 22
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const-string v0, "size > Integer.MAX_VALUE: "

    .line 28
    .line 29
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 30
    .line 31
    invoke-static {v0, v1, v2}, Ll/mlk0;->a(Ljava/lang/String;J)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0
.end method

.method public write(Ljava/nio/ByteBuffer;)I
    .locals 6

    if-eqz p1, :cond_1

    .line 236
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v0

    move v1, v0

    :goto_0
    if-lez v1, :cond_0

    const/4 v2, 0x1

    .line 237
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okio/e;->d(I)Lcom/tencent/cloud/ai/network/okio/s;

    move-result-object v2

    .line 238
    iget v3, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    rsub-int v3, v3, 0x2000

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 239
    iget-object v4, v2, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    iget v5, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    invoke-virtual {p1, v4, v5, v3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    sub-int/2addr v1, v3

    .line 240
    iget v4, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    add-int/2addr v4, v3

    iput v4, v2, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    goto :goto_0

    .line 241
    :cond_0
    iget-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    return v0

    .line 242
    :cond_1
    const-string p0, "source == null"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 8

    .line 1
    if-eqz p1, :cond_d

    .line 2
    .line 3
    if-eq p1, p0, :cond_c

    .line 4
    .line 5
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 6
    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    move-wide v4, p2

    .line 10
    invoke-static/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/y;->a(JJJ)V

    .line 11
    .line 12
    .line 13
    :goto_0
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    cmp-long v0, p2, v0

    .line 16
    .line 17
    if-lez v0, :cond_b

    .line 18
    .line 19
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 20
    .line 21
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 22
    .line 23
    iget v2, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 24
    .line 25
    sub-int/2addr v1, v2

    .line 26
    int-to-long v1, v1

    .line 27
    cmp-long v1, p2, v1

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    if-gez v1, :cond_5

    .line 31
    .line 32
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    const/4 v1, 0x0

    .line 40
    :goto_1
    if-eqz v1, :cond_2

    .line 41
    .line 42
    iget-boolean v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->e:Z

    .line 43
    .line 44
    if-eqz v3, :cond_2

    .line 45
    .line 46
    iget v3, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 47
    .line 48
    int-to-long v3, v3

    .line 49
    add-long/2addr v3, p2

    .line 50
    iget-boolean v5, v1, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 51
    .line 52
    if-eqz v5, :cond_1

    .line 53
    .line 54
    move v5, v2

    .line 55
    goto :goto_2

    .line 56
    :cond_1
    iget v5, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 57
    .line 58
    :goto_2
    int-to-long v5, v5

    .line 59
    sub-long/2addr v3, v5

    .line 60
    const-wide/16 v5, 0x2000

    .line 61
    .line 62
    cmp-long v3, v3, v5

    .line 63
    .line 64
    if-gtz v3, :cond_2

    .line 65
    .line 66
    long-to-int v2, p2

    .line 67
    invoke-virtual {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;I)V

    .line 68
    .line 69
    .line 70
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 71
    .line 72
    sub-long/2addr v0, p2

    .line 73
    iput-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 74
    .line 75
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 76
    .line 77
    add-long/2addr v0, p2

    .line 78
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    long-to-int v1, p2

    .line 82
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    if-lez v1, :cond_4

    .line 86
    .line 87
    iget v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 88
    .line 89
    iget v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 90
    .line 91
    sub-int/2addr v3, v4

    .line 92
    if-gt v1, v3, :cond_4

    .line 93
    .line 94
    const/16 v3, 0x400

    .line 95
    .line 96
    if-lt v1, v3, :cond_3

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/s;->b()Lcom/tencent/cloud/ai/network/okio/s;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    goto :goto_3

    .line 103
    :cond_3
    invoke-static {}, Lcom/tencent/cloud/ai/network/okio/t;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 108
    .line 109
    iget v5, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 110
    .line 111
    iget-object v6, v3, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    .line 112
    .line 113
    invoke-static {v4, v5, v6, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 114
    .line 115
    .line 116
    :goto_3
    iget v4, v3, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 117
    .line 118
    add-int/2addr v4, v1

    .line 119
    iput v4, v3, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 120
    .line 121
    iget v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 122
    .line 123
    add-int/2addr v4, v1

    .line 124
    iput v4, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 125
    .line 126
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 127
    .line 128
    invoke-virtual {v0, v3}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;)Lcom/tencent/cloud/ai/network/okio/s;

    .line 129
    .line 130
    .line 131
    iput-object v3, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 132
    .line 133
    goto :goto_4

    .line 134
    :cond_4
    invoke-static {}, Ll/fig0;->a()V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_5
    :goto_4
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 139
    .line 140
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 141
    .line 142
    iget v3, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 143
    .line 144
    sub-int/2addr v1, v3

    .line 145
    int-to-long v3, v1

    .line 146
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iput-object v1, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 151
    .line 152
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 153
    .line 154
    if-nez v1, :cond_6

    .line 155
    .line 156
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 157
    .line 158
    iput-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 159
    .line 160
    iput-object v0, v0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 161
    .line 162
    goto :goto_6

    .line 163
    :cond_6
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 164
    .line 165
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;)Lcom/tencent/cloud/ai/network/okio/s;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 170
    .line 171
    if-eq v1, v0, :cond_a

    .line 172
    .line 173
    iget-boolean v5, v1, Lcom/tencent/cloud/ai/network/okio/s;->e:Z

    .line 174
    .line 175
    if-nez v5, :cond_7

    .line 176
    .line 177
    goto :goto_6

    .line 178
    :cond_7
    iget v5, v0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 179
    .line 180
    iget v6, v0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 181
    .line 182
    sub-int/2addr v5, v6

    .line 183
    iget v6, v1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 184
    .line 185
    rsub-int v6, v6, 0x2000

    .line 186
    .line 187
    iget-boolean v7, v1, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 188
    .line 189
    if-eqz v7, :cond_8

    .line 190
    .line 191
    goto :goto_5

    .line 192
    :cond_8
    iget v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 193
    .line 194
    :goto_5
    add-int/2addr v6, v2

    .line 195
    if-le v5, v6, :cond_9

    .line 196
    .line 197
    goto :goto_6

    .line 198
    :cond_9
    invoke-virtual {v0, v1, v5}, Lcom/tencent/cloud/ai/network/okio/s;->a(Lcom/tencent/cloud/ai/network/okio/s;I)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/s;->a()Lcom/tencent/cloud/ai/network/okio/s;

    .line 202
    .line 203
    .line 204
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okio/t;->a(Lcom/tencent/cloud/ai/network/okio/s;)V

    .line 205
    .line 206
    .line 207
    :goto_6
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 208
    .line 209
    sub-long/2addr v0, v3

    .line 210
    iput-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 211
    .line 212
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 213
    .line 214
    add-long/2addr v0, v3

    .line 215
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 216
    .line 217
    sub-long/2addr p2, v3

    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_a
    invoke-static {}, Ll/wpg0;->a()V

    .line 221
    .line 222
    .line 223
    :cond_b
    return-void

    .line 224
    :cond_c
    const-string p0, "source == this"

    .line 225
    .line 226
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :cond_d
    const-string p0, "source == null"

    .line 231
    .line 232
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    return-void
.end method
