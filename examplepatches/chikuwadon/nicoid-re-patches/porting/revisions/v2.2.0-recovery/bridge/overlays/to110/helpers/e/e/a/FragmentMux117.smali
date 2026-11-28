.class final Le/e/a/FragmentMux117;
.super Ljava/lang/Object;
.source "FragmentMux117.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/FragmentMux117$Input;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static mux(Le/e/a/Mp4Transfer115;Ljava/util/List;Ljava/io/File;)V
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le/e/a/Mp4Transfer115;",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 7
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    const/4 v3, 0x0

    :try_start_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const-wide v5, 0x7fffffffffffffffL

    move v7, v3

    move v8, v7

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const-string v10, "video/avc"

    if-nez v9, :cond_10

    .line 9
    if-eqz v7, :cond_f

    if-eqz v8, :cond_f

    :try_start_1
    new-instance v4, Landroid/media/MediaMuxer;

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v4, v7, v3}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 10
    :try_start_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_c

    invoke-virtual {v4}, Landroid/media/MediaMuxer;->start()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/high16 v7, 0x400000

    :try_start_3
    invoke-static {v7}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v7

    new-instance v15, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v15}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 11
    :goto_2
    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    const/4 v14, 0x0

    :goto_3
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-nez v10, :cond_9

    const-wide/16 v16, 0x0

    if-nez v14, :cond_3

    .line 12
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v4}, Landroid/media/MediaMuxer;->stop()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 13
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v4}, Landroid/media/MediaMuxer;->release()V

    .line 14
    return-void

    .line 13
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FragmentedMp4117;

    :try_start_4
    invoke-virtual {v0}, Le/e/a/FragmentedMp4117;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    goto :goto_5

    .line 12
    :cond_1
    :try_start_5
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FragmentMux117$Input;

    iget-wide v5, v2, Le/e/a/FragmentMux117$Input;->last:J

    cmp-long v5, v5, v16

    if-ltz v5, :cond_2

    iget-wide v12, v2, Le/e/a/FragmentMux117$Input;->end:J

    const/4 v14, 0x4

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v9, v15

    invoke-virtual/range {v9 .. v14}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    invoke-virtual {v7, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    move-result-object v5

    check-cast v5, Ljava/nio/ByteBuffer;

    iget v2, v2, Le/e/a/FragmentMux117$Input;->track:I

    invoke-virtual {v4, v2, v7, v15}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    goto :goto_4

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v2, "MP4\u30c8\u30e9\u30c3\u30af\u304c\u7a7a\u3067\u3059"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 11
    :cond_3
    iget-object v9, v14, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    iget-object v12, v9, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget-object v9, v14, Le/e/a/FragmentMux117$Input;->format:Le/e/a/FragmentedMp4117$Format;

    iget v9, v9, Le/e/a/FragmentedMp4117$Format;->nalLength:I

    if-lez v9, :cond_4

    iget-object v9, v14, Le/e/a/FragmentMux117$Input;->format:Le/e/a/FragmentedMp4117$Format;

    iget v9, v9, Le/e/a/FragmentedMp4117$Format;->nalLength:I

    const/4 v10, 0x4

    if-ge v9, v10, :cond_4

    iget v9, v12, Le/e/a/FragmentedMp4117$Sample;->size:I

    int-to-long v9, v9

    const-wide/16 v18, 0x4

    mul-long v9, v9, v18

    goto :goto_6

    :cond_4
    iget v9, v12, Le/e/a/FragmentedMp4117$Sample;->size:I

    int-to-long v9, v9

    :goto_6
    const-wide/32 v18, 0x1000000

    cmp-long v11, v9, v18

    if-gtz v11, :cond_8

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v11

    int-to-long v2, v11

    cmp-long v2, v9, v2

    if-lez v2, :cond_5

    long-to-int v2, v9

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    move-object v7, v2

    :cond_5
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v2

    check-cast v2, Ljava/nio/ByteBuffer;

    iget-object v2, v14, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    invoke-virtual {v2, v7}, Le/e/a/FragmentedMp4117$Cursor;->write(Ljava/nio/ByteBuffer;)I

    move-result v11

    iget-wide v2, v12, Le/e/a/FragmentedMp4117$Sample;->timeUs:J

    sub-long/2addr v2, v5

    cmp-long v9, v2, v16

    if-ltz v9, :cond_7

    iget-boolean v9, v12, Le/e/a/FragmentedMp4117$Sample;->sync:Z

    if-eqz v9, :cond_6

    const/16 v16, 0x1

    goto :goto_7

    :cond_6
    const/16 v16, 0x0

    :goto_7
    const/4 v10, 0x0

    move-object v9, v15

    move-object v8, v12

    move-wide v12, v2

    move-wide/from16 v20, v5

    move-object v5, v14

    move/from16 v14, v16

    invoke-virtual/range {v9 .. v14}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    move-result-object v6

    check-cast v6, Ljava/nio/ByteBuffer;

    iget v6, v5, Le/e/a/FragmentMux117$Input;->track:I

    invoke-virtual {v4, v6, v7, v15}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    iput-wide v2, v5, Le/e/a/FragmentMux117$Input;->last:J

    iget-wide v9, v5, Le/e/a/FragmentMux117$Input;->end:J

    iget-wide v11, v8, Le/e/a/FragmentedMp4117$Sample;->durationUs:J

    invoke-static {v2, v3, v11, v12}, Le/e/a/FragmentedMp4117;->add(JJ)J

    move-result-wide v2

    invoke-static {v9, v10, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iput-wide v2, v5, Le/e/a/FragmentMux117$Input;->end:J

    iget-object v2, v5, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    invoke-virtual {v2}, Le/e/a/FragmentedMp4117$Cursor;->advance()Z

    invoke-static {}, Le/e/a/DownloadWorker115;->progress()V

    move-wide/from16 v5, v20

    const/4 v3, 0x0

    goto/16 :goto_2

    :cond_7
    new-instance v0, Ljava/io/IOException;

    const-string v2, "MP4\u8868\u793a\u6642\u523b\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_8
    throw v0

    :cond_8
    new-instance v0, Ljava/io/IOException;

    const-string v2, "MP4\u30d5\u30ec\u30fc\u30e0\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_8

    :cond_9
    move-wide/from16 v20, v5

    move-object v5, v14

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Le/e/a/FragmentMux117$Input;

    iget-object v2, v14, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    iget-object v2, v2, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    if-eqz v2, :cond_b

    if-eqz v5, :cond_a

    iget-object v2, v14, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    iget-object v2, v2, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget-wide v2, v2, Le/e/a/FragmentedMp4117$Sample;->timeUs:J

    iget-object v6, v5, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    iget-object v6, v6, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget-wide v10, v6, Le/e/a/FragmentedMp4117$Sample;->timeUs:J
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    cmp-long v2, v2, v10

    if-gez v2, :cond_b

    :cond_a
    goto :goto_9

    :cond_b
    move-object v14, v5

    :goto_9
    move-wide/from16 v5, v20

    const/4 v3, 0x0

    goto/16 :goto_3

    .line 13
    :catchall_0
    move-exception v0

    move-object v2, v4

    const/4 v3, 0x1

    goto :goto_b

    .line 10
    :cond_c
    move-wide/from16 v20, v5

    :try_start_6
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Le/e/a/FragmentMux117$Input;

    iget-object v3, v2, Le/e/a/FragmentMux117$Input;->format:Le/e/a/FragmentedMp4117$Format;

    iget-object v5, v3, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    invoke-virtual {v5, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    iget-object v5, v3, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    iget v6, v3, Le/e/a/FragmentedMp4117$Format;->width:I

    iget v8, v3, Le/e/a/FragmentedMp4117$Format;->height:I

    invoke-static {v5, v6, v8}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v5

    goto :goto_a

    :cond_d
    iget-object v5, v3, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    iget v6, v3, Le/e/a/FragmentedMp4117$Format;->rate:I

    iget v8, v3, Le/e/a/FragmentedMp4117$Format;->channels:I

    invoke-static {v5, v6, v8}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v5

    :goto_a
    const-string v6, "csd-0"

    iget-object v8, v3, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    invoke-static {v8}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v8

    invoke-virtual {v5, v6, v8}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    iget-object v6, v3, Le/e/a/FragmentedMp4117$Format;->csd1:[B

    if-eqz v6, :cond_e

    const-string v6, "csd-1"

    iget-object v3, v3, Le/e/a/FragmentedMp4117$Format;->csd1:[B

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v5, v6, v3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    :cond_e
    invoke-virtual {v4, v5}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v3

    iput v3, v2, Le/e/a/FragmentMux117$Input;->track:I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    move-wide/from16 v5, v20

    const/4 v3, 0x0

    goto/16 :goto_1

    .line 13
    :catchall_1
    move-exception v0

    move-object v2, v4

    const/4 v3, 0x0

    :goto_b
    move-object v4, v0

    goto/16 :goto_e

    .line 9
    :cond_f
    :try_start_7
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v2, "\u6620\u50cf\u307e\u305f\u306f\u97f3\u58f0\u306e\u30d5\u30e9\u30b0\u30e1\u30f3\u30c8\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 8
    :cond_10
    move-wide/from16 v20, v5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/File;

    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V

    new-instance v3, Le/e/a/FragmentedMp4117;

    invoke-direct {v3, v2}, Le/e/a/FragmentedMp4117;-><init>(Ljava/io/File;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, v3, Le/e/a/FragmentedMp4117;->formats:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-wide/from16 v5, v20

    :cond_11
    :goto_c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_12

    const/4 v3, 0x0

    goto/16 :goto_0

    :cond_12
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Le/e/a/FragmentedMp4117$Format;

    iget-object v11, v9, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    const-string v12, "audio/mp4a-latm"

    iget-object v13, v9, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v11, :cond_14

    if-eqz v12, :cond_13

    goto :goto_d

    :cond_13
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u3053\u306eMP4\u306e\u6620\u50cf\u30fb\u97f3\u58f0\u5f62\u5f0f\u306b\u306f\u5bfe\u5fdc\u3057\u3066\u3044\u307e\u305b\u3093"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_14
    :goto_d
    if-eqz v11, :cond_15

    if-nez v7, :cond_11

    :cond_15
    if-eqz v12, :cond_16

    if-eqz v8, :cond_16

    goto :goto_c

    :cond_16
    new-instance v13, Le/e/a/FragmentMux117$Input;

    invoke-direct {v13}, Le/e/a/FragmentMux117$Input;-><init>()V

    iput-object v3, v13, Le/e/a/FragmentMux117$Input;->movie:Le/e/a/FragmentedMp4117;

    iput-object v9, v13, Le/e/a/FragmentMux117$Input;->format:Le/e/a/FragmentedMp4117$Format;

    invoke-virtual {v3, v9}, Le/e/a/FragmentedMp4117;->cursor(Le/e/a/FragmentedMp4117$Format;)Le/e/a/FragmentedMp4117$Cursor;

    move-result-object v9

    iput-object v9, v13, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    iget-object v9, v13, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    iget-object v9, v9, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    if-nez v9, :cond_17

    goto :goto_c

    :cond_17
    iget-object v9, v13, Le/e/a/FragmentMux117$Input;->cursor:Le/e/a/FragmentedMp4117$Cursor;

    iget-object v9, v9, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget-wide v14, v9, Le/e/a/FragmentedMp4117$Sample;->timeUs:J

    invoke-static {v5, v6, v14, v15}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    invoke-interface {v0, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    or-int/2addr v7, v11

    or-int/2addr v8, v12

    goto :goto_c

    .line 13
    :catchall_2
    move-exception v0

    move-object v4, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_e
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1a

    if-eqz v2, :cond_19

    if-eqz v3, :cond_18

    :try_start_8
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->stop()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    goto :goto_10

    :catch_1
    move-exception v0

    :cond_18
    :goto_10
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->release()V

    :cond_19
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    throw v4

    :cond_1a
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/FragmentedMp4117;

    :try_start_9
    invoke-virtual {v0}, Le/e/a/FragmentedMp4117;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_2

    goto :goto_f

    :catch_2
    move-exception v0

    goto :goto_f
.end method
