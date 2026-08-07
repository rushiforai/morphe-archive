.class public abstract Lcom/momo/pipline/codec/MediaBaseCodecFilter;
.super Ll/hej;
.source "SourceFile"

# interfaces
.implements Ll/evx$b;
.implements Landroid/os/Handler$Callback;
.implements Lcom/momo/pipline/MomoInterface/MomoCodec;
.implements Ll/q210$b;
.implements Ll/q210$d;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;
    }
.end annotation


# instance fields
.field protected A:Ljava/lang/String;

.field private B:Ljava/lang/Object;

.field private C:Ljava/lang/Object;

.field private D:Ljava/lang/Object;

.field private E:Ll/q210$b;

.field protected F:Ll/wzl;

.field protected G:I

.field protected H:Ll/wvx;

.field protected I:Ll/evx;

.field protected volatile J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

.field protected K:Ll/l6m;

.field private L:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

.field private M:Landroid/os/HandlerThread;

.field private N:Landroid/os/Handler;

.field private final O:J

.field private P:J

.field protected Q:Z

.field protected R:Ll/brx;

.field protected q:J

.field protected r:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field protected s:Ll/uow;

.field protected t:I

.field private u:Z

.field protected v:Ljava/lang/String;

.field protected x:Ljava/lang/String;

.field protected y:Ljava/lang/String;

.field protected z:Ll/a320;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/hej;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->q:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->u:Z

    .line 10
    .line 11
    const-string v1, ""

    .line 12
    .line 13
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->v:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->x:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->y:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iput-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 21
    .line 22
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->A:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v1, Ljava/lang/Object;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->B:Ljava/lang/Object;

    .line 30
    .line 31
    new-instance v1, Ljava/lang/Object;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->C:Ljava/lang/Object;

    .line 37
    .line 38
    new-instance v1, Ljava/lang/Object;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->D:Ljava/lang/Object;

    .line 44
    .line 45
    iput-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->E:Ll/q210$b;

    .line 46
    .line 47
    iput-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->F:Ll/wzl;

    .line 48
    .line 49
    const/16 v1, 0x1388

    .line 50
    .line 51
    iput v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->G:I

    .line 52
    .line 53
    new-instance v1, Ll/wvx;

    .line 54
    .line 55
    invoke-direct {v1}, Ll/wvx;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 59
    .line 60
    new-instance v2, Ll/evx;

    .line 61
    .line 62
    invoke-direct {v2, v1}, Ll/evx;-><init>(Ll/wvx;)V

    .line 63
    .line 64
    .line 65
    iput-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 66
    .line 67
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 68
    .line 69
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 70
    .line 71
    const-wide/16 v1, 0x3e8

    .line 72
    .line 73
    iput-wide v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->O:J

    .line 74
    .line 75
    const-wide/16 v1, 0x1388

    .line 76
    .line 77
    iput-wide v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->P:J

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    iput-boolean v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Q:Z

    .line 81
    .line 82
    sget-object v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 83
    .line 84
    invoke-virtual {p0, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 85
    .line 86
    .line 87
    new-instance v1, Ljava/lang/ref/WeakReference;

    .line 88
    .line 89
    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->r:Ljava/lang/ref/WeakReference;

    .line 93
    .line 94
    iput v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->t:I

    .line 95
    .line 96
    :try_start_0
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-virtual {p0}, Ll/csx;->V0()Z

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    if-eqz p0, :cond_0

    .line 105
    .line 106
    invoke-static {}, Ll/aol;->e()Ll/aol;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p0}, Ll/aol;->o()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .line 112
    .line 113
    :cond_0
    return-void

    .line 114
    :catch_0
    move-exception p0

    .line 115
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 116
    .line 117
    .line 118
    return-void
.end method

