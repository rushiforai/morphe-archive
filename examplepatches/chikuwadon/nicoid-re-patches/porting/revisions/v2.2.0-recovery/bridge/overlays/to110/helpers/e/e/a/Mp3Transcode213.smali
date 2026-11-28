.class final Le/e/a/Mp3Transcode213;
.super Ljava/lang/Object;
.source "Mp3Transcode213.java"


# static fields
.field static final FRAMES:I = 0x480


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static convert(Le/e/a/Mp4Transfer115;Ljava/io/File;Ljava/io/File;I)V
    .registers 37
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move/from16 v0, p3

    .line 26
    const-string v1, "pcm-encoding"

    const/16 v2, 0x80

    if-eq v0, v2, :cond_0

    const/16 v2, 0xc0

    if-eq v0, v2, :cond_0

    const/16 v2, 0x100

    if-eq v0, v2, :cond_0

    .line 27
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP3\u30d3\u30c3\u30c8\u30ec\u30fc\u30c8\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 28
    :cond_0
    new-instance v2, Landroid/media/MediaExtractor;

    invoke-direct {v2}, Landroid/media/MediaExtractor;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 33
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    move v5, v4

    .line 36
    :goto_0
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_13

    const-string v7, "mime"

    if-lt v5, v6, :cond_1

    const/4 v5, -0x1

    move-object v6, v3

    goto :goto_1

    .line 37
    :cond_1
    :try_start_1
    invoke-virtual {v2, v5}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v6

    .line 38
    invoke-virtual {v6, v7}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_29

    .line 39
    const-string v9, "audio/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_29

    :goto_1
    if-ltz v5, :cond_28

    if-eqz v6, :cond_28

    .line 42
    invoke-virtual {v6, v7}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 43
    invoke-virtual {v2, v5}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 44
    invoke-static {v7}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_13

    const/4 v5, 0x2

    .line 46
    :try_start_2
    invoke-virtual {v6, v1, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 47
    invoke-virtual {v8, v6, v3, v3, v4}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 48
    invoke-virtual {v8}, Landroid/media/MediaCodec;->start()V

    .line 50
    new-instance v6, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v6}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    const/16 v7, 0x480

    .line 53
    new-array v15, v7, [F

    new-array v9, v7, [F

    const/high16 v10, 0x10000

    .line 55
    new-array v11, v10, [B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_11

    .line 57
    :try_start_3
    new-instance v12, Ljava/io/BufferedOutputStream;

    new-instance v13, Ljava/io/FileOutputStream;

    move-object/from16 v14, p2

    invoke-direct {v13, v14}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v12, v13}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_f

    move-object/from16 v16, v6

    move-object v13, v3

    move v3, v4

    move v7, v3

    move/from16 v17, v7

    move/from16 v18, v17

    move/from16 v22, v18

    const-wide/16 v5, 0x0

    const-wide/16 v19, 0x0

    const/16 v23, 0x2

    :goto_2
    const/4 v14, 0x1

    if-eqz v17, :cond_9

    if-eqz v13, :cond_8

    cmp-long v1, v5, v19

    if-eqz v1, :cond_8

    if-lez v3, :cond_3

    .line 144
    :try_start_4
    invoke-virtual {v13, v15, v9, v3, v11}, Lnet/sourceforge/lame/mp3/Lame;->encodeBuffer([F[FI[B)I

    move-result v1

    if-ltz v1, :cond_2

    if-gt v1, v10, :cond_2

    .line 146
    invoke-virtual {v12, v11, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_3

    .line 145
    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP3\u306e\u6700\u7d42\u30d5\u30ec\u30fc\u30e0\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_3
    :goto_3
    invoke-virtual {v13, v11}, Lnet/sourceforge/lame/mp3/Lame;->encodeFlush([B)I

    move-result v1

    if-ltz v1, :cond_7

    if-gt v1, v10, :cond_7

    .line 150
    invoke-virtual {v12, v11, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    .line 151
    invoke-virtual {v12}, Ljava/io/OutputStream;->flush()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 152
    :try_start_5
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 153
    :try_start_6
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->length()J

    move-result-wide v9
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    const-wide/16 v11, 0x80

    cmp-long v1, v9, v11

    if-ltz v1, :cond_6

    .line 155
    :try_start_7
    const-string v1, "nicoid-mp3"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "MP3 encoded at "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "kbps; frames="

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    if-eqz v13, :cond_4

    .line 157
    :try_start_8
    invoke-virtual {v13}, Lnet/sourceforge/lame/mp3/Lame;->close()I
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0

    :catch_0
    :cond_4
    if-eqz v8, :cond_5

    .line 158
    :try_start_9
    invoke-virtual {v8}, Landroid/media/MediaCodec;->stop()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    :catch_1
    invoke-virtual {v8}, Landroid/media/MediaCodec;->release()V

    .line 159
    :cond_5
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->release()V

    return-void

    :catchall_0
    move-exception v0

    move-object/from16 v22, v2

    move-object v3, v13

    move v4, v14

    goto/16 :goto_1c

    .line 153
    :cond_6
    :try_start_a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP3\u51fa\u529b\u30d5\u30a1\u30a4\u30eb\u304c\u7a7a\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    :catchall_1
    move-exception v0

    move-object/from16 v22, v2

    move-object v3, v13

    goto/16 :goto_1c

    :catchall_2
    move-exception v0

    move-object/from16 v22, v2

    move v2, v4

    move-object/from16 v21, v13

    const/4 v3, 0x0

    goto/16 :goto_1a

    .line 149
    :cond_7
    :try_start_b
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP3\u306e\u66f8\u304d\u51fa\u3057\u3092\u5b8c\u4e86\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 142
    :cond_8
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u5909\u63db\u5bfe\u8c61\u306e\u97f3\u58f0\u30c7\u30fc\u30bf\u304c\u7a7a\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :catchall_3
    move-exception v0

    move-object v3, v0

    move-object/from16 v22, v2

    move v2, v4

    move-object v1, v12

    goto/16 :goto_19

    .line 59
    :cond_9
    :try_start_c
    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_d

    move-object/from16 v24, v11

    const-wide/16 v10, 0x2710

    if-nez v18, :cond_d

    move-object/from16 v25, v9

    .line 61
    :try_start_d
    invoke-virtual {v8, v10, v11}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v9

    if-ltz v9, :cond_c

    .line 63
    invoke-virtual {v8, v9}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    if-eqz v10, :cond_b

    .line 65
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v11

    check-cast v11, Ljava/nio/ByteBuffer;

    .line 66
    invoke-virtual {v2, v10, v4}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v11
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    if-gez v11, :cond_a

    move-object v10, v12

    move-object/from16 v28, v13

    const-wide/16 v12, 0x0

    move v11, v14

    const/4 v14, 0x4

    move-object/from16 v18, v10

    const/4 v10, 0x0

    move/from16 v29, v11

    const/4 v11, 0x0

    move-object/from16 v32, v18

    move-object/from16 v31, v24

    move-object/from16 v30, v25

    move-wide/from16 v24, v5

    move/from16 v6, v29

    const-wide/16 v4, 0x2710

    .line 68
    :try_start_e
    invoke-virtual/range {v8 .. v14}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    move/from16 v18, v6

    move/from16 v26, v7

    :goto_4
    move-wide/from16 v6, v19

    goto :goto_9

    :cond_a
    move-object/from16 v32, v12

    move-object/from16 v28, v13

    move-object/from16 v31, v24

    move-object/from16 v30, v25

    move-wide/from16 v24, v5

    const-wide/16 v4, 0x2710

    .line 71
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v12

    move/from16 v26, v7

    move-wide/from16 v6, v19

    .line 72
    invoke-static {v6, v7, v12, v13}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v12

    const/4 v14, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v8 .. v14}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 73
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->advance()Z

    goto :goto_9

    :cond_b
    move-object/from16 v32, v12

    move-object/from16 v28, v13

    .line 64
    new-instance v0, Ljava/io/IOException;

    const-string v1, "AAC\u5165\u529b\u30d0\u30c3\u30d5\u30a1\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    :cond_c
    move/from16 v26, v7

    move-object/from16 v32, v12

    move-object/from16 v28, v13

    move-object/from16 v31, v24

    move-object/from16 v30, v25

    goto :goto_8

    :catchall_4
    move-exception v0

    move-object/from16 v32, v12

    :goto_5
    move-object v3, v0

    move-object/from16 v22, v2

    :goto_6
    move-object/from16 v1, v32

    :goto_7
    const/4 v2, 0x0

    goto/16 :goto_19

    :cond_d
    move/from16 v26, v7

    move-object/from16 v30, v9

    move-object/from16 v32, v12

    move-object/from16 v28, v13

    move-object/from16 v31, v24

    :goto_8
    move-wide/from16 v24, v5

    move-wide v4, v10

    goto :goto_4

    :goto_9
    move-object/from16 v9, v16

    .line 77
    :try_start_f
    invoke-virtual {v8, v9, v4, v5}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v4
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_c

    const/4 v5, -0x2

    const v10, 0x2ee00

    const/16 v11, 0x1f40

    .line 78
    const-string v12, "channel-count"

    const-string v13, "sample-rate"

    const/4 v14, 0x4

    if-ne v4, v5, :cond_13

    .line 79
    :try_start_10
    invoke-virtual {v8}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v4

    .line 80
    invoke-virtual {v4, v13}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v5

    .line 81
    invoke-virtual {v4, v12}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v12

    .line 82
    invoke-virtual {v4, v1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_e

    .line 83
    invoke-virtual {v4, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v4

    goto :goto_a

    :cond_e
    const/4 v4, 0x2

    :goto_a
    if-lt v5, v11, :cond_12

    if-gt v5, v10, :cond_12

    const/4 v11, 0x1

    if-lt v12, v11, :cond_12

    const/4 v10, 0x2

    if-gt v12, v10, :cond_12

    if-eq v4, v10, :cond_f

    if-ne v4, v14, :cond_12

    :cond_f
    if-eqz v28, :cond_11

    move/from16 v10, v26

    if-ne v5, v10, :cond_10

    move/from16 v10, v22

    if-eq v12, v10, :cond_11

    .line 88
    :cond_10
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "\u9014\u4e2d\u3067\u97f3\u58f0\u5f62\u5f0f\u304c\u5909\u66f4\u3055\u308c\u307e\u3057\u305f"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_11
    move/from16 v23, v4

    move-wide/from16 v19, v6

    move-object/from16 v16, v9

    move/from16 v22, v12

    move-object/from16 v13, v28

    move-object/from16 v9, v30

    move-object/from16 v11, v31

    move-object/from16 v12, v32

    const/4 v4, 0x0

    const/high16 v10, 0x10000

    move v7, v5

    goto/16 :goto_17

    .line 86
    :cond_12
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u5bfe\u5fdc\u3057\u3066\u3044\u306a\u3044\u97f3\u58f0\u5f62\u5f0f\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_13
    move/from16 v5, v22

    if-ltz v4, :cond_25

    if-nez v28, :cond_19

    .line 92
    invoke-virtual {v8}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v5

    .line 93
    invoke-virtual {v5, v13}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v13

    .line 94
    invoke-virtual {v5, v12}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v12

    const/4 v6, 0x1

    if-lt v12, v6, :cond_18

    const/4 v6, 0x2

    if-gt v12, v6, :cond_18

    if-lt v13, v11, :cond_18

    if-gt v13, v10, :cond_18

    .line 97
    invoke-virtual {v5, v1}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_14

    .line 98
    invoke-virtual {v5, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v10

    goto :goto_b

    :cond_14
    const/4 v10, 0x2

    :goto_b
    const/4 v6, 0x2

    if-eq v10, v6, :cond_15

    if-eq v10, v14, :cond_15

    .line 100
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u5bfe\u5fdc\u3057\u3066\u3044\u306a\u3044\u97f3\u58f0PCM\u5f62\u5f0f\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_15
    new-instance v5, Lnet/sourceforge/lame/mp3/Lame;

    invoke-direct {v5}, Lnet/sourceforge/lame/mp3/Lame;-><init>()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    .line 102
    :try_start_11
    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->getFlags()Lnet/sourceforge/lame/mp3/LameGlobalFlags;

    move-result-object v7

    invoke-virtual {v7, v12}, Lnet/sourceforge/lame/mp3/LameGlobalFlags;->setInNumChannels(I)V

    .line 103
    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->getFlags()Lnet/sourceforge/lame/mp3/LameGlobalFlags;

    move-result-object v7

    invoke-virtual {v7, v13}, Lnet/sourceforge/lame/mp3/LameGlobalFlags;->setInSampleRate(I)V

    .line 104
    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->getFlags()Lnet/sourceforge/lame/mp3/LameGlobalFlags;

    move-result-object v7

    invoke-virtual {v7, v0}, Lnet/sourceforge/lame/mp3/LameGlobalFlags;->setBitRate(I)V

    .line 105
    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->getFlags()Lnet/sourceforge/lame/mp3/LameGlobalFlags;

    move-result-object v7

    const/4 v11, 0x5

    invoke-virtual {v7, v11}, Lnet/sourceforge/lame/mp3/LameGlobalFlags;->setQuality(I)V

    .line 106
    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->getFlags()Lnet/sourceforge/lame/mp3/LameGlobalFlags;

    move-result-object v7

    const/4 v11, 0x1

    if-ne v12, v11, :cond_16

    sget-object v11, Lnet/sourceforge/lame/mp3/MPEGMode;->MONO:Lnet/sourceforge/lame/mp3/MPEGMode;

    goto :goto_c

    :cond_16
    sget-object v11, Lnet/sourceforge/lame/mp3/MPEGMode;->JOINT_STEREO:Lnet/sourceforge/lame/mp3/MPEGMode;

    :goto_c
    invoke-virtual {v7, v11}, Lnet/sourceforge/lame/mp3/LameGlobalFlags;->setMode(Lnet/sourceforge/lame/mp3/MPEGMode;)V

    .line 107
    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->getId3()Lnet/sourceforge/lame/mp3/ID3Tag;

    move-result-object v7

    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->getFlags()Lnet/sourceforge/lame/mp3/LameGlobalFlags;

    move-result-object v11

    invoke-virtual {v7, v11}, Lnet/sourceforge/lame/mp3/ID3Tag;->init(Lnet/sourceforge/lame/mp3/LameGlobalFlags;)V

    .line 108
    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->getFlags()Lnet/sourceforge/lame/mp3/LameGlobalFlags;

    move-result-object v7

    const/4 v11, 0x0

    invoke-virtual {v7, v11}, Lnet/sourceforge/lame/mp3/LameGlobalFlags;->setWriteId3tagAutomatic(Z)V

    .line 109
    invoke-virtual {v5}, Lnet/sourceforge/lame/mp3/Lame;->initParams()I

    move-result v7

    if-ltz v7, :cond_17

    move v7, v13

    move-object v13, v5

    goto :goto_d

    :cond_17
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP3\u30a8\u30f3\u30b3\u30fc\u30c0\u3092\u521d\u671f\u5316\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_5

    :catchall_5
    move-exception v0

    move-object v3, v0

    move-object/from16 v22, v2

    move-object v13, v5

    goto/16 :goto_6

    .line 96
    :cond_18
    :try_start_12
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u5bfe\u5fdc\u3057\u3066\u3044\u306a\u3044\u97f3\u58f0\u30b5\u30f3\u30d7\u30ea\u30f3\u30b0\u8a2d\u5b9a\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_6

    :catchall_6
    move-exception v0

    move-object v3, v0

    move-object/from16 v22, v2

    move-object/from16 v13, v28

    goto/16 :goto_6

    :cond_19
    move v12, v5

    move/from16 v10, v23

    move/from16 v7, v26

    move-object/from16 v13, v28

    .line 111
    :goto_d
    :try_start_13
    iget v5, v9, Landroid/media/MediaCodec$BufferInfo;->size:I
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_b

    if-lez v5, :cond_23

    .line 112
    :try_start_14
    invoke-virtual {v8, v4}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    if-eqz v5, :cond_22

    .line 114
    iget v11, v9, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v5, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v11

    check-cast v11, Ljava/nio/ByteBuffer;

    .line 115
    iget v11, v9, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v6, v9, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v11, v6

    invoke-virtual {v5, v11}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v6

    check-cast v6, Ljava/nio/ByteBuffer;

    .line 116
    sget-object v6, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    if-ne v10, v14, :cond_1a

    move v6, v14

    goto :goto_e

    :cond_1a
    const/4 v6, 0x2

    .line 118
    :goto_e
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v11

    mul-int/2addr v6, v12

    rem-int/2addr v11, v6

    if-nez v11, :cond_21

    .line 120
    :goto_f
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v11

    if-ge v11, v6, :cond_1b

    move-object/from16 v16, v1

    move-object/from16 v22, v2

    move-wide/from16 v5, v24

    move-object/from16 v11, v30

    move-object/from16 v14, v31

    move-object/from16 v1, v32

    const/high16 v0, 0x10000

    goto/16 :goto_15

    .line 121
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_9

    const/high16 v16, 0x47800000    # 65536.0f

    const/high16 v17, 0x4f000000

    if-ne v10, v14, :cond_1c

    .line 123
    :try_start_15
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v14

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v11, v14}, Ljava/lang/Math;->min(FF)F

    move-result v14

    const/high16 v11, -0x40800000    # -1.0f

    invoke-static {v11, v14}, Ljava/lang/Math;->max(FF)F

    move-result v14
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_7

    mul-float v14, v14, v17

    goto :goto_10

    .line 124
    :cond_1c
    :try_start_16
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v11

    int-to-float v11, v11

    mul-float v14, v11, v16

    .line 122
    :goto_10
    aput v14, v15, v3
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_9

    const/4 v11, 0x1

    if-ne v12, v11, :cond_1d

    :goto_11
    move-object/from16 v11, v30

    goto :goto_12

    :cond_1d
    const/4 v14, 0x4

    if-ne v10, v14, :cond_1e

    .line 127
    :try_start_17
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v14

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-static {v11, v14}, Ljava/lang/Math;->min(FF)F

    move-result v11

    const/high16 v14, -0x40800000    # -1.0f

    invoke-static {v14, v11}, Ljava/lang/Math;->max(FF)F

    move-result v11
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_7

    mul-float v14, v11, v17

    goto :goto_11

    :catchall_7
    move-exception v0

    goto/16 :goto_5

    .line 128
    :cond_1e
    :try_start_18
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v11

    int-to-float v11, v11

    mul-float v14, v11, v16

    goto :goto_11

    .line 125
    :goto_12
    aput v14, v11, v3

    add-int/lit8 v3, v3, 0x1

    const-wide/16 v16, 0x1

    add-long v24, v24, v16

    const/16 v14, 0x480

    if-ne v3, v14, :cond_20

    move-object/from16 v14, v31

    .line 131
    invoke-virtual {v13, v15, v11, v3, v14}, Lnet/sourceforge/lame/mp3/Lame;->encodeBuffer([F[FI[B)I

    move-result v3
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_9

    if-ltz v3, :cond_1f

    const/high16 v0, 0x10000

    if-gt v3, v0, :cond_1f

    move-object/from16 v16, v1

    move-object/from16 v22, v2

    move-object/from16 v1, v32

    const/4 v2, 0x0

    .line 133
    :try_start_19
    invoke-virtual {v1, v14, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    move-object/from16 v32, v1

    move-object/from16 v30, v11

    move-object/from16 v31, v14

    move-object/from16 v1, v16

    move-object/from16 v2, v22

    const/4 v3, 0x0

    goto :goto_13

    :cond_1f
    move-object/from16 v22, v2

    move-object/from16 v1, v32

    .line 132
    new-instance v0, Ljava/io/IOException;

    const-string v2, "MP3\u30a8\u30f3\u30b3\u30fc\u30c9\u306b\u5931\u6557\u3057\u307e\u3057\u305f"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_20
    move-object/from16 v30, v11

    :goto_13
    const/4 v14, 0x4

    goto/16 :goto_f

    :cond_21
    move-object/from16 v22, v2

    move-object/from16 v1, v32

    .line 119
    new-instance v0, Ljava/io/IOException;

    const-string v2, "PCM\u30d5\u30ec\u30fc\u30e0\u304c\u4e0d\u5b8c\u5168\u3067\u3059"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_22
    move-object/from16 v22, v2

    move-object/from16 v1, v32

    .line 113
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v2, "\u97f3\u58f0\u30c7\u30b3\u30fc\u30c9\u7d50\u679c\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_8

    :catchall_8
    move-exception v0

    goto :goto_14

    :catchall_9
    move-exception v0

    move-object/from16 v22, v2

    move-object/from16 v1, v32

    :goto_14
    move-object v3, v0

    goto/16 :goto_7

    :cond_23
    move-object/from16 v16, v1

    move-object/from16 v22, v2

    move-object/from16 v11, v30

    move-object/from16 v14, v31

    move-object/from16 v1, v32

    const/high16 v0, 0x10000

    move-wide/from16 v5, v24

    :goto_15
    const/4 v2, 0x0

    .line 138
    :try_start_1a
    invoke-virtual {v8, v4, v2}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 139
    iget v4, v9, Landroid/media/MediaCodec$BufferInfo;->flags:I
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_a

    const/16 v27, 0x4

    and-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_24

    const/16 v17, 0x1

    goto :goto_16

    :cond_24
    move/from16 v17, v2

    :goto_16
    move v4, v2

    move/from16 v23, v10

    move-object/from16 v2, v22

    const-wide/16 v19, 0x0

    move v10, v0

    move/from16 v22, v12

    move/from16 v0, p3

    move-object v12, v1

    move-object/from16 v1, v16

    move-object/from16 v16, v9

    move-object v9, v11

    move-object v11, v14

    goto/16 :goto_2

    :catchall_a
    move-exception v0

    goto :goto_18

    :catchall_b
    move-exception v0

    move-object/from16 v22, v2

    move-object/from16 v1, v32

    const/4 v2, 0x0

    goto :goto_18

    :cond_25
    move/from16 v0, p3

    move-wide/from16 v19, v6

    move-object/from16 v16, v9

    move/from16 v7, v26

    move-object/from16 v13, v28

    move-object/from16 v9, v30

    move-object/from16 v11, v31

    move-object/from16 v12, v32

    const/4 v4, 0x0

    const/high16 v10, 0x10000

    move/from16 v22, v5

    :goto_17
    move-wide/from16 v5, v24

    goto/16 :goto_2

    :catchall_c
    move-exception v0

    move-object/from16 v22, v2

    move-object/from16 v1, v32

    const/4 v2, 0x0

    move-object v3, v0

    move-object/from16 v13, v28

    goto :goto_19

    :catchall_d
    move-exception v0

    move-object/from16 v22, v2

    move v2, v4

    move-object v1, v12

    :goto_18
    move-object v3, v0

    .line 152
    :goto_19
    :try_start_1b
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    throw v3
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_e

    :catchall_e
    move-exception v0

    move-object/from16 v21, v13

    goto :goto_1a

    :catchall_f
    move-exception v0

    move-object/from16 v22, v2

    move v2, v4

    const/4 v3, 0x0

    const/16 v21, 0x0

    :goto_1a
    if-eqz v3, :cond_27

    if-eq v3, v0, :cond_26

    :try_start_1c
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_26
    move-object v0, v3

    :cond_27
    throw v0
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_10

    :catchall_10
    move-exception v0

    move v4, v2

    move-object/from16 v3, v21

    goto :goto_1c

    :catchall_11
    move-exception v0

    move-object/from16 v22, v2

    const/4 v3, 0x0

    goto :goto_1c

    :cond_28
    move-object/from16 v22, v2

    move v2, v4

    .line 41
    :try_start_1d
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP3\u5909\u63db\u7528\u306e\u97f3\u58f0\u30c8\u30e9\u30c3\u30af\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_12

    :catchall_12
    move-exception v0

    move v4, v2

    goto :goto_1b

    :cond_29
    move-object/from16 v16, v1

    move-object/from16 v22, v2

    move v2, v4

    add-int/lit8 v5, v5, 0x1

    move/from16 v0, p3

    move v4, v2

    move-object/from16 v1, v16

    move-object/from16 v2, v22

    const/4 v3, 0x0

    goto/16 :goto_0

    :catchall_13
    move-exception v0

    move-object/from16 v22, v2

    :goto_1b
    const/4 v3, 0x0

    const/4 v8, 0x0

    :goto_1c
    if-eqz v3, :cond_2a

    .line 157
    :try_start_1e
    invoke-virtual {v3}, Lnet/sourceforge/lame/mp3/Lame;->close()I
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_2

    :catch_2
    :cond_2a
    if-eqz v8, :cond_2b

    .line 158
    :try_start_1f
    invoke-virtual {v8}, Landroid/media/MediaCodec;->stop()V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_3

    :catch_3
    invoke-virtual {v8}, Landroid/media/MediaCodec;->release()V

    .line 159
    :cond_2b
    invoke-virtual/range {v22 .. v22}, Landroid/media/MediaExtractor;->release()V

    if-nez v4, :cond_2c

    .line 160
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    .line 161
    :cond_2c
    throw v0
.end method
