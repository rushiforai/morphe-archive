.class public Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

.field private b:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

.field private c:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

.field private d:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

.field private e:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

.field private f:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

.field private g:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

.field private h:I

.field private i:I

.field private j:Z

.field private k:Z

.field private l:Z

.field private m:Z

.field private n:J

.field private o:J

.field private p:Ltv/danmaku/ijk/media/sink/AgoraWriter;

.field private q:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

.field private r:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Ll/iny;",
            ">;"
        }
    .end annotation
.end field

.field private s:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

.field private t:Landroid/content/Context;

.field private final u:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Lcom/immomo/mediacore/coninf/MRtcEventHandler;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public v:Lio/agora/rtc2/IRtcEngineEventHandler;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;Ltv/danmaku/ijk/media/sink/AgoraWriter;Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->h:I

    .line 6
    .line 7
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->i:I

    .line 8
    .line 9
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->j:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->k:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->l:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->m:Z

    .line 17
    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->n:J

    .line 21
    .line 22
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->o:J

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->q:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 26
    .line 27
    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    .line 28
    .line 29
    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->r:Ljava/util/concurrent/ConcurrentHashMap;

    .line 33
    .line 34
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->s:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 35
    .line 36
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->t:Landroid/content/Context;

    .line 37
    .line 38
    new-instance v2, Ljava/util/concurrent/ConcurrentHashMap;

    .line 39
    .line 40
    invoke-direct {v2}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->u:Ljava/util/concurrent/ConcurrentHashMap;

    .line 44
    .line 45
    new-instance v2, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler$1;-><init>(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)V

    .line 48
    .line 49
    .line 50
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->v:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 51
    .line 52
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->t:Landroid/content/Context;

    .line 53
    .line 54
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->s:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 55
    .line 56
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->p:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 57
    .line 58
    iput-object p4, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 59
    .line 60
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->j:Z

    .line 61
    .line 62
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->k:Z

    .line 63
    .line 64
    return-void
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->u:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->r:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;)Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->d:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic d(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->g:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/streamer/StreamProducer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Ltv/danmaku/ijk/media/sink/AgoraWriter;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->p:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->q:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;)[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->q:[Lio/agora/rtc2/IRtcEngineEventHandler$AudioVolumeInfo;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->e:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;)Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic m(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->n:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic n(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->n:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic o(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic p(Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->o:J

    .line 2
    .line 3
    return-wide p1
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->t:Landroid/content/Context;

    .line 3
    .line 4
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->s:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 5
    .line 6
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->p:Ltv/danmaku/ijk/media/sink/AgoraWriter;

    .line 7
    .line 8
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->a:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 9
    .line 10
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->v:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 11
    .line 12
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->u:Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public B(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->u:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->u:Ljava/util/concurrent/ConcurrentHashMap;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public q(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->u:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->u:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public r(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->e:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 2
    .line 3
    return-void
.end method

.method public s(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->f:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 2
    .line 3
    return-void
.end method

.method public t(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->g:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 2
    .line 3
    return-void
.end method

.method public u()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->r:Ljava/util/concurrent/ConcurrentHashMap;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->entrySet()Ljava/util/Set;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Ljava/util/Map$Entry;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Ll/iny;

    .line 36
    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    const-string v3, ","

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {v2}, Ll/iny;->b()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    if-nez v1, :cond_2

    .line 55
    .line 56
    const-string p0, "(0)"

    .line 57
    .line 58
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    :cond_2
    const-string p0, "]"

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public v()Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->c:Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public x()Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->d:Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public z()Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->b:Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 2
    .line 3
    return-object p0
.end method
