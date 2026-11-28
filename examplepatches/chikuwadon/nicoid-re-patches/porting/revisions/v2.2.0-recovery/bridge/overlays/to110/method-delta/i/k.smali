.class public final Li/k;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Li/x;


# instance fields
.field public a:B

.field public final b:Li/r;

.field public final c:Ljava/util/zip/Inflater;

.field public final d:Li/l;

.field public final e:Ljava/util/zip/CRC32;


# virtual methods
.method public read(Li/d;J)J
    .registers 24

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-wide/from16 v8, p2

    if-eqz v7, :cond_17

    const-wide/16 v0, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x1

    cmp-long v2, v8, v0

    if-ltz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    if-eqz v2, :cond_16

    cmp-long v2, v8, v0

    if-nez v2, :cond_1

    return-wide v0

    :cond_1
    iget-byte v0, v6, Li/k;->a:B

    const-wide/16 v12, -0x1

    if-nez v0, :cond_11

    .line 1
    iget-object v0, v6, Li/k;->b:Li/r;

    const-wide/16 v1, 0xa

    invoke-virtual {v0, v1, v2}, Li/r;->e(J)V

    iget-object v0, v6, Li/k;->b:Li/r;

    iget-object v0, v0, Li/r;->a:Li/d;

    const-wide/16 v1, 0x3

    invoke-virtual {v0, v1, v2}, Li/d;->h(J)B

    move-result v14

    shr-int/lit8 v0, v14, 0x1

    and-int/2addr v0, v11

    if-ne v0, v11, :cond_2

    const/4 v0, 0x1

    const/4 v15, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    const/4 v15, 0x0

    :goto_1
    if-eqz v15, :cond_3

    iget-object v0, v6, Li/k;->b:Li/r;

    iget-object v1, v0, Li/r;->a:Li/d;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0xa

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Li/k;->a(Li/d;JJ)V

    :cond_3
    iget-object v0, v6, Li/k;->b:Li/r;

    invoke-virtual {v0}, Li/r;->readShort()S

    move-result v0

    const/16 v1, 0x1f8b

    const-string v2, "ID1ID2"

    invoke-virtual {v6, v2, v1, v0}, Li/k;->a(Ljava/lang/String;II)V

    iget-object v0, v6, Li/k;->b:Li/r;

    const-wide/16 v1, 0x8

    invoke-virtual {v0, v1, v2}, Li/r;->skip(J)V

    shr-int/lit8 v0, v14, 0x2

    and-int/2addr v0, v11

    if-ne v0, v11, :cond_4

    const/4 v0, 0x1

    goto :goto_2

    :cond_4
    const/4 v0, 0x0

    :goto_2
    const-wide/16 v1, 0x2

    if-eqz v0, :cond_7

    iget-object v0, v6, Li/k;->b:Li/r;

    invoke-virtual {v0, v1, v2}, Li/r;->e(J)V

    if-eqz v15, :cond_5

    iget-object v0, v6, Li/k;->b:Li/r;

    iget-object v1, v0, Li/r;->a:Li/d;

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x2

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Li/k;->a(Li/d;JJ)V

    :cond_5
    iget-object v0, v6, Li/k;->b:Li/r;

    iget-object v0, v0, Li/r;->a:Li/d;

    invoke-virtual {v0}, Li/d;->l()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    int-to-long v4, v0

    iget-object v0, v6, Li/k;->b:Li/r;

    invoke-virtual {v0, v4, v5}, Li/r;->e(J)V

    if-eqz v15, :cond_6

    iget-object v0, v6, Li/k;->b:Li/r;

    iget-object v1, v0, Li/r;->a:Li/d;

    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v16, v4

    invoke-virtual/range {v0 .. v5}, Li/k;->a(Li/d;JJ)V

    goto :goto_3

    :cond_6
    move-wide/from16 v16, v4

    :goto_3
    iget-object v0, v6, Li/k;->b:Li/r;

    move-wide/from16 v1, v16

    invoke-virtual {v0, v1, v2}, Li/r;->skip(J)V

    :cond_7
    shr-int/lit8 v0, v14, 0x3

    and-int/2addr v0, v11

    if-ne v0, v11, :cond_8

    const/4 v0, 0x1

    goto :goto_4

    :cond_8
    const/4 v0, 0x0

    :goto_4
    const-wide/16 v16, 0x1

    if-eqz v0, :cond_b

    iget-object v0, v6, Li/k;->b:Li/r;

    invoke-virtual {v0, v10}, Li/r;->a(B)J

    move-result-wide v18

    cmp-long v0, v18, v12

    if-eqz v0, :cond_a

    if-eqz v15, :cond_9

    iget-object v0, v6, Li/k;->b:Li/r;

    iget-object v1, v0, Li/r;->a:Li/d;

    const-wide/16 v2, 0x0

    add-long v4, v18, v16

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Li/k;->a(Li/d;JJ)V

    :cond_9
    iget-object v0, v6, Li/k;->b:Li/r;

    add-long v1, v18, v16

    invoke-virtual {v0, v1, v2}, Li/r;->skip(J)V

    goto :goto_5

    :cond_a
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_b
    :goto_5
    shr-int/lit8 v0, v14, 0x4

    and-int/2addr v0, v11

    if-ne v0, v11, :cond_c

    const/4 v0, 0x1

    goto :goto_6

    :cond_c
    const/4 v0, 0x0

    :goto_6
    if-eqz v0, :cond_f

    iget-object v0, v6, Li/k;->b:Li/r;

    invoke-virtual {v0, v10}, Li/r;->a(B)J

    move-result-wide v18

    cmp-long v0, v18, v12

    if-eqz v0, :cond_e

    if-eqz v15, :cond_d

    iget-object v0, v6, Li/k;->b:Li/r;

    iget-object v1, v0, Li/r;->a:Li/d;

    const-wide/16 v2, 0x0

    add-long v4, v18, v16

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Li/k;->a(Li/d;JJ)V

    :cond_d
    iget-object v0, v6, Li/k;->b:Li/r;

    add-long v1, v18, v16

    invoke-virtual {v0, v1, v2}, Li/r;->skip(J)V

    goto :goto_7

    :cond_e
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_f
    :goto_7
    if-eqz v15, :cond_10

    iget-object v0, v6, Li/k;->b:Li/r;

    const-wide/16 v1, 0x2

    .line 2
    invoke-virtual {v0, v1, v2}, Li/r;->e(J)V

    iget-object v0, v0, Li/r;->a:Li/d;

    invoke-virtual {v0}, Li/d;->l()S

    move-result v0

    .line 3
    iget-object v1, v6, Li/k;->e:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v2, v1

    int-to-short v1, v2

    const-string v2, "FHCRC"

    invoke-virtual {v6, v2, v0, v1}, Li/k;->a(Ljava/lang/String;II)V

    iget-object v0, v6, Li/k;->e:Ljava/util/zip/CRC32;

    invoke-virtual {v0}, Ljava/util/zip/CRC32;->reset()V

    .line 4
    :cond_10
    iput-byte v11, v6, Li/k;->a:B

    :cond_11
    iget-byte v0, v6, Li/k;->a:B

    const/4 v1, 0x2

    if-ne v0, v11, :cond_13

    .line 5
    iget-wide v2, v7, Li/d;->b:J

    .line 6
    iget-object v0, v6, Li/k;->d:Li/l;

    invoke-virtual {v0, v7, v8, v9}, Li/l;->read(Li/d;J)J

    move-result-wide v8

    cmp-long v0, v8, v12

    if-eqz v0, :cond_12

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-wide v4, v8

    invoke-virtual/range {v0 .. v5}, Li/k;->a(Li/d;JJ)V

    return-wide v8

    :cond_12
    iput-byte v1, v6, Li/k;->a:B

    :cond_13
    iget-byte v0, v6, Li/k;->a:B

    if-ne v0, v1, :cond_15

    .line 7
    iget-object v0, v6, Li/k;->b:Li/r;

    invoke-virtual {v0}, Li/r;->h()I

    move-result v0

    iget-object v1, v6, Li/k;->e:Ljava/util/zip/CRC32;

    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    move-result-wide v1

    long-to-int v2, v1

    const-string v1, "CRC"

    invoke-virtual {v6, v1, v0, v2}, Li/k;->a(Ljava/lang/String;II)V

    iget-object v0, v6, Li/k;->b:Li/r;

    invoke-virtual {v0}, Li/r;->h()I

    move-result v0

    iget-object v1, v6, Li/k;->c:Ljava/util/zip/Inflater;

    invoke-virtual {v1}, Ljava/util/zip/Inflater;->getBytesWritten()J

    move-result-wide v1

    long-to-int v2, v1

    const-string v1, "ISIZE"

    invoke-virtual {v6, v1, v0, v2}, Li/k;->a(Ljava/lang/String;II)V

    const/4 v0, 0x3

    .line 8
    iput-byte v0, v6, Li/k;->a:B

    iget-object v0, v6, Li/k;->b:Li/r;

    invoke-virtual {v0}, Li/r;->d()Z

    move-result v0

    if-eqz v0, :cond_14

    goto :goto_8

    :cond_14
    new-instance v0, Ljava/io/IOException;

    const-string v1, "gzip finished without exhausting source"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_15
    :goto_8
    return-wide v12

    :cond_16
    const-string v0, "byteCount < 0: "

    invoke-static {v0, v8, v9}, Le/b/a/a/a;->a(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_17
    const-string v0, "sink"

    .line 9
    invoke-static {v0}, Lg/k/c/h;->a(Ljava/lang/String;)V

    const/4 v0, 0x0

    throw v0
.end method
