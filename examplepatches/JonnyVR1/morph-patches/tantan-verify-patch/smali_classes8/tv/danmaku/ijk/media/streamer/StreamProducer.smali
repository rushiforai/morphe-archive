.class public Ltv/danmaku/ijk/media/streamer/StreamProducer;
.super Lcom/immomo/mediacore/strinf/confrenceHelp;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediacore/strinf/NotifyCenter;
.implements Ltv/danmaku/ijk/media/streamer/MomoSurface$PostDrawImageCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;,
        Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;,
        Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;,
        Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;,
        Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;,
        Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;
    }
.end annotation


# static fields
.field private static T1:B


# instance fields
.field A:Landroid/app/Activity;

.field private A1:Z

.field B:Landroid/content/Context;

.field private B1:I

.field public C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

.field private C1:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

.field D:Landroid/content/IntentFilter;

.field private D1:Z

.field private E:Ljava/lang/Object;

.field private E0:J

.field private E1:Landroid/os/Handler;

.field private F:Ljava/lang/Object;

.field private F0:F

.field private F1:Landroid/os/HandlerThread;

.field G:I

.field private G0:F

.field private G1:Lcom/immomo/mediacore/audio/audio_Indicator;

.field private H:I

.field private H0:Z

.field private H1:Ljava/lang/Object;

.field private I:Ljava/nio/ByteBuffer;

.field private I0:Z

.field private volatile I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

.field private J:Ljava/nio/ByteBuffer;

.field private J0:J

.field private volatile J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

.field private K:Ljava/nio/ByteBuffer;

.field private K0:J

.field private volatile K1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

.field private L:I

.field private L0:J

.field L1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;

.field private M:I

.field private volatile M0:Z

.field private M1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;

.field private N:I

.field private volatile N0:Z

.field private N1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;

