.class public Ltv/danmaku/ijk/media/source/audio/normalAudioSource;
.super Ltv/danmaku/ijk/media/source/audio/audioSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;
    }
.end annotation


# instance fields
.field private f:Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;

.field private g:I

.field private volatile h:Z

.field private i:J

.field private j:Landroid/media/AudioRecord;

.field private k:Ljava/lang/Thread;

.field private l:[B


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/source/audio/audioSource;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x400

    .line 5
    .line 6
    iput v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->g:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->h:Z

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->i:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->j:Landroid/media/AudioRecord;

    .line 17
    .line 18
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->l:[B

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic e(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->j:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->j:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->l:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;[B)[B
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->l:[B

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic j(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;)J
    .locals 4

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->i:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v2, v0

    .line 6
    iput-wide v2, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->i:J

    .line 7
    .line 8
    return-wide v0
.end method


# virtual methods
.method public d()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->l()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->h:Z

    .line 6
    .line 7
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->f:Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, p0, v1}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;-><init>(Ltv/danmaku/ijk/media/source/audio/normalAudioSource;Ltv/danmaku/ijk/media/source/audio/normalAudioSource$1;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->f:Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->k:Ljava/lang/Thread;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ljava/lang/Thread;

    .line 24
    .line 25
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->f:Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;

    .line 26
    .line 27
    const-string v2, "live-media-AudRec"

    .line 28
    .line 29
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->k:Ljava/lang/Thread;

    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->f:Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;->a(Lcom/immomo/mediacore/audio/AudioProcess;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->k:Ljava/lang/Thread;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    :try_start_0
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->h:Z

    .line 15
    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->k:Ljava/lang/Thread;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->k:Ljava/lang/Thread;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 25
    .line 26
    .line 27
    :goto_0
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->k:Ljava/lang/Thread;

    .line 28
    .line 29
    :cond_1
    iput-object v1, p0, Ltv/danmaku/ijk/media/source/audio/normalAudioSource;->f:Ltv/danmaku/ijk/media/source/audio/normalAudioSource$AudioRecordRunnable;

    .line 30
    .line 31
    return-void
.end method