.method private V1(Ll/brx;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/brx;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    :goto_0
    move-object v3, p1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    const-string v0, "mlive"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    iget-object p1, p1, Ll/arx$d;->c:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const-string p1, ""

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :goto_1
    new-instance v0, Ll/a320;

    .line 32
    .line 33
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string v1, "mdefault"

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Ll/arx;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 44
    .line 45
    iget-object v9, p1, Ll/wvx;->e1:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v10, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->y:Ljava/lang/String;

    .line 48
    .line 49
    const-string v1, "mdefault"

    .line 50
    .line 51
    const-string v2, "1a738fb015fe0a8476c4e05a314156d2"

    .line 52
    .line 53
    const-string v4, ""

    .line 54
    .line 55
    const-string v5, ""

    .line 56
    .line 57
    const-string v6, ""

    .line 58
    .line 59
    const-string v8, ""

    .line 60
    .line 61
    invoke-direct/range {v0 .. v10}, Ll/a320;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 65
    .line 66
    :cond_2
    return-void
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->N:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->M:Landroid/os/HandlerThread;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->M:Landroid/os/HandlerThread;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->N:Landroid/os/Handler;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->M:Landroid/os/HandlerThread;

    .line 21
    .line 22
    :cond_0
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, ":stopRecordonRecordPrepared#############"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->C:Ljava/lang/Object;

    .line 42
    .line 43
    monitor-enter v0

    .line 44
    :try_start_0
    sget-object v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_STOPPING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 47
    .line 48
    .line 49
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->j2()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw p0
.end method

.method public H(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "setProvider"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 17
    .line 18
    int-to-long v0, p1

    .line 19
    iput-wide v0, p0, Ll/wvx;->t:J

    .line 20
    .line 21
    return-void
.end method

.method public O(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->q:J

    .line 2
    .line 3
    return-void
.end method

.method public R0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 4

    .line 1
    const-string p2, ":startRecordonRecordPrepared#############"

    .line 2
    .line 3
    const-string v0, "sendMessageEx"

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, ""

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 13
    .line 14
    iget-wide v2, v2, Ll/wvx;->d:J

    .line 15
    .line 16
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v0, v1}, Ll/t9c;->f(Ljava/lang/String;Ljava/lang/Object;)I

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/evx;->j()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-boolean v0, p1, Ll/uow;->X0:Z

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/evx;->a()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ll/evx;->N(Ll/evx$b;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/evx;->O()V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->C:Ljava/lang/Object;

    .line 54
    .line 55
    monitor-enter v0

    .line 56
    :try_start_0
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-static {v1, p2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 74
    .line 75
    sget-object p1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_STARTING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 78
    .line 79
    .line 80
    monitor-exit v0

    .line 81
    return-void

    .line 82
    :catchall_0
    move-exception p0

    .line 83
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 84
    throw p0
.end method

.method public S0(Ll/brx;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "mediaCfgParams: "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    const-string v3, "MediaLogsReporters"

    .line 20
    .line 21
    invoke-static {v3, v2}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    const-string v2, "setMediaCfgParams"

    .line 25
    .line 26
    if-eqz v1, :cond_5

    .line 27
    .line 28
    iput-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R:Ll/brx;

    .line 29
    .line 30
    iget-object v4, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/brx;->m()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    filled-new-array {v2, v5}, [Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {v4, v5}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object v4, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 44
    .line 45
    invoke-virtual {v1}, Ll/brx;->c()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    int-to-long v5, v5

    .line 50
    iput-wide v5, v4, Ll/wvx;->s:J

    .line 51
    .line 52
    iget-object v4, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/brx;->f()I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    int-to-long v5, v5

    .line 59
    iput-wide v5, v4, Ll/wvx;->t:J

    .line 60
    .line 61
    iget-object v4, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 62
    .line 63
    invoke-virtual {v1}, Ll/brx;->j()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    iput-object v5, v4, Ll/wvx;->u:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    invoke-virtual {v1}, Ll/brx;->b()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v5

    .line 77
    invoke-virtual {v4, v5}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    invoke-virtual {v1}, Ll/brx;->l()V

    .line 82
    .line 83
    .line 84
    if-eqz v4, :cond_4

    .line 85
    .line 86
    iget-object v5, v4, Ll/arx$d;->e:Ll/bsx;

    .line 87
    .line 88
    if-eqz v5, :cond_0

    .line 89
    .line 90
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 91
    .line 92
    iget v5, v5, Ll/bsx;->l:I

    .line 93
    .line 94
    invoke-virtual {v6, v5}, Ll/evx;->K(I)V

    .line 95
    .line 96
    .line 97
    iget-object v5, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 98
    .line 99
    iget-object v6, v4, Ll/arx$d;->e:Ll/bsx;

    .line 100
    .line 101
    iget v6, v6, Ll/bsx;->k:I

    .line 102
    .line 103
    invoke-virtual {v5, v6}, Ll/evx;->L(I)V

    .line 104
    .line 105
    .line 106
    iget-object v5, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 107
    .line 108
    iget-object v6, v4, Ll/arx$d;->e:Ll/bsx;

    .line 109
    .line 110
    iget v6, v6, Ll/bsx;->j:I

    .line 111
    .line 112
    invoke-virtual {v5, v6}, Ll/evx;->I(I)V

    .line 113
    .line 114
    .line 115
    :cond_0
    iget-object v5, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 116
    .line 117
    if-nez v5, :cond_1

    .line 118
    .line 119
    new-instance v6, Ll/a320;

    .line 120
    .line 121
    invoke-virtual {v1}, Ll/brx;->b()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v7

    .line 125
    iget-object v8, v4, Ll/arx$d;->b:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v9, v4, Ll/arx$d;->c:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v1}, Ll/brx;->h()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v10

    .line 133
    invoke-virtual {v1}, Ll/brx;->f()I

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v11

    .line 141
    invoke-virtual {v1}, Ll/brx;->c()I

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v12

    .line 149
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    invoke-virtual {v1}, Ll/brx;->b()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v13

    .line 157
    invoke-virtual {v5, v13}, Ll/arx;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v13

    .line 161
    invoke-virtual {v1}, Ll/brx;->j()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v14

    .line 165
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 166
    .line 167
    iget-object v15, v1, Ll/wvx;->e1:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->y:Ljava/lang/String;

    .line 170
    .line 171
    move-object/from16 v16, v1

    .line 172
    .line 173
    invoke-direct/range {v6 .. v16}, Ll/a320;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iput-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 177
    .line 178
    :cond_1
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 179
    .line 180
    if-eqz v1, :cond_2

    .line 181
    .line 182
    iget-object v5, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 183
    .line 184
    invoke-virtual {v1, v5}, Ll/evx;->J(Ll/a320;)V

    .line 185
    .line 186
    .line 187
    :cond_2
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->A:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-nez v1, :cond_3

    .line 194
    .line 195
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 196
    .line 197
    iget-object v5, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->A:Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {v1, v5}, Ll/a320;->e(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 203
    .line 204
    new-instance v5, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    const-string v6, "set mTag="

    .line 207
    .line 208
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object v0, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->A:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    filled-new-array {v2, v0}, [Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-virtual {v1, v0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 225
    .line 226
    .line 227
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 228
    .line 229
    const-string v1, "userConfig: "

    .line 230
    .line 231
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    iget-object v1, v4, Ll/arx$d;->d:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-static {v3, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 244
    .line 245
    .line 246
    return-void

    .line 247
    :cond_4
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    const-string v3, "pusher userConfig == null, use default appid"

    .line 252
    .line 253
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    invoke-virtual {v2, v3}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 258
    .line 259
    .line 260
    invoke-direct/range {p0 .. p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->V1(Ll/brx;)V

    .line 261
    .line 262
    .line 263
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 264
    .line 265
    if-eqz v1, :cond_7

    .line 266
    .line 267
    iget-object v0, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 268
    .line 269
    invoke-virtual {v1, v0}, Ll/evx;->J(Ll/a320;)V

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_5
    iget-object v3, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 274
    .line 275
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    invoke-virtual {v3, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 280
    .line 281
    .line 282
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    const-string v2, "pusher medaicfgparam == null,user default appid "

    .line 287
    .line 288
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-virtual {v1, v2}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 293
    .line 294
    .line 295
    const/4 v1, 0x0

    .line 296
    invoke-direct {v0, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->V1(Ll/brx;)V

    .line 297
    .line 298
    .line 299
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 300
    .line 301
    if-eqz v1, :cond_6

    .line 302
    .line 303
    iget-object v2, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 304
    .line 305
    invoke-virtual {v1, v2}, Ll/evx;->J(Ll/a320;)V

    .line 306
    .line 307
    .line 308
    :cond_6
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->A:Ljava/lang/String;

    .line 309
    .line 310
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    if-nez v1, :cond_7

    .line 315
    .line 316
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 317
    .line 318
    iget-object v0, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->A:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v1, v0}, Ll/a320;->e(Ljava/lang/String;)V

    .line 321
    .line 322
    .line 323
    :cond_7
    return-void
.end method

.method public W1()Landroid/content/Context;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->r:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->r:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/content/Context;

    .line 24
    .line 25
    return-object p0
.end method

.method public X1()Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->L:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 2
    .line 3
    return-object p0
.end method

.method public Y(Ll/g510;Ll/uow;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, ":resetCodeconRecordPrepared#############"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget p1, p2, Ll/tow;->m:I

    .line 24
    .line 25
    iget v0, p2, Ll/tow;->n:I

    .line 26
    .line 27
    iget-boolean p2, p2, Ll/uow;->F0:Z

    .line 28
    .line 29
    if-eqz p2, :cond_1

    .line 30
    .line 31
    move v1, v0

    .line 32
    move v0, p1

    .line 33
    move p1, v1

    .line 34
    :cond_1
    invoke-virtual {p0, p1, v0}, Ll/zej;->setRenderSize(II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/wej;->reInitialize()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public Y1()J
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->q:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ll/csx;->U0()Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/csx;->X()J

    .line 23
    .line 24
    .line 25
    move-result-wide v0

    .line 26
    const/4 p0, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v3, "getNetAnchorTime "

    .line 32
    .line 33
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, " / "

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    const-string v2, "MediaBaseCodecFilter"

    .line 52
    .line 53
    invoke-static {v2, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    return-wide v0
.end method

.method public Z1()Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public a2(Landroid/content/Context;)Z
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const-string v0, "audio"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Landroid/media/AudioManager;

    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    return p0

    .line 16
    :cond_1
    const/4 v0, 0x2

    .line 17
    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    array-length v0, p1

    .line 22
    move v1, p0

    .line 23
    :goto_0
    if-ge v1, v0, :cond_4

    .line 24
    .line 25
    aget-object v2, p1, v1

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    const/4 v4, 0x3

    .line 32
    if-eq v3, v4, :cond_3

    .line 33
    .line 34
    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    const/4 v4, 0x4

    .line 39
    if-eq v3, v4, :cond_3

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    const/16 v4, 0x8

    .line 46
    .line 47
    if-eq v3, v4, :cond_3

    .line 48
    .line 49
    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    const/16 v4, 0x16

    .line 54
    .line 55
    if-eq v3, v4, :cond_3

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    const/16 v4, 0xb

    .line 62
    .line 63
    if-eq v3, v4, :cond_3

    .line 64
    .line 65
    invoke-virtual {v2}, Landroid/media/AudioDeviceInfo;->getType()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    const/4 v3, 0x7

    .line 70
    if-ne v2, v3, :cond_2

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_3
    :goto_1
    const/4 p0, 0x1

    .line 77
    :cond_4
    return p0
.end method

.method public b2()V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/wvx;->s:J

    .line 4
    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p0, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->a2(Landroid/content/Context;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    const-string v1, "1"

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const-string v1, "0"

    .line 27
    .line 28
    :goto_0
    const-string v2, "headSet"

    .line 29
    .line 30
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_7

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const-class v1, Landroid/hardware/usb/UsbManager;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/hardware/usb/UsbManager;

    .line 54
    .line 55
    const-string v1, "]"

    .line 56
    .line 57
    const-string v2, "["

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Landroid/hardware/usb/UsbManager;->getDeviceList()Ljava/util/HashMap;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    if-eqz v3, :cond_2

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    check-cast v3, Ljava/util/Map$Entry;

    .line 84
    .line 85
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    check-cast v3, Landroid/hardware/usb/UsbDevice;

    .line 90
    .line 91
    invoke-virtual {v3}, Landroid/hardware/usb/UsbDevice;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    const/16 v4, 0x5b

    .line 96
    .line 97
    const/16 v5, 0x28

    .line 98
    .line 99
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    const/16 v4, 0x5d

    .line 104
    .line 105
    const/16 v5, 0x29

    .line 106
    .line 107
    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    iget-object v4, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 112
    .line 113
    new-instance v5, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    const-string v5, "UsbDevice"

    .line 129
    .line 130
    invoke-virtual {v4, v5, v3}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    const-string v3, "audio"

    .line 139
    .line 140
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    check-cast v0, Landroid/media/AudioManager;

    .line 145
    .line 146
    if-eqz v0, :cond_7

    .line 147
    .line 148
    new-instance v3, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    const-string v4, "{"

    .line 151
    .line 152
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    const/4 v4, 0x1

    .line 156
    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    const/4 v5, 0x0

    .line 161
    move v6, v5

    .line 162
    :goto_2
    array-length v7, v4

    .line 163
    const-string v8, "},{"

    .line 164
    .line 165
    if-ge v6, v7, :cond_4

    .line 166
    .line 167
    if-eqz v6, :cond_3

    .line 168
    .line 169
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    :cond_3
    aget-object v7, v4, v6

    .line 173
    .line 174
    invoke-static {v7}, Ll/fvx;->B(Landroid/media/AudioDeviceInfo;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v7

    .line 178
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    add-int/lit8 v6, v6, 0x1

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_4
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    const/4 v4, 0x2

    .line 188
    invoke-virtual {v0, v4}, Landroid/media/AudioManager;->getDevices(I)[Landroid/media/AudioDeviceInfo;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    :goto_3
    array-length v4, v0

    .line 193
    if-ge v5, v4, :cond_6

    .line 194
    .line 195
    if-eqz v5, :cond_5

    .line 196
    .line 197
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    :cond_5
    aget-object v4, v0, v5

    .line 201
    .line 202
    invoke-static {v4}, Ll/fvx;->B(Landroid/media/AudioDeviceInfo;)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v4

    .line 206
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    add-int/lit8 v5, v5, 0x1

    .line 210
    .line 211
    goto :goto_3

    .line 212
    :cond_6
    const-string v0, "}"

    .line 213
    .line 214
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 218
    .line 219
    new-instance v0, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    const-string v1, "AudioDeviceInfo"

    .line 239
    .line 240
    invoke-virtual {p0, v1, v0}, Ll/evx;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    :cond_7
    return-void
.end method

.method public c1()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public c2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/evx;->C()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public d1()V
    .locals 0

    .line 1
    return-void
.end method

.method public d2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/evx;->E()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e1(Ll/l6m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 2
    .line 3
    return-void
.end method

.method public e2(II)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->E:Ll/q210$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-interface {p0, p1, p2, v0}, Ll/q210$b;->q0(IILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public f()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->N:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->M:Landroid/os/HandlerThread;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->M:Landroid/os/HandlerThread;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->N:Landroid/os/Handler;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->M:Landroid/os/HandlerThread;

    .line 21
    .line 22
    :cond_0
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, ":stopRecordonRecordPrepared#############"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v0, v1}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->C:Ljava/lang/Object;

    .line 42
    .line 43
    monitor-enter v0

    .line 44
    :try_start_0
    sget-object v1, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_STOPPING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 45
    .line 46
    invoke-virtual {p0, v1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 47
    .line 48
    .line 49
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->j2()V

    .line 51
    .line 52
    .line 53
    return-void

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    throw p0
.end method

.method public f2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/evx;->s()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/evx;->t()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/evx;->D()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 3

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    packed-switch p1, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    goto :goto_0

    .line 7
    :pswitch_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 8
    .line 9
    invoke-static {}, Ll/fvx;->p()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ll/wvx;->A0:Ljava/lang/String;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :pswitch_1
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->d1()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->N:Landroid/os/Handler;

    .line 20
    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->M:Landroid/os/HandlerThread;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/16 v0, 0x101

    .line 28
    .line 29
    iget-wide v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->P:J

    .line 30
    .line 31
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :pswitch_2
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 36
    .line 37
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v0, "ts"

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y1()J

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->k2(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    :catch_0
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->N:Landroid/os/Handler;

    .line 57
    .line 58
    if-eqz p1, :cond_0

    .line 59
    .line 60
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->M:Landroid/os/HandlerThread;

    .line 61
    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    const/16 p0, 0x100

    .line 65
    .line 66
    const-wide/16 v0, 0x3e8

    .line 67
    .line 68
    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 69
    .line 70
    .line 71
    :cond_0
    :goto_0
    const/4 p0, 0x0

    .line 72
    return p0

    .line 73
    :pswitch_data_0
    .packed-switch 0x100
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public i(IILl/fpf0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const-string v3, "setSimpleMediaLogsUpload"

    .line 12
    .line 13
    filled-new-array {v3, v1, v2, p3}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    if-lez p1, :cond_0

    .line 21
    .line 22
    int-to-long v0, p1

    .line 23
    iput-wide v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->P:J

    .line 24
    .line 25
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2, p3}, Ll/evx;->M(IILl/fpf0;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public i2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/evx;->F()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public declared-synchronized j0(Ljava/lang/Object;)V
    .locals 2

    .line 1
    const-string p1, " onRecordStop ################ success"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw p1
.end method

.method public j2()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->r:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k2(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->L:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 2
    .line 3
    return-void
.end method

.method public m2(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->A:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v1, "setMtag"

    .line 8
    .line 9
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->z:Ll/a320;

    .line 17
    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/a320;->e(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public n2(Ll/uow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-void
.end method

.method public o2(Ll/q210$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->E:Ll/q210$b;

    .line 2
    .line 3
    return-void
.end method

.method public p2()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v0, v0, v1}, Ll/evx;->M(IILl/fpf0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q0(IILjava/lang/Object;)V
    .locals 0

    .line 1
    return-void
.end method

.method public r1()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public declared-synchronized w0(IILjava/lang/Object;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    if-ne p3, p0, :cond_0

    .line 3
    .line 4
    :try_start_0
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->X1()Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget-object p2, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_STOPPING:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 9
    .line 10
    if-eq p1, p2, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->B:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    :try_start_1
    monitor-exit p1

    .line 16
    goto :goto_0

    .line 17
    :catchall_0
    move-exception p2

    .line 18
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    :try_start_2
    throw p2

    .line 20
    :catchall_1
    move-exception p1

    .line 21
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 22
    throw p1

    .line 23
    :cond_0
    :goto_0
    monitor-exit p0

    .line 24
    return-void
.end method
