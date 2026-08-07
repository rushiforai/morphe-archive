.class public final Ll/rog0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltech/sud/gip/core/ISudAiAgent;


# instance fields
.field public final a:Ljava/lang/String;

.field public b:J

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Ljava/lang/String;

.field public h:Ll/uwg0;

.field public i:Ll/pkg0;

.field public j:Ltech/sud/gip/core/ISudListenerAiAgent;

.field public k:Z

.field public l:Ll/xkg0;

.field public m:Z

.field public n:Z

.field public o:Ll/hkg0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-class v0, Ll/rog0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "SudGIP "

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/rog0;->a:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final declared-synchronized a()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 3
    .line 4
    const-string v1, "stopASR currentIsRunning:"

    .line 5
    .line 6
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-boolean v1, p0, Ll/rog0;->f:Z

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "AiAgentImpl"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/rog0;->a:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v2, "stopASR currentIsRunning:"

    .line 28
    .line 29
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-boolean v2, p0, Ll/rog0;->f:Z

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-boolean v0, p0, Ll/rog0;->f:Z

    .line 45
    .line 46
    if-nez v0, :cond_0

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_0
    const/4 v0, 0x0

    .line 50
    iput-boolean v0, p0, Ll/rog0;->f:Z

    .line 51
    .line 52
    iget-object v1, p0, Ll/rog0;->h:Ll/uwg0;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    iget-object v1, p0, Ll/rog0;->i:Ll/pkg0;

    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-object v3, v1, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 62
    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    invoke-virtual {v3, v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->offer(B)Z

    .line 66
    .line 67
    .line 68
    iput-object v2, v1, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catchall_0
    move-exception v0

    .line 72
    goto :goto_2

    .line 73
    :cond_1
    :goto_0
    iput-object v2, p0, Ll/rog0;->i:Ll/pkg0;

    .line 74
    .line 75
    :cond_2
    iget-object v0, p0, Ll/rog0;->h:Ll/uwg0;

    .line 76
    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    invoke-virtual {v0}, Ll/uwg0;->l()V

    .line 80
    .line 81
    .line 82
    iput-object v2, p0, Ll/rog0;->h:Ll/uwg0;

    .line 83
    .line 84
    const-string v0, "AiAgentImpl"

    .line 85
    .line 86
    const-string v1, "Continuous recognition stopped."

    .line 87
    .line 88
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Ll/rog0;->a:Ljava/lang/String;

    .line 92
    .line 93
    const-string v1, "Continuous recognition stopped."

    .line 94
    .line 95
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    .line 97
    .line 98
    monitor-exit p0

    .line 99
    return-void

    .line 100
    :cond_3
    :goto_1
    monitor-exit p0

    .line 101
    return-void

    .line 102
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    throw v0
.end method

.method public final pauseAudio()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/rog0;->h:Ll/uwg0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/uwg0;->a:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "pauseRecognize"

    .line 8
    .line 9
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const-string v0, "DoubaoAsrAsyncClient"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/uwg0;->c:Ll/hsp0;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/uwg0;->d:Ll/oug0;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Ll/oug0;->g:Z

    .line 27
    .line 28
    iget-object p0, p0, Ll/oug0;->a:Ll/cgg0;

    .line 29
    .line 30
    iget-object p0, p0, Ll/cgg0;->f:Ll/pkg0;

    .line 31
    .line 32
    iget-object v0, p0, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->offer(B)Z

    .line 38
    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public final pushAudio(Ljava/nio/ByteBuffer;I)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/rog0;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    monitor-enter p0

    .line 7
    if-eqz p1, :cond_5

    .line 8
    .line 9
    if-nez p2, :cond_1

    .line 10
    .line 11
    goto :goto_3

    .line 12
    :cond_1
    :try_start_0
    iget-boolean v0, p0, Ll/rog0;->f:Z

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    iget-object v0, p0, Ll/rog0;->l:Ll/xkg0;

    .line 18
    .line 19
    if-nez v0, :cond_3

    .line 20
    .line 21
    new-instance v0, Ll/xkg0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/xkg0;-><init>(Ll/rog0;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/rog0;->l:Ll/xkg0;

    .line 27
    .line 28
    iget-boolean v2, p0, Ll/rog0;->k:Z

    .line 29
    .line 30
    if-eqz v2, :cond_2

    .line 31
    .line 32
    iput-boolean v1, p0, Ll/rog0;->k:Z

    .line 33
    .line 34
    const-wide/16 v2, 0x1388

    .line 35
    .line 36
    invoke-static {v0, v2, v3}, Ltech/sud/gip/base/ThreadUtils;->postDelayedUITask(Ljava/lang/Runnable;J)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_2

    .line 42
    :cond_2
    invoke-static {v0}, Ltech/sud/gip/base/ThreadUtils;->postUITask(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    :goto_0
    iget-object v0, p0, Ll/rog0;->i:Ll/pkg0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    .line 47
    if-eqz v0, :cond_5

    .line 48
    .line 49
    :try_start_1
    new-array v0, p2, [B

    .line 50
    .line 51
    invoke-virtual {p1, v0, v1, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/rog0;->i:Ll/pkg0;

    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    if-nez p2, :cond_4

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_4
    iget-object p1, p1, Ll/pkg0;->a:Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Ltech/sud/gip/asr/base/utils/ByteArrayBlockingQueue;->offerBuffer([B)Z

    .line 65
    .line 66
    .line 67
    :goto_1
    monitor-exit p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    return-void

    .line 69
    :goto_2
    monitor-exit p0

    .line 70
    throw p1

    .line 71
    :catch_0
    :cond_5
    :goto_3
    monitor-exit p0

    .line 72
    return-void
.end method

.method public final sendText(Ljava/lang/String;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/rog0;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide v0, p0, Ll/rog0;->b:J

    .line 7
    .line 8
    iget-object v2, p0, Ll/rog0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v3, p0, Ll/rog0;->d:Ljava/lang/String;

    .line 11
    .line 12
    iget-object p0, p0, Ll/rog0;->e:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v4, Ll/utg0;->a:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v4, Ll/dpg0;

    .line 17
    .line 18
    invoke-direct {v4}, Ll/dpg0;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-wide v0, v4, Ll/dpg0;->a:J

    .line 22
    .line 23
    iput-object v2, v4, Ll/dpg0;->b:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v3, v4, Ll/dpg0;->c:Ljava/lang/String;

    .line 26
    .line 27
    iput-object p0, v4, Ll/dpg0;->d:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p1, v4, Ll/dpg0;->e:Ljava/lang/String;

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    iput-object p0, v4, Ll/dpg0;->f:Ll/xsg0;

    .line 33
    .line 34
    sget-object p0, Ll/utg0;->b:Ll/uyg0;

    .line 35
    .line 36
    new-instance p1, Ll/cog0;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/cog0;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v4, p1}, Ll/uyg0;->u(Ll/dpg0;Ll/cog0;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final setISudListenerAiAgent(Ltech/sud/gip/core/ISudListenerAiAgent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rog0;->j:Ltech/sud/gip/core/ISudListenerAiAgent;

    .line 2
    .line 3
    return-void
.end method

.method public final stopAudio()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rog0;->h:Ll/uwg0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uwg0;->l()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
