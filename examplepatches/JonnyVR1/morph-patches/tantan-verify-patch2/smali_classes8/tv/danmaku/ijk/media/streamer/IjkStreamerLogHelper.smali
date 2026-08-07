.class public Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;
    }
.end annotation


# instance fields
.field a:Landroid/content/Context;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:I

.field private e:I

.field private f:I

.field private g:Ljava/lang/String;

.field private h:J

.field private i:Z

.field private j:I

.field private k:Ltv/danmaku/ijk/media/streamer/NetUtil;

.field l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

.field private m:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

.field private n:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

.field private o:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

.field private p:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

.field private q:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

.field protected r:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

.field s:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IILtv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->a:Landroid/content/Context;

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->g:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->i:Z

    .line 13
    .line 14
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->j:I

    .line 15
    .line 16
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->k:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 17
    .line 18
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 19
    .line 20
    sget-object v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;->PUSHNULL:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 21
    .line 22
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->m:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 23
    .line 24
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->n:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 25
    .line 26
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->o:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 27
    .line 28
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->p:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 29
    .line 30
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->q:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 31
    .line 32
    new-instance v0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$1;-><init>(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->r:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 38
    .line 39
    new-instance v0, Ljava/util/HashSet;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->s:Ljava/util/HashSet;

    .line 45
    .line 46
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 47
    .line 48
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->e:I

    .line 49
    .line 50
    iput p4, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->f:I

    .line 51
    .line 52
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->r:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 53
    .line 54
    const/4 p3, 0x1

    .line 55
    invoke-virtual {p2, p3}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->e(Z)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->r:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 59
    .line 60
    iget p3, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->e:I

    .line 61
    .line 62
    invoke-virtual {p2, p3}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->f(I)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->r:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 66
    .line 67
    iget p3, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->f:I

    .line 68
    .line 69
    invoke-virtual {p2, p3}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->g(I)V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->a:Landroid/content/Context;

    .line 73
    .line 74
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {p1, p5}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->g(Ltv/danmaku/ijk/media/streamer/MediaReportLogManager$LogUploadCallBack;)V

    .line 79
    .line 80
    .line 81
    new-instance p1, Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 82
    .line 83
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->a:Landroid/content/Context;

    .line 84
    .line 85
    invoke-direct {p1, p2}, Ltv/danmaku/ijk/media/streamer/NetUtil;-><init>(Landroid/content/Context;)V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->k:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 89
    .line 90
    return-void
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->i:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)Ltv/danmaku/ijk/media/streamer/NetUtil;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->k:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->d:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()V
    .locals 8

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :goto_0
    move-object v3, v0

    .line 6
    goto :goto_1

    .line 7
    :cond_0
    const-string v0, ""

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->h:J

    .line 15
    .line 16
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-wide v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->h:J

    .line 21
    .line 22
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->d([Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v5

    .line 39
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->c:Ljava/lang/String;

    .line 44
    .line 45
    iget v6, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->d:I

    .line 46
    .line 47
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->e()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    const-string v2, "v2.pushBufferStart"

    .line 52
    .line 53
    invoke-virtual/range {v1 .. v7}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public g()V
    .locals 8

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->b:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :goto_0
    move-object v3, v0

    .line 6
    goto :goto_1

    .line 7
    :cond_0
    const-string v0, ""

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    iget-wide v5, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->h:J

    .line 23
    .line 24
    invoke-static {v0, v1, v5, v6}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->a(JJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    filled-new-array {v4, v0}, [Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v2, v0}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->d([Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->c:Ljava/lang/String;

    .line 45
    .line 46
    iget v6, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->d:I

    .line 47
    .line 48
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->e()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    const-string v2, "v2.pushBufferStop"

    .line 53
    .line 54
    invoke-virtual/range {v1 .. v7}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public declared-synchronized h(Ljava/lang/String;)V
    .locals 14

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v8

    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :cond_0
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->n:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 14
    .line 15
    sget-object v12, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;->PUSHSTART:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    .line 17
    if-ne v0, v12, :cond_1

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-void

    .line 21
    :cond_1
    :try_start_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->b:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_2
    const-string v0, ""

    .line 27
    .line 28
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->k:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 29
    .line 30
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/NetUtil;->d()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    const-string v1, "wifi"

    .line 37
    .line 38
    :goto_1
    move-object v7, v1

    .line 39
    goto :goto_2

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto/16 :goto_6

    .line 43
    .line 44
    :cond_3
    const-string v1, "other"

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :goto_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 48
    .line 49
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getServerIpAddr()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    const-string v1, "0.0.0.0"

    .line 60
    .line 61
    :goto_3
    move-object v2, v1

    .line 62
    goto :goto_4

    .line 63
    :cond_4
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 64
    .line 65
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getServerIpAddr()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    goto :goto_3

    .line 70
    :goto_4
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 71
    .line 72
    .line 73
    move-result-object v13

    .line 74
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 75
    .line 76
    .line 77
    move-result-wide v3

    .line 78
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 83
    .line 84
    invoke-virtual {v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getConnectTime()J

    .line 85
    .line 86
    .line 87
    move-result-wide v3

    .line 88
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 89
    .line 90
    .line 91
    move-result-object v3

    .line 92
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 93
    .line 94
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getFirstAuidoPacketTime()J

    .line 95
    .line 96
    .line 97
    move-result-wide v4

    .line 98
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 103
    .line 104
    invoke-virtual {v5}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getFirstVideoPacketTime()J

    .line 105
    .line 106
    .line 107
    move-result-wide v5

    .line 108
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 109
    .line 110
    .line 111
    move-result-object v5

    .line 112
    iget-object v6, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 113
    .line 114
    invoke-virtual {v6}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getFirstSendPacketTime()J

    .line 115
    .line 116
    .line 117
    move-result-wide v9

    .line 118
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 119
    .line 120
    .line 121
    move-result-object v6

    .line 122
    if-nez p1, :cond_5

    .line 123
    .line 124
    move-object v9, v8

    .line 125
    goto :goto_5

    .line 126
    :cond_5
    move-object v9, p1

    .line 127
    :goto_5
    const/4 p1, 0x1

    .line 128
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 129
    .line 130
    .line 131
    move-result-object v10

    .line 132
    const-string v11, "0.0.0.0"

    .line 133
    .line 134
    filled-new-array/range {v1 .. v11}, [Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {v13, p1}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->d([Ljava/lang/Object;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v5

    .line 142
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    const-string v2, "v2.pushStart"

    .line 147
    .line 148
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->c:Ljava/lang/String;

    .line 149
    .line 150
    iget v6, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->d:I

    .line 151
    .line 152
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->e()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    move-object v3, v0

    .line 157
    invoke-virtual/range {v1 .. v7}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 158
    .line 159
    .line 160
    iput-object v12, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->n:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 161
    .line 162
    monitor-exit p0

    .line 163
    return-void

    .line 164
    :goto_6
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 165
    throw p1
.end method

.method public declared-synchronized i(ILjava/lang/String;)V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->n:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 8
    .line 9
    sget-object v2, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;->PUSHSTOP:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    if-ne v0, v2, :cond_0

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v3, "0"

    .line 36
    .line 37
    filled-new-array {v2, p1, v1, v3, p2}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->d([Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    :goto_0
    move-object v4, p1

    .line 46
    goto :goto_3

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    move-object p1, v0

    .line 49
    goto/16 :goto_4

    .line 50
    .line 51
    :cond_1
    :try_start_2
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 56
    .line 57
    .line 58
    move-result-wide v2

    .line 59
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 68
    .line 69
    invoke-virtual {v4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getRtmpSendSize()J

    .line 70
    .line 71
    .line 72
    move-result-wide v4

    .line 73
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 78
    .line 79
    invoke-virtual {v5}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getServerIpAddr()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    if-eqz v5, :cond_2

    .line 88
    .line 89
    const-string v5, "0"

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :catch_0
    move-exception v0

    .line 93
    goto :goto_2

    .line 94
    :cond_2
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 95
    .line 96
    invoke-virtual {v5}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getServerIpAddr()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    :goto_1
    filled-new-array {v2, v3, v4, v5, p2}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->d([Ljava/lang/Object;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 108
    goto :goto_0

    .line 109
    :goto_2
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 110
    .line 111
    .line 112
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 117
    .line 118
    .line 119
    move-result-wide v2

    .line 120
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    const-string v3, "0"

    .line 129
    .line 130
    filled-new-array {v2, p1, v1, v3, p2}, [Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->d([Ljava/lang/Object;)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    goto :goto_0

    .line 139
    :goto_3
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    const-string v1, "v2.pushStop"

    .line 144
    .line 145
    const-string v2, ""

    .line 146
    .line 147
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->c:Ljava/lang/String;

    .line 148
    .line 149
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->d:I

    .line 150
    .line 151
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->e()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    invoke-virtual/range {v0 .. v6}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 156
    .line 157
    .line 158
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const-string v1, "v2.pushStop"

    .line 163
    .line 164
    const-string v2, ""

    .line 165
    .line 166
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->c:Ljava/lang/String;

    .line 167
    .line 168
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->d:I

    .line 169
    .line 170
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->e()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    invoke-virtual/range {v0 .. v6}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 175
    .line 176
    .line 177
    sget-object p1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;->PUSHSTOP:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 178
    .line 179
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->n:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 180
    .line 181
    monitor-exit p0

    .line 182
    return-void

    .line 183
    :goto_4
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 184
    throw p1
.end method

.method public declared-synchronized j()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l()V

    .line 3
    .line 4
    .line 5
    invoke-static {}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->b()Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/MediaReportLogManager;->e()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->k:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/NetUtil;->e()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->k:Ltv/danmaku/ijk/media/streamer/NetUtil;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->l:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 26
    .line 27
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->a:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    .line 29
    monitor-exit p0

    .line 30
    return-void

    .line 31
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw v0
.end method

.method public k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->m:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 2
    .line 3
    sget-object v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;->PUSHSTARTWATCH:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->r:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 9
    .line 10
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->h()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->m:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 14
    .line 15
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->m:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 2
    .line 3
    sget-object v1, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;->PUSHSTOPWATCH:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->r:Ltv/danmaku/ijk/media/streamer/LoopLogReporter;

    .line 9
    .line 10
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/LoopLogReporter;->i()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper;->m:Ltv/danmaku/ijk/media/streamer/IjkStreamerLogHelper$logStatus;

    .line 14
    .line 15
    return-void
.end method
