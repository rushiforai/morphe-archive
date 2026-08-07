.class public final Ll/zug0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/azm;


# static fields
.field public static d:Z


# instance fields
.field public volatile a:Ljava/util/TreeSet;

.field public final b:Ll/cpg0;

.field public volatile c:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/TreeSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zug0;->a:Ljava/util/TreeSet;

    .line 10
    .line 11
    new-instance v0, Ll/cpg0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/cpg0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/zug0;->b:Ll/cpg0;

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput v0, p0, Ll/zug0;->c:I

    .line 20
    .line 21
    return-void
.end method

.method public static a(Lokio/Buffer;)Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v2, Lokio/Buffer;

    .line 3
    .line 4
    invoke-direct {v2}, Lokio/Buffer;-><init>()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lokio/Buffer;->size()J

    .line 8
    .line 9
    .line 10
    move-result-wide v3

    .line 11
    const-wide/16 v5, 0x40

    .line 12
    .line 13
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v5

    .line 17
    const-wide/16 v3, 0x0

    .line 18
    .line 19
    move-object v1, p0

    .line 20
    invoke-virtual/range {v1 .. v6}, Lokio/Buffer;->copyTo(Lokio/Buffer;JJ)Lokio/Buffer;

    .line 21
    .line 22
    .line 23
    move p0, v0

    .line 24
    :goto_0
    const/16 v1, 0x10

    .line 25
    .line 26
    if-ge p0, v1, :cond_2

    .line 27
    .line 28
    invoke-virtual {v2}, Lokio/Buffer;->exhausted()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {v2}, Lokio/Buffer;->readUtf8CodePoint()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {v1}, Ljava/lang/Character;->isISOControl(I)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-eqz v3, :cond_1

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(I)Z

    .line 46
    .line 47
    .line 48
    move-result v1
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    if-nez v1, :cond_1

    .line 50
    .line 51
    return v0

    .line 52
    :cond_1
    add-int/lit8 p0, p0, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    :goto_1
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :catch_0
    return v0
.end method


