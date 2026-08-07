.class public Ltv/danmaku/ijk/media/sink/AgoraWriter;
.super Lcom/immomo/mediacore/sink/SinkBase;
.source "SourceFile"

# interfaces
.implements Lio/agora/rtc2/IAudioFrameObserver;


# static fields
.field private static final Y:[F


# instance fields
.field private A:Z

.field private B:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

.field private C:Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;

.field private D:Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

.field E:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private F:Z

.field private G:Ljava/lang/Object;

.field private H:Z

.field private I:Z

.field private J:Z

.field K:Ljava/lang/Runnable;

.field private L:I

.field private M:I

.field private N:Z

.field private O:F

.field private P:F

.field private Q:Lcom/immomo/mediacore/sink/CongressUtil;

.field private R:I

.field public S:I

.field private T:I

.field private U:Ll/ebl0;

.field private V:I

.field private W:Z

.field private X:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field private a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

.field private b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

.field private c:Lio/agora/rtc2/RtcEngine;

.field private d:Ljavax/microedition/khronos/egl/EGLContext;

.field private e:Landroid/content/Context;

.field private f:Z

.field private g:Z

.field private h:Z

.field private i:Landroid/os/Handler;

.field private j:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field private k:F

.field private l:F

.field private m:Lcom/immomo/mediacore/audio/AudioProcess;

.field private n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

.field protected o:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

.field private p:Z

.field private q:Z

.field private r:Ljava/lang/String;

.field private s:Ljava/lang/String;

.field private t:Z

.field private u:Z

.field private v:I

.field private w:I

.field private x:[Z

.field private y:Ljava/util/HashMap;

.field private z:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [F

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Y:[F

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Ljavax/microedition/khronos/egl/EGLContext;Ltv/danmaku/ijk/media/streamer/StreamProducer;Ljava/lang/String;Z)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/sink/SinkBase;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->f:Z

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h:Z

    .line 11
    .line 12
    new-instance v2, Landroid/os/Handler;

    .line 13
    .line 14
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 19
    .line 20
    .line 21
    iput-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i:Landroid/os/Handler;

    .line 22
    .line 23
    const/high16 v2, 0x3f800000    # 1.0f

    .line 24
    .line 25
    iput v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k:F

    .line 26
    .line 27
    iput v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->l:F

    .line 28
    .line 29
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p:Z

    .line 30
    .line 31
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->q:Z

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    iput-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->r:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->s:Ljava/lang/String;

    .line 37
    .line 38
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 39
    .line 40
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->u:Z

    .line 41
    .line 42
    iput v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->v:I

    .line 43
    .line 44
    const/4 v4, 0x7

    .line 45
    iput v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->w:I

    .line 46
    .line 47
    add-int/2addr v4, v0

    .line 48
    new-array v4, v4, [Z

    .line 49
    .line 50
    iput-object v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->x:[Z

    .line 51
    .line 52
    new-instance v4, Ljava/util/HashMap;

    .line 53
    .line 54
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y:Ljava/util/HashMap;

    .line 58
    .line 59
    new-instance v4, Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->z:Ljava/util/Map;

    .line 65
    .line 66
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 67
    .line 68
    iput-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 69
    .line 70
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F:Z

    .line 71
    .line 72
    new-instance v4, Ljava/lang/Object;

    .line 73
    .line 74
    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 78
    .line 79
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->H:Z

    .line 80
    .line 81
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I:Z

    .line 82
    .line 83
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->J:Z

    .line 84
    .line 85
    iput-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->K:Ljava/lang/Runnable;

    .line 86
    .line 87
    iput v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->L:I

    .line 88
    .line 89
    iput v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->M:I

    .line 90
    .line 91
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->N:Z

    .line 92
    .line 93
    iput v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->O:F

    .line 94
    .line 95
    const v4, 0x3f333333    # 0.7f

    .line 96
    .line 97
    .line 98
    iput v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->P:F

    .line 99
    .line 100
    iput-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Q:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 101
    .line 102
    const/4 v3, -0x1

    .line 103
    iput v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->R:I

    .line 104
    .line 105
    const v3, 0xac44

    .line 106
    .line 107
    .line 108
    iput v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->S:I

    .line 109
    .line 110
    iput v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->T:I

    .line 111
    .line 112
    const/4 v3, 0x2

    .line 113
    iput v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->V:I

    .line 114
    .line 115
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->W:Z

    .line 116
    .line 117
    new-instance v3, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;

    .line 118
    .line 119
    invoke-direct {v3, p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter$1;-><init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;)V

    .line 120
    .line 121
    .line 122
    iput-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->X:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 123
    .line 124
    iput-object p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->s:Ljava/lang/String;

    .line 125
    .line 126
    const-string p4, "AgoraWriter"

    .line 127
    .line 128
    const-string v3, "AgoraWriter:"

    .line 129
    .line 130
    invoke-static {p4, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->e:Landroid/content/Context;

    .line 134
    .line 135
    iput-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 136
    .line 137
    iput-object p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->d:Ljavax/microedition/khronos/egl/EGLContext;

    .line 138
    .line 139
    new-instance p1, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 140
    .line 141
    invoke-direct {p1}, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 145
    .line 146
    iput v1, p1, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->c:I

    .line 147
    .line 148
    new-instance p2, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 149
    .line 150
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->e:Landroid/content/Context;

    .line 151
    .line 152
    iget-object p4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 153
    .line 154
    invoke-direct {p2, p3, p1, p0, p4}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;-><init>(Landroid/content/Context;Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;Ltv/danmaku/ijk/media/sink/AgoraWriter;Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 155
    .line 156
    .line 157
    iput-object p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 158
    .line 159
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->X:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 160
    .line 161
    invoke-virtual {p2, p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->q(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 162
    .line 163
    .line 164
    iput-boolean p5, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 165
    .line 166
    new-instance p1, Lcom/immomo/mediacore/sink/CongressUtil;

    .line 167
    .line 168
    invoke-direct {p1}, Lcom/immomo/mediacore/sink/CongressUtil;-><init>()V

    .line 169
    .line 170
    .line 171
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Q:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 172
    .line 173
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->w()Lio/agora/rtc2/RtcEngine;

    .line 174
    .line 175
    .line 176
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p:Z

    .line 177
    .line 178
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F:Z

    .line 179
    .line 180
    iput v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->v:I

    .line 181
    .line 182
    new-instance p1, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 183
    .line 184
    invoke-direct {p1}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 185
    .line 186
    .line 187
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 188
    .line 189
    iget p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->S:I

    .line 190
    .line 191
    mul-int/lit8 p3, p2, 0xa

    .line 192
    .line 193
    div-int/lit16 p3, p3, 0x3e8

    .line 194
    .line 195
    invoke-virtual {p1, p2, v0, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEf(III)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 199
    .line 200
    invoke-virtual {p1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioGain(F)V

    .line 201
    .line 202
    .line 203
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 204
    .line 205
    invoke-virtual {p1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioLevel(F)V

    .line 206
    .line 207
    .line 208
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 209
    .line 210
    invoke-virtual {p0, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->setMasterAudioLevel(F)V

    .line 211
    .line 212
    .line 213
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljavax/microedition/khronos/egl/EGLContext;Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)V
    .locals 6

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    .line 214
    invoke-direct/range {v0 .. v5}, Ltv/danmaku/ijk/media/sink/AgoraWriter;-><init>(Landroid/content/Context;Ljavax/microedition/khronos/egl/EGLContext;Ltv/danmaku/ijk/media/streamer/StreamProducer;Ljava/lang/String;Z)V

    return-void
.end method

.method private final A(Ljava/lang/String;I)V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->q:Z

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    const-string v1, "1"

    .line 17
    .line 18
    invoke-direct {p0, v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->B(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E()V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-boolean v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->W:Z

    .line 30
    .line 31
    if-eqz v3, :cond_2

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Lio/agora/rtc2/RtcEngine;->setDefaultAudioRoutetoSpeakerphone(Z)I

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 37
    .line 38
    iget-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->r:Ljava/lang/String;

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    invoke-virtual {v1, v3, p1, v4, p2}, Lio/agora/rtc2/RtcEngine;->joinChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)I

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 45
    .line 46
    iput-object p1, p2, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->d:Ljava/lang/String;

    .line 47
    .line 48
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->q:Z

    .line 49
    .line 50
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I:Z

    .line 51
    .line 52
    if-nez p1, :cond_3

    .line 53
    .line 54
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 55
    .line 56
    if-eqz p1, :cond_4

    .line 57
    .line 58
    :cond_3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->C()V

    .line 59
    .line 60
    .line 61
    :cond_4
    monitor-exit v0

    .line 62
    return-void

    .line 63
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    throw p0
.end method

.method private final B(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->leaveChannel()I

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget v1, v0, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->a:I

    .line 13
    .line 14
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->a()V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    const-string v2, "leaveChannel "

    .line 20
    .line 21
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p1, " "

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v0, "AgoraWriter"

    .line 40
    .line 41
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    :cond_1
    const/4 p1, 0x0

    .line 45
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->q:Z

    .line 46
    .line 47
    return-void
.end method

.method private C()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 6
    .line 7
    const/16 v1, 0x66

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2, v2, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p:Z

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private E()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 2
    .line 3
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y0()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 12
    .line 13
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z0()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    div-int/lit16 v1, v1, 0x3e8

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 25
    .line 26
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R0()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    div-int/lit16 v1, v1, 0x3e8

    .line 31
    .line 32
    :goto_0
    if-nez v0, :cond_1

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget v2, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 36
    .line 37
    const/16 v3, 0xb0

    .line 38
    .line 39
    if-ge v2, v3, :cond_2

    .line 40
    .line 41
    iput v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 42
    .line 43
    :cond_2
    iget v2, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 44
    .line 45
    if-ge v2, v3, :cond_3

    .line 46
    .line 47
    iput v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 48
    .line 49
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    const-string v2, "setVideoProfileEx1 bitrate:"

    .line 52
    .line 53
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const-string v1, "AgoraWriter"

    .line 64
    .line 65
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 69
    .line 70
    xor-int/lit8 v0, v0, 0x1

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->enableVideo(Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method private G()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->H:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->H:Z

    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method private H()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->H:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->H:Z

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private I(J)J
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long v0, v0, p1

    .line 6
    .line 7
    const-wide/16 v1, -0x1

    .line 8
    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    iget v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->w:I

    .line 12
    .line 13
    int-to-long v3, v0

    .line 14
    cmp-long v0, p1, v3

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y:Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->w:I

    .line 26
    .line 27
    if-le v0, v3, :cond_1

    .line 28
    .line 29
    return-wide v1

    .line 30
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y:Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_4

    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    move v3, v0

    .line 44
    :goto_0
    iget v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->w:I

    .line 45
    .line 46
    if-gt v3, v4, :cond_3

    .line 47
    .line 48
    iget-object v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->x:[Z

    .line 49
    .line 50
    aget-boolean v5, v4, v3

    .line 51
    .line 52
    if-nez v5, :cond_2

    .line 53
    .line 54
    int-to-long v5, v3

    .line 55
    const/4 v0, 0x1

    .line 56
    aput-boolean v0, v4, v3

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    const-wide/16 v5, 0x0

    .line 63
    .line 64
    :goto_1
    if-eqz v0, :cond_4

    .line 65
    .line 66
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y:Ljava/util/HashMap;

    .line 67
    .line 68
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    :cond_4
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y:Ljava/util/HashMap;

    .line 80
    .line 81
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    if-eqz p0, :cond_5

    .line 90
    .line 91
    check-cast p0, Ljava/lang/Long;

    .line 92
    .line 93
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 94
    .line 95
    .line 96
    move-result-wide p0

    .line 97
    return-wide p0

    .line 98
    :cond_5
    :goto_2
    return-wide v1
.end method

.method private K()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic a(Ltv/danmaku/ijk/media/sink/AgoraWriter;JII)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->v(JII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/sink/CongressUtil;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Q:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ltv/danmaku/ijk/media/sink/AgoraWriter;J)J
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public static synthetic e(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/sink/AgoraWriter;)[Z
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->x:[Z

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/util/HashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y:Ljava/util/HashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->j:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lcom/immomo/mediacore/audio/AudioProcess;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic k(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ltv/danmaku/ijk/media/streamer/StreamProducer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Lio/agora/rtc2/RtcEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic n(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic o(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->e:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ll/ebl0;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->U:Ll/ebl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Ltv/danmaku/ijk/media/sink/AgoraWriter;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->z:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method private t()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->D:Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 3
    .line 4
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->B:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 5
    .line 6
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->C:Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;

    .line 7
    .line 8
    return-void
.end method

.method private final u(II)V
    .locals 4

    .line 1
    const-string v0, "configEngine "

    .line 2
    .line 3
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    monitor-exit v1

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 15
    .line 16
    iput p1, v3, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->a:I

    .line 17
    .line 18
    iput p2, v3, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->b:I

    .line 19
    .line 20
    invoke-virtual {v2, p1}, Lio/agora/rtc2/RtcEngine;->setClientRole(I)I

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->K()V

    .line 24
    .line 25
    .line 26
    const-string p2, "AgoraWriter"

    .line 27
    .line 28
    new-instance v2, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p1, " "

    .line 37
    .line 38
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 42
    .line 43
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->b:I

    .line 44
    .line 45
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    monitor-exit v1

    .line 56
    return-void

    .line 57
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    throw p0
.end method

.method private v(JII)V
    .locals 10

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i:Landroid/os/Handler;

    .line 7
    .line 8
    new-instance v1, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;

    .line 9
    .line 10
    move-object v2, p0

    .line 11
    move-wide v3, p1

    .line 12
    move v5, p3

    .line 13
    move v6, p4

    .line 14
    invoke-direct/range {v1 .. v6}, Ltv/danmaku/ijk/media/sink/AgoraWriter$3;-><init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;JII)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->z:Ljava/util/Map;

    .line 21
    .line 22
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    invoke-direct/range {p0 .. p2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I(J)J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    new-instance v0, Ltv/danmaku/ijk/media/util/helpSurface;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-direct {v0, v1, v4, v5}, Ltv/danmaku/ijk/media/util/helpSurface;-><init>(Landroid/view/SurfaceHolder;J)V

    .line 44
    .line 45
    .line 46
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Q:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/util/helpSurface;->c()Landroid/view/Surface;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v1, p1, p2, v3}, Lcom/immomo/mediacore/sink/CongressUtil;->setVideoSurface(JLandroid/view/Surface;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    const-wide/16 v6, -0x1

    .line 58
    .line 59
    cmp-long v1, v4, v6

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 64
    .line 65
    const/4 v8, 0x0

    .line 66
    const/4 v9, 0x5

    .line 67
    move v6, p3

    .line 68
    move v7, p4

    .line 69
    invoke-virtual/range {v3 .. v9}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L1(JIIII)V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 73
    .line 74
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J0()Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/util/helpSurface;->h(Ltv/danmaku/ijk/media/streamer/MomoSurface;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->z:Ljava/util/Map;

    .line 82
    .line 83
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    :cond_3
    :goto_0
    return-void
.end method

.method private w()Lio/agora/rtc2/RtcEngine;
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    const/4 v0, 0x3

    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->z([B)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_4

    .line 20
    .line 21
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->s:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->e:Landroid/content/Context;

    .line 33
    .line 34
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->s:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 37
    .line 38
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->v:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 39
    .line 40
    invoke-static {v0, v1, v2}, Lio/agora/rtc2/RtcEngine;->create(Landroid/content/Context;Ljava/lang/String;Lio/agora/rtc2/IRtcEngineEventHandler;)Lio/agora/rtc2/RtcEngine;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    :goto_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->e:Landroid/content/Context;

    .line 48
    .line 49
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 50
    .line 51
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->v:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lio/agora/rtc2/RtcEngine;->create(Landroid/content/Context;Ljava/lang/String;Lio/agora/rtc2/IRtcEngineEventHandler;)Lio/agora/rtc2/RtcEngine;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 58
    .line 59
    :goto_1
    sget-boolean v0, Ll/t9c;->a:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    goto :goto_2

    .line 62
    :catch_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    const/16 v1, -0x130

    .line 67
    .line 68
    const/4 v2, -0x1

    .line 69
    const/16 v3, 0x12c

    .line 70
    .line 71
    invoke-virtual {v0, v3, v1, v2, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 75
    .line 76
    iget v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->S:I

    .line 77
    .line 78
    const/4 v2, 0x2

    .line 79
    const/4 v3, 0x1

    .line 80
    const/16 v4, 0x400

    .line 81
    .line 82
    invoke-virtual {v0, v1, v3, v2, v4}, Lio/agora/rtc2/RtcEngine;->setRecordingAudioFrameParameters(IIII)I

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 86
    .line 87
    iget v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->S:I

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-virtual {v0, v1, v3, v2, v4}, Lio/agora/rtc2/RtcEngine;->setPlaybackAudioFrameParameters(IIII)I

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 94
    .line 95
    invoke-virtual {v0, v3}, Lio/agora/rtc2/RtcEngine;->setChannelProfile(I)I

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Lio/agora/rtc2/RtcEngine;->enableDualStreamMode(Z)I

    .line 101
    .line 102
    .line 103
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 104
    .line 105
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 106
    .line 107
    if-nez v0, :cond_3

    .line 108
    .line 109
    invoke-virtual {v1}, Lio/agora/rtc2/RtcEngine;->enableVideo()I

    .line 110
    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_3
    invoke-virtual {v1}, Lio/agora/rtc2/RtcEngine;->disableVideo()I

    .line 114
    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_4
    const-string p0, "NEED TO use your vendor key, get your own key at https://dashboard.agora.io/"

    .line 118
    .line 119
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    const/4 p0, 0x0

    .line 123
    return-object p0

    .line 124
    :cond_5
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 125
    .line 126
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->isTextureEncodeSupported()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->f:Z

    .line 131
    .line 132
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 133
    .line 134
    return-object p0

    .line 135
    :array_0
    .array-data 1
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method private y()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->D:Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->B:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->C:Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method


# virtual methods
.method public D()V
    .locals 1

    .line 1
    const-string p0, "AgoraWriter"

    .line 2
    .line 3
    const-string v0, "onMediaEngineLoadSuccess"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public F(I)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Q:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/CongressUtil;->setYuvCallback(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_1
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    :cond_0
    :goto_0
    return-void
.end method

.method public J(JLjava/nio/ByteBuffer;I)V
    .locals 3

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "writevideo:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p4, ";timeStamp:"

    .line 14
    .line 15
    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 29
    .line 30
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-nez p1, :cond_0

    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_0
    iget p2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 38
    .line 39
    const/16 p4, 0xb0

    .line 40
    .line 41
    if-ge p2, p4, :cond_1

    .line 42
    .line 43
    iput p4, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 44
    .line 45
    :cond_1
    iget p2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 46
    .line 47
    if-ge p2, p4, :cond_2

    .line 48
    .line 49
    iput p4, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 50
    .line 51
    :cond_2
    iget-boolean p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->f:Z

    .line 52
    .line 53
    if-nez p2, :cond_4

    .line 54
    .line 55
    iget-boolean p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 56
    .line 57
    if-eqz p2, :cond_4

    .line 58
    .line 59
    iget-boolean p2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 60
    .line 61
    if-nez p2, :cond_4

    .line 62
    .line 63
    new-instance p2, Lio/agora/rtc2/video/AgoraVideoFrame;

    .line 64
    .line 65
    invoke-direct {p2}, Lio/agora/rtc2/video/AgoraVideoFrame;-><init>()V

    .line 66
    .line 67
    .line 68
    const/4 p4, 0x1

    .line 69
    iput p4, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->format:I

    .line 70
    .line 71
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    iput-wide v0, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->timeStamp:J

    .line 76
    .line 77
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 78
    .line 79
    iput v0, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->stride:I

    .line 80
    .line 81
    iget p1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 82
    .line 83
    iput p1, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->height:I

    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    iput p1, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->rotation:I

    .line 87
    .line 88
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->array()[B

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p2, Lio/agora/rtc2/video/AgoraVideoFrame;->buf:[B

    .line 93
    .line 94
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 95
    .line 96
    monitor-enter p1

    .line 97
    :try_start_0
    iget-object p3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 98
    .line 99
    if-eqz p3, :cond_3

    .line 100
    .line 101
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I:Z

    .line 102
    .line 103
    if-nez v0, :cond_3

    .line 104
    .line 105
    invoke-virtual {p3, p2}, Lio/agora/rtc2/RtcEngine;->pushExternalVideoFrame(Lio/agora/rtc2/video/AgoraVideoFrame;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :catchall_0
    move-exception p0

    .line 110
    goto :goto_1

    .line 111
    :cond_3
    :goto_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    iget p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->v:I

    .line 113
    .line 114
    add-int/2addr p1, p4

    .line 115
    iput p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->v:I

    .line 116
    .line 117
    const/16 p2, 0x14

    .line 118
    .line 119
    if-le p1, p2, :cond_4

    .line 120
    .line 121
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->C()V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 126
    throw p0

    .line 127
    :cond_4
    :goto_2
    return-void
.end method

.method public SabineEffectReset()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectReset()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SabineEffectSet(IIF)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public SetSubVideoPos(JIIII)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    cmp-long v0, v0, p1

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-direct {p0, p1, p2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I(J)J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    const-wide/16 p1, -0x1

    .line 19
    .line 20
    cmp-long p1, v2, p1

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 25
    .line 26
    const/4 v8, 0x0

    .line 27
    move v4, p3

    .line 28
    move v5, p4

    .line 29
    move v6, p5

    .line 30
    move v7, p6

    .line 31
    invoke-virtual/range {v1 .. v8}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K1(JIIIII)V

    .line 32
    .line 33
    .line 34
    :cond_1
    :goto_0
    return-void
.end method

.method public addEventHandler(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->j:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->q(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->r(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->s(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->t(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustEQ(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustEQ(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustEf(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustEf(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public adjustTune(IZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public changeRole(I)I
    .locals 6

    .line 1
    const-string v0, "changeRole:"

    .line 2
    .line 3
    const-string v1, "AgoraWriter"

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "changeRole:"

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-virtual {p0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 24
    .line 25
    .line 26
    iget v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->T:I

    .line 27
    .line 28
    const/4 v3, -0x1

    .line 29
    if-ne p1, v2, :cond_0

    .line 30
    .line 31
    return v3

    .line 32
    :cond_0
    iput p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->T:I

    .line 33
    .line 34
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 35
    .line 36
    invoke-virtual {v2, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1(Z)V

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 40
    .line 41
    monitor-enter v2

    .line 42
    const/4 v4, 0x1

    .line 43
    if-ne v4, p1, :cond_1

    .line 44
    .line 45
    :try_start_0
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 46
    .line 47
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->f:Z

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 52
    .line 53
    iget-object v1, v1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 54
    .line 55
    new-instance v5, Ltv/danmaku/ijk/media/sink/AgoraWriter$5;

    .line 56
    .line 57
    invoke-direct {v5, p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter$5;-><init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v5}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->addSoftListener(Ll/qmq0$a;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception p0

    .line 65
    goto :goto_3

    .line 66
    :cond_1
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h:Z

    .line 67
    .line 68
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 69
    .line 70
    :cond_2
    :goto_0
    if-ne v4, p1, :cond_3

    .line 71
    .line 72
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 73
    .line 74
    if-nez v1, :cond_5

    .line 75
    .line 76
    :cond_3
    const/4 v1, 0x2

    .line 77
    if-eq v1, p1, :cond_5

    .line 78
    .line 79
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I:Z

    .line 80
    .line 81
    if-eq v1, v4, :cond_5

    .line 82
    .line 83
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 84
    .line 85
    if-eqz v1, :cond_4

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    iput-boolean v4, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F:Z

    .line 89
    .line 90
    goto :goto_2

    .line 91
    :cond_5
    :goto_1
    const-string v1, "AgoraWriter"

    .line 92
    .line 93
    new-instance v3, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E()V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 112
    .line 113
    invoke-virtual {v0, p1}, Lio/agora/rtc2/RtcEngine;->setClientRole(I)I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    :goto_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    if-ne v4, p1, :cond_7

    .line 119
    .line 120
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I:Z

    .line 121
    .line 122
    if-eq p1, v4, :cond_6

    .line 123
    .line 124
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 125
    .line 126
    if-ne p1, v4, :cond_7

    .line 127
    .line 128
    :cond_6
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->C()V

    .line 129
    .line 130
    .line 131
    :cond_7
    return v3

    .line 132
    :goto_3
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 133
    throw p0
.end method

.method public enableAudio(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->enableAudio()I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->disableAudio()I

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public enableAudioVolumeIndication(II)V
    .locals 1

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, p1, p2, v0}, Lio/agora/rtc2/RtcEngine;->enableAudioVolumeIndication(IIZ)I

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public enableCommMode(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p0, "{\"che.audio.live_for_comm\":true}"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const-string p1, "{\"che.audio.live_for_comm\":false}"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public enableVideo(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->enableVideo()I

    .line 8
    .line 9
    .line 10
    iget-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 11
    .line 12
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-ne p1, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y0()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 22
    .line 23
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z0()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    div-int/lit16 v0, v0, 0x3e8

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 35
    .line 36
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R0()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    div-int/lit16 v0, v0, 0x3e8

    .line 41
    .line 42
    :goto_0
    if-nez p1, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    iget v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 46
    .line 47
    const/16 v2, 0xb0

    .line 48
    .line 49
    if-ge v1, v2, :cond_2

    .line 50
    .line 51
    iput v2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 52
    .line 53
    :cond_2
    iget v1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 54
    .line 55
    if-ge v1, v2, :cond_3

    .line 56
    .line 57
    iput v2, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 58
    .line 59
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v2, "setVideoProfileEx1 bitrate:"

    .line 62
    .line 63
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v1, "AgoraWriter"

    .line 74
    .line 75
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 79
    .line 80
    const-string v1, "{\"che.video.keyFrameInterval\":1}"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    iget v0, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 86
    .line 87
    iput v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->L:I

    .line 88
    .line 89
    iget p1, p1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 90
    .line 91
    iput p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->M:I

    .line 92
    .line 93
    return-void

    .line 94
    :cond_4
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->disableVideo()I

    .line 95
    .line 96
    .line 97
    :cond_5
    :goto_1
    return-void
.end method

.method public bridge synthetic getAgoraEngine()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->x()Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getAudioBitRate()I
    .locals 1

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->z()Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txAudioKBitRate:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    return v0
.end method

.method public getAudioRxbytes()J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getAudioVideoStatics()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->u()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "[(0)]"

    .line 11
    .line 12
    return-object p0
.end method

.method public getAvFlag()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-super {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getAvFlag()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getAverageSendBitRateB()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->z()Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txKBitRate:I

    .line 14
    .line 15
    mul-int/lit16 p0, p0, 0x3e8

    .line 16
    .line 17
    div-int/lit8 p0, p0, 0x8

    .line 18
    .line 19
    int-to-long v0, p0

    .line 20
    return-wide v0

    .line 21
    :cond_1
    const-wide/16 v0, 0x0

    .line 22
    .line 23
    return-wide v0
.end method

.method public getEarMonitoringAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getMasterAudioLevel()F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k:F

    .line 2
    .line 3
    return p0
.end method

.method public getMixedAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getMuteStatus()Z
    .locals 2

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->T:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :cond_0
    invoke-super {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getMuteStatus()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    or-int/2addr p0, v1

    .line 12
    return p0
.end method

.method public getObservedAudioFramePosition()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getPlaybackAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getPublisherVideoHigh()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->M:I

    .line 8
    .line 9
    return p0
.end method

.method public getPublisherVideoWidth()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->L:I

    .line 8
    .line 9
    return p0
.end method

.method public getRecordAudioParams()Lio/agora/rtc2/audio/AudioParams;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public getRxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->z()Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->rxBytes:I

    .line 14
    .line 15
    int-to-long v0, p0

    .line 16
    return-wide v0

    .line 17
    :cond_1
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    return-wide v0
.end method

.method public getSlaveAudioLevel()F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->l:F

    .line 2
    .line 3
    return p0
.end method

.method public getStreamerType()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getSurroundMusicDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->getAudioMixingDuration()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public getSurroundMusicPos()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->getAudioMixingCurrentPosition()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public getTxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->z()Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RtcStats;->txBytes:I

    .line 14
    .line 15
    int-to-long v0, p0

    .line 16
    return-wide v0

    .line 17
    :cond_1
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    return-wide v0
.end method

.method public getVideoBitRate()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->v()Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :cond_0
    if-eqz v1, :cond_3

    .line 15
    .line 16
    iget p0, v1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentBitrate:I

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->x()Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :cond_2
    if-eqz v1, :cond_3

    .line 26
    .line 27
    iget p0, v1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->receivedBitrate:I

    .line 28
    .line 29
    return p0

    .line 30
    :cond_3
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public getVideoFrameRate()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->v()Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :cond_0
    if-eqz v1, :cond_3

    .line 15
    .line 16
    iget p0, v1, Lio/agora/rtc2/IRtcEngineEventHandler$LocalVideoStats;->sentFrameRate:I

    .line 17
    .line 18
    return p0

    .line 19
    :cond_1
    if-eqz p0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->x()Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :cond_2
    if-eqz v1, :cond_3

    .line 26
    .line 27
    iget p0, v1, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->rendererOutputFrameRate:I

    .line 28
    .line 29
    return p0

    .line 30
    :cond_3
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public getVideoFreezeCount()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->w()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    return v1

    .line 16
    :cond_1
    if-eqz p0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->y()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_2
    return v1
.end method

.method public getVideoRxbytes()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->x()Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    if-eqz p0, :cond_1

    .line 12
    .line 13
    iget p0, p0, Lio/agora/rtc2/IRtcEngineEventHandler$RemoteVideoStats;->receivedBitrate:I

    .line 14
    .line 15
    int-to-long v0, p0

    .line 16
    return-wide v0

    .line 17
    :cond_1
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    return-wide v0
.end method

.method public getWriteByte()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->getTxbytes()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public ignoreWriterSEI(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public isPlaying()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public muteAllRemoteAudioStream(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "muteAllRemoteAudioStream mute"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AgoraWriter"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteAudioStreams(Z)I

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public muteAllRemoteVideoStream(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteVideoStreams(Z)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public muteLocalAudioStream(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->muteLocalAudioStream(Z)I

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 12
    .line 13
    iget v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k:F

    .line 14
    .line 15
    const/high16 v2, 0x42c80000    # 100.0f

    .line 16
    .line 17
    mul-float/2addr v1, v2

    .line 18
    float-to-int v1, v1

    .line 19
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->adjustRecordingSignalVolume(I)I

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->adjustRecordingSignalVolume(I)I

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setMuteStatus(Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public muteLocalAudioStreamForGame(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "muteLocalAudioStreamForGame "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AgoraWriter"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Lio/agora/rtc2/RtcEngine;->muteLocalAudioStream(Z)I

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setMuteStatus(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public muteLocalVideoStream(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->muteLocalVideoStream(Z)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public muteRemoteAudioStream(JZ)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "muteRemoteAudioStream uid"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ";mute:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "AgoraWriter"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    long-to-int p1, p1

    .line 33
    invoke-virtual {p0, p1, p3}, Lio/agora/rtc2/RtcEngine;->muteRemoteAudioStream(IZ)I

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public muteRemoteVideoStream(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    long-to-int p1, p1

    .line 6
    invoke-virtual {p0, p1, p3}, Lio/agora/rtc2/RtcEngine;->muteRemoteVideoStream(IZ)I

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public notifyUpdateResolution()V
    .locals 5

    .line 1
    const-string v0, "setVideoBitrate width:"

    .line 2
    .line 3
    const-string v1, "AgoraWriter"

    .line 4
    .line 5
    const-string v2, "notifyUpdateResolution:"

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v1

    .line 13
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    monitor-exit v1

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget-boolean v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 22
    .line 23
    const/4 v4, 0x1

    .line 24
    if-ne v3, v4, :cond_1

    .line 25
    .line 26
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y0()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    iput-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    iput-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 38
    .line 39
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 40
    .line 41
    if-nez v2, :cond_2

    .line 42
    .line 43
    monitor-exit v1

    .line 44
    return-void

    .line 45
    :cond_2
    const-string v2, "AgoraWriter"

    .line 46
    .line 47
    new-instance v3, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 53
    .line 54
    iget v0, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    const-string v0, ";heigh:"

    .line 60
    .line 61
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 65
    .line 66
    iget v0, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 67
    .line 68
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F:Z

    .line 79
    .line 80
    if-ne v0, v4, :cond_3

    .line 81
    .line 82
    const-string v0, "AgoraWriter"

    .line 83
    .line 84
    const-string v2, "dealyed changeRole:1"

    .line 85
    .line 86
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E()V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 93
    .line 94
    invoke-virtual {p0, v4}, Lio/agora/rtc2/RtcEngine;->setClientRole(I)I

    .line 95
    .line 96
    .line 97
    :cond_3
    monitor-exit v1

    .line 98
    return-void

    .line 99
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    throw p0
.end method

.method public onEarMonitoringAudioFrame(IIIIILjava/nio/ByteBuffer;JI)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onMixedAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onPlaybackAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onPlaybackAudioFrameBeforeMixing(Ljava/lang/String;IIIIIILjava/nio/ByteBuffer;JIIJ)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onRecordAudioFrame(Ljava/lang/String;IIIIILjava/nio/ByteBuffer;JI)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public pause()V
    .locals 0

    return-void
.end method

.method public pausePlaying()V
    .locals 2

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "pausePlaying"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteAudioStreams(Z)I

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteVideoStreams(Z)I

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public pauseRecording()V
    .locals 3

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "pauseRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->muteLocalAudioStream(Z)I

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/sink/AgoraWriter$2;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter$2;-><init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->K:Ljava/lang/Runnable;

    .line 22
    .line 23
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i:Landroid/os/Handler;

    .line 24
    .line 25
    const-wide/16 v1, 0x7530

    .line 26
    .line 27
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public pauseSurroundMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->pauseAudioMixing()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public postDrawImage(I)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->f:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_6

    .line 5
    .line 6
    if-eqz p1, :cond_6

    .line 7
    .line 8
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 9
    .line 10
    if-eqz v0, :cond_6

    .line 11
    .line 12
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t:Z

    .line 13
    .line 14
    if-nez v0, :cond_6

    .line 15
    .line 16
    const-string v0, "AgoraWriter"

    .line 17
    .line 18
    new-instance v2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v3, "postDrawImage texture: "

    .line 21
    .line 22
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->v:I

    .line 36
    .line 37
    add-int/2addr v0, v1

    .line 38
    iput v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->v:I

    .line 39
    .line 40
    const/16 v2, 0x14

    .line 41
    .line 42
    if-le v0, v2, :cond_0

    .line 43
    .line 44
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->C()V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 48
    .line 49
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 50
    .line 51
    if-ne v0, v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y0()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    :goto_0
    if-nez v0, :cond_2

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_2
    iget v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 66
    .line 67
    const/16 v2, 0xb0

    .line 68
    .line 69
    if-ge v1, v2, :cond_3

    .line 70
    .line 71
    iput v2, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 72
    .line 73
    :cond_3
    iget v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 74
    .line 75
    if-ge v1, v2, :cond_4

    .line 76
    .line 77
    iput v2, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 78
    .line 79
    :cond_4
    const-string v1, "AgoraWriter"

    .line 80
    .line 81
    new-instance v2, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    const-string v3, "postDrawImage texture: "

    .line 84
    .line 85
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v3, "qu.resX:"

    .line 92
    .line 93
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 97
    .line 98
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v3, "qu.resY"

    .line 102
    .line 103
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget v3, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 107
    .line 108
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    new-instance v1, Lio/agora/rtc2/video/AgoraVideoFrame;

    .line 119
    .line 120
    invoke-direct {v1}, Lio/agora/rtc2/video/AgoraVideoFrame;-><init>()V

    .line 121
    .line 122
    .line 123
    const/16 v2, 0xa

    .line 124
    .line 125
    iput v2, v1, Lio/agora/rtc2/video/AgoraVideoFrame;->format:I

    .line 126
    .line 127
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 128
    .line 129
    .line 130
    move-result-wide v2

    .line 131
    iput-wide v2, v1, Lio/agora/rtc2/video/AgoraVideoFrame;->timeStamp:J

    .line 132
    .line 133
    iget v2, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 134
    .line 135
    iput v2, v1, Lio/agora/rtc2/video/AgoraVideoFrame;->stride:I

    .line 136
    .line 137
    iget v0, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 138
    .line 139
    iput v0, v1, Lio/agora/rtc2/video/AgoraVideoFrame;->height:I

    .line 140
    .line 141
    iput p1, v1, Lio/agora/rtc2/video/AgoraVideoFrame;->textureID:I

    .line 142
    .line 143
    sget-object p1, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Y:[F

    .line 144
    .line 145
    iput-object p1, v1, Lio/agora/rtc2/video/AgoraVideoFrame;->transform:[F

    .line 146
    .line 147
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 148
    .line 149
    monitor-enter p1

    .line 150
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 151
    .line 152
    if-eqz v0, :cond_5

    .line 153
    .line 154
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->I:Z

    .line 155
    .line 156
    if-nez p0, :cond_5

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->pushExternalVideoFrame(Lio/agora/rtc2/video/AgoraVideoFrame;)Z

    .line 159
    .line 160
    .line 161
    goto :goto_1

    .line 162
    :catchall_0
    move-exception p0

    .line 163
    goto :goto_2

    .line 164
    :cond_5
    :goto_1
    monitor-exit p1

    .line 165
    return-void

    .line 166
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 167
    throw p0

    .line 168
    :cond_6
    :goto_3
    return-void
.end method

.method public prepare()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public release()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->stopRecording()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->stopSurroundMusic()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->addMRtcAudioHandlerEx(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->addMRtcChannelHandler(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i:Landroid/os/Handler;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1, v0, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i:Landroid/os/Handler;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->DeinitAudioTracks()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 33
    .line 34
    monitor-enter v1

    .line 35
    const/4 v2, 0x0

    .line 36
    :try_start_0
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 37
    .line 38
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h:Z

    .line 39
    .line 40
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    invoke-virtual {v2, v0}, Lio/agora/rtc2/RtcEngine;->registerAudioFrameObserver(Lio/agora/rtc2/IAudioFrameObserver;)I

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->destroy()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 56
    .line 57
    if-eqz v2, :cond_2

    .line 58
    .line 59
    iget-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->X:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 60
    .line 61
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->B(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 65
    .line 66
    iget-object v3, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->j:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->B(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V

    .line 69
    .line 70
    .line 71
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 72
    .line 73
    iput-object v0, v2, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->v:Lio/agora/rtc2/IRtcEngineEventHandler;

    .line 74
    .line 75
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;->A()V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 79
    .line 80
    :cond_2
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->X:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 81
    .line 82
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->j:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 83
    .line 84
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 85
    .line 86
    if-eqz v2, :cond_3

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 92
    .line 93
    invoke-virtual {v2}, Lcom/immomo/mediacore/audio/AudioProcess;->release()V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 97
    .line 98
    :cond_3
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 99
    .line 100
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->e:Landroid/content/Context;

    .line 101
    .line 102
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 103
    .line 104
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->b:Ltv/danmaku/ijk/media/streamer/agora/MyEngineEventHandler;

    .line 105
    .line 106
    iput-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->d:Ljavax/microedition/khronos/egl/EGLContext;

    .line 107
    .line 108
    monitor-exit v1

    .line 109
    return-void

    .line 110
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    throw p0
.end method

.method public resume()V
    .locals 0

    return-void
.end method

.method public resumePlaying()V
    .locals 2

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "resumePlaying"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteAudioStreams(Z)I

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Lio/agora/rtc2/RtcEngine;->muteAllRemoteVideoStreams(Z)I

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public resumeRecording()V
    .locals 2

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "resumeRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Lio/agora/rtc2/RtcEngine;->muteLocalAudioStream(Z)I

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->i:Landroid/os/Handler;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->K:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public resumeSurroundMusic()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lio/agora/rtc2/RtcEngine;->resumeAudioMixing()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Q:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/CongressUtil;->clearPcmCallback()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :catch_1
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 16
    .line 17
    .line 18
    :cond_0
    :goto_0
    return-void
.end method

.method public setAudioHighQualityParameters(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->N:Z

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    const-string p1, "{\"che.audio.high.quality.mode\":true}"

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public setAudioSamplingRate(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->S:I

    .line 2
    .line 3
    return-void
.end method

.method public setChannalName(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 2
    .line 3
    iput-object p1, v0, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->d:Ljava/lang/String;

    .line 4
    .line 5
    invoke-super {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setChannalName(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setChannelkey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->r:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDefaultAudioRoutetoSpeakerphone(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->W:Z

    .line 2
    .line 3
    return-void
.end method

.method public setEnableSpeakerphone(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setEnableSpeakerphone(Z)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public setEncryptionMode(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setEncryptionSecret(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setJsonForPostion(Ljava/lang/String;)V
    .locals 13

    .line 1
    const-string v0, "renderMode"

    .line 2
    .line 3
    const-string v1, "alpha"

    .line 4
    .line 5
    const-string v2, "z"

    .line 6
    .line 7
    const-string v3, "h"

    .line 8
    .line 9
    const-string v4, "w"

    .line 10
    .line 11
    const-string v5, "y"

    .line 12
    .line 13
    const-string v6, "x"

    .line 14
    .line 15
    const-string v7, "id"

    .line 16
    .line 17
    const-string v8, "has"

    .line 18
    .line 19
    const-string v9, "conf"

    .line 20
    .line 21
    const-string v10, "mid"

    .line 22
    .line 23
    invoke-super {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setJsonForPostion(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-boolean v11, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 27
    .line 28
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 29
    .line 30
    const/4 v12, 0x1

    .line 31
    if-ne v11, v12, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y0()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    :goto_0
    if-nez p0, :cond_1

    .line 43
    .line 44
    goto/16 :goto_3

    .line 45
    .line 46
    :cond_1
    :try_start_0
    new-instance p0, Lorg/json/JSONObject;

    .line 47
    .line 48
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-string p1, ""

    .line 52
    .line 53
    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v11

    .line 57
    if-eqz v11, :cond_2

    .line 58
    .line 59
    invoke-virtual {p0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    goto/16 :goto_3

    .line 70
    .line 71
    :cond_3
    invoke-virtual {p0, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_4

    .line 82
    .line 83
    goto/16 :goto_3

    .line 84
    .line 85
    :cond_4
    invoke-virtual {p0, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    goto :goto_1

    .line 90
    :cond_5
    invoke-virtual {p0, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    :goto_1
    if-eqz p0, :cond_f

    .line 95
    .line 96
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-nez p1, :cond_6

    .line 101
    .line 102
    goto :goto_3

    .line 103
    :cond_6
    const/4 p1, 0x0

    .line 104
    :goto_2
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    .line 105
    .line 106
    .line 107
    move-result v8

    .line 108
    if-ge p1, v8, :cond_f

    .line 109
    .line 110
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v8

    .line 114
    check-cast v8, Lorg/json/JSONObject;

    .line 115
    .line 116
    if-eqz v8, :cond_7

    .line 117
    .line 118
    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result v9

    .line 122
    if-eqz v9, :cond_7

    .line 123
    .line 124
    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    :cond_7
    if-eqz v8, :cond_8

    .line 128
    .line 129
    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 130
    .line 131
    .line 132
    move-result v9

    .line 133
    if-eqz v9, :cond_8

    .line 134
    .line 135
    invoke-virtual {v8, v6}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 136
    .line 137
    .line 138
    :cond_8
    if-eqz v8, :cond_9

    .line 139
    .line 140
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 141
    .line 142
    .line 143
    move-result v9

    .line 144
    if-eqz v9, :cond_9

    .line 145
    .line 146
    invoke-virtual {v8, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 147
    .line 148
    .line 149
    :cond_9
    if-eqz v8, :cond_a

    .line 150
    .line 151
    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 152
    .line 153
    .line 154
    move-result v9

    .line 155
    if-eqz v9, :cond_a

    .line 156
    .line 157
    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 158
    .line 159
    .line 160
    :cond_a
    if-eqz v8, :cond_b

    .line 161
    .line 162
    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v9

    .line 166
    if-eqz v9, :cond_b

    .line 167
    .line 168
    invoke-virtual {v8, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 169
    .line 170
    .line 171
    :cond_b
    if-eqz v8, :cond_c

    .line 172
    .line 173
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v9

    .line 177
    if-eqz v9, :cond_c

    .line 178
    .line 179
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 180
    .line 181
    .line 182
    :cond_c
    if-eqz v8, :cond_d

    .line 183
    .line 184
    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 185
    .line 186
    .line 187
    move-result v9

    .line 188
    if-eqz v9, :cond_d

    .line 189
    .line 190
    invoke-virtual {v8, v1}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 191
    .line 192
    .line 193
    :cond_d
    if-eqz v8, :cond_e

    .line 194
    .line 195
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 196
    .line 197
    .line 198
    move-result v9

    .line 199
    if-eqz v9, :cond_e

    .line 200
    .line 201
    invoke-virtual {v8, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    .line 203
    .line 204
    :cond_e
    add-int/lit8 p1, p1, 0x1

    .line 205
    .line 206
    goto :goto_2

    .line 207
    :cond_f
    :goto_3
    return-void

    .line 208
    :catch_0
    move-exception p0

    .line 209
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 210
    .line 211
    .line 212
    return-void
.end method

.method public setMasterAudioLevel(F)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    iget v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->O:F

    .line 8
    .line 9
    mul-float/2addr v0, p1

    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->k:F

    .line 11
    .line 12
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    const/high16 v2, 0x42c80000    # 100.0f

    .line 17
    .line 18
    mul-float/2addr v0, v2

    .line 19
    float-to-int v0, v0

    .line 20
    invoke-virtual {v1, v0}, Lio/agora/rtc2/RtcEngine;->adjustRecordingSignalVolume(I)I

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioLevel(F)V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method

.method public setOnSurroundMusicStatusListener(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 2
    .line 3
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 4
    .line 5
    return-void
.end method

.method public setParameters(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setParameters(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->B:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 2
    .line 3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->H()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setPlayBackAudioLevel(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    const/high16 v0, 0x42c80000    # 100.0f

    .line 12
    .line 13
    mul-float/2addr p1, v0

    .line 14
    float-to-int p1, p1

    .line 15
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->adjustPlaybackSignalVolume(I)I

    .line 16
    .line 17
    .line 18
    :cond_1
    return-void
.end method

.method public setPlaybackDateCallback(Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->C:Lcom/immomo/mediacore/sink/SinkBase$PlaybackDateCallback;

    .line 2
    .line 3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->H()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setRecordDateCallback(Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->D:Lcom/immomo/mediacore/sink/SinkBase$RecordDateCallback;

    .line 2
    .line 3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->y()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->H()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public setRole(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->T:I

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->setClientRole(I)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setRoomMode(I)V
    .locals 0

    .line 1
    const/4 p1, 0x2

    .line 2
    iput p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->R:I

    .line 3
    .line 4
    return-void
.end method

.method public setRtmpPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setRtmpPath(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setSlaveAudioLevel(F)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    iget v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->P:F

    .line 8
    .line 9
    mul-float/2addr v0, p1

    .line 10
    iput v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->l:F

    .line 11
    .line 12
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    const/high16 v2, 0x42c80000    # 100.0f

    .line 17
    .line 18
    mul-float/2addr v0, v2

    .line 19
    float-to-int v0, v0

    .line 20
    invoke-virtual {v1, v0}, Lio/agora/rtc2/RtcEngine;->adjustAudioMixingVolume(I)I

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioLevel(F)V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method

.method public setStreamerInOutAndType(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setUserID(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->a:Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;

    .line 2
    .line 3
    iput p1, v0, Ltv/danmaku/ijk/media/streamer/agora/EngineConfig;->c:I

    .line 4
    .line 5
    invoke-super {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setUserID(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setVideoChannellistener(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ebl0;

    .line 2
    .line 3
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->U:Ll/ebl0;

    .line 4
    .line 5
    return-void
.end method

.method public startAttachStreamer()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->startRecording()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public startPlaying()V
    .locals 4

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "startPlaying:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getChannalName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_2

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 33
    .line 34
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1(Z)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->E:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 42
    .line 43
    const v1, 0x30d40

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P1(I)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 50
    .line 51
    const/16 v1, 0xb0

    .line 52
    .line 53
    invoke-virtual {v0, v1, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R1(II)V

    .line 54
    .line 55
    .line 56
    :cond_0
    const/4 v0, 0x2

    .line 57
    const/16 v1, 0x21

    .line 58
    .line 59
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->u(II)V

    .line 60
    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h:Z

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getChannalName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 70
    .line 71
    .line 72
    move-result-wide v1

    .line 73
    long-to-int v1, v1

    .line 74
    invoke-direct {p0, v0, v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A(Ljava/lang/String;I)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_1
    const-string p0, "startRecording getUserID =0"

    .line 79
    .line 80
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    const-string p0, "startPlaying getChannalName null exception"

    .line 85
    .line 86
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public startRecording()V
    .locals 4

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "startRecording"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getChannalName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_4

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    cmp-long v0, v0, v2

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 30
    .line 31
    .line 32
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F:Z

    .line 33
    .line 34
    iget-object v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1(Z)V

    .line 37
    .line 38
    .line 39
    iget v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->T:I

    .line 40
    .line 41
    const/16 v2, 0x21

    .line 42
    .line 43
    invoke-direct {p0, v1, v2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->u(II)V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x1

    .line 47
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 48
    .line 49
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->f:Z

    .line 50
    .line 51
    if-nez v2, :cond_0

    .line 52
    .line 53
    iget-object v2, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 54
    .line 55
    iget-object v2, v2, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 56
    .line 57
    new-instance v3, Ltv/danmaku/ijk/media/sink/AgoraWriter$4;

    .line 58
    .line 59
    invoke-direct {v3, p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter$4;-><init>(Ltv/danmaku/ijk/media/sink/AgoraWriter;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->addSoftListener(Ll/qmq0$a;)V

    .line 63
    .line 64
    .line 65
    :cond_0
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->p:Z

    .line 66
    .line 67
    iput v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->v:I

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getChannalName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getUserID()J

    .line 74
    .line 75
    .line 76
    move-result-wide v2

    .line 77
    long-to-int v2, v2

    .line 78
    invoke-direct {p0, v0, v2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A(Ljava/lang/String;I)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->m:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 82
    .line 83
    if-eqz v0, :cond_1

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 86
    .line 87
    .line 88
    :cond_1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->A:Z

    .line 89
    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F(I)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-void

    .line 96
    :cond_3
    const-string p0, "startRecording getUserID =0"

    .line 97
    .line 98
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_4
    const-string p0, "startRecording getChannalName null exception"

    .line 103
    .line 104
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public startSurroundMusic(Ljava/lang/String;IJ)V
    .locals 0

    .line 1
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 10
    .line 11
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 12
    .line 13
    const/4 p2, 0x1

    .line 14
    const/4 p3, 0x0

    .line 15
    invoke-interface {p1, p0, p2, p3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public startSurroundMusicEx(Ljava/lang/String;ZZI)V
    .locals 0

    .line 1
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 10
    .line 11
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 12
    .line 13
    const/4 p2, 0x1

    .line 14
    const/4 p3, 0x0

    .line 15
    invoke-interface {p1, p0, p2, p3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public stopPlaying()V
    .locals 3

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "stopPlaying:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    const/4 v1, 0x0

    .line 12
    :try_start_0
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->h:Z

    .line 13
    .line 14
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 15
    .line 16
    const-string v2, "1"

    .line 17
    .line 18
    invoke-direct {p0, v2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->B(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F(I)V

    .line 22
    .line 23
    .line 24
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F:Z

    .line 25
    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    throw p0
.end method

.method public stopRecording()V
    .locals 3

    .line 1
    const-string v0, "AgoraWriter"

    .line 2
    .line 3
    const-string v1, "stopRecording:"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->G:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    invoke-super {p0}, Lcom/immomo/mediacore/sink/SinkBase;->stopRecording()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->g:Z

    .line 16
    .line 17
    const-string v2, "1"

    .line 18
    .line 19
    invoke-direct {p0, v2}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->B(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->s()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F(I)V

    .line 26
    .line 27
    .line 28
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->F:Z

    .line 29
    .line 30
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    invoke-direct {p0}, Ltv/danmaku/ijk/media/sink/AgoraWriter;->t()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0
.end method

.method public stopSurroundMusic()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lio/agora/rtc2/RtcEngine;->stopAudioMixing()I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->o:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->n:Ltv/danmaku/ijk/media/streamer/StreamProducer;

    .line 13
    .line 14
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-interface {v0, p0, v1, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;->a(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;II)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public updateChannelkey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->r:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lio/agora/rtc2/RtcEngine;->renewToken(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public writeAudio(JLjava/nio/ByteBuffer;J)V
    .locals 0

    return-void
.end method

.method public writeAudioExtradata(Ljava/nio/ByteBuffer;J)V
    .locals 0

    return-void
.end method

.method public writeVideo(JLjava/nio/ByteBuffer;J)V
    .locals 0

    return-void
.end method

.method public writeVideoExtradata(Ljava/nio/ByteBuffer;J)V
    .locals 0

    return-void
.end method

.method public writeVideoTexture(ILjavax/microedition/khronos/egl/EGLContext;IIJ)V
    .locals 0

    return-void
.end method

.method public x()Lio/agora/rtc2/RtcEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->c:Lio/agora/rtc2/RtcEngine;

    .line 2
    .line 3
    return-object p0
.end method

.method public z([B)Ljava/lang/String;
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/sink/AgoraWriter;->Q:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/CongressUtil;->getPara([B)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    .line 9
    return-object p0

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catch_1
    move-exception p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    const-string p0, "xxoo"

    .line 20
    .line 21
    return-object p0
.end method
