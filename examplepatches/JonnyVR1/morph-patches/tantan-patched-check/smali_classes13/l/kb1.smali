.class public Ll/kb1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/Object;

.field private b:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

.field private c:Z

.field private d:I


# direct methods
.method public constructor <init>(II)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/kb1;->a:Ljava/lang/Object;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/kb1;->b:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/kb1;->c:Z

    .line 16
    .line 17
    iput p2, p0, Ll/kb1;->d:I

    .line 18
    .line 19
    const-string v0, "AudioLoopBack"

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, " startRecord  AudioLoopBack audioSampleRate:"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, ";mSampleChannels:"

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/kb1;->a:Ljava/lang/Object;

    .line 47
    .line 48
    monitor-enter v0

    .line 49
    :try_start_0
    iget-object v1, p0, Ll/kb1;->b:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 50
    .line 51
    if-nez v1, :cond_0

    .line 52
    .line 53
    new-instance v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 54
    .line 55
    invoke-direct {v1, p1, p2}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;-><init>(II)V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Ll/kb1;->b:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->play()V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    :goto_0
    monitor-exit v0

    .line 67
    return-void

    .line 68
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    throw p0
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/kb1;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/kb1;->b:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->stop()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ll/kb1;->b:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->release()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, p0, Ll/kb1;->b:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    return-void

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/kb1;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public c([BI)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/kb1;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-array v0, p2, [B

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {p1, v1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/kb1;->a:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter p1

    .line 14
    :try_start_0
    iget-object p0, p0, Ll/kb1;->b:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v0, p2}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->write([BI)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    monitor-exit p1

    .line 25
    return-void

    .line 26
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    throw p0

    .line 28
    :cond_1
    return-void
.end method