# virtual methods
.method public final intercept(Ll/azm$a;)Ll/i5d0;
    .locals 27

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    .line 1
    iget v2, v1, Ll/zug0;->c:I

    .line 2
    invoke-interface {v0}, Ll/azm$a;->request()Ll/x1d0;

    move-result-object v3

    const/4 v4, 0x1

    if-ne v2, v4, :cond_0

    .line 3
    invoke-interface {v0, v3}, Ll/azm$a;->a(Ll/x1d0;)Ll/i5d0;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v5, 0x4

    if-ne v2, v5, :cond_1

    move v5, v4

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    :goto_0
    if-nez v5, :cond_3

    const/4 v7, 0x3

    if-ne v2, v7, :cond_2

    goto :goto_1

    :cond_2
    const/4 v4, 0x0

    :cond_3
    :goto_1
    if-eqz v5, :cond_4

    .line 4
    const-string v2, "sud_log_level_key"

    invoke-virtual {v3, v2}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 5
    const-string v8, "sud_log_level_value_headers"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 6
    invoke-virtual {v3}, Ll/x1d0;->h()Ll/x1d0$a;

    move-result-object v3

    .line 7
    invoke-virtual {v3, v2}, Ll/x1d0$a;->n(Ljava/lang/String;)Ll/x1d0$a;

    .line 8
    invoke-virtual {v3}, Ll/x1d0$a;->b()Ll/x1d0;

    move-result-object v3

    const/4 v5, 0x0

    .line 9
    :cond_4
    invoke-virtual {v3}, Ll/x1d0;->a()Ll/z1d0;

    move-result-object v2

    .line 10
    invoke-interface {v0}, Ll/azm$a;->connection()Ll/bx5;

    move-result-object v7

    .line 11
    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "--> "

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ll/x1d0;->g()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 12
    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 13
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ll/x1d0;->k()Ll/rnl;

    move-result-object v8

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    if-eqz v7, :cond_5

    .line 14
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v7}, Ll/bx5;->a()Lokhttp3/Protocol;

    move-result-object v7

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    :cond_5
    const-string v7, "-byte body)"

    if-nez v4, :cond_6

    if-eqz v2, :cond_6

    .line 15
    const-string v10, " (requestBody.contentLength()"

    invoke-virtual {v8, v10}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 16
    invoke-virtual {v8, v7}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 17
    :cond_6
    iget-object v10, v1, Ll/zug0;->b:Ll/cpg0;

    invoke-virtual {v10, v8}, Ll/cpg0;->a(Ljava/lang/String;)V

    const-string v8, "-byte body omitted)"

    const-string v10, "identity"

    const-string v11, ": "

    const-string v12, "Content-Length"

    const-string v14, "gzip"

    const-string v15, "Content-Encoding"

    const-string v6, ""

    const-wide/16 v16, -0x1

    if-eqz v4, :cond_14

    .line 18
    invoke-virtual {v3}, Ll/x1d0;->e()Ll/e0l;

    move-result-object v13

    if-eqz v2, :cond_a

    .line 19
    invoke-virtual {v2}, Ll/z1d0;->contentType()Ll/e7y;

    move-result-object v18

    if-eqz v18, :cond_8

    move/from16 v18, v4

    .line 20
    const-string v4, "Content-Type"

    invoke-virtual {v13, v4}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_7

    .line 21
    iget-object v4, v1, Ll/zug0;->b:Ll/cpg0;

    move/from16 v19, v5

    new-instance v5, Ljava/lang/StringBuilder;

    move-object/from16 v20, v9

    const-string v9, "Content-Type: "

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ll/z1d0;->contentType()Ll/e7y;

    move-result-object v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ll/cpg0;->a(Ljava/lang/String;)V

    goto :goto_3

    :cond_7
    :goto_2
    move/from16 v19, v5

    move-object/from16 v20, v9

    goto :goto_3

    :cond_8
    move/from16 v18, v4

    goto :goto_2

    .line 22
    :goto_3
    invoke-virtual {v2}, Ll/z1d0;->contentLength()J

    move-result-wide v4

    cmp-long v4, v4, v16

    if-eqz v4, :cond_9

    .line 23
    invoke-virtual {v13, v12}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_9

    .line 24
    iget-object v4, v1, Ll/zug0;->b:Ll/cpg0;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v9, "Content-Length: "

    invoke-direct {v5, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v21, v8

    invoke-virtual {v2}, Ll/z1d0;->contentLength()J

    move-result-wide v8

    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ll/cpg0;->a(Ljava/lang/String;)V

    goto :goto_4

    :cond_9
    move-object/from16 v21, v8

    goto :goto_4

    :cond_a
    move/from16 v18, v4

    move/from16 v19, v5

    move-object/from16 v21, v8

    move-object/from16 v20, v9

    :goto_4
    const/4 v4, 0x0

    .line 25
    :goto_5
    invoke-virtual {v13}, Ll/e0l;->k()I

    move-result v5

    if-ge v4, v5, :cond_c

    .line 26
    iget-object v5, v1, Ll/zug0;->a:Ljava/util/TreeSet;

    invoke-virtual {v13, v4}, Ll/e0l;->f(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_b

    move-object/from16 v5, v20

    goto :goto_6

    .line 27
    :cond_b
    invoke-virtual {v13, v4}, Ll/e0l;->m(I)Ljava/lang/String;

    move-result-object v5

    .line 28
    :goto_6
    iget-object v8, v1, Ll/zug0;->b:Ll/cpg0;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v22, v12

    invoke-virtual {v13, v4}, Ll/e0l;->f(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ll/cpg0;->a(Ljava/lang/String;)V

    add-int/lit8 v4, v4, 0x1

    move-object/from16 v12, v22

    goto :goto_5

    :cond_c
    move-object/from16 v22, v12

    const-string v4, "--> END "

    if-eqz v19, :cond_d

    if-nez v2, :cond_e

    :cond_d
    move-object/from16 v2, v21

    goto/16 :goto_b

    .line 29
    :cond_e
    invoke-virtual {v3}, Ll/x1d0;->e()Ll/e0l;

    move-result-object v5

    .line 30
    invoke-virtual {v5, v15}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_f

    goto :goto_8

    .line 31
    :cond_f
    invoke-virtual {v5, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_10

    .line 32
    invoke-virtual {v5, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_10

    .line 33
    iget-object v2, v1, Ll/zug0;->b:Ll/cpg0;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ll/x1d0;->g()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " (encoded body omitted)"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ll/cpg0;->a(Ljava/lang/String;)V

    :goto_7
    move-object/from16 v2, v21

    goto/16 :goto_c

    .line 34
    :cond_10
    :goto_8
    new-instance v5, Lokio/Buffer;

    invoke-direct {v5}, Lokio/Buffer;-><init>()V

    .line 35
    invoke-virtual {v2, v5}, Ll/z1d0;->writeTo(Lokio/BufferedSink;)V

    .line 36
    invoke-virtual {v2}, Ll/z1d0;->contentType()Ll/e7y;

    move-result-object v8

    .line 37
    sget-object v9, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    if-eqz v8, :cond_11

    .line 38
    invoke-virtual {v8, v9}, Ll/e7y;->b(Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;

    move-result-object v8

    goto :goto_9

    :cond_11
    const/4 v8, 0x0

    :goto_9
    if-nez v8, :cond_12

    goto :goto_a

    :cond_12
    move-object v9, v8

    .line 39
    :goto_a
    iget-object v8, v1, Ll/zug0;->b:Ll/cpg0;

    invoke-virtual {v8, v6}, Ll/cpg0;->a(Ljava/lang/String;)V

    .line 40
    invoke-static {v5}, Ll/zug0;->a(Lokio/Buffer;)Z

    move-result v8

    .line 41
    iget-object v12, v1, Ll/zug0;->b:Ll/cpg0;

    if-eqz v8, :cond_13

    .line 42
    invoke-virtual {v5, v9}, Lokio/Buffer;->readString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12, v5}, Ll/cpg0;->a(Ljava/lang/String;)V

    .line 43
    iget-object v5, v1, Ll/zug0;->b:Ll/cpg0;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ll/x1d0;->g()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " ("

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ll/z1d0;->contentLength()J

    move-result-wide v12

    invoke-virtual {v8, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ll/cpg0;->a(Ljava/lang/String;)V

    goto :goto_7

    .line 44
    :cond_13
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ll/x1d0;->g()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " (binary "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ll/z1d0;->contentLength()J

    move-result-wide v8

    invoke-virtual {v5, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-object/from16 v2, v21

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v4}, Ll/cpg0;->a(Ljava/lang/String;)V

    goto :goto_c

    .line 45
    :goto_b
    iget-object v5, v1, Ll/zug0;->b:Ll/cpg0;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ll/x1d0;->g()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ll/cpg0;->a(Ljava/lang/String;)V

    goto :goto_c

    :cond_14
    move/from16 v18, v4

    move/from16 v19, v5

    move-object v2, v8

    move-object/from16 v20, v9

    move-object/from16 v22, v12

    .line 46
    :goto_c
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 47
    :try_start_0
    invoke-interface {v0, v3}, Ll/azm$a;->a(Ll/x1d0;)Ll/i5d0;

    move-result-object v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 48
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    sub-long/2addr v8, v4

    const-wide/32 v4, 0xf4240

    div-long/2addr v8, v4

    .line 49
    invoke-virtual {v3}, Ll/i5d0;->k()Ll/k5d0;

    move-result-object v4

    if-nez v4, :cond_15

    goto/16 :goto_1a

    .line 50
    :cond_15
    invoke-virtual {v4}, Ll/k5d0;->contentLength()J

    move-result-wide v12

    cmp-long v0, v12, v16

    if-eqz v0, :cond_16

    .line 51
    const-string v0, "$contentLength-byte"

    goto :goto_d

    :cond_16
    const-string v0, "unknown-length"

    .line 52
    :goto_d
    iget-object v5, v1, Ll/zug0;->b:Ll/cpg0;

    move-object/from16 p1, v4

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    .line 53
    invoke-virtual {v3}, Ll/i5d0;->q()I

    move-result v21

    move-wide/from16 v23, v8

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 54
    invoke-virtual {v3}, Ll/i5d0;->J()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_17

    move-object v9, v6

    move-wide/from16 v25, v12

    move-object/from16 v12, v20

    goto :goto_e

    :cond_17
    new-instance v9, Ljava/lang/StringBuilder;

    move-wide/from16 v25, v12

    move-object/from16 v12, v20

    invoke-direct {v9, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ll/i5d0;->J()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 55
    :goto_e
    invoke-virtual {v3}, Ll/i5d0;->Z()Ll/x1d0;

    move-result-object v13

    invoke-virtual {v13}, Ll/x1d0;->k()Ll/rnl;

    move-result-object v13

    move-object/from16 v20, v12

    .line 56
    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    if-nez v18, :cond_18

    move-object/from16 v21, v7

    .line 57
    new-instance v7, Ljava/lang/StringBuilder;

    move-object/from16 v23, v2

    const-string v2, ", "

    invoke-direct {v7, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " body"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_f

    :cond_18
    move-object/from16 v23, v2

    move-object/from16 v21, v7

    const-string v0, ")"

    :goto_f
    filled-new-array {v8, v9, v13, v12, v0}, [Ljava/lang/Object;

    move-result-object v0

    .line 58
    const-string v2, "<-- %s%s %s (%dms%s)"

    invoke-static {v4, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ll/cpg0;->a(Ljava/lang/String;)V

    if-eqz v18, :cond_28

    .line 59
    invoke-virtual {v3}, Ll/i5d0;->F()Ll/e0l;

    move-result-object v2

    const/4 v0, 0x0

    .line 60
    :goto_10
    invoke-virtual {v2}, Ll/e0l;->k()I

    move-result v4

    if-ge v0, v4, :cond_1a

    .line 61
    iget-object v4, v1, Ll/zug0;->a:Ljava/util/TreeSet;

    invoke-virtual {v2, v0}, Ll/e0l;->f(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/TreeSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    move-object/from16 v4, v20

    goto :goto_11

    .line 62
    :cond_19
    invoke-virtual {v2, v0}, Ll/e0l;->m(I)Ljava/lang/String;

    move-result-object v4

    .line 63
    :goto_11
    iget-object v5, v1, Ll/zug0;->b:Ll/cpg0;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ll/e0l;->f(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ll/cpg0;->a(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    :cond_1a
    if-eqz v19, :cond_27

    .line 64
    invoke-virtual {v3}, Ll/i5d0;->Z()Ll/x1d0;

    move-result-object v0

    invoke-virtual {v0}, Ll/x1d0;->g()Ljava/lang/String;

    move-result-object v0

    const-string v4, "HEAD"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    goto/16 :goto_19

    .line 65
    :cond_1b
    invoke-virtual {v3}, Ll/i5d0;->q()I

    move-result v0

    const/16 v4, 0x64

    if-lt v0, v4, :cond_1c

    const/16 v4, 0xc8

    if-lt v0, v4, :cond_1d

    :cond_1c
    const/16 v4, 0xcc

    if-eq v0, v4, :cond_1d

    const/16 v4, 0x130

    if-eq v0, v4, :cond_1d

    goto :goto_13

    .line 66
    :cond_1d
    invoke-virtual {v3}, Ll/i5d0;->F()Ll/e0l;

    move-result-object v0

    move-object/from16 v4, v22

    invoke-virtual {v0, v4}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 67
    :try_start_1
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_12

    :catch_0
    move-exception v0

    .line 68
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    move-wide/from16 v4, v16

    :goto_12
    cmp-long v0, v4, v16

    if-nez v0, :cond_1e

    .line 69
    const-string v0, "Transfer-Encoding"

    invoke-virtual {v3, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v4, "chunked"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 70
    :cond_1e
    :goto_13
    invoke-virtual {v3}, Ll/i5d0;->F()Ll/e0l;

    move-result-object v0

    .line 71
    invoke-virtual {v0, v15}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1f

    goto :goto_14

    .line 72
    :cond_1f
    invoke-virtual {v0, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_20

    .line 73
    invoke-virtual {v0, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 74
    iget-object v0, v1, Ll/zug0;->b:Ll/cpg0;

    const-string v1, "<-- END HTTP (encoded body omitted)"

    invoke-virtual {v0, v1}, Ll/cpg0;->a(Ljava/lang/String;)V

    goto/16 :goto_1a

    .line 75
    :cond_20
    :goto_14
    invoke-virtual/range {p1 .. p1}, Ll/k5d0;->source()Lokio/BufferedSource;

    move-result-object v0

    const-wide v4, 0x7fffffffffffffffL

    .line 76
    invoke-interface {v0, v4, v5}, Lokio/BufferedSource;->request(J)Z

    .line 77
    invoke-interface {v0}, Lokio/BufferedSource;->buffer()Lokio/Buffer;

    move-result-object v0

    .line 78
    invoke-virtual {v2, v15}, Ll/e0l;->d(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_21

    .line 79
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    .line 80
    new-instance v4, Lokio/GzipSource;

    invoke-virtual {v0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v0

    invoke-direct {v4, v0}, Lokio/GzipSource;-><init>(Lokio/Source;)V

    .line 81
    :try_start_2
    new-instance v0, Lokio/Buffer;

    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 82
    invoke-virtual {v0, v4}, Lokio/Buffer;->writeAll(Lokio/Source;)J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 83
    invoke-virtual {v4}, Lokio/GzipSource;->close()V

    goto :goto_16

    :catchall_0
    move-exception v0

    move-object v1, v0

    .line 84
    :try_start_3
    invoke-virtual {v4}, Lokio/GzipSource;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_15

    :catchall_1
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_15
    throw v1

    :cond_21
    const/4 v2, 0x0

    .line 85
    :goto_16
    invoke-virtual/range {p1 .. p1}, Ll/k5d0;->contentType()Ll/e7y;

    move-result-object v4

    .line 86
    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    if-eqz v4, :cond_22

    .line 87
    invoke-virtual {v4, v5}, Ll/e7y;->b(Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;

    move-result-object v13

    goto :goto_17

    :cond_22
    const/4 v13, 0x0

    :goto_17
    if-nez v13, :cond_23

    goto :goto_18

    :cond_23
    move-object v5, v13

    .line 88
    :goto_18
    invoke-static {v0}, Ll/zug0;->a(Lokio/Buffer;)Z

    move-result v4

    if-nez v4, :cond_24

    .line 89
    iget-object v2, v1, Ll/zug0;->b:Ll/cpg0;

    invoke-virtual {v2, v6}, Ll/cpg0;->a(Ljava/lang/String;)V

    .line 90
    iget-object v1, v1, Ll/zug0;->b:Ll/cpg0;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "<-- END HTTP (binary "

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-object/from16 v4, v23

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ll/cpg0;->a(Ljava/lang/String;)V

    return-object v3

    :cond_24
    const-wide/16 v7, 0x0

    cmp-long v4, v25, v7

    if-eqz v4, :cond_25

    .line 91
    iget-object v4, v1, Ll/zug0;->b:Ll/cpg0;

    invoke-virtual {v4, v6}, Ll/cpg0;->a(Ljava/lang/String;)V

    .line 92
    iget-object v4, v1, Ll/zug0;->b:Ll/cpg0;

    invoke-virtual {v0}, Lokio/Buffer;->clone()Lokio/Buffer;

    move-result-object v6

    invoke-virtual {v6, v5}, Lokio/Buffer;->readString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ll/cpg0;->a(Ljava/lang/String;)V

    .line 93
    :cond_25
    iget-object v1, v1, Ll/zug0;->b:Ll/cpg0;

    if-eqz v2, :cond_26

    .line 94
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v4

    .line 95
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    filled-new-array {v0, v2}, [Ljava/lang/Object;

    move-result-object v0

    .line 96
    const-string v2, "<-- END HTTP (%d-byte, %d-gzipped-byte body)"

    invoke-static {v4, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ll/cpg0;->a(Ljava/lang/String;)V

    goto :goto_1a

    .line 97
    :cond_26
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    invoke-virtual {v0}, Lokio/Buffer;->size()J

    move-result-wide v4

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "<-- END HTTP ("

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-object/from16 v2, v21

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ll/cpg0;->a(Ljava/lang/String;)V

    goto :goto_1a

    .line 98
    :cond_27
    :goto_19
    iget-object v0, v1, Ll/zug0;->b:Ll/cpg0;

    const-string v1, "<-- END HTTP"

    invoke-virtual {v0, v1}, Ll/cpg0;->a(Ljava/lang/String;)V

    :cond_28
    :goto_1a
    return-object v3

    :catch_1
    move-exception v0

    .line 99
    iget-object v1, v1, Ll/zug0;->b:Ll/cpg0;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<-- HTTP FAILED: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ll/cpg0;->a(Ljava/lang/String;)V

    .line 100
    throw v0
.end method
