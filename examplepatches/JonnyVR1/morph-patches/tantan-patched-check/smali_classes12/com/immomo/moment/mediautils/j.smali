.class public Lcom/immomo/moment/mediautils/j;
.super Lcom/immomo/moment/mediautils/f;
.source "SourceFile"


# instance fields
.field private final b:Ljava/lang/String;

.field private c:Landroid/media/MediaExtractor;

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/media/MediaFormat;",
            ">;"
        }
    .end annotation
.end field

.field private e:I

.field private f:I

.field private g:I

.field private h:Ljava/lang/Object;

.field private final i:Ljava/lang/String;

.field private j:Landroid/media/MediaFormat;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/f;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MediaDemuxerWrapper"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/moment/mediautils/j;->b:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 10
    .line 11
    const/high16 v0, 0x100000

    .line 12
    .line 13
    iput v0, p0, Lcom/immomo/moment/mediautils/j;->e:I

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    iput v0, p0, Lcom/immomo/moment/mediautils/j;->f:I

    .line 17
    .line 18
    iput v0, p0, Lcom/immomo/moment/mediautils/j;->g:I

    .line 19
    .line 20
    new-instance v0, Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/immomo/moment/mediautils/j;->h:Ljava/lang/Object;

    .line 26
    .line 27
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/immomo/moment/mediautils/j;->i:Ljava/lang/String;

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/immomo/moment/mediautils/j;->d:Ljava/util/List;

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/moment/mediautils/j;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/media/MediaFormat;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/j;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/j;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-nez v1, :cond_4

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :try_start_1
    new-instance v2, Landroid/media/MediaExtractor;

    .line 10
    .line 11
    invoke-direct {v2}, Landroid/media/MediaExtractor;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v2, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 15
    .line 16
    invoke-virtual {v2, p1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 20
    .line 21
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    move v3, v1

    .line 26
    :goto_0
    if-ge v3, v2, :cond_2

    .line 27
    .line 28
    iget-object v4, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 29
    .line 30
    invoke-virtual {v4, v3}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    iget-object v5, p0, Lcom/immomo/moment/mediautils/j;->d:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    const-string v5, "mime"

    .line 40
    .line 41
    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    const-string v6, "audio"

    .line 46
    .line 47
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v5

    .line 51
    if-eqz v5, :cond_0

    .line 52
    .line 53
    iput v3, p0, Lcom/immomo/moment/mediautils/j;->f:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catchall_0
    move-exception p0

    .line 57
    goto :goto_4

    .line 58
    :catch_0
    move-exception v2

    .line 59
    goto :goto_2

    .line 60
    :cond_0
    const-string v5, "mime"

    .line 61
    .line 62
    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    const-string v5, "video"

    .line 67
    .line 68
    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    if-eqz v4, :cond_1

    .line 73
    .line 74
    iput v3, p0, Lcom/immomo/moment/mediautils/j;->g:I

    .line 75
    .line 76
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const-string v2, "MediaDemuxerWrapper"

    .line 80
    .line 81
    new-instance v3, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    const-string v4, "durations is "

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v4, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 92
    .line 93
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getCachedDuration()J

    .line 94
    .line 95
    .line 96
    move-result-wide v4

    .line 97
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string v4, "  "

    .line 101
    .line 102
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-static {v2, v3}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :goto_2
    :try_start_2
    const-string v3, "MediaDemuxerWrapper"

    .line 114
    .line 115
    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-static {v3, v4}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Lcom/immomo/moment/mediautils/f;->a:Lcom/immomo/moment/mediautils/f$a;

    .line 123
    .line 124
    if-eqz p0, :cond_3

    .line 125
    .line 126
    new-instance v3, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    invoke-static {v2}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v2, " file:"

    .line 139
    .line 140
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    invoke-interface {p0, p1}, Lcom/immomo/moment/mediautils/f$a;->a(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_3
    monitor-exit v0

    .line 154
    return v1

    .line 155
    :cond_4
    :goto_3
    monitor-exit v0

    .line 156
    const/4 p0, 0x1

    .line 157
    return p0

    .line 158
    :goto_4
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 159
    throw p0
.end method

.method public d(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I
    .locals 10

    .line 1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/j;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    const/4 v0, -0x1

    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v2, 0x0

    .line 11
    :try_start_0
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 12
    .line 13
    .line 14
    iget-object v3, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 15
    .line 16
    invoke-virtual {v3, p1, v2}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 17
    .line 18
    .line 19
    move-result v6

    .line 20
    if-lez v6, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iget-object v2, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 32
    .line 33
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 34
    .line 35
    .line 36
    move-result-wide v7

    .line 37
    if-eq p1, v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    move-object p0, v0

    .line 47
    goto :goto_2

    .line 48
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getSampleFlags()I

    .line 51
    .line 52
    .line 53
    move-result v9

    .line 54
    const/4 v5, 0x0

    .line 55
    move-object v4, p2

    .line 56
    invoke-virtual/range {v4 .. v9}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/media/MediaExtractor;->advance()Z

    .line 62
    .line 63
    .line 64
    :cond_2
    monitor-exit v1

    .line 65
    return v6

    .line 66
    :cond_3
    :goto_1
    monitor-exit v1

    .line 67
    return v0

    .line 68
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    throw p0
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/j;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->release()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-object v1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/j;->d:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 20
    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    iput v1, p0, Lcom/immomo/moment/mediautils/j;->f:I

    .line 24
    .line 25
    iput v1, p0, Lcom/immomo/moment/mediautils/j;->g:I

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method

.method public f(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/j;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, p1, p2, v1}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit v0

    .line 16
    return-void

    .line 17
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p0
.end method

.method public g(Landroid/media/MediaFormat;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/j;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_2

    .line 8
    .line 9
    iput-object p1, p0, Lcom/immomo/moment/mediautils/j;->j:Landroid/media/MediaFormat;

    .line 10
    .line 11
    const-string v1, "mime"

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    :goto_0
    if-ge v2, v1, :cond_1

    .line 24
    .line 25
    iget-object v3, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 26
    .line 27
    invoke-virtual {v3, v2}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    const-string v4, "mime"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {p1, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    if-nez v4, :cond_0

    .line 42
    .line 43
    iget-object v4, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 44
    .line 45
    invoke-virtual {v4, v2}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 46
    .line 47
    .line 48
    const-string v4, "max-input-size"

    .line 49
    .line 50
    invoke-virtual {v3, v4}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    if-eqz v4, :cond_0

    .line 55
    .line 56
    const-string v4, "max-input-size"

    .line 57
    .line 58
    invoke-virtual {v3, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    iget v4, p0, Lcom/immomo/moment/mediautils/j;->e:I

    .line 63
    .line 64
    if-ge v4, v3, :cond_0

    .line 65
    .line 66
    add-int/lit16 v3, v3, 0xc8

    .line 67
    .line 68
    iput v3, p0, Lcom/immomo/moment/mediautils/j;->e:I

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :catchall_0
    move-exception p0

    .line 72
    goto :goto_2

    .line 73
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    const/4 p0, 0x1

    .line 77
    monitor-exit v0

    .line 78
    return p0

    .line 79
    :cond_2
    const-string p0, "MediaDemuxerWrapper"

    .line 80
    .line 81
    const-string p1, "Mp4Demuxer not init !!"

    .line 82
    .line 83
    invoke-static {p0, p1}, Ll/lyv;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    .line 85
    .line 86
    monitor-exit v0

    .line 87
    return v2

    .line 88
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    throw p0
.end method

.method public i(Ll/ad60;)Ll/ad60;
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/j;->h:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    :try_start_0
    new-instance p1, Ll/ad60;

    .line 7
    .line 8
    iget v0, p0, Lcom/immomo/moment/mediautils/j;->e:I

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/ad60;-><init>(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    move-object v2, p1

    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    move-object p0, v0

    .line 17
    goto :goto_2

    .line 18
    :goto_0
    invoke-virtual {v2}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 24
    .line 25
    .line 26
    iget-object v3, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 27
    .line 28
    invoke-virtual {v3, p1, v0}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-lez v3, :cond_4

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget-object v4, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 44
    .line 45
    invoke-virtual {v4}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 46
    .line 47
    .line 48
    move-result-wide v6

    .line 49
    iget v4, p0, Lcom/immomo/moment/mediautils/j;->f:I

    .line 50
    .line 51
    if-ne v0, v4, :cond_1

    .line 52
    .line 53
    iget-object p1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 54
    .line 55
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getSampleFlags()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    const/4 v8, 0x0

    .line 60
    const/4 v4, 0x0

    .line 61
    invoke-virtual/range {v2 .. v8}, Ll/ad60;->d(IIIJI)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    iget v4, p0, Lcom/immomo/moment/mediautils/j;->g:I

    .line 66
    .line 67
    if-ne v0, v4, :cond_3

    .line 68
    .line 69
    iget-object v0, p0, Lcom/immomo/moment/mediautils/j;->i:Ljava/lang/String;

    .line 70
    .line 71
    const-string v4, "huawei"

    .line 72
    .line 73
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    sub-int/2addr v0, p1

    .line 88
    const/16 p1, 0x8

    .line 89
    .line 90
    if-le v0, p1, :cond_2

    .line 91
    .line 92
    add-int/2addr v3, p1

    .line 93
    iget-object p1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getSampleFlags()I

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    const/4 v8, 0x1

    .line 100
    const/4 v4, 0x0

    .line 101
    invoke-virtual/range {v2 .. v8}, Ll/ad60;->d(IIIJI)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    iget-object p1, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 106
    .line 107
    invoke-virtual {p1}, Landroid/media/MediaExtractor;->getSampleFlags()I

    .line 108
    .line 109
    .line 110
    move-result v5

    .line 111
    const/4 v8, 0x1

    .line 112
    const/4 v4, 0x0

    .line 113
    invoke-virtual/range {v2 .. v8}, Ll/ad60;->d(IIIJI)V

    .line 114
    .line 115
    .line 116
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/j;->c:Landroid/media/MediaExtractor;

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/media/MediaExtractor;->advance()Z

    .line 119
    .line 120
    .line 121
    monitor-exit v1

    .line 122
    return-object v2

    .line 123
    :cond_4
    const/4 p0, 0x0

    .line 124
    monitor-exit v1

    .line 125
    return-object p0

    .line 126
    :goto_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    throw p0
.end method

.method public j(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/j;->e()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_2

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/j;->c(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    const/4 v0, 0x0

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/immomo/moment/mediautils/j;->d:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Landroid/media/MediaFormat;

    .line 31
    .line 32
    invoke-virtual {p0, v1}, Lcom/immomo/moment/mediautils/j;->g(Landroid/media/MediaFormat;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-nez v1, :cond_1

    .line 37
    .line 38
    return v0

    .line 39
    :cond_2
    const/4 p0, 0x1

    .line 40
    return p0
.end method