.field private O:[Ljava/nio/ByteBuffer;

.field private volatile O0:Z

.field private O1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

.field private P:Lcom/immomo/mediacore/audio/AudioProcess;

.field private P0:Landroid/media/AudioRecord;

.field private P1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;

.field private Q:I

.field private Q0:Landroid/view/Surface;

.field private Q1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

.field private R:Z

.field private R0:Landroid/view/Surface;

.field private R1:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

.field private S:I

.field private volatile S0:J

.field private S1:Landroid/os/Handler;

.field private T:Z

.field private volatile T0:J

.field private U:I

.field private U0:[B

.field private V:I

.field private V0:[B

.field private W:I

.field private W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

.field private X:I

.field private X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

.field private Y:F

.field private Y0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

.field private Z:I

.field private Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

.field private a:Landroid/graphics/PointF;

.field private a1:J

.field private b:F

.field protected b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

.field private c:Z

.field private c1:Z

.field private d:Z

.field private d1:Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;

.field private e:Ljava/lang/String;

.field private e1:Ljava/lang/Thread;

.field private final f:I

.field private f1:Ljava/lang/Thread;

.field protected g:Lcom/immomo/mediacore/audio/AudioQuality;

.field private g1:Ljava/lang/Thread;

.field protected h:Lcom/immomo/mediacore/audio/AudioQuality;

.field private h1:Ljava/lang/String;

.field protected i:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private i1:Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

.field protected j:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private j1:Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;

.field protected k:Lcom/immomo/mediacore/strinf/VideoQuality;

.field private k0:Z

.field private k1:I

.field protected l:B

.field private l1:J

.field protected m:I

.field protected m1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

.field protected n:I

.field private n1:Ltv/danmaku/ijk/media/source/SourceBase;

.field protected o:Landroid/media/MediaCodec;

.field private o1:Ltv/danmaku/ijk/media/source/audio/audioSource;

.field protected p:Landroid/media/MediaCodec;

.field private p0:Z

.field private p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

.field protected q:Landroid/media/MediaCodec;

.field private volatile q1:I

.field r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.field private r1:Lcom/immomo/mediacore/sink/SinkBase;

.field s:Ljava/nio/ByteBuffer;

.field private volatile s1:Lcom/immomo/mediacore/sink/SinkBase;

.field t:[Ljava/nio/ByteBuffer;

.field private t1:Z

.field private u:I

.field private u1:Z

.field private v:I

.field private v1:Ljava/util/Map;

.field private w:I

.field private w1:I

.field private x:I

.field private x1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;

.field private y:I

.field private y1:Z

.field private z:I

.field private z1:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "streamerCameraProducer"

    .line 2
    .line 3
    :try_start_0
    const-string v1, "android.media.MediaCodec"

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    const-string v1, "Phone supports the MediaCoded API"

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    sput-byte v1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T1:B

    .line 15
    .line 16
    const-string v1, "Phone supports the MediaCoded v2 API"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    const/4 v1, 0x1

    .line 23
    sput-byte v1, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T1:B

    .line 24
    .line 25
    const-string v1, "Phone does not support the MediaCodec API"

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ltv/danmaku/ijk/media/streamer/MomoSurface;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Lcom/immomo/mediacore/strinf/confrenceHelp;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/PointF;

    .line 5
    .line 6
    const/high16 v1, 0x41800000    # 16.0f

    .line 7
    .line 8
    const/high16 v2, 0x41100000    # 9.0f

    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a:Landroid/graphics/PointF;

    .line 14
    .line 15
    const/high16 v0, 0x3f800000    # 1.0f

    .line 16
    .line 17
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b:F

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c:Z

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d:Z

    .line 24
    .line 25
    const-string v3, "{}"

    .line 26
    .line 27
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e:Ljava/lang/String;

    .line 28
    .line 29
    const/16 v3, -0x3039

    .line 30
    .line 31
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f:I

    .line 32
    .line 33
    sget-object v3, Lcom/immomo/mediacore/audio/AudioQuality;->DEFAULT_AUDIO_QUALITY:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/immomo/mediacore/audio/AudioQuality;->clone()Lcom/immomo/mediacore/audio/AudioQuality;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 40
    .line 41
    invoke-virtual {v3}, Lcom/immomo/mediacore/audio/AudioQuality;->clone()Lcom/immomo/mediacore/audio/AudioQuality;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 46
    .line 47
    sget-object v3, Lcom/immomo/mediacore/strinf/VideoQuality;->DEFAULT_VIDEO_QUALITY:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 54
    .line 55
    invoke-virtual {v3}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 60
    .line 61
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 62
    .line 63
    invoke-virtual {v3}, Lcom/immomo/mediacore/strinf/VideoQuality;->clone()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 68
    .line 69
    const/4 v3, -0x1

    .line 70
    iput-byte v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 71
    .line 72
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m:I

    .line 73
    .line 74
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n:I

    .line 75
    .line 76
    const/4 v4, 0x0

    .line 77
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 78
    .line 79
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p:Landroid/media/MediaCodec;

    .line 80
    .line 81
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 82
    .line 83
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 84
    .line 85
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s:Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t:[Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u:I

    .line 90
    .line 91
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v:I

    .line 92
    .line 93
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w:I

    .line 94
    .line 95
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->x:I

    .line 96
    .line 97
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y:I

    .line 98
    .line 99
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z:I

    .line 100
    .line 101
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->A:Landroid/app/Activity;

    .line 102
    .line 103
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 104
    .line 105
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 106
    .line 107
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D:Landroid/content/IntentFilter;

    .line 108
    .line 109
    new-instance v5, Ljava/lang/Object;

    .line 110
    .line 111
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E:Ljava/lang/Object;

    .line 115
    .line 116
    new-instance v5, Ljava/lang/Object;

    .line 117
    .line 118
    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F:Ljava/lang/Object;

    .line 122
    .line 123
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G:I

    .line 124
    .line 125
    const/16 v5, 0x800

    .line 126
    .line 127
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H:I

    .line 128
    .line 129
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I:Ljava/nio/ByteBuffer;

    .line 134
    .line 135
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H:I

    .line 136
    .line 137
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J:Ljava/nio/ByteBuffer;

    .line 142
    .line 143
    iget v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H:I

    .line 144
    .line 145
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 146
    .line 147
    .line 148
    move-result-object v5

    .line 149
    iput-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K:Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L:I

    .line 152
    .line 153
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M:I

    .line 154
    .line 155
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N:I

    .line 156
    .line 157
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O:[Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q:I

    .line 160
    .line 161
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R:Z

    .line 162
    .line 163
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S:I

    .line 164
    .line 165
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T:Z

    .line 166
    .line 167
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U:I

    .line 168
    .line 169
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V:I

    .line 170
    .line 171
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W:I

    .line 172
    .line 173
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X:I

    .line 174
    .line 175
    const/4 v5, 0x0

    .line 176
    iput v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y:F

    .line 177
    .line 178
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z:I

    .line 179
    .line 180
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k0:Z

    .line 181
    .line 182
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p0:Z

    .line 183
    .line 184
    const-wide/16 v5, 0x0

    .line 185
    .line 186
    iput-wide v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E0:J

    .line 187
    .line 188
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F0:F

    .line 189
    .line 190
    const/high16 v0, 0x3f000000    # 0.5f

    .line 191
    .line 192
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G0:F

    .line 193
    .line 194
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H0:Z

    .line 195
    .line 196
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I0:Z

    .line 197
    .line 198
    const-wide/16 v7, 0x1770

    .line 199
    .line 200
    iput-wide v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J0:J

    .line 201
    .line 202
    const-wide/16 v7, 0x3e8

    .line 203
    .line 204
    iput-wide v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K0:J

    .line 205
    .line 206
    const-wide/16 v7, 0xbb8

    .line 207
    .line 208
    iput-wide v7, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L0:J

    .line 209
    .line 210
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M0:Z

    .line 211
    .line 212
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N0:Z

    .line 213
    .line 214
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O0:Z

    .line 215
    .line 216
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P0:Landroid/media/AudioRecord;

    .line 217
    .line 218
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q0:Landroid/view/Surface;

    .line 219
    .line 220
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R0:Landroid/view/Surface;

    .line 221
    .line 222
    iput-wide v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S0:J

    .line 223
    .line 224
    iput-wide v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T0:J

    .line 225
    .line 226
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U0:[B

    .line 227
    .line 228
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V0:[B

    .line 229
    .line 230
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 231
    .line 232
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 233
    .line 234
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 235
    .line 236
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 237
    .line 238
    const-wide/16 v5, -0x1

    .line 239
    .line 240
    iput-wide v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a1:J

    .line 241
    .line 242
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c1:Z

    .line 243
    .line 244
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i1:Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

    .line 245
    .line 246
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j1:Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;

    .line 247
    .line 248
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 249
    .line 250
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q1:I

    .line 251
    .line 252
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 253
    .line 254
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u1:Z

    .line 255
    .line 256
    new-instance v0, Ljava/util/HashMap;

    .line 257
    .line 258
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 259
    .line 260
    .line 261
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 262
    .line 263
    iput v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w1:I

    .line 264
    .line 265
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 266
    .line 267
    const/16 v0, 0x14

    .line 268
    .line 269
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z1:I

    .line 270
    .line 271
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->A1:Z

    .line 272
    .line 273
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B1:I

    .line 274
    .line 275
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 276
    .line 277
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D1:Z

    .line 278
    .line 279
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E1:Landroid/os/Handler;

    .line 280
    .line 281
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F1:Landroid/os/HandlerThread;

    .line 282
    .line 283
    new-instance v0, Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 284
    .line 285
    invoke-direct {v0}, Lcom/immomo/mediacore/audio/audio_Indicator;-><init>()V

    .line 286
    .line 287
    .line 288
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G1:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 289
    .line 290
    new-instance v0, Ljava/lang/Object;

    .line 291
    .line 292
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 293
    .line 294
    .line 295
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H1:Ljava/lang/Object;

    .line 296
    .line 297
    iput-object v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 298
    .line 299
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;

    .line 300
    .line 301
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$1;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 302
    .line 303
    .line 304
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 305
    .line 306
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;

    .line 307
    .line 308
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$2;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 309
    .line 310
    .line 311
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 312
    .line 313
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;

    .line 314
    .line 315
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$3;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 316
    .line 317
    .line 318
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;

    .line 319
    .line 320
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$4;

    .line 321
    .line 322
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$4;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 323
    .line 324
    .line 325
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;

    .line 326
    .line 327
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$5;

    .line 328
    .line 329
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$5;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 330
    .line 331
    .line 332
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;

    .line 333
    .line 334
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$6;

    .line 335
    .line 336
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$6;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 337
    .line 338
    .line 339
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

    .line 340
    .line 341
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$7;

    .line 342
    .line 343
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$7;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 344
    .line 345
    .line 346
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 347
    .line 348
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$8;

    .line 349
    .line 350
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$8;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 351
    .line 352
    .line 353
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

    .line 354
    .line 355
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;

    .line 356
    .line 357
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$9;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 358
    .line 359
    .line 360
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R1:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 361
    .line 362
    new-instance v0, Landroid/os/Handler;

    .line 363
    .line 364
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 365
    .line 366
    .line 367
    move-result-object v1

    .line 368
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 369
    .line 370
    .line 371
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S1:Landroid/os/Handler;

    .line 372
    .line 373
    new-instance v0, Ljava/lang/StringBuilder;

    .line 374
    .line 375
    const-string v1, "StreamProducer:"

    .line 376
    .line 377
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    iget-byte v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 381
    .line 382
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 383
    .line 384
    .line 385
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object v0

    .line 389
    const-string v1, "streamerCameraProducer"

    .line 390
    .line 391
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 392
    .line 393
    .line 394
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 395
    .line 396
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 397
    .line 398
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 399
    .line 400
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F1:Landroid/os/HandlerThread;

    .line 401
    .line 402
    if-nez p1, :cond_0

    .line 403
    .line 404
    new-instance p1, Landroid/os/HandlerThread;

    .line 405
    .line 406
    const-string p2, "ijkStrMonitor"

    .line 407
    .line 408
    invoke-direct {p1, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F1:Landroid/os/HandlerThread;

    .line 412
    .line 413
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 414
    .line 415
    .line 416
    new-instance p1, Landroid/os/Handler;

    .line 417
    .line 418
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F1:Landroid/os/HandlerThread;

    .line 419
    .line 420
    invoke-virtual {p2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 421
    .line 422
    .line 423
    move-result-object p2

    .line 424
    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 425
    .line 426
    .line 427
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E1:Landroid/os/Handler;

    .line 428
    .line 429
    :cond_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k2()V

    .line 430
    .line 431
    .line 432
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1()V

    .line 433
    .line 434
    .line 435
    return-void
.end method

.method public static synthetic A(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic B(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic C(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I
    .locals 2

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B1:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B1:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic D(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic E(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic F(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c1:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic I(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic J(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic K(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->x1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic L(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R1:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O0:Z

    .line 2
    .line 3
    return p0
.end method

.method private M1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E1:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$10;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$10;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 8
    .line 9
    .line 10
    const-wide/16 v2, 0x1388

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic N(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic O(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O:[Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic R(Ltv/danmaku/ijk/media/streamer/StreamProducer;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic S(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P0:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U(Ltv/danmaku/ijk/media/streamer/StreamProducer;Landroid/media/AudioRecord;)Landroid/media/AudioRecord;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P0:Landroid/media/AudioRecord;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic V(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N0:Z

    .line 2
    .line 3
    return p0
.end method

.method private V0()V
    .locals 3

    .line 1
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d1:Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;

    .line 8
    .line 9
    new-instance v0, Ljava/lang/Thread;

    .line 10
    .line 11
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d1:Ltv/danmaku/ijk/media/streamer/StreamProducer$VideoRecordRunnable;

    .line 12
    .line 13
    const-string v2, "live-media-StreamVideoRecorder"

    .line 14
    .line 15
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e1:Ljava/lang/Thread;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic W(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U0:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic X(Ltv/danmaku/ijk/media/streamer/StreamProducer;[B)[B
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U0:[B

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic Y(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/audio_Indicator;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G1:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z(Ltv/danmaku/ijk/media/streamer/StreamProducer;)[B
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V0:[B

    .line 2
    .line 3
    return-object p0
.end method

.method private Z1()V
    .locals 5

    .line 1
    const-string v0, "streamerCameraProducer"

    .line 2
    .line 3
    const-string v1, "AudioRecordRunnable startAudioCapture stopAudioCapture"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e2()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F:Ljava/lang/Object;

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 15
    .line 16
    if-nez v1, :cond_9

    .line 17
    .line 18
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto/16 :goto_1

    .line 23
    .line 24
    :cond_0
    const-string v1, "streamerCameraProducer"

    .line 25
    .line 26
    const-string v2, "AudioRecordRunnable startAudioCapture"

    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N0:Z

    .line 33
    .line 34
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 35
    .line 36
    if-nez v1, :cond_6

    .line 37
    .line 38
    new-instance v1, Lcom/immomo/mediacore/audio/AudioProcess;

    .line 39
    .line 40
    invoke-direct {v1}, Lcom/immomo/mediacore/audio/AudioProcess;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 44
    .line 45
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F0:F

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->setMasterAudioLevel(F)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 51
    .line 52
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G0:F

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioLevel(F)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/AudioProcess;->startAudioProcessding()V

    .line 60
    .line 61
    .line 62
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R:Z

    .line 63
    .line 64
    if-eqz v1, :cond_1

    .line 65
    .line 66
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 67
    .line 68
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q:I

    .line 69
    .line 70
    invoke-virtual {v2, v3, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustEQ(IZ)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catchall_0
    move-exception p0

    .line 75
    goto :goto_2

    .line 76
    :cond_1
    :goto_0
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k0:Z

    .line 77
    .line 78
    if-eqz v1, :cond_2

    .line 79
    .line 80
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 81
    .line 82
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z:I

    .line 83
    .line 84
    invoke-virtual {v2, v3, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 85
    .line 86
    .line 87
    :cond_2
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T:Z

    .line 88
    .line 89
    if-eqz v1, :cond_3

    .line 90
    .line 91
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 92
    .line 93
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S:I

    .line 94
    .line 95
    invoke-virtual {v2, v3, v1}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustAef(IZ)V

    .line 96
    .line 97
    .line 98
    :cond_3
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U:I

    .line 99
    .line 100
    if-ltz v1, :cond_4

    .line 101
    .line 102
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 103
    .line 104
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V:I

    .line 105
    .line 106
    invoke-virtual {v2, v1, v3}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustEf(II)V

    .line 107
    .line 108
    .line 109
    :cond_4
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W:I

    .line 110
    .line 111
    if-ltz v1, :cond_5

    .line 112
    .line 113
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 114
    .line 115
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X:I

    .line 116
    .line 117
    iget v4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y:F

    .line 118
    .line 119
    invoke-virtual {v2, v1, v3, v4}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 120
    .line 121
    .line 122
    :cond_5
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 123
    .line 124
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H:I

    .line 125
    .line 126
    const/4 v3, 0x2

    .line 127
    div-int/2addr v2, v3

    .line 128
    const v4, 0xac44

    .line 129
    .line 130
    .line 131
    invoke-virtual {v1, v4, v3, v2}, Lcom/immomo/mediacore/audio/AudioProcess;->openSabineEf(III)V

    .line 132
    .line 133
    .line 134
    :cond_6
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 135
    .line 136
    if-nez v1, :cond_7

    .line 137
    .line 138
    new-instance v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 139
    .line 140
    const/4 v2, 0x0

    .line 141
    invoke-direct {v1, p0, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V

    .line 142
    .line 143
    .line 144
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 145
    .line 146
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c1:Z

    .line 147
    .line 148
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->c(Z)V

    .line 149
    .line 150
    .line 151
    :cond_7
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1:Ljava/lang/Thread;

    .line 152
    .line 153
    if-nez v1, :cond_8

    .line 154
    .line 155
    new-instance v1, Ljava/lang/Thread;

    .line 156
    .line 157
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 158
    .line 159
    const-string v3, "live-media-AudRec"

    .line 160
    .line 161
    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1:Ljava/lang/Thread;

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 167
    .line 168
    .line 169
    :cond_8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 170
    .line 171
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 172
    .line 173
    invoke-virtual {v1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->a(Lcom/immomo/mediacore/audio/AudioProcess;)V

    .line 174
    .line 175
    .line 176
    monitor-exit v0

    .line 177
    return-void

    .line 178
    :cond_9
    :goto_1
    monitor-exit v0

    .line 179
    return-void

    .line 180
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 181
    throw p0
.end method

.method public static synthetic a0(Ltv/danmaku/ijk/media/streamer/StreamProducer;[B)[B
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V0:[B

    .line 2
    .line 3
    return-object p1
.end method

.method private a2()I
    .locals 1

    .line 1
    const-string p0, "streamerCameraProducer"

    .line 2
    .line 3
    const-string v0, "AudioRecordRunnable startAudioCapture stopAudioCapture"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public static synthetic b0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J
    .locals 4

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E0:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v2, v0

    .line 6
    iput-wide v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E0:J

    .line 7
    .line 8
    return-wide v0
.end method

.method public static synthetic c0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic d0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic e0(Ltv/danmaku/ijk/media/streamer/StreamProducer;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic f(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/audio/AudioProcess;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    return-object p0
.end method

.method private f2()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1:Ljava/lang/Thread;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :try_start_0
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O0:Z

    .line 8
    .line 9
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1:Ljava/lang/Thread;

    .line 10
    .line 11
    const-wide/16 v2, 0x3e8

    .line 12
    .line 13
    invoke-virtual {v0, v2, v3}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :catch_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1:Ljava/lang/Thread;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 20
    .line 21
    .line 22
    :goto_0
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1:Ljava/lang/Thread;

    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/immomo/mediacore/strinf/confrenceHelp;->removePcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 34
    .line 35
    :cond_1
    const-string v0, "streamerCameraProducer"

    .line 36
    .line 37
    const-string v2, "stopAudioEncode"

    .line 38
    .line 39
    invoke-static {v0, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->stop()V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 50
    .line 51
    :cond_2
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 52
    .line 53
    return-void
.end method

.method public static synthetic g(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic g0(Ltv/danmaku/ijk/media/streamer/StreamProducer;Lcom/immomo/mediacore/audio/AudioProcess;)Lcom/immomo/mediacore/audio/AudioProcess;
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic h(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q1:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u1:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic i0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic j(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u1:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic j0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic k(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l1:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic k0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I
    .locals 1

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M:I

    .line 5
    .line 6
    return v0
.end method

.method private k1()V
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i1:Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

    .line 8
    .line 9
    new-instance v0, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j1:Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;

    .line 15
    .line 16
    new-instance v0, Landroid/content/IntentFilter;

    .line 17
    .line 18
    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D:Landroid/content/IntentFilter;

    .line 22
    .line 23
    const-string v1, "android.intent.action.HEADSET_PLUG"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i1:Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

    .line 33
    .line 34
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D:Landroid/content/IntentFilter;

    .line 35
    .line 36
    invoke-static {v0, v1, v2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 40
    .line 41
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j1:Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;

    .line 42
    .line 43
    new-instance v2, Landroid/content/IntentFilter;

    .line 44
    .line 45
    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    .line 46
    .line 47
    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1, v2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const-string v1, "audio"

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Landroid/media/AudioManager;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/media/AudioManager;->isWiredHeadsetOn()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .line 73
    :catch_0
    :cond_0
    return-void
.end method

.method public static synthetic l(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l0(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic m0(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic n(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic o(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic p(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method private p0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 6
    .line 7
    const v2, 0x3e3851ec    # 0.18f

    .line 8
    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D1:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G0:F

    .line 17
    .line 18
    mul-float v1, p0, v2

    .line 19
    .line 20
    mul-float/2addr p0, v2

    .line 21
    invoke-virtual {v0, v1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G0:F

    .line 26
    .line 27
    mul-float v1, p0, v2

    .line 28
    .line 29
    mul-float/2addr p0, v2

    .line 30
    invoke-virtual {v0, v1, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public static synthetic q(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/source/audio/audioSource;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M1()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private s2()V
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 4
    .line 5
    rem-int/lit8 v1, v0, 0x2

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    add-int/lit8 v0, v0, -0x1

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 12
    .line 13
    :cond_0
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 14
    .line 15
    rem-int/lit8 v1, v0, 0x2

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    add-int/lit8 v0, v0, -0x1

    .line 20
    .line 21
    iput v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 22
    .line 23
    :cond_1
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 24
    .line 25
    const/16 v1, 0xb0

    .line 26
    .line 27
    if-ge v0, v1, :cond_2

    .line 28
    .line 29
    iput v1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 30
    .line 31
    :cond_2
    iget v0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 32
    .line 33
    const/16 v1, 0x20

    .line 34
    .line 35
    if-ge v0, v1, :cond_3

    .line 36
    .line 37
    iput v1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 38
    .line 39
    :cond_3
    return-void
.end method

.method public static synthetic t(Ltv/danmaku/ijk/media/streamer/StreamProducer;)I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N:I

    .line 2
    .line 3
    return p0
.end method

.method private t0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E1:Landroid/os/Handler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E1:Landroid/os/Handler;

    .line 10
    .line 11
    invoke-virtual {p0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic u(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic v(Ltv/danmaku/ijk/media/streamer/StreamProducer;I)I
    .locals 1

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N:I

    .line 2
    .line 3
    add-int/2addr v0, p1

    .line 4
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N:I

    .line 5
    .line 6
    return v0
.end method

.method private v0()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    new-instance v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, p0, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V

    .line 7
    .line 8
    .line 9
    const-string v2, "live-media-EnAudioSoft"

    .line 10
    .line 11
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1:Ljava/lang/Thread;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic w(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Ltv/danmaku/ijk/media/streamer/MomoSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method private w0()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi",
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "audio/mp4a-latm"

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    :try_start_0
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O0:Z

    .line 5
    .line 6
    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 7
    .line 8
    .line 9
    move-result-object v2

    .line 10
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 11
    .line 12
    new-instance v2, Landroid/media/MediaFormat;

    .line 13
    .line 14
    invoke-direct {v2}, Landroid/media/MediaFormat;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v3, "mime"

    .line 18
    .line 19
    invoke-virtual {v2, v3, v0}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const-string v0, "bitrate"

    .line 23
    .line 24
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 25
    .line 26
    iget v3, v3, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 27
    .line 28
    invoke-virtual {v2, v0, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 29
    .line 30
    .line 31
    const-string v0, "channel-count"

    .line 32
    .line 33
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 34
    .line 35
    iget v3, v3, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 36
    .line 37
    invoke-virtual {v2, v0, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    const-string v0, "sample-rate"

    .line 41
    .line 42
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 43
    .line 44
    iget v3, v3, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 45
    .line 46
    invoke-virtual {v2, v0, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    const-string v0, "aac-profile"

    .line 50
    .line 51
    const/4 v3, 0x2

    .line 52
    invoke-virtual {v2, v0, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    const-string v0, "max-input-size"

    .line 56
    .line 57
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H:I

    .line 58
    .line 59
    invoke-virtual {v2, v0, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-virtual {v0, v2, v3, v3, v1}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 74
    .line 75
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O:[Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 82
    .line 83
    if-eqz v0, :cond_0

    .line 84
    .line 85
    const/4 v1, 0x0

    .line 86
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 87
    .line 88
    .line 89
    :cond_0
    new-instance v0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 90
    .line 91
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q:Landroid/media/MediaCodec;

    .line 92
    .line 93
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 94
    .line 95
    invoke-direct {v0, v1, v2}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;-><init>(Landroid/media/MediaCodec;Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 96
    .line 97
    .line 98
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 99
    .line 100
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->l()V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 104
    .line 105
    new-instance v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$14;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$14;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->h(Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;)V

    .line 111
    .line 112
    .line 113
    new-instance v0, Ljava/lang/Thread;

    .line 114
    .line 115
    new-instance v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;

    .line 116
    .line 117
    invoke-direct {v1, p0, v3}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioEncoderRunnable;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/StreamProducer$1;)V

    .line 118
    .line 119
    .line 120
    const-string v2, "live-media-EnAudioMCodec"

    .line 121
    .line 122
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g1:Ljava/lang/Thread;

    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :catch_0
    move-exception p0

    .line 132
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public static synthetic x(Ltv/danmaku/ijk/media/streamer/StreamProducer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic y(Ltv/danmaku/ijk/media/streamer/StreamProducer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic z(Ltv/danmaku/ijk/media/streamer/StreamProducer;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public A0()J
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->n()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const/16 v2, 0x4e2a

    .line 17
    .line 18
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    :cond_1
    return-wide v0
.end method

.method public A1(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1, p2}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g(J)V

    .line 6
    .line 7
    .line 8
    const-wide/16 p1, -0x1

    .line 9
    .line 10
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a1:J

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a1:J

    .line 14
    .line 15
    return-void
.end method

.method public B0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/audio/AudioProcess;->getAudioFrames()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public B1(J)V
    .locals 2

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L0:J

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long p1, p1, v0

    .line 6
    .line 7
    if-gtz p1, :cond_0

    .line 8
    .line 9
    const-wide/16 p1, 0x3e8

    .line 10
    .line 11
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L0:J

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public C0()J
    .locals 4

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E0:J

    .line 2
    .line 3
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H:I

    .line 4
    .line 5
    int-to-long v2, p0

    .line 6
    mul-long/2addr v0, v2

    .line 7
    return-wide v0
.end method

.method public C1(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnSurroundMusicStatusListener;

    .line 2
    .line 3
    return-void
.end method

.method public D0()J
    .locals 3

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e28

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public D1(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->x1:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$OnWiredHeadsetStatusListener;

    .line 2
    .line 3
    return-void
.end method

.method public E0()J
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const/16 v2, 0x4e30

    .line 17
    .line 18
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    :cond_1
    return-wide v0
.end method

.method public E1(Landroid/graphics/PointF;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-void
.end method

.method public F0()J
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->n()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const/16 v2, 0x4e2f

    .line 17
    .line 18
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    :cond_1
    return-wide v0
.end method

.method public F1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b:F

    .line 2
    .line 3
    return-void
.end method

.method public G0()F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F0:F

    .line 2
    .line 3
    return p0
.end method

.method public G1(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setSei:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "streamerCameraProducer"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e:Ljava/lang/String;

    .line 21
    .line 22
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public H0()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w1:I

    .line 2
    .line 3
    return p0
.end method

.method public H1(F)V
    .locals 1

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G0:F

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->setSlaveAudioLevel(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public I0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public I1(JZ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->U0(JZ)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 30
    .line 31
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/source/AidSource;->o2(JZ)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public J0()Ltv/danmaku/ijk/media/streamer/MomoSurface;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    return-object p0
.end method

.method public J1(JZ)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->V0(JZ)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 30
    .line 31
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 40
    .line 41
    if-eqz p0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2, p3}, Ltv/danmaku/ijk/media/source/AidSource;->s2(JZ)V

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void
.end method

.method public K0()J
    .locals 3

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 v2, 0x4e24

    .line 8
    .line 9
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    :cond_0
    return-wide v0
.end method

.method public K1(JIIIII)V
    .locals 8

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual/range {p0 .. p7}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->W0(JIIIII)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 30
    .line 31
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    move-object v0, p0

    .line 40
    check-cast v0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    move-wide v1, p1

    .line 45
    move v3, p3

    .line 46
    move v4, p4

    .line 47
    move v5, p5

    .line 48
    move v6, p6

    .line 49
    move v7, p7

    .line 50
    invoke-virtual/range {v0 .. v7}, Ltv/danmaku/ijk/media/source/AidSource;->C2(JIIIII)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public L0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 2
    .line 3
    return p0
.end method

.method public L1(JIIII)V
    .locals 7

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual/range {p0 .. p6}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X0(JIIII)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 30
    .line 31
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    move-object v0, p0

    .line 40
    check-cast v0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    move-wide v1, p1

    .line 45
    move v3, p3

    .line 46
    move v4, p4

    .line 47
    move v5, p5

    .line 48
    move v6, p6

    .line 49
    invoke-virtual/range {v0 .. v6}, Ltv/danmaku/ijk/media/source/AidSource;->z2(JIIII)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public M0()F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G0:F

    .line 2
    .line 3
    return p0
.end method

.method public N0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public N1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G1:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/audio_Indicator;->setUserID(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public O0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCurrentPosition()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public O1(Ll/ebl0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->setVideoChannellistener(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public P0()J
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->p()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const/16 v2, 0x4e2d

    .line 17
    .line 18
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    :cond_1
    return-wide v0
.end method

.method public P1(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----setVideoEncodingBitRate: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 9
    .line 10
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "---->"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "streamerCameraProducer"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 33
    .line 34
    iput p1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 35
    .line 36
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d(I)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public Q0()J
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    const/16 v2, 0x4e2c

    .line 17
    .line 18
    invoke-virtual {p0, v2, v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->getPropertyLong(IJ)J

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    :cond_1
    return-wide v0
.end method

.method public Q1(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    iput p1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 4
    .line 5
    const/16 v1, 0x1e

    .line 6
    .line 7
    if-le p1, v1, :cond_0

    .line 8
    .line 9
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 10
    .line 11
    :cond_0
    iget v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 12
    .line 13
    if-gtz v1, :cond_1

    .line 14
    .line 15
    const/16 v1, 0x14

    .line 16
    .line 17
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 18
    .line 19
    :cond_1
    iget v0, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 20
    .line 21
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z1:I

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, p1, v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d(IZ)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public R0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    iget p0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 4
    .line 5
    return p0
.end method

.method public R1(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    iput p1, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 4
    .line 5
    iput p2, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 6
    .line 7
    return-void
.end method

.method public S0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->w0()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public S1(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y:I

    .line 2
    .line 3
    return-void
.end method

.method public T0()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B1:I

    .line 2
    .line 3
    return p0
.end method

.method public T1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z0(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public U0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H1:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D1:Z

    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 17
    .line 18
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 19
    .line 20
    iget v3, v2, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 21
    .line 22
    iget v2, v2, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 23
    .line 24
    invoke-direct {v1, v3, v2}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;-><init>(II)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->play()V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p0
.end method

.method public U1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D1:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public V1()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a2()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z1()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public W0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 6
    .line 7
    const/4 v0, -0x1

    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public W1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V1()V

    .line 5
    .line 6
    .line 7
    iget-byte v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 8
    .line 9
    const/4 v2, 0x5

    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w0()V

    .line 13
    .line 14
    .line 15
    goto :goto_2

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_3

    .line 18
    :catch_0
    move-exception p0

    .line 19
    goto :goto_0

    .line 20
    :catch_1
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v0()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    goto :goto_2

    .line 26
    :goto_0
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 27
    .line 28
    .line 29
    goto :goto_2

    .line 30
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 31
    .line 32
    .line 33
    :goto_2
    monitor-exit v0

    .line 34
    return-void

    .line 35
    :goto_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    throw p0
.end method

.method public X0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 2
    .line 3
    return p0
.end method

.method public X1(Landroid/app/Activity;Landroid/graphics/Bitmap;IIII)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----startCaptureImage(S):"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "streamerCameraProducer"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-object v0, p0

    .line 23
    iget-object p0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput v1, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G:I

    .line 29
    .line 30
    invoke-virtual/range {p0 .. p6}, Ltv/danmaku/ijk/media/source/SourceBase;->J(Landroid/app/Activity;Landroid/graphics/Bitmap;IIII)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public Y0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public Y1(Landroid/app/Activity;IILandroid/media/projection/MediaProjection;I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----startCaptureScreen(S):"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "streamerCameraProducer"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-object v0, p0

    .line 23
    iget-object p0, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 24
    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput v1, v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G:I

    .line 29
    .line 30
    invoke-virtual/range {p0 .. p5}, Ltv/danmaku/ijk/media/source/SourceBase;->K(Landroid/app/Activity;IILandroid/media/projection/MediaProjection;I)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public Z0(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public a(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->postDrawImage(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/sink/SinkBase;->postDrawImage(I)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public a1(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c1:Z

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->c(Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 11
    .line 12
    if-eqz p1, :cond_2

    .line 13
    .line 14
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c1:Z

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 23
    .line 24
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R1:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDateCallbackFlags(I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 37
    .line 38
    if-nez v0, :cond_2

    .line 39
    .line 40
    invoke-virtual {p1, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDateCallbackFlags(I)V

    .line 47
    .line 48
    .line 49
    :cond_2
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H1:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->stop()V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->release()V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

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

.method public b1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public b2()V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----startRecording(S):"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-byte v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ";recording ="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v2, ";mVideoSource="

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v2, "streamerCameraProducer"

    .line 38
    .line 39
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 43
    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i1()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    :goto_0
    return-void

    .line 54
    :cond_1
    const/4 v0, 0x1

    .line 55
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 56
    .line 57
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W1()V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c2()V

    .line 61
    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H0:Z

    .line 65
    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v3, "----startRecording(E):"

    .line 69
    .line 70
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-byte v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 74
    .line 75
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {v2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public c(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const-string p1, "streamerCameraProducer"

    .line 11
    .line 12
    const-string v1, "AudioRecordRunnable EnableExternalAudio stopAudioCapture"

    .line 13
    .line 14
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e2()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    invoke-virtual {v1}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 24
    .line 25
    .line 26
    const-string p1, "streamerCameraProducer"

    .line 27
    .line 28
    const-string v1, "AudioRecordRunnable EnableExternalAudio startAudioCapture"

    .line 29
    .line 30
    invoke-static {p1, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V1()V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    monitor-exit v0

    .line 37
    return-void

    .line 38
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method

.method public c1(JZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public c2()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M0:Z

    .line 6
    .line 7
    iget-byte v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 8
    .line 9
    const/4 v3, 0x5

    .line 10
    if-eq v2, v3, :cond_1

    .line 11
    .line 12
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z(Landroid/view/Surface;)V

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 21
    .line 22
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 23
    .line 24
    iget v3, v3, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 25
    .line 26
    const/4 v4, 0x0

    .line 27
    invoke-virtual {v2, v3, v4}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->M0(IZ)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_5

    .line 33
    :catch_0
    move-exception p0

    .line 34
    goto :goto_2

    .line 35
    :catch_1
    move-exception p0

    .line 36
    goto :goto_3

    .line 37
    :cond_0
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 38
    .line 39
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->b0()V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V0()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->x0()V

    .line 47
    .line 48
    .line 49
    :goto_1
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    goto :goto_4

    .line 52
    :goto_2
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    goto :goto_4

    .line 56
    :goto_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 57
    .line 58
    .line 59
    :goto_4
    monitor-exit v0

    .line 60
    return-void

    .line 61
    :goto_5
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    throw p0
.end method

.method public d(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "softFrameRateUpdata: "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ";needDrop:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "streamerCameraProducer"

    .line 28
    .line 29
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->M0(IZ)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public d1(JZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public d2()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->C0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->stop()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 17
    .line 18
    :cond_1
    iput-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 19
    .line 20
    return-void
.end method

.method public e()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->start()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public e1(Landroid/app/Activity;JLandroid/graphics/Bitmap;)V
    .locals 7

    .line 1
    if-eqz p4, :cond_2

    .line 2
    .line 3
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 4
    .line 5
    if-eqz p1, :cond_2

    .line 6
    .line 7
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v0, "openPublishHelp(S): label ["

    .line 15
    .line 16
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, "], bitmap="

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "streamerCameraProducer"

    .line 35
    .line 36
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 40
    .line 41
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 52
    .line 53
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 62
    .line 63
    if-eqz p0, :cond_2

    .line 64
    .line 65
    new-instance p0, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string p1, "openPublishHelp: userID["

    .line 68
    .line 69
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string p1, "]\u672a\u91ca\u653e\uff01\uff01\uff01"

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    return-void

    .line 88
    :cond_1
    new-instance v1, Ltv/danmaku/ijk/media/source/AidSource;

    .line 89
    .line 90
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 91
    .line 92
    const/4 v6, -0x1

    .line 93
    move-wide v4, p2

    .line 94
    move-object v2, p4

    .line 95
    invoke-direct/range {v1 .. v6}, Ltv/danmaku/ijk/media/source/AidSource;-><init>(Landroid/graphics/Bitmap;Ltv/danmaku/ijk/media/streamer/MomoSurface;JI)V

    .line 96
    .line 97
    .line 98
    new-instance p1, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string p2, "openPublishHelp: add ["

    .line 101
    .line 102
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string p2, "]"

    .line 109
    .line 110
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-static {v0, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 121
    .line 122
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    :cond_2
    :goto_0
    return-void
.end method

.method public e2()V
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->a(Lcom/immomo/mediacore/audio/AudioProcess;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    :try_start_1
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N0:Z

    .line 26
    .line 27
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1:Ljava/lang/Thread;

    .line 28
    .line 29
    const-wide/16 v3, 0x7d0

    .line 30
    .line 31
    invoke-virtual {v1, v3, v4}, Ljava/lang/Thread;->join(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    :try_start_2
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1:Ljava/lang/Thread;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 38
    .line 39
    .line 40
    :goto_0
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f1:Ljava/lang/Thread;

    .line 41
    .line 42
    const-string v1, "streamerCameraProducer"

    .line 43
    .line 44
    const-string v3, "AudioRecordRunnable stopAudioCapture"

    .line 45
    .line 46
    invoke-static {v1, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    :cond_2
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 50
    .line 51
    monitor-exit v0

    .line 52
    return-void

    .line 53
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 54
    throw p0
.end method

.method public f1(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;JLjava/lang/String;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;ILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V
    .locals 13

    .line 1
    move-wide/from16 v6, p3

    .line 2
    .line 3
    move-object/from16 v0, p5

    .line 4
    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "tcp://"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ":"

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    move/from16 v2, p6

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, "?listen"

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 37
    .line 38
    if-eqz v1, :cond_2

    .line 39
    .line 40
    if-eqz p2, :cond_2

    .line 41
    .line 42
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 43
    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    goto/16 :goto_0

    .line 47
    .line 48
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    const-string v2, "openPublishHelp(S): label ["

    .line 51
    .line 52
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v2, "], type="

    .line 59
    .line 60
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    move/from16 v9, p9

    .line 64
    .line 65
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string v2, ", ip["

    .line 69
    .line 70
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v0, "], "

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    move-object/from16 v8, p8

    .line 82
    .line 83
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const-string v12, "streamerCameraProducer"

    .line 91
    .line 92
    invoke-static {v12, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 96
    .line 97
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_1

    .line 106
    .line 107
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 108
    .line 109
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    check-cast p0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 118
    .line 119
    if-eqz p0, :cond_2

    .line 120
    .line 121
    new-instance p0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string p1, "openPublishHelp: userID["

    .line 124
    .line 125
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p1, "]\u672a\u91ca\u653e\uff01\uff01\uff01"

    .line 132
    .line 133
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {v12, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_1
    new-instance v0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 145
    .line 146
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 147
    .line 148
    const/4 v10, -0x1

    .line 149
    move-object v2, p0

    .line 150
    move-object v1, p1

    .line 151
    move-object v3, p2

    .line 152
    move-object/from16 v11, p10

    .line 153
    .line 154
    invoke-direct/range {v0 .. v11}, Ltv/danmaku/ijk/media/source/AidSource;-><init>(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ljava/lang/String;Ltv/danmaku/ijk/media/streamer/MomoSurface;JLtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V

    .line 155
    .line 156
    .line 157
    new-instance p1, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    const-string p2, "openPublishHelp: add ["

    .line 160
    .line 161
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    const-string p2, "]"

    .line 168
    .line 169
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    invoke-static {v12, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 177
    .line 178
    .line 179
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 180
    .line 181
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    :cond_2
    :goto_0
    return-void
.end method

.method public g1(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;JLjava/lang/String;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;I)V
    .locals 13

    .line 1
    move-wide/from16 v6, p3

    .line 2
    .line 3
    move-object/from16 v4, p5

    .line 4
    .line 5
    if-eqz v4, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    if-eqz p2, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "openPublishHelp(S): label ["

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "], type="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    move/from16 v9, p7

    .line 35
    .line 36
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, ", url["

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v1, "], "

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    move-object/from16 v8, p6

    .line 53
    .line 54
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const-string v12, "streamerCameraProducer"

    .line 62
    .line 63
    invoke-static {v12, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 67
    .line 68
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 79
    .line 80
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    check-cast p0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 89
    .line 90
    if-eqz p0, :cond_2

    .line 91
    .line 92
    new-instance p0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string p1, "openPublishHelp: userID["

    .line 95
    .line 96
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    const-string p1, "]\u672a\u91ca\u653e\uff01\uff01\uff01"

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {v12, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_1
    new-instance v0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 116
    .line 117
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 118
    .line 119
    const/4 v10, -0x1

    .line 120
    const/4 v11, 0x0

    .line 121
    move-object v2, p0

    .line 122
    move-object v1, p1

    .line 123
    move-object v3, p2

    .line 124
    invoke-direct/range {v0 .. v11}, Ltv/danmaku/ijk/media/source/AidSource;-><init>(Landroid/app/Activity;Ltv/danmaku/ijk/media/streamer/StreamProducer;Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;Ljava/lang/String;Ltv/danmaku/ijk/media/streamer/MomoSurface;JLtv/danmaku/ijk/media/streamer/ijkMediaStreamer$SizeChangedCallback;IILtv/danmaku/ijk/media/streamer/ijkMediaStreamer$aidSwitchResolution;)V

    .line 125
    .line 126
    .line 127
    new-instance p1, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    const-string p2, "openPublishHelp: add ["

    .line 130
    .line 131
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string p2, "]"

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-static {v12, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 150
    .line 151
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    :cond_2
    :goto_0
    return-void
.end method

.method public g2()V
    .locals 2

    .line 1
    const-string v0, "AudioRecordRunnable stopAudioRecording stopAudioCapture"

    .line 2
    .line 3
    const-string v1, "streamerCameraProducer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e2()V

    .line 9
    .line 10
    .line 11
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->f2()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->stopAudioProcessding()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->release()V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 33
    .line 34
    :cond_0
    const-string p0, "stopAudioRecording"

    .line 35
    .line 36
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public getPreviewScale()Landroid/graphics/PointF;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a:Landroid/graphics/PointF;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPreviewZoom()F
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public getStreamerType()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->getStreamerType()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getVideoQuality()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "getVideoQuality: width"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 9
    .line 10
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ";heigh:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 21
    .line 22
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "streamerCameraProducer"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 37
    .line 38
    return-object p0
.end method

.method public getWriter()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public h1()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundFrames()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 15
    .line 16
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->isPlaying()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pause()V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public declared-synchronized h2(J)V
    .locals 4

    .line 1
    const-string v0, "stopPublishHelp: remove ["

    .line 2
    .line 3
    const-string v1, "stopPublishHelp(S): label ["

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    const-string v2, "streamerCameraProducer"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "]"

    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v2, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 43
    .line 44
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Ltv/danmaku/ijk/media/source/AidSource;

    .line 53
    .line 54
    if-eqz v1, :cond_0

    .line 55
    .line 56
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 57
    .line 58
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/source/AidSource;->u2(I)V

    .line 67
    .line 68
    .line 69
    const-string v1, "streamerCameraProducer"

    .line 70
    .line 71
    new-instance v2, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string p1, "]"

    .line 80
    .line 81
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    invoke-static {v1, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    .line 90
    .line 91
    goto :goto_0

    .line 92
    :catchall_0
    move-exception p1

    .line 93
    goto :goto_1

    .line 94
    :cond_0
    :goto_0
    monitor-exit p0

    .line 95
    return-void

    .line 96
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 97
    throw p1
.end method

.method public i1()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "streamerCameraProducer"

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->p()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p0, "zjlfound prepare fail"

    .line 15
    .line 16
    invoke-static {v2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    return v1

    .line 20
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v3, "----zjlfound prepare\uff1abitrate="

    .line 23
    .line 24
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 28
    .line 29
    iget v3, v3, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 30
    .line 31
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 42
    .line 43
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z:I

    .line 44
    .line 45
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setAudioSource(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 49
    .line 50
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y:I

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setVideoSource(I)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 56
    .line 57
    const/4 v3, 0x3

    .line 58
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setAudioEncoder(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 62
    .line 63
    const/4 v3, 0x2

    .line 64
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setVideoEncoder(I)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v3, "----prepare call setVideoFrameRate: mVideoQuality.bitrate="

    .line 70
    .line 71
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 75
    .line 76
    iget v3, v3, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 77
    .line 78
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 89
    .line 90
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 91
    .line 92
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->framerate:I

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setVideoFrameRate(I)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 98
    .line 99
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 100
    .line 101
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setVideoEncodingBitRate(I)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 107
    .line 108
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 109
    .line 110
    iget v2, v2, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 111
    .line 112
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setAudioEncodingBitRate(I)V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 116
    .line 117
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 118
    .line 119
    iget v2, v2, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setAudioSamplingRate(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 125
    .line 126
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 127
    .line 128
    iget v3, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 129
    .line 130
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 131
    .line 132
    invoke-virtual {v0, v3, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setVideoSize(II)V

    .line 133
    .line 134
    .line 135
    iget-byte v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 136
    .line 137
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 138
    .line 139
    const/4 v3, 0x1

    .line 140
    const/4 v4, 0x5

    .line 141
    if-ne v0, v4, :cond_1

    .line 142
    .line 143
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setMediaCodecEnable(Z)V

    .line 144
    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_1
    invoke-virtual {v2, v1}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setMediaCodecEnable(Z)V

    .line 148
    .line 149
    .line 150
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 151
    .line 152
    iget-wide v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J0:J

    .line 153
    .line 154
    invoke-virtual {v0, v1, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setMaxCacheDuration(J)V

    .line 155
    .line 156
    .line 157
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 158
    .line 159
    iget-wide v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K0:J

    .line 160
    .line 161
    invoke-virtual {v0, v1, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setMinCacheDuration(J)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 165
    .line 166
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 167
    .line 168
    iget-boolean v1, v1, Ltv/danmaku/ijk/media/streamer/MomoSurface;->d:Z

    .line 169
    .line 170
    if-ne v1, v3, :cond_2

    .line 171
    .line 172
    const-wide/16 v1, 0x1

    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_2
    const-wide/16 v1, 0x0

    .line 176
    .line 177
    :goto_1
    invoke-virtual {v0, v1, v2}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setStreamPixFmt(J)V

    .line 178
    .line 179
    .line 180
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 181
    .line 182
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->prepare()Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    return p0
.end method

.method public i2()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----stopRecording:recording="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "streamerCameraProducer"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 29
    .line 30
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/source/audio/audioSource;->b(Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j2()V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g2()V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d2()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public j1([BIJ)V
    .locals 4

    .line 1
    const-string v0, "mqbuffer;lens:"

    .line 2
    .line 3
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    const/4 v2, 0x1

    .line 7
    :try_start_0
    iput-boolean v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p0:Z

    .line 8
    .line 9
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 10
    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/source/audio/audioSource;->b(Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 22
    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    const-string v2, "streamerCameraProducer"

    .line 26
    .line 27
    new-instance v3, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v0, ";timestamp:"

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-static {v2, p3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e2()V

    .line 51
    .line 52
    .line 53
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 54
    .line 55
    invoke-virtual {p3}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 56
    .line 57
    .line 58
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 59
    .line 60
    if-eqz p3, :cond_1

    .line 61
    .line 62
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 63
    .line 64
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 65
    .line 66
    .line 67
    move-result-wide p3

    .line 68
    const-wide/16 v2, 0x3e8

    .line 69
    .line 70
    div-long/2addr p3, v2

    .line 71
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;->onPcmDateCallback([BIJ)V

    .line 72
    .line 73
    .line 74
    :cond_1
    monitor-exit v1

    .line 75
    return-void

    .line 76
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 77
    throw p0
.end method

.method public j2()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u:I

    .line 3
    .line 4
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v:I

    .line 5
    .line 6
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->E0()V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 14
    .line 15
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->G0()V

    .line 16
    .line 17
    .line 18
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "stopRecording mMode:"

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-byte v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "streamerCameraProducer"

    .line 35
    .line 36
    invoke-static {v2, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e1:Ljava/lang/Thread;

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    :try_start_0
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M0:Z

    .line 45
    .line 46
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e1:Ljava/lang/Thread;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catch_0
    move-exception v0

    .line 53
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 54
    .line 55
    .line 56
    :goto_0
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e1:Ljava/lang/Thread;

    .line 57
    .line 58
    :cond_1
    const-string v0, "stopRecording mVideoRecordThread stoped mThread:"

    .line 59
    .line 60
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 64
    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->stop()V

    .line 68
    .line 69
    .line 70
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 71
    .line 72
    :cond_2
    const-wide/16 v0, -0x1

    .line 73
    .line 74
    iput-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a1:J

    .line 75
    .line 76
    iput-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 77
    .line 78
    const-string p0, "stopRecording videoMux stoped "

    .line 79
    .line 80
    invoke-static {v2, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public k2()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i1:Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i1:Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

    .line 14
    .line 15
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;->a()V

    .line 16
    .line 17
    .line 18
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i1:Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j1:Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j1:Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;

    .line 30
    .line 31
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;->a()V

    .line 32
    .line 33
    .line 34
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j1:Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    :catch_0
    :cond_1
    return-void
.end method

.method public l1(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/AudioProcess;->clearSurroundFrames()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 15
    .line 16
    invoke-virtual {v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->seekTo(J)V

    .line 17
    .line 18
    .line 19
    const-wide/16 p1, 0x0

    .line 20
    .line 21
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l1:J

    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l1:J

    .line 25
    .line 26
    return-void
.end method

.method public l2(Lcom/immomo/mediacore/sink/SinkBase;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 8
    .line 9
    if-nez p1, :cond_1

    .line 10
    .line 11
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 12
    .line 13
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 14
    .line 15
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e2()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->removePcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/immomo/mediacore/audio/AudioProcess;->clear()V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 36
    .line 37
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setPcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 43
    .line 44
    if-nez p1, :cond_3

    .line 45
    .line 46
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 47
    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/strinf/confrenceHelp;->removePcmDataCallback(Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V1()V

    .line 56
    .line 57
    .line 58
    :cond_2
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d2()V

    .line 59
    .line 60
    .line 61
    const/4 p1, 0x0

    .line 62
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I1:Lcom/immomo/mediacore/sink/SinkBase$PcmDateCallback;

    .line 63
    .line 64
    :cond_3
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 65
    .line 66
    if-eqz p1, :cond_4

    .line 67
    .line 68
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 69
    .line 70
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 71
    .line 72
    invoke-virtual {p1, p0}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 73
    .line 74
    .line 75
    :cond_4
    return-void
.end method

.method public m1(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 2

    .line 1
    const-string v0, "streamerCameraProducer"

    .line 2
    .line 3
    const-string v1, "setAttachedVideoQuality: width"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->X(Lcom/immomo/mediacore/strinf/VideoQuality;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public m2(Landroid/graphics/Bitmap;III)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/source/SourceBase;->Q(Landroid/graphics/Bitmap;III)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n0(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->U(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 2
    .line 3
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioQuality;->channelNum:I

    .line 4
    .line 5
    return-void
.end method

.method public n2(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 8
    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual/range {p0 .. p5}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->i1(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 30
    .line 31
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    move-object v0, p0

    .line 40
    check-cast v0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    move-wide v1, p1

    .line 45
    move-object v3, p3

    .line 46
    move v4, p4

    .line 47
    move-object v5, p5

    .line 48
    invoke-virtual/range {v0 .. v5}, Ltv/danmaku/ijk/media/source/AidSource;->B2(JLandroid/graphics/SurfaceTexture;ILandroid/graphics/Bitmap;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void
.end method

.method public notify(IIILjava/lang/Object;)V
    .locals 2

    .line 1
    const/16 v0, 0x12c

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/immomo/mediacore/sink/SinkBase;->getErrorCode()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eq v1, v0, :cond_1

    .line 14
    .line 15
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-static {p0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->postEventFromStreamPro(Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;IIILjava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public notifyAdjustAef(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T:Z

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustAef(IZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public notifyAdjustEQ(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R:Z

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustEQ(IZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public notifyAdjustEf(II)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->U:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V:I

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustEf(II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public notifyAdjustTune(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z:I

    .line 2
    .line 3
    iput-boolean p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k0:Z

    .line 4
    .line 5
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/AudioProcess;->adjustTune(IZ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public notifyEffectReset()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

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

.method public notifyEffectSet(IIF)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X:I

    .line 4
    .line 5
    iput p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Y:F

    .line 6
    .line 7
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lcom/immomo/mediacore/audio/AudioProcess;->SabineEffectSet(IIF)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public notifyEnableExtralAudio(Z)V
    .locals 0

    return-void
.end method

.method public notifyExtralAudioLoss()V
    .locals 2

    .line 1
    const-string v0, "streamerCameraProducer"

    .line 2
    .line 3
    const-string v1, "sabineAudioSource notifyExtralAudioLoss"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q1:I

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q1:I

    .line 18
    .line 19
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 20
    .line 21
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/source/audio/audioSource;->b(Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;)V

    .line 24
    .line 25
    .line 26
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z1()V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/strinf/confrenceHelp;->getExternAudioDevStatusCallback()Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/immomo/mediacore/strinf/confrenceHelp;->getExternAudioDevStatusCallback()Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-interface {p0, v0}, Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;->onAudioDevStatusNotify(I)V

    .line 45
    .line 46
    .line 47
    :cond_1
    return-void
.end method

.method public notifyExtralAudioReady()V
    .locals 3

    .line 1
    const-string v0, "streamerCameraProducer"

    .line 2
    .line 3
    const-string v1, "sabineAudioSource notifyExtralAudioReady"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q1:I

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq v0, v1, :cond_2

    .line 16
    .line 17
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->S1:Landroid/os/Handler;

    .line 22
    .line 23
    new-instance v2, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;

    .line 24
    .line 25
    invoke-direct {v2, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$11;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0}, Lcom/immomo/mediacore/strinf/confrenceHelp;->getExternAudioDevStatusCallback()Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/immomo/mediacore/strinf/confrenceHelp;->getExternAudioDevStatusCallback()Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v2, 0x1

    .line 42
    invoke-interface {v0, v2}, Lcom/immomo/mediacore/sink/ijkStreamerUtil$ExternAudioDevStatusCallback;->onAudioDevStatusNotify(I)V

    .line 43
    .line 44
    .line 45
    :cond_1
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->q1:I

    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public notifyRecording()V
    .locals 2

    .line 1
    const-string v0, "streamerCameraProducer"

    .line 2
    .line 3
    const-string v1, "----notifyRecording: call startRecording()"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b2()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public notifyResumeRecording()V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----notifyResumeRecording:recording="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",old["

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ","

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v:I

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v2, "], new["

    .line 34
    .line 35
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 39
    .line 40
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 49
    .line 50
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v1, "]"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const-string v1, "streamerCameraProducer"

    .line 65
    .line 66
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t1:Z

    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    if-ne v0, v1, :cond_1

    .line 73
    .line 74
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u:I

    .line 75
    .line 76
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 77
    .line 78
    iget v2, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 79
    .line 80
    if-ne v0, v2, :cond_0

    .line 81
    .line 82
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v:I

    .line 83
    .line 84
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 85
    .line 86
    if-eq v0, v1, :cond_1

    .line 87
    .line 88
    :cond_0
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j2()V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c2()V

    .line 92
    .line 93
    .line 94
    :cond_1
    return-void
.end method

.method public notifyUpdateResolution()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/SourceBase;->n()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 12
    .line 13
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 14
    .line 15
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/source/SourceBase;->n()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 20
    .line 21
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 22
    .line 23
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 24
    .line 25
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 26
    .line 27
    invoke-virtual {v1}, Ltv/danmaku/ijk/media/source/SourceBase;->n()Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 32
    .line 33
    iput v1, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 34
    .line 35
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s2()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 39
    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/immomo/mediacore/sink/SinkBase;->notifyUpdateResolution()V

    .line 43
    .line 44
    .line 45
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->notifyUpdateResolution()V

    .line 52
    .line 53
    .line 54
    :cond_2
    return-void
.end method

.method public o0(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G1:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/audio_Indicator;->addMRtcAudioHandler(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 2
    .line 3
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioQuality;->bitRate:I

    .line 4
    .line 5
    return-void
.end method

.method public o2(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->V1()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public p1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h:Lcom/immomo/mediacore/audio/AudioQuality;

    .line 2
    .line 3
    iput p1, p0, Lcom/immomo/mediacore/audio/AudioQuality;->samplingRate:I

    .line 4
    .line 5
    return-void
.end method

.method public p2(Lcom/immomo/mediacore/strinf/VideoQuality;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s2()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/immomo/mediacore/sink/SinkBase;->notifyUpdateResolution()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/immomo/mediacore/sink/SinkBase;->notifyUpdateResolution()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public q0(J)J
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 16
    .line 17
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/AidSource;->p2()J

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    return-wide p0

    .line 34
    :cond_0
    const-wide/16 p0, 0x0

    .line 35
    .line 36
    return-wide p0
.end method

.method public q1(I)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z:I

    .line 2
    .line 3
    return-void
.end method

.method public q2(Lcom/immomo/mediacore/sink/SinkBase;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 2
    .line 3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->m(Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Z0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecAudioMux;

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->m(Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/immomo/mediacore/sink/SinkBase;->setHeadsetStatus(Z)V

    .line 26
    .line 27
    .line 28
    :cond_2
    return-void
.end method

.method public r0(J)J
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 16
    .line 17
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/source/AidSource;->getDuration()J

    .line 30
    .line 31
    .line 32
    move-result-wide p0

    .line 33
    return-wide p0

    .line 34
    :cond_0
    const-wide/16 p0, 0x0

    .line 35
    .line 36
    return-wide p0
.end method

.method public r1(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public r2(Landroid/app/Activity;Ltv/danmaku/ijk/media/source/SourceBase;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "----updateVideoSource(S):"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "streamerCameraProducer"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->A:Landroid/app/Activity;

    .line 23
    .line 24
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/source/SourceBase;->q()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iput-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 32
    .line 33
    new-instance p1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string p2, "----updateVideoSource(E):"

    .line 36
    .line 37
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 41
    .line 42
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public release()V
    .locals 5

    .line 1
    const-string v0, "mCamera.release begin"

    .line 2
    .line 3
    const-string v1, "streamerCameraProducer"

    .line 4
    .line 5
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Lcom/immomo/mediacore/strinf/confrenceHelp;->release()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n1:Ltv/danmaku/ijk/media/source/SourceBase;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G1:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/immomo/mediacore/audio/audio_Indicator;->release()V

    .line 29
    .line 30
    .line 31
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G1:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 32
    .line 33
    :cond_2
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->t0()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F1:Landroid/os/HandlerThread;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 41
    .line 42
    .line 43
    :cond_3
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F1:Landroid/os/HandlerThread;

    .line 44
    .line 45
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->E1:Landroid/os/Handler;

    .line 46
    .line 47
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 48
    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J1:Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;

    .line 52
    .line 53
    invoke-virtual {v0, v3}, Ltv/danmaku/ijk/media/source/audio/audioSource;->b(Lcom/immomo/mediacore/sink/SinkBase$ExtPcmDateCallback;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 57
    .line 58
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/source/audio/audioSource;->a()V

    .line 59
    .line 60
    .line 61
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->p1:Ltv/danmaku/ijk/media/source/audio/audioSource;

    .line 62
    .line 63
    :cond_4
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k2()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j2()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->g2()V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->d2()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b()V

    .line 76
    .line 77
    .line 78
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->i1:Ltv/danmaku/ijk/media/streamer/StreamProducer$HeadsetPlugReceiver;

    .line 79
    .line 80
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j1:Ltv/danmaku/ijk/media/streamer/StreamProducer$BlueConnectStateBroadcastReceiver;

    .line 81
    .line 82
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D:Landroid/content/IntentFilter;

    .line 83
    .line 84
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->stopSurroundMusic()V

    .line 85
    .line 86
    .line 87
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I:Ljava/nio/ByteBuffer;

    .line 88
    .line 89
    const-string v0, "mCamera.release end"

    .line 90
    .line 91
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->A:Landroid/app/Activity;

    .line 95
    .line 96
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 97
    .line 98
    :try_start_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q0:Landroid/view/Surface;

    .line 99
    .line 100
    if-eqz v0, :cond_5

    .line 101
    .line 102
    invoke-virtual {v0}, Landroid/view/Surface;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .line 104
    .line 105
    :catch_0
    :cond_5
    :try_start_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R0:Landroid/view/Surface;

    .line 106
    .line 107
    if-eqz v0, :cond_6

    .line 108
    .line 109
    invoke-virtual {v0}, Landroid/view/Surface;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 110
    .line 111
    .line 112
    :catch_1
    :cond_6
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q0:Landroid/view/Surface;

    .line 113
    .line 114
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R0:Landroid/view/Surface;

    .line 115
    .line 116
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 117
    .line 118
    if-eqz v0, :cond_9

    .line 119
    .line 120
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_8

    .line 133
    .line 134
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    check-cast v1, Ljava/util/Map$Entry;

    .line 139
    .line 140
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    check-cast v1, Ljava/lang/Long;

    .line 145
    .line 146
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 147
    .line 148
    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    check-cast v3, Ltv/danmaku/ijk/media/source/AidSource;

    .line 153
    .line 154
    if-eqz v3, :cond_7

    .line 155
    .line 156
    const/4 v4, 0x1

    .line 157
    invoke-virtual {v3, v4}, Ltv/danmaku/ijk/media/source/AidSource;->u2(I)V

    .line 158
    .line 159
    .line 160
    :cond_7
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 161
    .line 162
    invoke-interface {v3, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 167
    .line 168
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 169
    .line 170
    .line 171
    :cond_9
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 172
    .line 173
    return-void
.end method

.method public s0(JJ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v1:Ljava/util/Map;

    .line 16
    .line 17
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Ltv/danmaku/ijk/media/source/AidSource;

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v1, "aidSeekTo: ["

    .line 32
    .line 33
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, "], "

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string p2, "streamerCameraProducer"

    .line 52
    .line 53
    invoke-static {p2, p1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, p3, p4}, Ltv/danmaku/ijk/media/source/AidSource;->v2(J)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public s1(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I0:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSourceSucess()V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->setCameraSuccess()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public startSurroundMusic(Ljava/lang/String;IJ)V
    .locals 5

    .line 1
    const-string p2, "Mediaplayer Unable to open content: "

    .line 2
    .line 3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v1, "Mediaplayer startSurroundMusic: "

    .line 6
    .line 7
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "streamerCameraProducer"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u1:Z

    .line 24
    .line 25
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h1:Ljava/lang/String;

    .line 26
    .line 27
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 28
    .line 29
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 30
    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 37
    .line 38
    invoke-virtual {p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    iput-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    goto/16 :goto_4

    .line 49
    .line 50
    :cond_1
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h1:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    iput-wide p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l1:J

    .line 55
    .line 56
    const/4 p1, -0x1

    .line 57
    :try_start_0
    new-instance p3, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 58
    .line 59
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->B:Landroid/content/Context;

    .line 60
    .line 61
    invoke-direct {p3, p4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>(Landroid/content/Context;)V

    .line 62
    .line 63
    .line 64
    iput-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 65
    .line 66
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->L1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;

    .line 67
    .line 68
    invoke-virtual {p3, p4}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 69
    .line 70
    .line 71
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 72
    .line 73
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->M1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;

    .line 74
    .line 75
    invoke-virtual {p3, p4}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 76
    .line 77
    .line 78
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 79
    .line 80
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->N1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;

    .line 81
    .line 82
    invoke-virtual {p3, p4}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 83
    .line 84
    .line 85
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 86
    .line 87
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->O1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;

    .line 88
    .line 89
    invoke-virtual {p3, p4}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnBufferingUpdateListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 90
    .line 91
    .line 92
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 93
    .line 94
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;

    .line 95
    .line 96
    invoke-virtual {p3, p4}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnInfoListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 97
    .line 98
    .line 99
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 100
    .line 101
    iget-object p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q1:Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;

    .line 102
    .line 103
    invoke-virtual {p3, p4}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnSeekCompleteListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 104
    .line 105
    .line 106
    iget-boolean p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 107
    .line 108
    const/4 p4, 0x1

    .line 109
    if-eq p3, p4, :cond_2

    .line 110
    .line 111
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 112
    .line 113
    invoke-virtual {p3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getStreamerType()I

    .line 114
    .line 115
    .line 116
    move-result p3

    .line 117
    const/4 v0, 0x2

    .line 118
    if-ne p3, v0, :cond_3

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :catch_0
    move-exception p3

    .line 122
    goto :goto_2

    .line 123
    :catch_1
    move-exception p3

    .line 124
    goto :goto_3

    .line 125
    :cond_2
    :goto_0
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 126
    .line 127
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->R1:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 128
    .line 129
    invoke-virtual {p3, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 130
    .line 131
    .line 132
    :cond_3
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 133
    .line 134
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h1:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-virtual {p3, v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 144
    .line 145
    invoke-virtual {p3, p4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDateCallbackFlags(I)V

    .line 146
    .line 147
    .line 148
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C:Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;

    .line 149
    .line 150
    invoke-virtual {p3}, Ltv/danmaku/ijk/media/streamer/ijkMediaStreamer;->getStreamerType()I

    .line 151
    .line 152
    .line 153
    move-result p3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 155
    .line 156
    const-wide/32 v2, 0xac44

    .line 157
    .line 158
    .line 159
    const/16 v4, 0x4e38

    .line 160
    .line 161
    if-eqz p3, :cond_4

    .line 162
    .line 163
    :try_start_1
    invoke-virtual {v0, v4, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_4
    invoke-virtual {v0, v4, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 168
    .line 169
    .line 170
    :goto_1
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 171
    .line 172
    const/16 v0, 0x4e36

    .line 173
    .line 174
    const-wide/16 v2, 0x2

    .line 175
    .line 176
    invoke-virtual {p3, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 177
    .line 178
    .line 179
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 180
    .line 181
    const/16 v0, 0x4e37

    .line 182
    .line 183
    const-wide/16 v2, 0x3

    .line 184
    .line 185
    invoke-virtual {p3, v0, v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 186
    .line 187
    .line 188
    iget-object p3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 189
    .line 190
    invoke-virtual {p3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->prepareAsync()V

    .line 191
    .line 192
    .line 193
    iput p4, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 194
    .line 195
    return-void

    .line 196
    :goto_2
    new-instance p4, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    invoke-direct {p4, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h1:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    invoke-static {v1, p2, p3}, Ll/t9c;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 211
    .line 212
    .line 213
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 214
    .line 215
    return-void

    .line 216
    :goto_3
    new-instance p4, Ljava/lang/StringBuilder;

    .line 217
    .line 218
    invoke-direct {p4, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-object p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->h1:Ljava/lang/String;

    .line 222
    .line 223
    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-static {v1, p2, p3}, Ll/t9c;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 231
    .line 232
    .line 233
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 234
    .line 235
    :cond_5
    :goto_4
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 3

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u1:Z

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnBufferingUpdateListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnInfoListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnSeekCompleteListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 43
    .line 44
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->stop()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->release()V

    .line 50
    .line 51
    .line 52
    iput v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k1:I

    .line 53
    .line 54
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public t1(II)V
    .locals 2

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x3

    .line 7
    if-ltz p2, :cond_0

    .line 8
    .line 9
    if-le p2, v1, :cond_1

    .line 10
    .line 11
    :cond_0
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n:I

    .line 12
    .line 13
    :cond_1
    if-ltz p1, :cond_2

    .line 14
    .line 15
    if-le p1, v1, :cond_3

    .line 16
    .line 17
    :cond_2
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m:I

    .line 18
    .line 19
    :cond_3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string p2, "after setCameraRotation mFrontCameraRotation:"

    .line 22
    .line 23
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget p2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->m:I

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p2, ";mBackCameraRotation:"

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->n:I

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "streamerCameraProducer"

    .line 46
    .line 47
    invoke-static {p1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public t2([BI)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->y1:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->D1:Z

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->c1:Z

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-array v0, p2, [B

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {p1, v1, v0, v1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->H1:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter p1

    .line 22
    :try_start_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->C1:Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, v0, p2}, Lcom/immomo/mediacore/audio/NonBlockingAudioTrack;->write([BI)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_0
    :goto_0
    monitor-exit p1

    .line 33
    return-void

    .line 34
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    throw p0

    .line 36
    :cond_1
    return-void
.end method

.method public u0(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->G1:Lcom/immomo/mediacore/audio/audio_Indicator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/mediacore/audio/audio_Indicator;->enableAudioVolumeIndication(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u1(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public v1(F)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->F0:F

    .line 2
    .line 3
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/immomo/mediacore/audio/AudioProcess;->setMasterAudioLevel(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public w1(J)V
    .locals 2

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J0:J

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long p1, p1, v0

    .line 6
    .line 7
    if-gtz p1, :cond_0

    .line 8
    .line 9
    const-wide/16 p1, 0x1770

    .line 10
    .line 11
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->J0:J

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public x0()V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi",
            "NewApi"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Video encoded using the MediaCodec API with a surface mVideoQuality.framerate"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z1:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "streamerCameraProducer"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string v0, "video/avc"

    .line 28
    .line 29
    invoke-static {v0}, Ll/y0f;->b(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-static {v2}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iput-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 42
    .line 43
    invoke-direct {p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->s2()V

    .line 44
    .line 45
    .line 46
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 47
    .line 48
    iget v3, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 49
    .line 50
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 51
    .line 52
    invoke-static {v0, v3, v2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 57
    .line 58
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 59
    .line 60
    const-string v3, "bitrate"

    .line 61
    .line 62
    invoke-virtual {v0, v3, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    const-string v2, "frame-rate"

    .line 66
    .line 67
    iget v3, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z1:I

    .line 68
    .line 69
    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 70
    .line 71
    .line 72
    const-string v2, "color-format"

    .line 73
    .line 74
    const v3, 0x7f000789

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 78
    .line 79
    .line 80
    const-string v2, "i-frame-interval"

    .line 81
    .line 82
    const/4 v3, 0x1

    .line 83
    invoke-virtual {v0, v2, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 87
    .line 88
    const/4 v4, 0x0

    .line 89
    if-eqz v2, :cond_5

    .line 90
    .line 91
    invoke-virtual {v2, v0, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 95
    .line 96
    invoke-virtual {v0}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q0:Landroid/view/Surface;

    .line 101
    .line 102
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 103
    .line 104
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 108
    .line 109
    iget v2, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 110
    .line 111
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->u:I

    .line 112
    .line 113
    iget v2, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 114
    .line 115
    iput v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->v:I

    .line 116
    .line 117
    iget v0, v0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 118
    .line 119
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w:I

    .line 120
    .line 121
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z1:I

    .line 122
    .line 123
    iput v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->x:I

    .line 124
    .line 125
    new-instance v0, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    const-string v2, "-------recording:resolution("

    .line 128
    .line 129
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 133
    .line 134
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 135
    .line 136
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string v2, ","

    .line 140
    .line 141
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 145
    .line 146
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 147
    .line 148
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v2, "),bitrate="

    .line 152
    .line 153
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 157
    .line 158
    iget v2, v2, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 159
    .line 160
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v2, ", framerate="

    .line 164
    .line 165
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->z1:I

    .line 169
    .line 170
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    .line 179
    .line 180
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 181
    .line 182
    if-eqz v0, :cond_1

    .line 183
    .line 184
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q0:Landroid/view/Surface;

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->b(Landroid/view/Surface;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->b1:Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;

    .line 190
    .line 191
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->P:Lcom/immomo/mediacore/audio/AudioProcess;

    .line 192
    .line 193
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/StreamProducer$AudioRecordRunnable;->a(Lcom/immomo/mediacore/audio/AudioProcess;)V

    .line 194
    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->W0:Ltv/danmaku/ijk/media/streamer/MomoSurface;

    .line 198
    .line 199
    if-eqz v0, :cond_2

    .line 200
    .line 201
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->Q0:Landroid/view/Surface;

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/streamer/MomoSurface;->Z(Landroid/view/Surface;)V

    .line 204
    .line 205
    .line 206
    :cond_2
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 207
    .line 208
    if-eqz v0, :cond_3

    .line 209
    .line 210
    const/4 v1, 0x0

    .line 211
    invoke-virtual {v0, v1}, Lcom/immomo/mediacore/sink/SinkBase;->setErrorCode(I)V

    .line 212
    .line 213
    .line 214
    :cond_3
    new-instance v0, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 215
    .line 216
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->o:Landroid/media/MediaCodec;

    .line 217
    .line 218
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->r1:Lcom/immomo/mediacore/sink/SinkBase;

    .line 219
    .line 220
    invoke-direct {v0, v1, v2}, Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;-><init>(Landroid/media/MediaCodec;Lcom/immomo/mediacore/sink/SinkBase;)V

    .line 221
    .line 222
    .line 223
    iput-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 224
    .line 225
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->l()V

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 229
    .line 230
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->j:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 231
    .line 232
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 233
    .line 234
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->d(I)V

    .line 235
    .line 236
    .line 237
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 238
    .line 239
    iget-boolean v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->I0:Z

    .line 240
    .line 241
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->e(Z)V

    .line 242
    .line 243
    .line 244
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 245
    .line 246
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->e:Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->k(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    iget-wide v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->a1:J

    .line 252
    .line 253
    const-wide/16 v2, -0x1

    .line 254
    .line 255
    cmp-long v2, v0, v2

    .line 256
    .line 257
    if-eqz v2, :cond_4

    .line 258
    .line 259
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 260
    .line 261
    invoke-virtual {v2, v0, v1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->g(J)V

    .line 262
    .line 263
    .line 264
    :cond_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 265
    .line 266
    new-instance v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$12;

    .line 267
    .line 268
    invoke-direct {v1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$12;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 269
    .line 270
    .line 271
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->f(Ltv/danmaku/ijk/media/processing/encodec/MuxBase$EncoderFrameRateUpdataListener;)V

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->X0:Ltv/danmaku/ijk/media/processing/encodec/MediaCodecVideoMux;

    .line 275
    .line 276
    new-instance v1, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;

    .line 277
    .line 278
    invoke-direct {v1, p0}, Ltv/danmaku/ijk/media/streamer/StreamProducer$13;-><init>(Ltv/danmaku/ijk/media/streamer/StreamProducer;)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {v0, v1}, Ltv/danmaku/ijk/media/processing/encodec/MuxBase;->h(Ltv/danmaku/ijk/media/streamer/StreamProducer$PacketBufferlingStatusListener;)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :cond_5
    const/16 v0, -0x12f

    .line 286
    .line 287
    const/4 v1, 0x2

    .line 288
    const/16 v2, 0x12c

    .line 289
    .line 290
    invoke-virtual {p0, v2, v0, v1, v4}, Ltv/danmaku/ijk/media/streamer/StreamProducer;->notify(IIILjava/lang/Object;)V

    .line 291
    .line 292
    .line 293
    return-void
.end method

.method public x1(I)I
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->w1:I

    .line 2
    .line 3
    return p1
.end method

.method public y0()Lcom/immomo/mediacore/strinf/VideoQuality;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "getVideoQuality: width"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 9
    .line 10
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resX:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ";heigh:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 21
    .line 22
    iget v1, v1, Lcom/immomo/mediacore/strinf/VideoQuality;->resY:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "streamerCameraProducer"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 37
    .line 38
    return-object p0
.end method

.method public y1(Z)V
    .locals 2

    .line 1
    sget-byte v0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->T1:B

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iput-byte v0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    :goto_0
    iput-byte v1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->l:B

    .line 13
    .line 14
    return-void
.end method

.method public z0()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->k:Lcom/immomo/mediacore/strinf/VideoQuality;

    .line 2
    .line 3
    iget p0, p0, Lcom/immomo/mediacore/strinf/VideoQuality;->bitrate:I

    .line 4
    .line 5
    return p0
.end method

.method public z1(J)V
    .locals 2

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K0:J

    .line 2
    .line 3
    const-wide/16 v0, 0x0

    .line 4
    .line 5
    cmp-long p1, p1, v0

    .line 6
    .line 7
    if-gtz p1, :cond_0

    .line 8
    .line 9
    const-wide/16 p1, 0x3e8

    .line 10
    .line 11
    iput-wide p1, p0, Ltv/danmaku/ijk/media/streamer/StreamProducer;->K0:J

    .line 12
    .line 13
    :cond_0
    return-void
.end method
