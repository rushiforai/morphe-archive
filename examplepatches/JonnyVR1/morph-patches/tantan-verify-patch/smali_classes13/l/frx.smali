.class public Ll/frx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bam;


# instance fields
.field public a:Landroid/media/MediaMetadataRetriever;

.field public b:Landroid/media/MediaExtractor;

.field public c:Landroid/media/MediaMuxer;

.field public d:Z

.field public e:Ljava/lang/String;

.field public f:I

.field public g:I

.field public h:I

.field public i:J

.field public j:J

.field public k:[I

.field public l:I

.field public m:I

.field public n:Landroid/media/MediaFormat;

.field public o:Landroid/media/MediaFormat;

.field public p:I

.field public q:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    filled-new-array {v0, v0}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/frx;->k:[I

    .line 10
    .line 11
    const/4 v0, -0x5

    .line 12
    iput v0, p0, Ll/frx;->l:I

    .line 13
    .line 14
    iput v0, p0, Ll/frx;->m:I

    .line 15
    .line 16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iput-object p1, p0, Ll/frx;->e:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/frx;->d(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ll/ht5;Ll/it5;Ll/bam$c;Ll/bam$d;Ll/bam$a;Ll/bam$b;)Z
    .locals 6

    .line 1
    new-instance v0, Ll/frx$a;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v4, p4

    .line 5
    move-object v3, p5

    .line 6
    move-object v5, p6

    .line 7
    move-object v2, p7

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/frx$a;-><init>(Ll/frx;Ll/bam$b;Ll/bam$d;Ll/bam$c;Ll/bam$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, p1, p2, p3, v0}, Ll/frx;->b(Ljava/lang/String;Ll/ht5;Ll/it5;Ll/bam$e;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public b(Ljava/lang/String;Ll/ht5;Ll/it5;Ll/bam$e;)Z
    .locals 35

    move-object/from16 v1, p0

    move-object/from16 v7, p1

    move-object/from16 v0, p3

    move-object/from16 v8, p4

    .line 1
    iget-wide v2, v0, Ll/it5;->h:J

    .line 2
    iget-wide v5, v0, Ll/it5;->i:J

    .line 3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    const/4 v9, 0x0

    if-eqz v8, :cond_0

    .line 4
    iget-object v4, v1, Ll/frx;->e:Ljava/lang/String;

    invoke-interface {v8, v4, v9}, Ll/bam$e;->a(Ljava/lang/String;I)V

    .line 5
    :cond_0
    invoke-virtual {v1, v7, v9, v0, v8}, Ll/frx;->e(Ljava/lang/String;ILl/it5;Ll/bam$e;)V

    .line 6
    iget v4, v1, Ll/frx;->p:I

    if-eqz v4, :cond_34

    iget v4, v1, Ll/frx;->q:I

    if-eqz v4, :cond_34

    .line 7
    :try_start_0
    new-instance v4, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v4}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 8
    iget-object v10, v1, Ll/frx;->k:[I

    aget v10, v10, v9
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_10
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ltz v10, :cond_2b

    const/4 v11, 0x0

    .line 9
    :try_start_1
    iget-object v12, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    invoke-virtual {v12, v10}, Landroid/media/MediaExtractor;->selectTrack(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_f
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 v12, 0x0

    cmp-long v10, v2, v12

    .line 10
    iget-object v14, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    if-lez v10, :cond_1

    .line 11
    :try_start_2
    invoke-virtual {v14, v2, v3, v9}, Landroid/media/MediaExtractor;->seekTo(JI)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v2, v0

    goto/16 :goto_23

    :catch_0
    move-exception v0

    move-wide/from16 v26, v2

    move-object v14, v4

    move-wide/from16 v21, v5

    move-object v2, v11

    move-object v9, v2

    move-object v12, v9

    goto/16 :goto_1e

    .line 12
    :cond_1
    :try_start_3
    invoke-virtual {v14, v12, v13, v9}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 13
    :goto_0
    iget-object v14, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    iget-object v15, v1, Ll/frx;->k:[I

    aget v15, v15, v9

    invoke-virtual {v14, v15}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v14

    .line 14
    const-string v15, "video/avc"

    invoke-static {v15}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v15
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_f
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-wide/from16 v16, v12

    .line 15
    :try_start_4
    iget-object v12, v1, Ll/frx;->n:Landroid/media/MediaFormat;

    const/4 v13, 0x1

    invoke-virtual {v15, v12, v11, v11, v13}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 16
    new-instance v12, Ll/cvm;

    invoke-virtual {v15}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object v13

    invoke-direct {v12, v13}, Ll/cvm;-><init>(Landroid/view/Surface;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_e
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 17
    :try_start_5
    invoke-virtual {v12}, Ll/cvm;->c()V

    .line 18
    invoke-virtual {v15}, Landroid/media/MediaCodec;->start()V

    .line 19
    const-string v13, "mime"

    invoke-virtual {v14, v13}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v13
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_d
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 20
    :try_start_6
    new-instance v9, Ll/j760;

    iget v11, v1, Ll/frx;->f:I
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_c
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-wide/from16 v26, v2

    :try_start_7
    iget v2, v1, Ll/frx;->g:I

    iget v3, v1, Ll/frx;->h:I

    iget-boolean v0, v0, Ll/it5;->l:Z

    invoke-direct {v9, v11, v2, v3, v0}, Ll/j760;-><init>(IIIZ)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_b
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 21
    :try_start_8
    invoke-virtual {v9}, Ll/j760;->c()Landroid/view/Surface;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v13, v14, v0, v2, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 22
    invoke-virtual {v13}, Landroid/media/MediaCodec;->start()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_a
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    const-wide/16 v28, -0x1

    move-wide/from16 v30, v28

    const/4 v0, 0x0

    const/4 v3, 0x0

    const/4 v11, 0x0

    :goto_1
    if-nez v3, :cond_23

    move/from16 p3, v3

    if-nez v0, :cond_7

    .line 23
    :try_start_9
    iget-object v14, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    invoke-virtual {v14}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    move-result v14

    .line 24
    iget-object v2, v1, Ll/frx;->k:[I

    const/4 v3, 0x0

    aget v2, v2, v3
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    if-ne v14, v2, :cond_5

    move-object v2, v4

    const-wide/16 v3, 0x9c4

    .line 25
    :try_start_a
    invoke-virtual {v13, v3, v4}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v14

    if-ltz v14, :cond_3

    .line 26
    invoke-virtual {v13, v14}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 27
    iget-object v4, v1, Ll/frx;->b:Landroid/media/MediaExtractor;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_5
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    move-object/from16 v34, v2

    const/4 v2, 0x0

    :try_start_b
    invoke-virtual {v4, v3, v2}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v21
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    if-gez v21, :cond_2

    const-wide/16 v22, 0x0

    const/16 v24, 0x4

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v18, v13

    move/from16 v19, v14

    .line 28
    :try_start_c
    invoke-virtual/range {v18 .. v24}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    move-object/from16 v2, v18

    const/4 v0, 0x1

    goto :goto_5

    :catch_1
    move-exception v0

    move-wide/from16 v21, v5

    move-object v11, v15

    move-object/from16 v2, v18

    :goto_2
    move-object/from16 v14, v34

    goto/16 :goto_1e

    :cond_2
    move-object/from16 v18, v13

    move/from16 v19, v14

    .line 29
    :try_start_d
    iget-object v2, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 30
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v22

    const/16 v24, 0x0

    const/16 v20, 0x0

    .line 31
    invoke-virtual/range {v18 .. v24}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    move-object/from16 v2, v18

    .line 32
    :try_start_e
    iget-object v3, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    invoke-virtual {v3}, Landroid/media/MediaExtractor;->advance()Z

    goto :goto_5

    :catch_2
    move-exception v0

    :goto_3
    move-wide/from16 v21, v5

    move-object v11, v15

    goto :goto_2

    :catch_3
    move-exception v0

    move-object/from16 v2, v18

    goto :goto_3

    :catch_4
    move-exception v0

    :goto_4
    move-object v2, v13

    goto :goto_3

    :catch_5
    move-exception v0

    move-object/from16 v34, v2

    goto :goto_4

    :cond_3
    move-object/from16 v34, v2

    move-object v2, v13

    :cond_4
    :goto_5
    move v3, v0

    const/4 v0, 0x0

    goto :goto_6

    :cond_5
    move-object/from16 v34, v4

    move-object v2, v13

    const/4 v3, -0x1

    if-ne v14, v3, :cond_4

    move v3, v0

    const/4 v0, 0x1

    :goto_6
    if-eqz v0, :cond_6

    const-wide/16 v13, 0x9c4

    .line 33
    invoke-virtual {v2, v13, v14}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v19
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_2
    .catchall {:try_start_e .. :try_end_e} :catchall_0

    if-ltz v19, :cond_6

    const-wide/16 v22, 0x0

    const/16 v24, 0x4

    const/16 v20, 0x0

    const/16 v21, 0x0

    move-object/from16 v18, v2

    .line 34
    :try_start_f
    invoke-virtual/range {v18 .. v24}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_3
    .catchall {:try_start_f .. :try_end_f} :catchall_0

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    move v0, v3

    goto :goto_7

    :catch_6
    move-exception v0

    move-object/from16 v34, v4

    goto :goto_4

    :cond_7
    move-object/from16 v34, v4

    move-object v2, v13

    :goto_7
    xor-int/lit8 v3, v11, 0x1

    move v4, v3

    const/4 v13, 0x1

    move/from16 v3, p3

    :goto_8
    if-nez v4, :cond_8

    if-eqz v13, :cond_9

    :cond_8
    move/from16 v19, v0

    move/from16 p3, v3

    move/from16 v18, v4

    move-object/from16 v14, v34

    const-wide/16 v3, 0x9c4

    goto :goto_9

    :cond_9
    move-object v13, v2

    move-object/from16 v4, v34

    const/4 v2, 0x0

    goto/16 :goto_1

    .line 35
    :goto_9
    :try_start_10
    invoke-virtual {v15, v14, v3, v4}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    const/4 v4, -0x3

    const/4 v3, -0x1

    if-ne v0, v3, :cond_a

    move-wide/from16 v21, v5

    move/from16 v23, v10

    move/from16 v24, v11

    const/4 v4, 0x1

    const/4 v13, 0x0

    move v5, v3

    move/from16 v3, p3

    goto/16 :goto_12

    :cond_a
    if-ne v0, v4, :cond_b

    goto :goto_a

    :cond_b
    const/4 v3, -0x2

    if-ne v0, v3, :cond_c

    :goto_a
    move/from16 v3, p3

    move-wide/from16 v21, v5

    move/from16 v23, v10

    move/from16 v24, v11

    const/4 v4, 0x1

    :goto_b
    const/4 v5, -0x1

    goto/16 :goto_12

    :cond_c
    if-ltz v0, :cond_22

    .line 36
    invoke-virtual {v15, v0}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    if-eqz v3, :cond_21

    .line 37
    iget v4, v14, Landroid/media/MediaCodec$BufferInfo;->size:I
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_9
    .catchall {:try_start_10 .. :try_end_10} :catchall_0

    move-wide/from16 v21, v5

    const/4 v5, 0x1

    if-le v4, v5, :cond_12

    .line 38
    :try_start_11
    iget v5, v14, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v5, v5, 0x2

    if-nez v5, :cond_e

    .line 39
    iget-object v4, v1, Ll/frx;->c:Landroid/media/MediaMuxer;

    iget v5, v1, Ll/frx;->l:I

    invoke-virtual {v4, v5, v3, v14}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    :cond_d
    move/from16 v23, v10

    move/from16 v24, v11

    const/4 v4, 0x1

    goto/16 :goto_f

    :catch_7
    move-exception v0

    :goto_c
    move-object v11, v15

    goto/16 :goto_1e

    .line 40
    :cond_e
    iget v5, v1, Ll/frx;->l:I

    const/4 v6, -0x5

    if-ne v5, v6, :cond_d

    .line 41
    new-array v5, v4, [B

    .line 42
    iget v6, v14, Landroid/media/MediaCodec$BufferInfo;->offset:I

    add-int/2addr v6, v4

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 43
    iget v4, v14, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 44
    invoke-virtual {v3, v5}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 45
    iget v3, v14, Landroid/media/MediaCodec$BufferInfo;->size:I

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    :goto_d
    if-ltz v3, :cond_10

    const/4 v6, 0x3

    if-le v3, v6, :cond_10

    .line 46
    aget-byte v6, v5, v3

    if-ne v6, v4, :cond_f

    add-int/lit8 v4, v3, -0x1

    aget-byte v4, v5, v4

    if-nez v4, :cond_f

    add-int/lit8 v4, v3, -0x2

    aget-byte v4, v5, v4

    if-nez v4, :cond_f

    add-int/lit8 v4, v3, -0x3

    aget-byte v6, v5, v4

    if-nez v6, :cond_f

    .line 47
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    .line 48
    iget v6, v14, Landroid/media/MediaCodec$BufferInfo;->size:I

    sub-int/2addr v6, v4

    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    move/from16 v23, v10

    move/from16 v24, v11

    const/4 v10, 0x0

    .line 49
    invoke-virtual {v3, v5, v10, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 50
    iget v11, v14, Landroid/media/MediaCodec$BufferInfo;->size:I

    sub-int/2addr v11, v4

    invoke-virtual {v6, v5, v4, v11}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_e

    :cond_f
    move/from16 v23, v10

    move/from16 v24, v11

    add-int/lit8 v3, v3, -0x1

    move/from16 v10, v23

    move/from16 v11, v24

    const/4 v4, 0x1

    goto :goto_d

    :cond_10
    move/from16 v23, v10

    move/from16 v24, v11

    const/4 v3, 0x0

    const/4 v6, 0x0

    :goto_e
    if-eqz v3, :cond_11

    if-eqz v6, :cond_11

    .line 51
    iget-object v4, v1, Ll/frx;->n:Landroid/media/MediaFormat;

    const-string v5, "csd-0"

    invoke-virtual {v4, v5, v3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 52
    iget-object v3, v1, Ll/frx;->n:Landroid/media/MediaFormat;

    const-string v4, "csd-1"

    invoke-virtual {v3, v4, v6}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 53
    :cond_11
    iget-object v3, v1, Ll/frx;->c:Landroid/media/MediaMuxer;

    iget-object v4, v1, Ll/frx;->n:Landroid/media/MediaFormat;

    invoke-virtual {v3, v4}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v3

    iput v3, v1, Ll/frx;->l:I

    .line 54
    iget-object v3, v1, Ll/frx;->c:Landroid/media/MediaMuxer;

    invoke-virtual {v3}, Landroid/media/MediaMuxer;->start()V

    const/4 v4, 0x1

    .line 55
    iput-boolean v4, v1, Ll/frx;->d:Z

    goto :goto_f

    :cond_12
    move v4, v5

    move/from16 v23, v10

    move/from16 v24, v11

    .line 56
    :goto_f
    iget v3, v14, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x4

    if-eqz v3, :cond_13

    move v3, v4

    :goto_10
    const/4 v10, 0x0

    goto :goto_11

    :cond_13
    const/4 v3, 0x0

    goto :goto_10

    .line 57
    :goto_11
    invoke-virtual {v15, v0, v10}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    goto/16 :goto_b

    :goto_12
    if-eq v0, v5, :cond_14

    move-object/from16 v34, v14

    move/from16 v4, v18

    move/from16 v0, v19

    :goto_13
    move-wide/from16 v5, v21

    move/from16 v10, v23

    move/from16 v11, v24

    goto/16 :goto_8

    :cond_14
    if-nez v24, :cond_20

    const-wide/16 v10, 0x9c4

    .line 58
    invoke-virtual {v2, v14, v10, v11}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    if-ne v0, v5, :cond_15

    :goto_14
    move/from16 v0, v19

    const/4 v4, 0x0

    goto/16 :goto_19

    :cond_15
    const/4 v6, -0x3

    if-ne v0, v6, :cond_16

    goto/16 :goto_18

    :cond_16
    const/4 v6, -0x2

    if-ne v0, v6, :cond_17

    .line 59
    invoke-virtual {v2}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    goto :goto_18

    :cond_17
    if-ltz v0, :cond_1f

    .line 60
    iget v6, v14, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-eqz v6, :cond_18

    move v6, v4

    goto :goto_15

    :cond_18
    const/4 v6, 0x0

    :goto_15
    cmp-long v20, v21, v16

    if-lez v20, :cond_19

    .line 61
    iget-wide v4, v14, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    cmp-long v4, v4, v21

    if-ltz v4, :cond_19

    .line 62
    iget v4, v14, Landroid/media/MediaCodec$BufferInfo;->flags:I

    or-int/lit8 v4, v4, 0x4

    iput v4, v14, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v6, 0x0

    const/16 v19, 0x1

    const/16 v24, 0x1

    :cond_19
    if-lez v23, :cond_1b

    cmp-long v4, v30, v28

    if-nez v4, :cond_1b

    .line 63
    iget-wide v4, v14, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    cmp-long v20, v4, v26

    if-gez v20, :cond_1a

    const/4 v6, 0x0

    goto :goto_16

    :cond_1a
    move-wide/from16 v30, v4

    .line 64
    :cond_1b
    :goto_16
    invoke-virtual {v2, v0, v6}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_7
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    if-eqz v6, :cond_1d

    .line 65
    :try_start_12
    invoke-virtual {v9}, Ll/j760;->a()V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_8
    .catchall {:try_start_12 .. :try_end_12} :catchall_0

    const/4 v4, 0x0

    .line 66
    :try_start_13
    invoke-virtual {v9, v4}, Ll/j760;->b(Z)V

    .line 67
    iget-wide v4, v14, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    const-wide/16 v32, 0x3e8

    mul-long v4, v4, v32

    invoke-virtual {v12, v4, v5}, Ll/cvm;->e(J)V

    if-eqz v8, :cond_1c

    .line 68
    iget-wide v4, v14, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    long-to-float v0, v4

    iget-wide v4, v1, Ll/frx;->i:J

    long-to-float v4, v4

    div-float/2addr v0, v4

    const/high16 v4, 0x42c80000    # 100.0f

    mul-float/2addr v0, v4

    float-to-int v0, v0

    .line 69
    invoke-interface {v8, v0}, Ll/bam$e;->b(I)V

    .line 70
    :cond_1c
    invoke-virtual {v12}, Ll/cvm;->f()Z

    goto :goto_17

    :catch_8
    move-exception v0

    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 72
    :cond_1d
    :goto_17
    iget v0, v14, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_1e

    .line 73
    invoke-virtual {v15}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    goto :goto_14

    :cond_1e
    :goto_18
    move/from16 v4, v18

    move/from16 v0, v19

    goto :goto_19

    .line 74
    :cond_1f
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unexpected result from decoder.dequeueOutputBuffer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_20
    const-wide/16 v10, 0x9c4

    goto :goto_18

    :goto_19
    move-object/from16 v34, v14

    goto/16 :goto_13

    :catch_9
    move-exception v0

    move-wide/from16 v21, v5

    goto/16 :goto_c

    :cond_21
    move-wide/from16 v21, v5

    .line 75
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "encoderOutputBuffer "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " was null"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_22
    move-wide/from16 v21, v5

    .line 76
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unexpected result from encoder.dequeueOutputBuffer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_7
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    :cond_23
    move-object v14, v4

    move-wide/from16 v21, v5

    move-object v2, v13

    cmp-long v0, v30, v28

    if-eqz v0, :cond_24

    move-wide/from16 v26, v30

    :cond_24
    const/4 v0, 0x1

    :goto_1a
    move-object v13, v2

    move-wide/from16 v2, v26

    goto :goto_20

    :catch_a
    move-exception v0

    move-object v14, v4

    move-wide/from16 v21, v5

    move-object v2, v13

    goto/16 :goto_c

    :catch_b
    move-exception v0

    :goto_1b
    move-object v14, v4

    move-wide/from16 v21, v5

    move-object v2, v13

    move-object v11, v15

    :goto_1c
    const/4 v9, 0x0

    goto :goto_1e

    :catch_c
    move-exception v0

    move-wide/from16 v26, v2

    goto :goto_1b

    :catch_d
    move-exception v0

    move-wide/from16 v26, v2

    move-object v14, v4

    move-wide/from16 v21, v5

    move-object v11, v15

    const/4 v2, 0x0

    goto :goto_1c

    :catch_e
    move-exception v0

    move-wide/from16 v26, v2

    move-object v14, v4

    move-wide/from16 v21, v5

    move-object v11, v15

    const/4 v2, 0x0

    const/4 v9, 0x0

    :goto_1d
    const/4 v12, 0x0

    goto :goto_1e

    :catch_f
    move-exception v0

    move-wide/from16 v26, v2

    move-object v14, v4

    move-wide/from16 v21, v5

    const/4 v2, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    goto :goto_1d

    :goto_1e
    if-eqz v8, :cond_25

    .line 77
    :try_start_14
    invoke-interface {v8, v0, v7}, Ll/bam$e;->c(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_1f

    :catch_10
    move-exception v0

    goto/16 :goto_22

    :cond_25
    :goto_1f
    move-object v15, v11

    const/4 v0, 0x0

    goto :goto_1a

    .line 78
    :goto_20
    iget-object v4, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    iget-object v5, v1, Ll/frx;->k:[I

    const/16 v25, 0x0

    aget v5, v5, v25

    invoke-virtual {v4, v5}, Landroid/media/MediaExtractor;->unselectTrack(I)V

    if-eqz v9, :cond_26

    .line 79
    invoke-virtual {v9}, Ll/j760;->d()V

    :cond_26
    if-eqz v12, :cond_27

    .line 80
    invoke-virtual {v12}, Ll/cvm;->d()V

    :cond_27
    if-eqz v13, :cond_28

    .line 81
    invoke-virtual {v13}, Landroid/media/MediaCodec;->stop()V

    .line 82
    invoke-virtual {v13}, Landroid/media/MediaCodec;->release()V

    :cond_28
    if-eqz v15, :cond_29

    .line 83
    invoke-virtual {v15}, Landroid/media/MediaCodec;->stop()V

    .line 84
    invoke-virtual {v15}, Landroid/media/MediaCodec;->release()V

    :cond_29
    if-eqz v8, :cond_2a

    .line 85
    invoke-interface {v8, v7}, Ll/bam$e;->onSuccess(Ljava/lang/String;)V

    :cond_2a
    move v9, v0

    move-wide v3, v2

    goto :goto_21

    :cond_2b
    move-wide/from16 v26, v2

    move-object v14, v4

    move-wide/from16 v21, v5

    move-wide/from16 v3, v26

    const/4 v9, 0x0

    :goto_21
    if-eqz v9, :cond_2c

    move-object v2, v14

    move-wide/from16 v5, v21

    .line 86
    invoke-virtual/range {v1 .. v6}, Ll/frx;->g(Landroid/media/MediaCodec$BufferInfo;JJ)J
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_10
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 87
    :cond_2c
    iget-object v0, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    if-eqz v0, :cond_2d

    .line 88
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 89
    :cond_2d
    iget-object v0, v1, Ll/frx;->c:Landroid/media/MediaMuxer;

    if-eqz v0, :cond_33

    iget-boolean v2, v1, Ll/frx;->d:Z

    if-eqz v2, :cond_33

    const/4 v3, 0x0

    .line 90
    :try_start_15
    iput-boolean v3, v1, Ll/frx;->d:Z

    .line 91
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->release()V
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_11

    goto :goto_27

    :catch_11
    move-exception v0

    if-eqz v8, :cond_33

    .line 92
    invoke-interface {v8, v0, v7}, Ll/bam$e;->c(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_27

    :goto_22
    if-eqz v8, :cond_30

    .line 93
    :try_start_16
    invoke-interface {v8, v0, v7}, Ll/bam$e;->c(Ljava/lang/Throwable;Ljava/lang/String;)V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_0

    goto :goto_25

    .line 94
    :goto_23
    iget-object v0, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    if-eqz v0, :cond_2e

    .line 95
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 96
    :cond_2e
    iget-object v0, v1, Ll/frx;->c:Landroid/media/MediaMuxer;

    if-eqz v0, :cond_2f

    iget-boolean v3, v1, Ll/frx;->d:Z

    if-eqz v3, :cond_2f

    const/4 v3, 0x0

    .line 97
    :try_start_17
    iput-boolean v3, v1, Ll/frx;->d:Z

    .line 98
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->release()V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_12

    goto :goto_24

    :catch_12
    move-exception v0

    if-eqz v8, :cond_2f

    .line 99
    invoke-interface {v8, v0, v7}, Ll/bam$e;->c(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 100
    :cond_2f
    :goto_24
    throw v2

    .line 101
    :cond_30
    :goto_25
    iget-object v0, v1, Ll/frx;->b:Landroid/media/MediaExtractor;

    if-eqz v0, :cond_31

    .line 102
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    .line 103
    :cond_31
    iget-object v0, v1, Ll/frx;->c:Landroid/media/MediaMuxer;

    if-eqz v0, :cond_32

    iget-boolean v2, v1, Ll/frx;->d:Z

    if-eqz v2, :cond_32

    const/4 v3, 0x0

    .line 104
    :try_start_18
    iput-boolean v3, v1, Ll/frx;->d:Z

    .line 105
    invoke-virtual {v0}, Landroid/media/MediaMuxer;->release()V
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_13

    goto :goto_26

    :catch_13
    move-exception v0

    if-eqz v8, :cond_32

    .line 106
    invoke-interface {v8, v0, v7}, Ll/bam$e;->c(Ljava/lang/Throwable;Ljava/lang/String;)V

    :cond_32
    :goto_26
    const/4 v9, 0x0

    :cond_33
    :goto_27
    return v9

    :cond_34
    move/from16 v25, v9

    return v25
.end method

.method public final c(Ll/it5;)Landroid/media/MediaFormat;
    .locals 2

    .line 1
    iget-boolean v0, p1, Ll/it5;->l:Z

    .line 2
    .line 3
    iget v1, p1, Ll/it5;->d:I

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget v0, p1, Ll/it5;->e:I

    .line 8
    .line 9
    if-ge v1, v0, :cond_0

    .line 10
    .line 11
    iput v1, p0, Ll/frx;->p:I

    .line 12
    .line 13
    iput v1, p0, Ll/frx;->q:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iput v0, p0, Ll/frx;->p:I

    .line 17
    .line 18
    iput v0, p0, Ll/frx;->q:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iput v1, p0, Ll/frx;->p:I

    .line 22
    .line 23
    iget v0, p1, Ll/it5;->e:I

    .line 24
    .line 25
    iput v0, p0, Ll/frx;->q:I

    .line 26
    .line 27
    :goto_0
    iget v0, p0, Ll/frx;->p:I

    .line 28
    .line 29
    iget p0, p0, Ll/frx;->q:I

    .line 30
    .line 31
    const-string v1, "video/avc"

    .line 32
    .line 33
    invoke-static {v1, v0, p0}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string v0, "color-format"

    .line 38
    .line 39
    const v1, 0x7f000789

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    const-string v0, "bitrate"

    .line 46
    .line 47
    iget v1, p1, Ll/it5;->b:I

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 50
    .line 51
    .line 52
    const-string v0, "frame-rate"

    .line 53
    .line 54
    iget v1, p1, Ll/it5;->a:I

    .line 55
    .line 56
    invoke-virtual {p0, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 57
    .line 58
    .line 59
    const-string v0, "i-frame-interval"

    .line 60
    .line 61
    iget p1, p1, Ll/it5;->c:I

    .line 62
    .line 63
    invoke-virtual {p0, v0, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    return-object p0
.end method

.method public final d(Ljava/lang/String;)V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Landroid/media/MediaMetadataRetriever;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/frx;->a:Landroid/media/MediaMetadataRetriever;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/frx;->a:Landroid/media/MediaMetadataRetriever;

    .line 12
    .line 13
    const/16 v1, 0x12

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ll/frx;->f:I

    .line 24
    .line 25
    iget-object v0, p0, Ll/frx;->a:Landroid/media/MediaMetadataRetriever;

    .line 26
    .line 27
    const/16 v1, 0x13

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p0, Ll/frx;->g:I

    .line 38
    .line 39
    iget-object v0, p0, Ll/frx;->a:Landroid/media/MediaMetadataRetriever;

    .line 40
    .line 41
    const/16 v1, 0x18

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iput v0, p0, Ll/frx;->h:I

    .line 52
    .line 53
    iget-object v0, p0, Ll/frx;->a:Landroid/media/MediaMetadataRetriever;

    .line 54
    .line 55
    const/16 v1, 0x9

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    const-wide/16 v2, 0x3e8

    .line 70
    .line 71
    mul-long/2addr v0, v2

    .line 72
    iput-wide v0, p0, Ll/frx;->i:J

    .line 73
    .line 74
    iget-object v0, p0, Ll/frx;->a:Landroid/media/MediaMetadataRetriever;

    .line 75
    .line 76
    const/16 v1, 0x14

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    iput-wide v0, p0, Ll/frx;->j:J

    .line 91
    .line 92
    new-instance v0, Landroid/media/MediaExtractor;

    .line 93
    .line 94
    invoke-direct {v0}, Landroid/media/MediaExtractor;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 98
    .line 99
    invoke-virtual {v0, p1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ll/frx;->f(Landroid/media/MediaExtractor;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    .line 106
    .line 107
    return-void

    .line 108
    :catch_0
    move-exception p0

    .line 109
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public final e(Ljava/lang/String;ILl/it5;Ll/bam$e;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Landroid/media/MediaMuxer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p1, v1}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ll/frx;->c:Landroid/media/MediaMuxer;

    .line 8
    .line 9
    invoke-virtual {v0, p2}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p3}, Ll/frx;->c(Ll/it5;)Landroid/media/MediaFormat;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Ll/frx;->n:Landroid/media/MediaFormat;

    .line 17
    .line 18
    iget-object p2, p0, Ll/frx;->k:[I

    .line 19
    .line 20
    const/4 p3, 0x1

    .line 21
    aget p2, p2, p3

    .line 22
    .line 23
    if-ltz p2, :cond_0

    .line 24
    .line 25
    iget-object p3, p0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 26
    .line 27
    invoke-virtual {p3, p2}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iput-object p2, p0, Ll/frx;->o:Landroid/media/MediaFormat;

    .line 32
    .line 33
    iget-object p3, p0, Ll/frx;->c:Landroid/media/MediaMuxer;

    .line 34
    .line 35
    invoke-virtual {p3, p2}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iput p2, p0, Ll/frx;->m:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    return-void

    .line 42
    :catch_0
    move-exception p0

    .line 43
    if-eqz p4, :cond_0

    .line 44
    .line 45
    invoke-interface {p4, p0, p1}, Ll/bam$e;->c(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method public final f(Landroid/media/MediaExtractor;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1, v2}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    const-string v4, "mime"

    .line 14
    .line 15
    invoke-virtual {v3, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const-string v4, "audio/"

    .line 20
    .line 21
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_0

    .line 26
    .line 27
    iget-object v3, p0, Ll/frx;->k:[I

    .line 28
    .line 29
    const/4 v4, 0x1

    .line 30
    aput v2, v3, v4

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const-string v4, "video/"

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-eqz v3, :cond_1

    .line 40
    .line 41
    iget-object v3, p0, Ll/frx;->k:[I

    .line 42
    .line 43
    aput v2, v3, v1

    .line 44
    .line 45
    :cond_1
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return-void
.end method

.method public final g(Landroid/media/MediaCodec$BufferInfo;JJ)J
    .locals 17
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v2, p2

    .line 6
    .line 7
    iget v4, v0, Ll/frx;->m:I

    .line 8
    .line 9
    if-ltz v4, :cond_9

    .line 10
    .line 11
    iget-object v4, v0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 12
    .line 13
    iget-object v7, v0, Ll/frx;->k:[I

    .line 14
    .line 15
    const/4 v8, 0x1

    .line 16
    aget v7, v7, v8

    .line 17
    .line 18
    invoke-virtual {v4, v7}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 19
    .line 20
    .line 21
    iget-object v4, v0, Ll/frx;->o:Landroid/media/MediaFormat;

    .line 22
    .line 23
    const-string v7, "max-input-size"

    .line 24
    .line 25
    invoke-virtual {v4, v7}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    const-wide/16 v9, 0x0

    .line 30
    .line 31
    cmp-long v7, v2, v9

    .line 32
    .line 33
    iget-object v11, v0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 34
    .line 35
    const/4 v12, 0x0

    .line 36
    if-lez v7, :cond_0

    .line 37
    .line 38
    invoke-virtual {v11, v2, v3, v12}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {v11, v9, v10, v12}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 43
    .line 44
    .line 45
    :goto_0
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    move v3, v12

    .line 50
    const-wide/16 v13, -0x1

    .line 51
    .line 52
    :cond_1
    :goto_1
    iget-object v4, v0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 53
    .line 54
    if-nez v3, :cond_8

    .line 55
    .line 56
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    .line 57
    .line 58
    .line 59
    move-result v4

    .line 60
    iget-object v11, v0, Ll/frx;->k:[I

    .line 61
    .line 62
    aget v11, v11, v8

    .line 63
    .line 64
    if-ne v4, v11, :cond_7

    .line 65
    .line 66
    iget-object v4, v0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 67
    .line 68
    invoke-virtual {v4, v2, v12}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    iput v4, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 73
    .line 74
    if-gez v4, :cond_2

    .line 75
    .line 76
    iput v12, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 77
    .line 78
    move v4, v8

    .line 79
    const-wide/16 v15, -0x1

    .line 80
    .line 81
    goto :goto_4

    .line 82
    :cond_2
    iget-object v4, v0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 83
    .line 84
    const-wide/16 v15, -0x1

    .line 85
    .line 86
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 87
    .line 88
    .line 89
    move-result-wide v5

    .line 90
    iput-wide v5, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 91
    .line 92
    if-lez v7, :cond_3

    .line 93
    .line 94
    cmp-long v4, v13, v15

    .line 95
    .line 96
    if-nez v4, :cond_3

    .line 97
    .line 98
    move-wide v13, v5

    .line 99
    :cond_3
    cmp-long v4, p4, v9

    .line 100
    .line 101
    if-ltz v4, :cond_5

    .line 102
    .line 103
    cmp-long v4, v5, p4

    .line 104
    .line 105
    if-gez v4, :cond_4

    .line 106
    .line 107
    goto :goto_3

    .line 108
    :cond_4
    :goto_2
    move v4, v8

    .line 109
    goto :goto_4

    .line 110
    :cond_5
    :goto_3
    iput v12, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 111
    .line 112
    iget-object v4, v0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 113
    .line 114
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleFlags()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    iput v4, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 119
    .line 120
    iget-object v4, v0, Ll/frx;->c:Landroid/media/MediaMuxer;

    .line 121
    .line 122
    iget v5, v0, Ll/frx;->m:I

    .line 123
    .line 124
    invoke-virtual {v4, v5, v2, v1}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 125
    .line 126
    .line 127
    iget-object v4, v0, Ll/frx;->b:Landroid/media/MediaExtractor;

    .line 128
    .line 129
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->advance()Z

    .line 130
    .line 131
    .line 132
    :cond_6
    move v4, v12

    .line 133
    goto :goto_4

    .line 134
    :cond_7
    const-wide/16 v15, -0x1

    .line 135
    .line 136
    const/4 v5, -0x1

    .line 137
    if-ne v4, v5, :cond_6

    .line 138
    .line 139
    goto :goto_2

    .line 140
    :goto_4
    if-eqz v4, :cond_1

    .line 141
    .line 142
    move v3, v8

    .line 143
    goto :goto_1

    .line 144
    :cond_8
    iget-object v0, v0, Ll/frx;->k:[I

    .line 145
    .line 146
    aget v0, v0, v8

    .line 147
    .line 148
    invoke-virtual {v4, v0}, Landroid/media/MediaExtractor;->unselectTrack(I)V

    .line 149
    .line 150
    .line 151
    return-wide v13

    .line 152
    :cond_9
    const-wide/16 v15, -0x1

    .line 153
    .line 154
    return-wide v15
.end method
