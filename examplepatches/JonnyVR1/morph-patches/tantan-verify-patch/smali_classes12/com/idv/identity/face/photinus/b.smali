.class public Lcom/idv/identity/face/photinus/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/face/photinus/b$a;
    }
.end annotation


# static fields
.field private static a:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 0

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

.method private static a(ZLandroid/media/MediaCodec$BufferInfo;Lcom/idv/identity/face/photinus/b$a;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    :cond_0
    iget-object v0, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_1
    :goto_0
    iget-object v1, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 15
    .line 16
    const-wide/16 v2, 0x2710

    .line 17
    .line 18
    invoke-virtual {v1, p1, v2, v3}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, -0x1

    .line 23
    if-ne v1, v2, :cond_2

    .line 24
    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_2
    const/4 v2, -0x3

    .line 30
    if-ne v1, v2, :cond_3

    .line 31
    .line 32
    iget-object v0, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    goto :goto_0

    .line 39
    :cond_3
    const/4 v2, -0x2

    .line 40
    if-ne v1, v2, :cond_5

    .line 41
    .line 42
    iget-boolean v1, p2, Lcom/idv/identity/face/photinus/b$a;->d:Z

    .line 43
    .line 44
    if-nez v1, :cond_4

    .line 45
    .line 46
    iget-object v1, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v2, p2, Lcom/idv/identity/face/photinus/b$a;->b:Landroid/media/MediaMuxer;

    .line 53
    .line 54
    invoke-virtual {v2, v1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iput v1, p2, Lcom/idv/identity/face/photinus/b$a;->e:I

    .line 59
    .line 60
    iget-object v1, p2, Lcom/idv/identity/face/photinus/b$a;->b:Landroid/media/MediaMuxer;

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->start()V

    .line 63
    .line 64
    .line 65
    const/4 v1, 0x1

    .line 66
    iput-boolean v1, p2, Lcom/idv/identity/face/photinus/b$a;->d:Z

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    const-string p0, "format changed twice"

    .line 70
    .line 71
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_5
    if-gez v1, :cond_6

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_6
    aget-object v2, v0, v1

    .line 79
    .line 80
    if-eqz v2, :cond_a

    .line 81
    .line 82
    iget v3, p1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 83
    .line 84
    and-int/lit8 v3, v3, 0x2

    .line 85
    .line 86
    const/4 v4, 0x0

    .line 87
    if-eqz v3, :cond_7

    .line 88
    .line 89
    iput v4, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 90
    .line 91
    :cond_7
    iget v3, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 92
    .line 93
    if-eqz v3, :cond_9

    .line 94
    .line 95
    iget-boolean v3, p2, Lcom/idv/identity/face/photinus/b$a;->d:Z

    .line 96
    .line 97
    if-eqz v3, :cond_8

    .line 98
    .line 99
    iget v3, p1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 100
    .line 101
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 102
    .line 103
    .line 104
    iget v3, p1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 105
    .line 106
    iget v5, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 107
    .line 108
    add-int/2addr v3, v5

    .line 109
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 110
    .line 111
    .line 112
    :try_start_1
    iget-object v3, p2, Lcom/idv/identity/face/photinus/b$a;->b:Landroid/media/MediaMuxer;

    .line 113
    .line 114
    iget v5, p2, Lcom/idv/identity/face/photinus/b$a;->e:I

    .line 115
    .line 116
    invoke-virtual {v3, v5, v2, p1}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 117
    .line 118
    .line 119
    goto :goto_1

    .line 120
    :cond_8
    const-string p0, "muxer hasn\'t started"

    .line 121
    .line 122
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :catch_1
    :cond_9
    :goto_1
    iget-object v2, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 127
    .line 128
    invoke-virtual {v2, v1, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 129
    .line 130
    .line 131
    iget v1, p1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 132
    .line 133
    and-int/lit8 v1, v1, 0x4

    .line 134
    .line 135
    if-eqz v1, :cond_1

    .line 136
    .line 137
    :goto_2
    return-void

    .line 138
    :cond_a
    new-instance p0, Ljava/lang/Exception;

    .line 139
    .line 140
    new-instance p1, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string p2, "encoderOutputBuffer "

    .line 143
    .line 144
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string p2, " was null"

    .line 151
    .line 152
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    throw p0
.end method

.method public static b(Landroid/content/Context;Ljava/util/List;IIILjava/lang/String;Lcom/idv/identity/face/photinus/VideoFormatConfig;Ll/ep50;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/nio/ByteBuffer;",
            ">;III",
            "Ljava/lang/String;",
            "Lcom/idv/identity/face/photinus/VideoFormatConfig;",
            "Ll/ep50;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    sput-boolean v0, Lcom/idv/identity/face/photinus/b;->a:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    move-object v2, p0

    .line 6
    move v7, p2

    .line 7
    move v3, p3

    .line 8
    move v4, p4

    .line 9
    move-object v5, p5

    .line 10
    move-object v6, p6

    .line 11
    :try_start_0
    invoke-static/range {v2 .. v7}, Lcom/idv/identity/face/photinus/b;->d(Landroid/content/Context;IILjava/lang/String;Lcom/idv/identity/face/photinus/VideoFormatConfig;I)Lcom/idv/identity/face/photinus/b$a;

    .line 12
    .line 13
    .line 14
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception v0

    .line 17
    move-object p0, v0

    .line 18
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p7, p0}, Ll/ep50;->b(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    move-object p0, v1

    .line 26
    :goto_0
    if-eqz p0, :cond_3

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/idv/identity/face/photinus/b$a;->a()Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-eqz p2, :cond_3

    .line 33
    .line 34
    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 p2, 0x0

    .line 39
    move p3, p2

    .line 40
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result p4

    .line 44
    if-eqz p4, :cond_0

    .line 45
    .line 46
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    check-cast p4, Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->array()[B

    .line 53
    .line 54
    .line 55
    move-result-object p4

    .line 56
    invoke-static {p4, v3, v4, v7}, Lcom/idv/identity/face/photinus/VideoWriter;->F([BIII)[B

    .line 57
    .line 58
    .line 59
    move-result-object p4

    .line 60
    invoke-static {p3, p4, p0}, Lcom/idv/identity/face/photinus/b;->c(I[BLcom/idv/identity/face/photinus/b$a;)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 p3, p3, 0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :catch_1
    move-exception v0

    .line 67
    move-object p0, v0

    .line 68
    goto :goto_2

    .line 69
    :cond_0
    invoke-static {p3, v1, p0}, Lcom/idv/identity/face/photinus/b;->c(I[BLcom/idv/identity/face/photinus/b$a;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 73
    .line 74
    if-eqz p1, :cond_1

    .line 75
    .line 76
    invoke-virtual {p1}, Landroid/media/MediaCodec;->stop()V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 80
    .line 81
    invoke-virtual {p1}, Landroid/media/MediaCodec;->release()V

    .line 82
    .line 83
    .line 84
    iput-object v1, p0, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 85
    .line 86
    :cond_1
    iget-object p1, p0, Lcom/idv/identity/face/photinus/b$a;->b:Landroid/media/MediaMuxer;

    .line 87
    .line 88
    if-eqz p1, :cond_2

    .line 89
    .line 90
    invoke-virtual {p1}, Landroid/media/MediaMuxer;->stop()V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/idv/identity/face/photinus/b$a;->b:Landroid/media/MediaMuxer;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/media/MediaMuxer;->release()V

    .line 96
    .line 97
    .line 98
    iput-object v1, p0, Lcom/idv/identity/face/photinus/b$a;->b:Landroid/media/MediaMuxer;

    .line 99
    .line 100
    iput-boolean p2, p0, Lcom/idv/identity/face/photinus/b$a;->d:Z

    .line 101
    .line 102
    :cond_2
    iget-object p0, p0, Lcom/idv/identity/face/photinus/b$a;->c:Ljava/io/File;

    .line 103
    .line 104
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-interface {p7, p0}, Ll/ep50;->a(Landroid/net/Uri;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 109
    .line 110
    .line 111
    goto :goto_3

    .line 112
    :goto_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-interface {p7, p0}, Ll/ep50;->b(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_3
    :goto_3
    return-void
.end method

.method private static c(I[BLcom/idv/identity/face/photinus/b$a;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 13
    .line 14
    const-wide/16 v3, 0x2710

    .line 15
    .line 16
    invoke-virtual {v2, v3, v4}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 17
    .line 18
    .line 19
    move-result v6

    .line 20
    if-ltz v6, :cond_2

    .line 21
    .line 22
    invoke-static {p0}, Lcom/idv/identity/face/photinus/VideoWriter;->x(I)J

    .line 23
    .line 24
    .line 25
    move-result-wide v9

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    iget-object v5, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 29
    .line 30
    const/4 v8, 0x0

    .line 31
    const/4 v11, 0x4

    .line 32
    const/4 v7, 0x0

    .line 33
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    invoke-static {p0, v1, p2}, Lcom/idv/identity/face/photinus/b;->a(ZLandroid/media/MediaCodec$BufferInfo;Lcom/idv/identity/face/photinus/b$a;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    aget-object p0, v0, v6

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-ne v0, v2, :cond_1

    .line 58
    .line 59
    iget-object v5, p2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 60
    .line 61
    array-length v8, p1

    .line 62
    const/4 v11, 0x0

    .line 63
    const/4 v7, 0x0

    .line 64
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    invoke-static {p0, v1, p2}, Lcom/idv/identity/face/photinus/b;->a(ZLandroid/media/MediaCodec$BufferInfo;Lcom/idv/identity/face/photinus/b$a;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_1
    invoke-virtual {p0}, Ljava/nio/Buffer;->position()I

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    invoke-virtual {p0}, Ljava/nio/Buffer;->capacity()I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    invoke-virtual {p0}, Ljava/nio/Buffer;->limit()I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    new-instance v0, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string v1, "position="

    .line 87
    .line 88
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string p1, "   capacity="

    .line 95
    .line 96
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p1, "limit="

    .line 103
    .line 104
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    new-instance p1, Ljava/lang/Exception;

    .line 115
    .line 116
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :cond_2
    return-void
.end method

.method private static d(Landroid/content/Context;IILjava/lang/String;Lcom/idv/identity/face/photinus/VideoFormatConfig;I)Lcom/idv/identity/face/photinus/b$a;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const-string v0, "video/avc"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/face/photinus/b;->e(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Lcom/idv/identity/face/photinus/b$a;

    .line 8
    .line 9
    invoke-direct {v2}, Lcom/idv/identity/face/photinus/b$a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v3, "Phontinus"

    .line 21
    .line 22
    invoke-static {p0, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance v3, Ljava/io/File;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    if-nez v4, :cond_0

    .line 40
    .line 41
    invoke-virtual {v3}, Ljava/io/File;->mkdir()Z

    .line 42
    .line 43
    .line 44
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string p3, ".mp4"

    .line 53
    .line 54
    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    invoke-static {p0, p3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    new-instance p3, Ljava/io/File;

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-direct {p3, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iput-object p3, v2, Lcom/idv/identity/face/photinus/b$a;->c:Ljava/io/File;

    .line 75
    .line 76
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    .line 77
    .line 78
    .line 79
    move-result p0

    .line 80
    if-eqz p0, :cond_1

    .line 81
    .line 82
    iget-object p0, v2, Lcom/idv/identity/face/photinus/b$a;->c:Ljava/io/File;

    .line 83
    .line 84
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    .line 85
    .line 86
    .line 87
    :cond_1
    const/16 p0, 0x5a

    .line 88
    .line 89
    if-eq p5, p0, :cond_3

    .line 90
    .line 91
    const/16 p0, 0x10e

    .line 92
    .line 93
    if-ne p5, p0, :cond_2

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    goto :goto_1

    .line 101
    :cond_3
    :goto_0
    invoke-static {v0, p2, p1}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    :goto_1
    const-string p1, "color-format"

    .line 106
    .line 107
    const/16 p2, 0x15

    .line 108
    .line 109
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 110
    .line 111
    .line 112
    const-string p1, "bitrate"

    .line 113
    .line 114
    invoke-virtual {p4}, Lcom/idv/identity/face/photinus/VideoFormatConfig;->getBitRate()I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    const-string p1, "frame-rate"

    .line 122
    .line 123
    invoke-virtual {p4}, Lcom/idv/identity/face/photinus/VideoFormatConfig;->getFrameRate()I

    .line 124
    .line 125
    .line 126
    move-result p2

    .line 127
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 128
    .line 129
    .line 130
    const-string p1, "i-frame-interval"

    .line 131
    .line 132
    const/16 p2, 0xa

    .line 133
    .line 134
    invoke-virtual {p0, p1, p2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 135
    .line 136
    .line 137
    :try_start_0
    invoke-virtual {v1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-static {p1}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, v2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 146
    .line 147
    const/4 p2, 0x1

    .line 148
    const/4 p3, 0x0

    .line 149
    invoke-virtual {p1, p0, p3, p3, p2}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 150
    .line 151
    .line 152
    iget-object p0, v2, Lcom/idv/identity/face/photinus/b$a;->a:Landroid/media/MediaCodec;

    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/media/MediaCodec;->start()V

    .line 155
    .line 156
    .line 157
    iget-object p0, v2, Lcom/idv/identity/face/photinus/b$a;->c:Ljava/io/File;

    .line 158
    .line 159
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    :try_start_1
    new-instance p1, Landroid/media/MediaMuxer;

    .line 164
    .line 165
    const/4 p2, 0x0

    .line 166
    invoke-direct {p1, p0, p2}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 167
    .line 168
    .line 169
    iput-object p1, v2, Lcom/idv/identity/face/photinus/b$a;->b:Landroid/media/MediaMuxer;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 170
    .line 171
    return-object v2

    .line 172
    :catch_0
    move-exception p0

    .line 173
    new-instance p1, Ljava/lang/Exception;

    .line 174
    .line 175
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    new-instance p2, Ljava/lang/StringBuilder;

    .line 180
    .line 181
    const-string p3, "create muxer error, msg = "

    .line 182
    .line 183
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    throw p1

    .line 197
    :catch_1
    move-exception p0

    .line 198
    new-instance p1, Ljava/lang/Exception;

    .line 199
    .line 200
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    new-instance p2, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    const-string p3, "create codec by name error, msg = "

    .line 207
    .line 208
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    throw p1
.end method

.method private static e(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/idv/identity/face/photinus/b;->f(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    move v2, v1

    .line 14
    :goto_0
    if-ge v2, v0, :cond_4

    .line 15
    .line 16
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-nez v4, :cond_1

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_1
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    array-length v5, v4

    .line 32
    move v6, v1

    .line 33
    :goto_1
    if-ge v6, v5, :cond_3

    .line 34
    .line 35
    aget-object v7, v4, v6

    .line 36
    .line 37
    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eqz v7, :cond_2

    .line 42
    .line 43
    return-object v3

    .line 44
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_4
    const-string p0, "not support mimeType"

    .line 51
    .line 52
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method

.method private static f(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 9

    .line 1
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

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
    if-ge v2, v0, :cond_4

    .line 8
    .line 9
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-nez v4, :cond_1

    .line 25
    .line 26
    const-string v4, ""

    .line 27
    .line 28
    :cond_1
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    array-length v6, v5

    .line 33
    move v7, v1

    .line 34
    :goto_1
    if-ge v7, v6, :cond_3

    .line 35
    .line 36
    aget-object v8, v5, v7

    .line 37
    .line 38
    invoke-virtual {v8, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v8

    .line 42
    if-eqz v8, :cond_2

    .line 43
    .line 44
    const-string v8, "google"

    .line 45
    .line 46
    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    if-eqz v8, :cond_2

    .line 51
    .line 52
    return-object v3

    .line 53
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_4
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method
