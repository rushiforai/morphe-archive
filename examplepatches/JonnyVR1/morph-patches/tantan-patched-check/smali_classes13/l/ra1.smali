.class public Ll/ra1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ra1$a;
    }
.end annotation


# instance fields
.field private a:Ljava/util/List;

.field private b:Z

.field c:Lcom/immomo/mediabase/AudioParameter;

.field private d:Ll/yb1;

.field private final e:I

.field private f:Lcom/immomo/mediacore/audio/AudioProcess;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ljava/util/Collections;->synchronizedList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ll/ra1;->d:Ll/yb1;

    .line 17
    .line 18
    const/16 v0, 0x800

    .line 19
    .line 20
    iput v0, p0, Ll/ra1;->e:I

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;JJZZ)Z
    .locals 2

    .line 1
    move-object v0, p0

    .line 2
    new-instance p0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 3
    .line 4
    iget-object v1, v0, Ll/ra1;->c:Lcom/immomo/mediabase/AudioParameter;

    .line 5
    .line 6
    invoke-direct {p0, v1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;-><init>(Lcom/immomo/mediabase/AudioParameter;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/ra1;->b(I)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-object v1, v0, Ll/ra1;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->setDecoderListener(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecodeListener;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual/range {p0 .. p8}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->setDecodeSource(ILjava/lang/String;JJZZ)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->startDecode()V

    .line 32
    .line 33
    .line 34
    return v1

    .line 35
    :cond_1
    invoke-virtual {p0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->release()V

    .line 36
    .line 37
    .line 38
    return v1
.end method

.method public b(I)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ra1;->e(I)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x1

    .line 10
    return p0
.end method

.method public c(Ll/ra1$a;)V
    .locals 14

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_2

    .line 4
    .line 5
    :cond_0
    iget-object v1, p0, Ll/ra1;->a:Ljava/util/List;

    .line 6
    .line 7
    monitor-enter v1

    .line 8
    :try_start_0
    iget-object p0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const/4 v0, 0x0

    .line 15
    move-object v7, v0

    .line 16
    move-object v13, v7

    .line 17
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_5

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getSampleFrame()Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object v8

    .line 35
    if-eqz v8, :cond_1

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isMutePlayback()Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    const/4 v9, 0x0

    .line 42
    const/16 v10, 0x800

    .line 43
    .line 44
    if-nez v2, :cond_3

    .line 45
    .line 46
    if-nez v7, :cond_2

    .line 47
    .line 48
    invoke-static {v10}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getPlaybackVolume()F

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-static {v2, v10, v3, v4}, Lcom/immomo/mediabase/AudioMixerNative;->setVolume_Native([BIF[B)I

    .line 65
    .line 66
    .line 67
    invoke-virtual {v7, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :catchall_0
    move-exception v0

    .line 72
    move-object p0, v0

    .line 73
    goto :goto_3

    .line 74
    :cond_2
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-virtual {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getPlaybackVolume()F

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    const/16 v6, 0x800

    .line 87
    .line 88
    const/high16 v3, 0x3f800000    # 1.0f

    .line 89
    .line 90
    invoke-static/range {v2 .. v7}, Lcom/immomo/mediabase/AudioMixerNative;->mixPcmData_Native([BF[BFILjava/nio/ByteBuffer;)I

    .line 91
    .line 92
    .line 93
    :cond_3
    :goto_1
    invoke-virtual {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isPublish()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-eqz v2, :cond_1

    .line 98
    .line 99
    invoke-virtual {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->isMuteSendout()Z

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    if-nez v2, :cond_1

    .line 104
    .line 105
    if-nez v13, :cond_4

    .line 106
    .line 107
    invoke-static {v10}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->array()[B

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getSendoutVolume()F

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    invoke-static {v3, v10, v0, v4}, Lcom/immomo/mediabase/AudioMixerNative;->setVolume_Native([BIF[B)I

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 127
    .line 128
    .line 129
    move-object v13, v2

    .line 130
    goto :goto_0

    .line 131
    :cond_4
    move-object v2, v8

    .line 132
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->array()[B

    .line 133
    .line 134
    .line 135
    move-result-object v8

    .line 136
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 137
    .line 138
    .line 139
    move-result-object v10

    .line 140
    invoke-virtual {v0}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getSendoutVolume()F

    .line 141
    .line 142
    .line 143
    move-result v11

    .line 144
    const/16 v12, 0x800

    .line 145
    .line 146
    const/high16 v9, 0x3f800000    # 1.0f

    .line 147
    .line 148
    invoke-static/range {v8 .. v13}, Lcom/immomo/mediabase/AudioMixerNative;->mixPcmData_Native([BF[BFILjava/nio/ByteBuffer;)I

    .line 149
    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_5
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    if-eqz v7, :cond_6

    .line 155
    .line 156
    invoke-interface {p1, v7}, Ll/ra1$a;->a(Ljava/nio/ByteBuffer;)V

    .line 157
    .line 158
    .line 159
    :cond_6
    if-eqz v13, :cond_7

    .line 160
    .line 161
    invoke-interface {p1, v13}, Ll/ra1$a;->b(Ljava/nio/ByteBuffer;)V

    .line 162
    .line 163
    .line 164
    :cond_7
    :goto_2
    return-void

    .line 165
    :goto_3
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 166
    throw p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public e(I)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getId()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-ne v2, p1, :cond_0

    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-object v1

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    monitor-exit v0

    .line 35
    const/4 p0, 0x0

    .line 36
    return-object p0

    .line 37
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/ra1;->a:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 21
    .line 22
    invoke-virtual {v2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->stopDecode()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->release()V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object p0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    throw p0
.end method

.method public g(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ra1;->e(I)Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->stopDecode()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->release()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public h(Ll/yb1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ra1;->d:Ll/yb1;

    .line 2
    .line 3
    return-void
.end method

.method public i(ZLcom/immomo/mediabase/AudioParameter;)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ll/ra1;->b:Z

    .line 2
    .line 3
    iput-object p2, p0, Ll/ra1;->c:Lcom/immomo/mediabase/AudioParameter;

    .line 4
    .line 5
    iget-object v0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object p0, p0, Ll/ra1;->a:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;

    .line 25
    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    invoke-virtual {v1, p1, p2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->setEnableResample(ZLcom/immomo/mediabase/AudioParameter;)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    monitor-exit v0

    .line 35
    return-void

    .line 36
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public onDecodeFinished(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ra1;->d:Ll/yb1;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getId()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, v0, p1}, Ll/yb1;->c(ILjava/lang/String;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onDecoderError(ILcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ra1;->d:Ll/yb1;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getId()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    const-string v1, "\u89e3\u7801\u5931\u8d25"

    .line 16
    .line 17
    invoke-virtual {p0, v0, p2, p1, v1}, Ll/yb1;->b(ILjava/lang/String;ILjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public onForamtChange(Landroid/media/MediaFormat;Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
    .locals 1

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ra1;->d:Ll/yb1;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getId()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p2}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p0, v0, p2, p1}, Ll/yb1;->e(ILjava/lang/String;Landroid/media/MediaFormat;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onPlayFinished(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ra1;->d:Ll/yb1;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getId()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/yb1;->g(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onPlayStart(Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/ra1;->d:Ll/yb1;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getId()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-virtual {p0, p1}, Ll/yb1;->i(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onProcessFrame(Ljava/nio/ByteBuffer;JLcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    if-eqz p4, :cond_1

    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p4}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getPitch()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object p2, p0, Ll/ra1;->f:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 11
    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    new-instance p2, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 15
    .line 16
    invoke-direct {p2}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p2, p0, Ll/ra1;->f:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 20
    .line 21
    iget-object p3, p0, Ll/ra1;->c:Lcom/immomo/mediabase/AudioParameter;

    .line 22
    .line 23
    invoke-virtual {p3}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 24
    .line 25
    .line 26
    move-result p3

    .line 27
    iget-object v0, p0, Ll/ra1;->c:Lcom/immomo/mediabase/AudioParameter;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/16 v1, 0x400

    .line 34
    .line 35
    invoke-virtual {p2, p3, v0, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEf(III)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    iget-object p2, p0, Ll/ra1;->f:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p4}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getPitch()I

    .line 48
    .line 49
    .line 50
    move-result p3

    .line 51
    const/16 p4, 0x800

    .line 52
    .line 53
    invoke-virtual {p2, p1, p4, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->processAudioPitch([BII)[B

    .line 54
    .line 55
    .line 56
    :cond_1
    monitor-exit p0

    .line 57
    return-void

    .line 58
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p1
.end method

.method public onResampleOpen(Lcom/immomo/mediabase/AudioParameter;Lcom/immomo/mediabase/AudioParameter;Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;)V
    .locals 7

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/ra1;->d:Ll/yb1;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p3}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getId()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p3}, Lcom/immomo/mediabase/MultiAudioPlayer/AudioFileDecode;->getUrl()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    invoke-virtual {p2}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    invoke-virtual {p2}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-virtual/range {v0 .. v6}, Ll/yb1;->d(ILjava/lang/String;IIII)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method
