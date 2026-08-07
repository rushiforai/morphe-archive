.class public Lcom/tencent/iliveroom/a/a;
.super Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/iliveroom/IOneSecAdapter;
.implements Lcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;
.implements Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;
.implements Lcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/iliveroom/a/a$b;,
        Lcom/tencent/iliveroom/a/a$a;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:I

.field private D:J

.field private E:J

.field private F:J

.field private G:Lcom/tencent/iliveroom/a/a$b;

.field private H:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;",
            ">;"
        }
    .end annotation
.end field

.field private I:I

.field private J:I

.field private K:Lcom/tencent/iliveroom/a/a/e;

.field private L:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

.field private M:Ljava/lang/String;

.field private N:Lcom/tencent/iliveroom/a/c/d;

.field private O:J

.field private P:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;",
            ">;"
        }
    .end annotation
.end field

.field protected a:Lcom/tencent/iliveroom/OneSecAdapterParams;

.field protected b:Z

.field protected c:Lcom/tencent/iliveroom/a/c/e;

.field protected d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

.field protected e:Lcom/tencent/iliveroom/a/c;

.field protected f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected g:Z

.field protected h:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field protected i:J

.field protected j:Lcom/tencent/iliveroom/a/a/d;

.field protected k:Lcom/tencent/iliveroom/a/c/a;

.field protected l:Z

.field private m:Landroid/content/Context;

.field private n:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/tencent/iliveroom/a/a$a;",
            ">;"
        }
    .end annotation
.end field

.field private o:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

.field private p:Ljava/lang/String;

.field private q:Z

.field private r:Z

.field private s:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private t:Lcom/tencent/iliveroom/a/a/b;

.field private u:J

.field private v:Ljava/lang/Object;

.field private w:Lcom/tencent/iliveroom/a/b;

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Lcom/tencent/iliveroom/a/c/d;

    .line 5
    .line 6
    invoke-direct {p2}, Lcom/tencent/iliveroom/a/c/d;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a;->N:Lcom/tencent/iliveroom/a/c/d;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->m:Landroid/content/Context;

    .line 16
    .line 17
    invoke-super {p0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioFrameListener(Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->bigEncSize:Lcom/tencent/liteav/g$a;

    .line 23
    .line 24
    const/4 p2, 0x0

    .line 25
    iput p2, p1, Lcom/tencent/liteav/g$a;->a:I

    .line 26
    .line 27
    iput p2, p1, Lcom/tencent/liteav/g$a;->b:I

    .line 28
    .line 29
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 30
    .line 31
    iput p2, p1, Lcom/tencent/liteav/g;->a:I

    .line 32
    .line 33
    iput p2, p1, Lcom/tencent/liteav/g;->b:I

    .line 34
    .line 35
    const/16 v0, 0xf

    .line 36
    .line 37
    iput v0, p1, Lcom/tencent/liteav/g;->h:I

    .line 38
    .line 39
    const/4 v0, 0x1

    .line 40
    iput v0, p1, Lcom/tencent/liteav/g;->j:I

    .line 41
    .line 42
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 43
    .line 44
    invoke-virtual {v1, p1}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Lcom/tencent/liteav/d;->f(Z)V

    .line 50
    .line 51
    .line 52
    new-instance p1, Lcom/tencent/iliveroom/a/a/b;

    .line 53
    .line 54
    invoke-direct {p1}, Lcom/tencent/iliveroom/a/a/b;-><init>()V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    .line 58
    .line 59
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 60
    .line 61
    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->s:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 65
    .line 66
    new-instance p1, Lcom/tencent/iliveroom/a/c/e;

    .line 67
    .line 68
    invoke-direct {p1}, Lcom/tencent/iliveroom/a/c/e;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 72
    .line 73
    new-instance p1, Lcom/tencent/iliveroom/a/b;

    .line 74
    .line 75
    invoke-direct {p1, p0}, Lcom/tencent/iliveroom/a/b;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->w:Lcom/tencent/iliveroom/a/b;

    .line 79
    .line 80
    new-instance p1, Lcom/tencent/iliveroom/a/c;

    .line 81
    .line 82
    invoke-direct {p1, p0}, Lcom/tencent/iliveroom/a/c;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 83
    .line 84
    .line 85
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->e:Lcom/tencent/iliveroom/a/c;

    .line 86
    .line 87
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 88
    .line 89
    invoke-virtual {p1, p3}, Lcom/tencent/iliveroom/a/c/e;->a(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->w:Lcom/tencent/iliveroom/a/b;

    .line 93
    .line 94
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setListener(Lcom/tencent/trtc/TRTCCloudListener;)V

    .line 95
    .line 96
    .line 97
    invoke-super {p0, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setGSensorMode(I)V

    .line 98
    .line 99
    .line 100
    invoke-super {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncoderMirror(Z)V

    .line 101
    .line 102
    .line 103
    const/4 p1, 0x2

    .line 104
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoEncoderRotation(I)V

    .line 105
    .line 106
    .line 107
    new-instance p2, Ljava/util/HashMap;

    .line 108
    .line 109
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a;->H:Ljava/util/Map;

    .line 113
    .line 114
    new-instance p2, Ljava/util/HashMap;

    .line 115
    .line 116
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 117
    .line 118
    .line 119
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a;->n:Ljava/util/Map;

    .line 120
    .line 121
    new-instance p2, Ljava/util/HashMap;

    .line 122
    .line 123
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 124
    .line 125
    .line 126
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a;->P:Ljava/util/Map;

    .line 127
    .line 128
    new-instance p2, Ljava/util/HashSet;

    .line 129
    .line 130
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 131
    .line 132
    .line 133
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a;->f:Ljava/util/Set;

    .line 134
    .line 135
    new-instance p2, Ljava/util/HashSet;

    .line 136
    .line 137
    invoke-direct {p2}, Ljava/util/HashSet;-><init>()V

    .line 138
    .line 139
    .line 140
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a;->h:Ljava/util/Set;

    .line 141
    .line 142
    new-instance p2, Lcom/tencent/iliveroom/a/a$b;

    .line 143
    .line 144
    invoke-direct {p2, p0}, Lcom/tencent/iliveroom/a/a$b;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 145
    .line 146
    .line 147
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a;->G:Lcom/tencent/iliveroom/a/a$b;

    .line 148
    .line 149
    const-wide/16 p2, -0x1

    .line 150
    .line 151
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a;->i:J

    .line 152
    .line 153
    new-instance p2, Lcom/tencent/iliveroom/a/c/a;

    .line 154
    .line 155
    const/4 p3, 0x5

    .line 156
    invoke-direct {p2, p3}, Lcom/tencent/iliveroom/a/c/a;-><init>(I)V

    .line 157
    .line 158
    .line 159
    iput-object p2, p0, Lcom/tencent/iliveroom/a/a;->k:Lcom/tencent/iliveroom/a/c/a;

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    const p3, 0x7fffffff

    .line 166
    .line 167
    .line 168
    invoke-interface {p2, p3, p0}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->setMusicObserver(ILcom/tencent/liteav/audio/TXAudioEffectManager$TXMusicPlayObserver;)V

    .line 169
    .line 170
    .line 171
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    const p2, 0xac44

    .line 176
    .line 177
    .line 178
    const/16 p3, 0x200

    .line 179
    .line 180
    invoke-virtual {p0, p2, p1, p3}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setPlayoutDataCallbackFormat(III)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public static synthetic A(Lcom/tencent/iliveroom/a/a;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->v:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic B(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopAllRemoteView()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic D(Lcom/tencent/iliveroom/a/a;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->s:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic E(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopAllAudioEffects()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H(Lcom/tencent/iliveroom/a/a;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->M:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic I(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopPublishCDNStream()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J(Lcom/tencent/iliveroom/a/a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic K(Lcom/tencent/iliveroom/a/a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic L(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic N(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->pauseBGM()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->resumeBGM()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P(Lcom/tencent/iliveroom/a/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/iliveroom/a/a;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Q(Lcom/tencent/iliveroom/a/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/iliveroom/a/a;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic R(Lcom/tencent/iliveroom/a/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/iliveroom/a/a;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic S(Lcom/tencent/iliveroom/a/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/iliveroom/a/a;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic T(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startLocalAudio()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopLocalAudio()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic V(Lcom/tencent/iliveroom/a/a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/a;->D:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic W(Lcom/tencent/iliveroom/a/a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/a;->F:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic X(Lcom/tencent/iliveroom/a/a;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/a;->E:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic Y(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/basic/util/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/basic/util/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mSDKHandler:Lcom/tencent/liteav/basic/util/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;I)I
    .locals 0

    .line 213
    iput p1, p0, Lcom/tencent/iliveroom/a/a;->A:I

    return p1
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;I)I
    .locals 0

    .line 176
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoStreamType(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
    .locals 0

    .line 177
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoRenderListener(Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I

    move-result p0

    return p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I
    .locals 0

    .line 178
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableEncSmallVideoStream(ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I

    move-result p0

    return p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;J)J
    .locals 0

    .line 179
    iput-wide p1, p0, Lcom/tencent/iliveroom/a/a;->D:J

    return-wide p1
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->o:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;
    .locals 0

    .line 181
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->L:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    return-object p1
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a$b;
    .locals 0

    .line 182
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->G:Lcom/tencent/iliveroom/a/a$b;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/a/a/e;)Lcom/tencent/iliveroom/a/a/e;
    .locals 0

    .line 183
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->K:Lcom/tencent/iliveroom/a/a/e;

    return-object p1
.end method

.method private a(IJLjava/lang/String;J)Ljava/lang/String;
    .locals 2

    const p0, 0x8a94

    .line 214
    const-string v0, "_main"

    const-string v1, "_"

    if-eq p1, p0, :cond_1

    const p0, 0x1b9e0

    if-ne p1, p0, :cond_0

    goto :goto_0

    .line 215
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 216
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;IJLjava/lang/String;J)Ljava/lang/String;
    .locals 0

    .line 184
    invoke-direct/range {p0 .. p6}, Lcom/tencent/iliveroom/a/a;->b(IJLjava/lang/String;J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 185
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->M:Ljava/lang/String;

    return-object p1
.end method

.method private a(IIIII)V
    .locals 8

    .line 1
    const-string v0, " bitrate:"

    .line 2
    .line 3
    const-string v1, " fps:"

    .line 4
    .line 5
    const-string v2, " height:"

    .line 6
    .line 7
    const-string v3, " width:"

    .line 8
    .line 9
    const-string v4, "TRTCAdapter-ext"

    .line 10
    .line 11
    if-lez p2, :cond_1

    .line 12
    .line 13
    if-lez p3, :cond_1

    .line 14
    .line 15
    if-lez p4, :cond_1

    .line 16
    .line 17
    if-lez p5, :cond_1

    .line 18
    .line 19
    const/4 v5, 0x1

    .line 20
    if-ne p1, v5, :cond_0

    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    invoke-static {p0, v5, v6}, Lcom/tencent/iliveroom/a/a;->b(Lcom/tencent/iliveroom/a/a;ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I

    .line 24
    .line 25
    .line 26
    :cond_0
    new-instance v6, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v7, "setVideoEncParamsInner -> setEncParams type:"

    .line 29
    .line 30
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v6, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {v4, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    new-instance v0, Lorg/json/JSONObject;

    .line 68
    .line 69
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 70
    .line 71
    .line 72
    :try_start_0
    const-string v1, "api"

    .line 73
    .line 74
    const-string v2, "setVideoEncodeParamEx"

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 77
    .line 78
    .line 79
    new-instance v1, Lorg/json/JSONObject;

    .line 80
    .line 81
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v2, "params"

    .line 85
    .line 86
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    .line 88
    .line 89
    const-string v2, "codecType"

    .line 90
    .line 91
    invoke-virtual {v1, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 92
    .line 93
    .line 94
    const-string v2, "streamType"

    .line 95
    .line 96
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    const-string p1, "videoWidth"

    .line 100
    .line 101
    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 102
    .line 103
    .line 104
    const-string p1, "videoHeight"

    .line 105
    .line 106
    invoke-virtual {v1, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 107
    .line 108
    .line 109
    const-string p1, "videoFps"

    .line 110
    .line 111
    invoke-virtual {v1, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 112
    .line 113
    .line 114
    const-string p1, "videoBitrate"

    .line 115
    .line 116
    invoke-virtual {v1, p1, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :catch_0
    move-exception p1

    .line 121
    const-string p2, "build json object failed."

    .line 122
    .line 123
    invoke-static {v4, p2, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 124
    .line 125
    .line 126
    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    invoke-static {p0, p1}, Lcom/tencent/iliveroom/a/a;->g(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 135
    .line 136
    const-string v5, "setVideoEncParamsInner -> fail. type:"

    .line 137
    .line 138
    invoke-direct {p0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {p0, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-static {v4, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;II)V
    .locals 0

    .line 186
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioEffectVolume(II)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;IIIII)V
    .locals 0

    .line 187
    invoke-direct/range {p0 .. p5}, Lcom/tencent/iliveroom/a/a;->a(IIIII)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;JLcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;)V
    .locals 0

    .line 188
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetMixTranscodingConfig(JLcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V
    .locals 0

    .line 189
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->playAudioEffect(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V
    .locals 0

    .line 190
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setNetworkQosParam(Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;I)V
    .locals 0

    .line 191
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enterRoom(Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;I)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;)V
    .locals 0

    .line 192
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setMixTranscodingConfig(Lcom/tencent/trtc/TRTCCloudDef$TRTCTranscodingConfig;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)V
    .locals 0

    .line 193
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioFrameListener(Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/Runnable;)V
    .locals 0

    .line 194
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;III)V
    .locals 0

    .line 195
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurfaceSize(Ljava/lang/String;III)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 0

    .line 196
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 197
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startRemoteView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 198
    invoke-direct {p0, p1, p2}, Lcom/tencent/iliveroom/a/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Z)V
    .locals 0

    .line 199
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteRemoteVideoStream(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 200
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalAudio(Z)V

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 204
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    if-eqz v0, :cond_0

    .line 205
    new-instance v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;

    invoke-direct {v0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;-><init>()V

    .line 206
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    iget v2, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->appId:I

    iput v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;->appId:I

    .line 207
    iget v1, v1, Lcom/tencent/iliveroom/OneSecAdapterParams;->bizId:I

    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;->bizId:I

    .line 208
    iput-object p1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;->url:Ljava/lang/String;

    .line 209
    iput-object p2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;->streamId:Ljava/lang/String;

    .line 210
    invoke-super {p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startPublishCDNStream(Lcom/tencent/trtc/TRTCCloudDef$TRTCPublishCDNParam;)V

    const/4 p1, 0x0

    .line 211
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->p:Ljava/lang/String;

    return-void

    .line 212
    :cond_0
    const-string p0, "TRTCAdapter-ext"

    const-string p1, "startPublishCDNStreamInner -> error! room params is null."

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;I[BZZ)Z
    .locals 0

    .line 201
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sendCustomCmdMsg(I[BZZ)Z

    move-result p0

    return p0
.end method

.method public static synthetic a(Lcom/tencent/iliveroom/a/a;[BI)Z
    .locals 0

    .line 202
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sendSEIMsg([BI)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;I)I
    .locals 0

    .line 194
    iput p1, p0, Lcom/tencent/iliveroom/a/a;->z:I

    return p1
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;I)I
    .locals 0

    .line 179
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoStreamType(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
    .locals 0

    .line 180
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoRenderListener(Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I
    .locals 0

    .line 181
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableEncSmallVideoStream(ZLcom/tencent/trtc/TRTCCloudDef$TRTCVideoEncParam;)I

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;J)J
    .locals 0

    .line 182
    iput-wide p1, p0, Lcom/tencent/iliveroom/a/a;->E:J

    return-wide p1
.end method

.method private b(IJLjava/lang/String;J)Ljava/lang/String;
    .locals 2

    const p0, 0x8a94

    .line 195
    const-string v0, "_H265"

    const-string v1, "_"

    if-eq p1, p0, :cond_1

    const p0, 0x1b9e0

    if-ne p1, p0, :cond_0

    goto :goto_0

    .line 196
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 197
    :cond_1
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/tencent/liteav/basic/util/TXCCommonUtil;->getMD5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;IJLjava/lang/String;J)Ljava/lang/String;
    .locals 0

    .line 183
    invoke-direct/range {p0 .. p6}, Lcom/tencent/iliveroom/a/a;->a(IJLjava/lang/String;J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private b()V
    .locals 8

    .line 1
    new-instance v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;->preference:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    iput v1, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;->controlMode:I

    .line 11
    .line 12
    invoke-static {p0, v0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCNetworkQosParam;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->p:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->p:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a;->M:Ljava/lang/String;

    .line 26
    .line 27
    invoke-direct {p0, v0, v2}, Lcom/tencent/iliveroom/a/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 31
    .line 32
    iget v0, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomRole:I

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    if-ne v0, v1, :cond_1

    .line 36
    .line 37
    move v0, v1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v0, v2

    .line 40
    :goto_0
    iput-boolean v0, p0, Lcom/tencent/iliveroom/a/a;->b:Z

    .line 41
    .line 42
    new-instance v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;

    .line 43
    .line 44
    invoke-direct {v0}, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;-><init>()V

    .line 45
    .line 46
    .line 47
    iget-object v3, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 48
    .line 49
    iget-wide v3, v3, Lcom/tencent/iliveroom/OneSecAdapterParams;->sdkAppId:J

    .line 50
    .line 51
    long-to-int v3, v3

    .line 52
    iput v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->sdkAppId:I

    .line 53
    .line 54
    new-instance v3, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    iget-object v4, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 60
    .line 61
    iget-wide v4, v4, Lcom/tencent/iliveroom/OneSecAdapterParams;->userId:J

    .line 62
    .line 63
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v4, ""

    .line 67
    .line 68
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iput-object v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userId:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 78
    .line 79
    iget v4, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomRole:I

    .line 80
    .line 81
    if-ne v4, v1, :cond_2

    .line 82
    .line 83
    const/16 v4, 0x14

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_2
    const/16 v4, 0x15

    .line 87
    .line 88
    :goto_1
    iput v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->role:I

    .line 89
    .line 90
    iget-object v4, v3, Lcom/tencent/iliveroom/OneSecAdapterParams;->userSig:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->userSig:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v3, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->privateMapKey:[B

    .line 95
    .line 96
    if-eqz v3, :cond_3

    .line 97
    .line 98
    new-instance v4, Ljava/lang/String;

    .line 99
    .line 100
    invoke-direct {v4, v3}, Ljava/lang/String;-><init>([B)V

    .line 101
    .line 102
    .line 103
    iput-object v4, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->privateMapKey:Ljava/lang/String;

    .line 104
    .line 105
    :cond_3
    const/4 v3, -0x1

    .line 106
    iput v3, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->roomId:I

    .line 107
    .line 108
    new-instance v3, Lorg/json/JSONObject;

    .line 109
    .line 110
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 111
    .line 112
    .line 113
    :try_start_0
    const-string v4, "strGroupId"

    .line 114
    .line 115
    iget-object v5, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 116
    .line 117
    iget-object v5, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 120
    .line 121
    .line 122
    const-string v4, "Role"

    .line 123
    .line 124
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 128
    .line 129
    iget-wide v4, v2, Lcom/tencent/iliveroom/OneSecAdapterParams;->sdkAppId:J

    .line 130
    .line 131
    const-wide/32 v6, 0x5374ab14

    .line 132
    .line 133
    .line 134
    cmp-long v2, v4, v6

    .line 135
    .line 136
    if-eqz v2, :cond_4

    .line 137
    .line 138
    new-instance v2, Lorg/json/JSONObject;

    .line 139
    .line 140
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string v4, "pure_audio_push_mod"

    .line 144
    .line 145
    invoke-virtual {v2, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 146
    .line 147
    .line 148
    const-string v4, "Str_uc_params"

    .line 149
    .line 150
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    .line 152
    .line 153
    goto :goto_2

    .line 154
    :catch_0
    move-exception v2

    .line 155
    const-string v4, "TRTCAdapter-ext"

    .line 156
    .line 157
    const-string v5, "build json failed."

    .line 158
    .line 159
    invoke-static {v4, v5, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 160
    .line 161
    .line 162
    :cond_4
    :goto_2
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    iput-object v2, v0, Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;->businessInfo:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {p0, v0, v1}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCParams;I)V

    .line 169
    .line 170
    .line 171
    iget-boolean v0, p0, Lcom/tencent/iliveroom/a/a;->b:Z

    .line 172
    .line 173
    if-eqz v0, :cond_5

    .line 174
    .line 175
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a;->c()V

    .line 176
    .line 177
    .line 178
    :cond_5
    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 184
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a;->b()V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;JLcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;)V
    .locals 0

    .line 185
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->nativeSetMixTranscodingConfig(JLcom/tencent/liteav/trtc/impl/TRTCTranscodingConfigInner;)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V
    .locals 0

    .line 186
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->playAudioEffect(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioEffectParam;)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Ljava/lang/Runnable;)V
    .locals 0

    .line 187
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V
    .locals 0

    .line 188
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopRemoteView(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;III)V
    .locals 0

    .line 189
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurfaceSize(Ljava/lang/String;III)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 0

    .line 190
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V
    .locals 0

    .line 191
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->startRemoteView(Ljava/lang/String;Lcom/tencent/rtmp/ui/TXCloudVideoView;)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;Z)V
    .locals 0

    .line 192
    invoke-super {p0, p1, p2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteRemoteAudio(Ljava/lang/String;Z)V

    return-void
.end method

.method public static synthetic b(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 193
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalVideo(Z)V

    return-void
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;I)I
    .locals 0

    .line 92
    iput p1, p0, Lcom/tencent/iliveroom/a/a;->C:I

    return p1
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I
    .locals 0

    .line 84
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteVideoRenderListener(Ljava/lang/String;IILcom/tencent/trtc/TRTCCloudListener$TRTCVideoRenderListener;)I

    move-result p0

    return p0
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;J)J
    .locals 0

    .line 85
    iput-wide p1, p0, Lcom/tencent/iliveroom/a/a;->F:J

    return-wide p1
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;
    .locals 0

    .line 86
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->o:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    return-object p0
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 87
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->p:Ljava/lang/String;

    return-object p1
.end method

.method private c()V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Lcom/tencent/iliveroom/a/a;->k(Lcom/tencent/iliveroom/a/a;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a;->s:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/tencent/iliveroom/a/a;->o:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    iget v4, p0, Lcom/tencent/iliveroom/a/a;->x:I

    .line 15
    .line 16
    iget v5, p0, Lcom/tencent/iliveroom/a/a;->y:I

    .line 17
    .line 18
    iget v6, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoFps:I

    .line 19
    .line 20
    iget v7, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoBitrate:I

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    move-object v2, p0

    .line 24
    invoke-direct/range {v2 .. v7}, Lcom/tencent/iliveroom/a/a;->a(IIIII)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object v2, p0

    .line 29
    :goto_0
    invoke-static {v2, v2}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;Lcom/tencent/trtc/TRTCCloudListener$TRTCAudioFrameListener;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, v2, Lcom/tencent/iliveroom/a/a;->o:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 33
    .line 34
    iget p0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->audioEncQuality:I

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    const v3, 0xac44

    .line 38
    .line 39
    .line 40
    const-string v4, "TRTCAdapter-ext"

    .line 41
    .line 42
    const/4 v5, 0x3

    .line 43
    if-ne p0, v5, :cond_1

    .line 44
    .line 45
    const-string p0, "startPublish: enable high audio quality."

    .line 46
    .line 47
    invoke-static {v4, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v2, v5}, Lcom/tencent/iliveroom/a/a;->q(Lcom/tencent/iliveroom/a/a;I)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const/16 v0, 0x200

    .line 58
    .line 59
    invoke-virtual {p0, v3, v1, v0}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setCaptureDataCallbackFormat(III)V

    .line 60
    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_1
    const-string p0, "startPublish: enable standard audio quality."

    .line 64
    .line 65
    invoke-static {v4, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v2, v1}, Lcom/tencent/iliveroom/a/a;->r(Lcom/tencent/iliveroom/a/a;I)V

    .line 69
    .line 70
    .line 71
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const/16 v1, 0x400

    .line 76
    .line 77
    invoke-virtual {p0, v3, v0, v1}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setCaptureDataCallbackFormat(III)V

    .line 78
    .line 79
    .line 80
    :goto_1
    invoke-static {v2}, Lcom/tencent/iliveroom/a/a;->T(Lcom/tencent/iliveroom/a/a;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;Ljava/lang/Runnable;)V
    .locals 0

    .line 88
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnListenerThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;III)V
    .locals 0

    .line 89
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurfaceSize(Ljava/lang/String;III)V

    return-void
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 0

    .line 90
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V

    return-void
.end method

.method public static synthetic c(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 91
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalAudio(Z)V

    return-void
.end method

.method public static synthetic d(Lcom/tencent/iliveroom/a/a;)I
    .locals 0

    .line 19
    iget p0, p0, Lcom/tencent/iliveroom/a/a;->x:I

    return p0
.end method

.method public static synthetic d(Lcom/tencent/iliveroom/a/a;I)I
    .locals 0

    .line 14
    iput p1, p0, Lcom/tencent/iliveroom/a/a;->B:I

    return p1
.end method

.method private d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lcom/tencent/iliveroom/a/a;->l(Lcom/tencent/iliveroom/a/a;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->U(Lcom/tencent/iliveroom/a/a;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->s:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic d(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V
    .locals 0

    .line 15
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;III)V
    .locals 0

    .line 16
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurfaceSize(Ljava/lang/String;III)V

    return-void
.end method

.method public static synthetic d(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 0

    .line 17
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V

    return-void
.end method

.method public static synthetic d(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 18
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalVideo(Z)V

    return-void
.end method

.method public static synthetic e(Lcom/tencent/iliveroom/a/a;)I
    .locals 0

    .line 5
    iget p0, p0, Lcom/tencent/iliveroom/a/a;->y:I

    return p0
.end method

.method public static synthetic e(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->switchRole(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V
    .locals 0

    .line 6
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic e(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;III)V
    .locals 0

    .line 7
    invoke-super {p0, p1, p2, p3, p4}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurfaceSize(Ljava/lang/String;III)V

    return-void
.end method

.method public static synthetic e(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 0

    .line 8
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V

    return-void
.end method

.method public static synthetic e(Lcom/tencent/iliveroom/a/a;Z)Z
    .locals 0

    .line 9
    iput-boolean p1, p0, Lcom/tencent/iliveroom/a/a;->r:Z

    return p1
.end method

.method public static synthetic f(Lcom/tencent/iliveroom/a/a;I)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setPriorRemoteVideoStreamType(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic f(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    return-object p0
.end method

.method public static synthetic f(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 0

    .line 8
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V

    return-void
.end method

.method public static synthetic f(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 9
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalVideo(Z)V

    return-void
.end method

.method public static synthetic g(Lcom/tencent/iliveroom/a/a;I)I
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setPriorRemoteVideoStreamType(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 6
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    return-object p0
.end method

.method public static synthetic g(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->callExperimentalAPI(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic g(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 0

    .line 8
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V

    return-void
.end method

.method public static synthetic g(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 9
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteAllRemoteVideoStreams(Z)V

    return-void
.end method

.method public static synthetic h(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    return-object p0
.end method

.method public static synthetic h(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableAudioVolumeEvaluation(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;ILandroid/view/Surface;)V
    .locals 0

    .line 6
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setRemoteSurface(Ljava/lang/String;ILandroid/view/Surface;)V

    return-void
.end method

.method public static synthetic h(Lcom/tencent/iliveroom/a/a;Z)Z
    .locals 0

    .line 7
    iput-boolean p1, p0, Lcom/tencent/iliveroom/a/a;->q:Z

    return p1
.end method

.method public static synthetic i(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    return-object p0
.end method

.method public static synthetic i(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioRoute(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 6
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalAudio(Z)V

    return-void
.end method

.method public static synthetic j(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a/b;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    return-object p0
.end method

.method public static synthetic j(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setSystemVolumeType(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 6
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteAllRemoteAudio(Z)V

    return-void
.end method

.method public static synthetic k(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->n:Ljava/util/Map;

    return-object p0
.end method

.method public static synthetic k(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setSystemVolumeType(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 6
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableCustomVideoCapture(Z)V

    return-void
.end method

.method public static synthetic l(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->H:Ljava/util/Map;

    return-object p0
.end method

.method public static synthetic l(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioPlayoutVolume(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic l(Lcom/tencent/iliveroom/a/a;Z)V
    .locals 0

    .line 6
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->enableCustomVideoCapture(Z)V

    return-void
.end method

.method public static synthetic m(Lcom/tencent/iliveroom/a/a;)Ljava/util/Map;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->P:Ljava/util/Map;

    return-object p0
.end method

.method public static synthetic m(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopAudioEffect(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopBGM()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 5
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAllAudioEffectsVolume(I)V

    return-void
.end method

.method public static synthetic o(Lcom/tencent/iliveroom/a/a;I)I
    .locals 0

    .line 5
    iput p1, p0, Lcom/tencent/iliveroom/a/a;->I:I

    return p1
.end method

.method public static synthetic o(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->stopAllAudioEffects()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic p(Lcom/tencent/iliveroom/a/a;I)I
    .locals 0

    .line 5
    iput p1, p0, Lcom/tencent/iliveroom/a/a;->J:I

    return p1
.end method

.method public static synthetic p(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 5
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioQuality(I)V

    return-void
.end method

.method public static synthetic r(Lcom/tencent/iliveroom/a/a;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setAudioQuality(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Lcom/tencent/iliveroom/a/a;)Z
    .locals 0

    .line 5
    iget-boolean p0, p0, Lcom/tencent/iliveroom/a/a;->q:Z

    return p0
.end method

.method public static synthetic s(Lcom/tencent/iliveroom/a/a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/iliveroom/a/a;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic t(Lcom/tencent/iliveroom/a/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/a;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->K:Lcom/tencent/iliveroom/a/a/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/c/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->N:Lcom/tencent/iliveroom/a/c/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->L:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;
    .locals 0

    .line 203
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    return-object p0
.end method

.method public addDelegate(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/c/e;->a(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public checkUserState(Ljava/lang/String;JII)V
    .locals 3

    .line 1
    const-string v0, "TRTCAdapter-ext"

    .line 2
    .line 3
    invoke-super/range {p0 .. p5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->checkUserState(Ljava/lang/String;JII)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 7
    .line 8
    .line 9
    move-result-wide p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    iget-object p3, p0, Lcom/tencent/iliveroom/a/a;->a:Lcom/tencent/iliveroom/OneSecAdapterParams;

    .line 11
    .line 12
    if-nez p3, :cond_0

    .line 13
    .line 14
    const-string p0, "TRTCAdapter: check user state error. params is null."

    .line 15
    .line 16
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteAudio(I)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteAudio(I)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eq v0, v1, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 31
    .line 32
    iget-object v1, p3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteAudio(I)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    invoke-virtual {v0, v1, p1, p2, v2}, Lcom/tencent/iliveroom/a/c/e;->onRoomAudioMuted(Ljava/lang/String;JZ)V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-static {p5}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteMainVideo(I)Z

    .line 42
    .line 43
    .line 44
    move-result p5

    .line 45
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteMainVideo(I)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eq p5, v0, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 52
    .line 53
    iget-object p3, p3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomName:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p4}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->isMuteMainVideo(I)Z

    .line 56
    .line 57
    .line 58
    move-result p4

    .line 59
    invoke-virtual {p0, p3, p1, p2, p4}, Lcom/tencent/iliveroom/a/c/e;->onRoomVideoMuted(Ljava/lang/String;JZ)V

    .line 60
    .line 61
    .line 62
    :cond_2
    return-void

    .line 63
    :catch_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string p2, "TRTCAdapter: check user state error. user id error.id:"

    .line 66
    .line 67
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public clearDelegate()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/c/e;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public clearLocalMixConfig()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$33;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$33;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public clearMixTranscodingConfig()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$31;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$31;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public connectOtherRoom(Ljava/lang/String;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->e:Lcom/tencent/iliveroom/a/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/c;->a(Ljava/lang/String;J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$34;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$34;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public disconnectOtherRoom()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->e:Lcom/tencent/iliveroom/a/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/c;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public enableAudioMessage(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$27;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$27;-><init>(Lcom/tencent/iliveroom/a/a;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public enableEncSmallVideoStream(ZLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;II)I
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$13;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/tencent/iliveroom/a/a$13;-><init>(Lcom/tencent/iliveroom/a/a;ZLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public getAVStatistic()Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/b/a;->c()Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMusicCurrentPosition()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7fffffff

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->getMusicCurrentPosInMS(I)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method

.method public getMusicDuration()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/a;->O:J

    .line 2
    .line 3
    long-to-int p0, v0

    .line 4
    return p0
.end method

.method public joinRoom(Lcom/tencent/iliveroom/OneSecAdapterParams;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$1;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/iliveroom/a/a$1;-><init>(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/OneSecAdapterParams;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteAllRemoteAudio(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$16;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$16;-><init>(Lcom/tencent/iliveroom/a/a;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteAllRemoteVideo(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$8;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$8;-><init>(Lcom/tencent/iliveroom/a/a;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteLocalAudio(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$14;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$14;-><init>(Lcom/tencent/iliveroom/a/a;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteLocalVideo(Z)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$46;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$46;-><init>(Lcom/tencent/iliveroom/a/a;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteRemoteAudio(JZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$15;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/a$15;-><init>(Lcom/tencent/iliveroom/a/a;JZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public muteRemoteVideo(JZ)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$7;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/a$7;-><init>(Lcom/tencent/iliveroom/a/a;JZ)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public notifyEvent(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->notifyEvent(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->w:Lcom/tencent/iliveroom/a/b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/b;->a(Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onAVMemberEnter(JLjava/lang/String;II)V
    .locals 7

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAVMemberEnter(JLjava/lang/String;II)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 5
    .line 6
    .line 7
    move-result-object p4

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ""

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const v1, 0xac44

    .line 26
    .line 27
    .line 28
    const/4 v2, 0x2

    .line 29
    const/16 v3, 0x200

    .line 30
    .line 31
    invoke-virtual {p4, v0, v1, v2, v3}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setRemoteStreamDataCallbackFormat(Ljava/lang/String;III)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/tencent/liteav/audio/TXCAudioEngine;->getInstance()Lcom/tencent/liteav/audio/TXCAudioEngine;

    .line 35
    .line 36
    .line 37
    move-result-object p4

    .line 38
    invoke-virtual {p4, v1, v2, v3}, Lcom/tencent/liteav/audio/TXCAudioEngine;->setPlayoutDataCallbackFormat(III)V

    .line 39
    .line 40
    .line 41
    :try_start_0
    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 42
    .line 43
    .line 44
    move-result-wide v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    new-instance v0, Lcom/tencent/iliveroom/a/a$41;

    .line 46
    .line 47
    move-object v1, p0

    .line 48
    move-wide v2, p1

    .line 49
    move v6, p5

    .line 50
    invoke-direct/range {v0 .. v6}, Lcom/tencent/iliveroom/a/a$41;-><init>(Lcom/tencent/iliveroom/a/a;JJI)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    const-string p0, "TRTCAdapter-ext"

    .line 58
    .line 59
    const-string p1, "TRTCAdapter: on av member enter.  user is is valid. user id:0"

    .line 60
    .line 61
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onAVMemberExit(JLjava/lang/String;II)V
    .locals 3

    .line 1
    invoke-super/range {p0 .. p5}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAVMemberExit(JLjava/lang/String;II)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 5
    .line 6
    .line 7
    move-result-wide p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    move-wide v1, p3

    .line 9
    move-wide p4, p1

    .line 10
    move-wide p2, v1

    .line 11
    move-object p1, p0

    .line 12
    new-instance p0, Lcom/tencent/iliveroom/a/a$42;

    .line 13
    .line 14
    invoke-direct/range {p0 .. p5}, Lcom/tencent/iliveroom/a/a$42;-><init>(Lcom/tencent/iliveroom/a/a;JJ)V

    .line 15
    .line 16
    .line 17
    move-object v1, p1

    .line 18
    move-object p1, p0

    .line 19
    move-object p0, v1

    .line 20
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception v0

    .line 25
    move-object p0, v0

    .line 26
    const-string p1, "TRTCAdapter-ext"

    .line 27
    .line 28
    const-string p2, "parse userid failed."

    .line 29
    .line 30
    invoke-static {p1, p2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onCancelTranscoding(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$39;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/iliveroom/a/a$39;-><init>(Lcom/tencent/iliveroom/a/a;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p0, v0}, Lcom/tencent/iliveroom/a/a;->c(Lcom/tencent/iliveroom/a/a;Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onCapturedRawAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 2
    .line 3
    iget v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->channel:I

    .line 4
    .line 5
    iget v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->sampleRate:I

    .line 6
    .line 7
    iget-wide v3, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->timestamp:J

    .line 8
    .line 9
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    new-instance v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;

    .line 14
    .line 15
    invoke-direct {v5}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioData:[B

    .line 19
    .line 20
    iput v1, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioChannels:I

    .line 21
    .line 22
    iput v2, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioSampleRate:I

    .line 23
    .line 24
    iput-wide v3, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->timestamp:J

    .line 25
    .line 26
    invoke-virtual {p1, v5}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onRecordAudioFrame(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;)Z

    .line 27
    .line 28
    .line 29
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/a;->i:J

    .line 30
    .line 31
    const-wide/16 v6, -0x1

    .line 32
    .line 33
    cmp-long p1, v2, v6

    .line 34
    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x2

    .line 38
    if-ne v1, p1, :cond_0

    .line 39
    .line 40
    iget-object v1, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioData:[B

    .line 41
    .line 42
    iget-object v2, p0, Lcom/tencent/iliveroom/a/a;->k:Lcom/tencent/iliveroom/a/c/a;

    .line 43
    .line 44
    invoke-virtual {v2}, Lcom/tencent/iliveroom/a/c/a;->a()[B

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-static {v1, p1, v2, p1}, Lcom/tencent/iliveroom/a/c/b;->a([BI[BI)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    const/4 v2, 0x1

    .line 53
    if-ne v1, v2, :cond_1

    .line 54
    .line 55
    iget-object v1, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioData:[B

    .line 56
    .line 57
    iget-object v3, p0, Lcom/tencent/iliveroom/a/a;->k:Lcom/tencent/iliveroom/a/c/a;

    .line 58
    .line 59
    invoke-virtual {v3, p1}, Lcom/tencent/iliveroom/a/c/a;->a(I)[B

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-static {v1, v2, v3, p1}, Lcom/tencent/iliveroom/a/c/b;->a([BI[BI)V

    .line 64
    .line 65
    .line 66
    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    .line 67
    .line 68
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a;->F:J

    .line 69
    .line 70
    const-wide/16 v3, 0x0

    .line 71
    .line 72
    cmp-long p1, v1, v3

    .line 73
    .line 74
    if-gez p1, :cond_2

    .line 75
    .line 76
    new-instance p1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string v1, "onRecordPcmData -> statistic error occurred, fix it. bytes = "

    .line 79
    .line 80
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a;->F:J

    .line 84
    .line 85
    invoke-virtual {p1, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const-string v1, "TRTCAdapter-ext"

    .line 93
    .line 94
    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    iput-wide v3, p0, Lcom/tencent/iliveroom/a/a;->F:J

    .line 98
    .line 99
    :cond_2
    iget-wide v1, p0, Lcom/tencent/iliveroom/a/a;->F:J

    .line 100
    .line 101
    array-length p1, v0

    .line 102
    int-to-long v3, p1

    .line 103
    add-long/2addr v1, v3

    .line 104
    iput-wide v1, p0, Lcom/tencent/iliveroom/a/a;->F:J

    .line 105
    .line 106
    :cond_3
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->s:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 107
    .line 108
    if-eqz p1, :cond_4

    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_4

    .line 115
    .line 116
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->s:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 117
    .line 118
    const/4 v0, 0x0

    .line 119
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 120
    .line 121
    .line 122
    new-instance p1, Lcom/tencent/iliveroom/a/a$43;

    .line 123
    .line 124
    invoke-direct {p1, p0}, Lcom/tencent/iliveroom/a/a$43;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 128
    .line 129
    .line 130
    :cond_4
    return-void
.end method

.method public onComplete(II)V
    .locals 2

    .line 1
    const v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "Music onComplete: id-"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p1, " code-"

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "TRTCAdapter-ext"

    .line 29
    .line 30
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 34
    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    if-nez p2, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onMusicPlayFinish()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    const/16 p1, 0x2bc2

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onMusicPlayError(I)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public onEncVideo(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onEncVideo(Lcom/tencent/liteav/basic/structs/TXSNALPacket;)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object v0, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/iliveroom/a/b/a;->a()Lcom/tencent/iliveroom/a/b/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/b/a;->d()V

    .line 15
    .line 16
    .line 17
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/a;->D:J

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v0, v0, v2

    .line 22
    .line 23
    if-gez v0, :cond_0

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, "onEncVideo -> statistic error occurred, fix it. bytes = "

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-wide v4, p0, Lcom/tencent/iliveroom/a/a;->D:J

    .line 33
    .line 34
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const-string v1, "TRTCAdapter-ext"

    .line 42
    .line 43
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iput-wide v2, p0, Lcom/tencent/iliveroom/a/a;->D:J

    .line 47
    .line 48
    :cond_0
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/a;->D:J

    .line 49
    .line 50
    iget-object p1, p1, Lcom/tencent/liteav/basic/structs/TXSNALPacket;->nalData:[B

    .line 51
    .line 52
    array-length p1, p1

    .line 53
    int-to-long v2, p1

    .line 54
    add-long/2addr v0, v2

    .line 55
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/a;->D:J

    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public onLocalProcessedAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
    .locals 0

    return-void
.end method

.method public onMixedPlayAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioData:[B

    .line 13
    .line 14
    iget v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->channel:I

    .line 15
    .line 16
    iput v1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioChannels:I

    .line 17
    .line 18
    iget v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->sampleRate:I

    .line 19
    .line 20
    iput v1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioSampleRate:I

    .line 21
    .line 22
    iget-wide v1, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->timestamp:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->timestamp:J

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onPlaybackAudioFrame(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;)Z

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onPlayProgress(IJJ)V
    .locals 0

    .line 1
    const p2, 0x7fffffff

    .line 2
    .line 3
    .line 4
    if-ne p1, p2, :cond_0

    .line 5
    .line 6
    iput-wide p4, p0, Lcom/tencent/iliveroom/a/a;->O:J

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onRecordEncData([BJIII)V
    .locals 2

    .line 1
    invoke-super/range {p0 .. p6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onRecordEncData([BJIII)V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-wide p2, p0, Lcom/tencent/iliveroom/a/a;->E:J

    .line 7
    .line 8
    const-wide/16 p4, 0x0

    .line 9
    .line 10
    cmp-long p2, p2, p4

    .line 11
    .line 12
    if-gez p2, :cond_0

    .line 13
    .line 14
    new-instance p2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string p3, "onRecordEncData -> statistic error occurred, fix it. bytes = "

    .line 17
    .line 18
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-wide v0, p0, Lcom/tencent/iliveroom/a/a;->E:J

    .line 22
    .line 23
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    const-string p3, "TRTCAdapter-ext"

    .line 31
    .line 32
    invoke-static {p3, p2}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iput-wide p4, p0, Lcom/tencent/iliveroom/a/a;->E:J

    .line 36
    .line 37
    :cond_0
    iget-wide p2, p0, Lcom/tencent/iliveroom/a/a;->E:J

    .line 38
    .line 39
    array-length p1, p1

    .line 40
    int-to-long p4, p1

    .line 41
    add-long/2addr p2, p4

    .line 42
    iput-wide p2, p0, Lcom/tencent/iliveroom/a/a;->E:J

    .line 43
    .line 44
    :cond_1
    return-void
.end method

.method public onRemoteUserAudioFrame(Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;Ljava/lang/String;)V
    .locals 4

    .line 1
    :try_start_0
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/a;->i:J

    .line 6
    .line 7
    cmp-long p2, v0, v2

    .line 8
    .line 9
    if-nez p2, :cond_0

    .line 10
    .line 11
    iget-object p2, p0, Lcom/tencent/iliveroom/a/a;->k:Lcom/tencent/iliveroom/a/c/a;

    .line 12
    .line 13
    iget-object v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 14
    .line 15
    invoke-virtual {p2, v2}, Lcom/tencent/iliveroom/a/c/a;->a([B)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    new-instance p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;

    .line 23
    .line 24
    invoke-direct {p2}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->data:[B

    .line 28
    .line 29
    iput-object v2, p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioData:[B

    .line 30
    .line 31
    iget v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->channel:I

    .line 32
    .line 33
    iput v2, p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioChannels:I

    .line 34
    .line 35
    iget v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->sampleRate:I

    .line 36
    .line 37
    iput v2, p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->audioSampleRate:I

    .line 38
    .line 39
    iget-wide v2, p1, Lcom/tencent/trtc/TRTCCloudDef$TRTCAudioFrame;->timestamp:J

    .line 40
    .line 41
    iput-wide v2, p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;->timestamp:J

    .line 42
    .line 43
    invoke-virtual {p0, v0, v1, p2}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onPlayPcmData(JLcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAudioFrame;)Z

    .line 44
    .line 45
    .line 46
    :catch_0
    :cond_1
    return-void
.end method

.method public onRenderVideoFrame(Ljava/lang/String;ILcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;)V
    .locals 6

    .line 1
    if-nez p2, :cond_2

    .line 2
    .line 3
    iget-object p2, p0, Lcom/tencent/iliveroom/a/a;->P:Ljava/util/Map;

    .line 4
    .line 5
    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    move-object v0, p2

    .line 10
    check-cast v0, Lcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget v1, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->bufferType:I

    .line 16
    .line 17
    const/4 v2, 0x2

    .line 18
    if-ne v1, v2, :cond_0

    .line 19
    .line 20
    iget v1, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->pixelFormat:I

    .line 21
    .line 22
    if-ne v1, p2, :cond_0

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    iget-object v3, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->data:[B

    .line 33
    .line 34
    iget v4, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 35
    .line 36
    iget v5, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 37
    .line 38
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;->onPreRenderBufferFrame(J[BII)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 42
    .line 43
    .line 44
    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    iget-object p1, p0, Lcom/tencent/iliveroom/a/a;->L:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 46
    .line 47
    if-eqz p1, :cond_2

    .line 48
    .line 49
    iget-boolean p1, p1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->onlyMixAudio:Z

    .line 50
    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/a;->i:J

    .line 55
    .line 56
    cmp-long p1, v0, v2

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    iget p1, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->pixelFormat:I

    .line 61
    .line 62
    if-ne p1, p2, :cond_2

    .line 63
    .line 64
    iget p1, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->bufferType:I

    .line 65
    .line 66
    if-ne p1, p2, :cond_2

    .line 67
    .line 68
    iget-object p1, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->buffer:Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    .line 84
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 88
    .line 89
    .line 90
    new-instance p1, Lcom/tencent/iliveroom/a/a/d;

    .line 91
    .line 92
    invoke-direct {p1}, Lcom/tencent/iliveroom/a/a/d;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object p2, p1, Lcom/tencent/iliveroom/a/a/d;->a:Ljava/nio/ByteBuffer;

    .line 96
    .line 97
    iget p2, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->width:I

    .line 98
    .line 99
    iput p2, p1, Lcom/tencent/iliveroom/a/a/d;->b:I

    .line 100
    .line 101
    iget p2, p3, Lcom/tencent/trtc/TRTCCloudDef$TRTCVideoFrame;->height:I

    .line 102
    .line 103
    iput p2, p1, Lcom/tencent/iliveroom/a/a/d;->c:I

    .line 104
    .line 105
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a;->j:Lcom/tencent/iliveroom/a/a/d;

    .line 106
    .line 107
    :catch_0
    :cond_2
    :goto_0
    return-void
.end method

.method public onStart(II)V
    .locals 2

    .line 1
    const v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    if-ne p1, v0, :cond_1

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "Music onStart: id-"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p1, " code-"

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "TRTCAdapter-ext"

    .line 29
    .line 30
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/a;->O:J

    .line 36
    .line 37
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->d:Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;

    .line 38
    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    if-nez p2, :cond_0

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onMusicPlayBegin()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    const/16 p1, 0x2bc2

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;->onMusicPlayError(I)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public onVideoQosChanged(IIIIIII)V
    .locals 1

    .line 1
    invoke-super/range {p0 .. p7}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onVideoQosChanged(IIIIIII)V

    .line 2
    .line 3
    .line 4
    new-instance p6, Lcom/tencent/iliveroom/a/a$40;

    .line 5
    .line 6
    move v0, p1

    .line 7
    move-object p1, p0

    .line 8
    move-object p0, p6

    .line 9
    move p6, p3

    .line 10
    move p3, p5

    .line 11
    move p5, p2

    .line 12
    move p2, v0

    .line 13
    invoke-direct/range {p0 .. p6}, Lcom/tencent/iliveroom/a/a$40;-><init>(Lcom/tencent/iliveroom/a/a;IIIII)V

    .line 14
    .line 15
    .line 16
    move-object v0, p1

    .line 17
    move-object p1, p0

    .line 18
    move-object p0, v0

    .line 19
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public pause()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$37;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$37;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public pauseMusic()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7fffffff

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->pausePlayMusic(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public playEffectWithId(ILjava/lang/String;ZZ)V
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$21;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move v5, p3

    .line 7
    move v4, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/tencent/iliveroom/a/a$21;-><init>(Lcom/tencent/iliveroom/a/a;ILjava/lang/String;ZZ)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public playMusicWithUrl(Ljava/lang/String;ZI)V
    .locals 2

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    const-string p0, "TRTCAdapter-ext"

    .line 4
    .line 5
    const-string p1, "playMusicWithUrl: play music fail, times is zero."

    .line 6
    .line 7
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const v0, 0x7fffffff

    .line 12
    .line 13
    .line 14
    if-lez p3, :cond_1

    .line 15
    .line 16
    add-int/lit8 p3, p3, -0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    move p3, v0

    .line 20
    :goto_0
    new-instance v1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;

    .line 21
    .line 22
    invoke-direct {v1, v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;-><init>(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iput p3, v1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->loopCount:I

    .line 26
    .line 27
    xor-int/lit8 p1, p2, 0x1

    .line 28
    .line 29
    iput-boolean p1, v1, Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;->publish:Z

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0, v1}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->startPlayMusic(Lcom/tencent/liteav/audio/TXAudioEffectManager$AudioMusicParam;)Z

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public quitRoom()V
    .locals 3

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$23;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$23;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v1, 0x3e8

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThreadAndWaitDone(Ljava/lang/Runnable;J)V

    .line 9
    .line 10
    .line 11
    invoke-super {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->exitRoom()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public removeDelegate(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a;->c:Lcom/tencent/iliveroom/a/c/e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/c/e;->b(Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public resume()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$38;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$38;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public resumeMusic()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7fffffff

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->resumePlayMusic(I)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public runOnSDKThread(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public sendCustomVideoTexture(IIIIIZLjava/lang/Object;)I
    .locals 6

    .line 1
    iget-boolean p2, p0, Lcom/tencent/iliveroom/a/a;->g:Z

    .line 2
    .line 3
    const-string p5, "TRTCAdapter-ext"

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p0, "TRTCAdapter: send custom video texture ignore, block pusher is pushing."

    .line 8
    .line 9
    invoke-static {p5, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    const/16 p0, -0xbb8

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    iget-object p2, p0, Lcom/tencent/iliveroom/a/a;->o:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;

    .line 16
    .line 17
    if-eqz p2, :cond_3

    .line 18
    .line 19
    iget-object p6, p0, Lcom/tencent/iliveroom/a/a;->L:Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 20
    .line 21
    if-eqz p6, :cond_2

    .line 22
    .line 23
    iget-boolean v0, p6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->onlyMixAudio:Z

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget v0, p0, Lcom/tencent/iliveroom/a/a;->x:I

    .line 28
    .line 29
    iget v1, p6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->videoWidth:I

    .line 30
    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iget v0, p0, Lcom/tencent/iliveroom/a/a;->y:I

    .line 34
    .line 35
    iget v2, p6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->videoHeight:I

    .line 36
    .line 37
    if-eq v0, v2, :cond_3

    .line 38
    .line 39
    :cond_1
    iput v1, p0, Lcom/tencent/iliveroom/a/a;->x:I

    .line 40
    .line 41
    iget p6, p6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->videoHeight:I

    .line 42
    .line 43
    iput p6, p0, Lcom/tencent/iliveroom/a/a;->y:I

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    iget p6, p0, Lcom/tencent/iliveroom/a/a;->x:I

    .line 47
    .line 48
    if-ne p6, p3, :cond_4

    .line 49
    .line 50
    iget p6, p0, Lcom/tencent/iliveroom/a/a;->y:I

    .line 51
    .line 52
    if-eq p6, p4, :cond_3

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    move-object v0, p0

    .line 56
    goto :goto_2

    .line 57
    :cond_4
    :goto_0
    iput p3, p0, Lcom/tencent/iliveroom/a/a;->x:I

    .line 58
    .line 59
    iput p4, p0, Lcom/tencent/iliveroom/a/a;->y:I

    .line 60
    .line 61
    :goto_1
    iget v2, p0, Lcom/tencent/iliveroom/a/a;->x:I

    .line 62
    .line 63
    iget v3, p0, Lcom/tencent/iliveroom/a/a;->y:I

    .line 64
    .line 65
    iget v4, p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoFps:I

    .line 66
    .line 67
    iget v5, p2, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomConfig;->videoBitrate:I

    .line 68
    .line 69
    const/4 v1, 0x0

    .line 70
    move-object v0, p0

    .line 71
    invoke-direct/range {v0 .. v5}, Lcom/tencent/iliveroom/a/a;->a(IIIII)V

    .line 72
    .line 73
    .line 74
    :goto_2
    iget-wide v1, v0, Lcom/tencent/iliveroom/a/a;->u:J

    .line 75
    .line 76
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 81
    .line 82
    .line 83
    move-result-wide v3

    .line 84
    cmp-long p0, v1, v3

    .line 85
    .line 86
    if-nez p0, :cond_5

    .line 87
    .line 88
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->v:Ljava/lang/Object;

    .line 89
    .line 90
    if-eq p7, p0, :cond_9

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_5
    const-string p0, "sendCustomVideoTexture -> eglcontext\'s thread change!"

    .line 94
    .line 95
    invoke-static {p5, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :goto_3
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->v:Ljava/lang/Object;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    .line 103
    .line 104
    new-instance p2, Lcom/tencent/iliveroom/a/a$47;

    .line 105
    .line 106
    invoke-direct {p2, v0}, Lcom/tencent/iliveroom/a/a$47;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0, p2}, Lcom/tencent/iliveroom/a/a/b;->b(Ljava/lang/Runnable;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/a/b;->c()V

    .line 115
    .line 116
    .line 117
    :cond_6
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/a/b;->b()Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-nez p0, :cond_7

    .line 124
    .line 125
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/tencent/iliveroom/a/a/b;->a()V

    .line 128
    .line 129
    .line 130
    :cond_7
    if-eqz p7, :cond_8

    .line 131
    .line 132
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    .line 133
    .line 134
    invoke-virtual {p0, p7}, Lcom/tencent/iliveroom/a/a/b;->a(Ljava/lang/Object;)V

    .line 135
    .line 136
    .line 137
    :cond_8
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    .line 138
    .line 139
    new-instance p2, Lcom/tencent/iliveroom/a/a$48;

    .line 140
    .line 141
    invoke-direct {p2, v0}, Lcom/tencent/iliveroom/a/a$48;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, p2}, Lcom/tencent/iliveroom/a/a/b;->a(Ljava/lang/Runnable;)V

    .line 145
    .line 146
    .line 147
    const-string p0, "sendCustomVideoTexture -> thread attach egl context finish."

    .line 148
    .line 149
    invoke-static {p5, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :cond_9
    iput-object p7, v0, Lcom/tencent/iliveroom/a/a;->v:Ljava/lang/Object;

    .line 153
    .line 154
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-virtual {p0}, Ljava/lang/Thread;->getId()J

    .line 159
    .line 160
    .line 161
    move-result-wide p5

    .line 162
    iput-wide p5, v0, Lcom/tencent/iliveroom/a/a;->u:J

    .line 163
    .line 164
    if-eqz p7, :cond_a

    .line 165
    .line 166
    invoke-static {}, Landroid/opengl/GLES20;->glFinish()V

    .line 167
    .line 168
    .line 169
    iget-object p0, v0, Lcom/tencent/iliveroom/a/a;->t:Lcom/tencent/iliveroom/a/a/b;

    .line 170
    .line 171
    new-instance p2, Lcom/tencent/iliveroom/a/a$2;

    .line 172
    .line 173
    invoke-direct {p2, v0, p1, p3, p4}, Lcom/tencent/iliveroom/a/a$2;-><init>(Lcom/tencent/iliveroom/a/a;III)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {p0, p2}, Lcom/tencent/iliveroom/a/a/b;->a(Ljava/lang/Runnable;)V

    .line 177
    .line 178
    .line 179
    :cond_a
    const/16 p0, 0x3e8

    .line 180
    .line 181
    return p0
.end method

.method public sendMessageEx([B)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, p1, v0}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;[BI)Z

    .line 3
    .line 4
    .line 5
    return v0
.end method

.method public sendStreamMessage(I[BZZ)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3, p4}, Lcom/tencent/iliveroom/a/a;->a(Lcom/tencent/iliveroom/a/a;I[BZZ)Z

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public setAudioDelegate(Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$45;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$45;-><init>(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomAudioDelegateAdapter;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setAudioExpandBlockThreshold(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$35;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$35;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setAudioExpandCountPerBlock(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$36;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$36;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setAudioMode(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$18;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$18;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setAudioVolumeIndication(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$17;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$17;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setCustomVideoParam(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveSize;I)V
    .locals 0

    .line 1
    new-instance p1, Lcom/tencent/iliveroom/a/a$12;

    .line 2
    .line 3
    invoke-direct {p1, p0, p2}, Lcom/tencent/iliveroom/a/a$12;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setEffectsVolume(D)I
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$25;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/iliveroom/a/a$25;-><init>(Lcom/tencent/iliveroom/a/a;D)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setLocalMixConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$32;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$32;-><init>(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setLogPath(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setMicVolume(F)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/high16 v0, 0x42c80000    # 100.0f

    .line 6
    .line 7
    mul-float/2addr p1, v0

    .line 8
    float-to-int p1, p1

    .line 9
    invoke-interface {p0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->setVoiceCaptureVolume(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setMixTranscodingConfig(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;-><init>(Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    new-instance v1, Lcom/tencent/iliveroom/a/a$30;

    .line 11
    .line 12
    invoke-direct {v1, p0, v0, p1}, Lcom/tencent/iliveroom/a/a$30;-><init>(Lcom/tencent/iliveroom/a/a;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomTranscodingConfig;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v1}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setMusicPitch(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    int-to-float p1, p1

    .line 6
    const/high16 v0, 0x41400000    # 12.0f

    .line 7
    .line 8
    div-float/2addr p1, v0

    .line 9
    const v0, 0x7fffffff

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->setMusicPitch(IF)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public setMusicPosition(I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7fffffff

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->seekMusicToPosInMS(II)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public setMusicVolume(F)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/high16 v1, 0x42c80000    # 100.0f

    .line 6
    .line 7
    mul-float/2addr p1, v1

    .line 8
    float-to-int p1, p1

    .line 9
    const v1, 0x7fffffff

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->setMusicPlayoutVolume(II)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-interface {p0, v1, p1}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->setMusicPublishVolume(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public setPlaybackVolume(F)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$20;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$20;-><init>(Lcom/tencent/iliveroom/a/a;F)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setPriorRemoteVideoStreamType(I)I
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$10;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$10;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setRemoteVideoStreamType(Ljava/lang/String;I)I
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$11;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Lcom/tencent/iliveroom/a/a$11;-><init>(Lcom/tencent/iliveroom/a/a;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setSurfaceSize(JII)V
    .locals 0

    return-void
.end method

.method public setVideoRenderDelegate(JLcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$9;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/a$9;-><init>(Lcom/tencent/iliveroom/a/a;JLcom/tencent/iliveroom/TXILiveRoomVideoRenderDelegate;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setVolumeOfEffect(ID)I
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$26;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/a$26;-><init>(Lcom/tencent/iliveroom/a/a;ID)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public setVolumeType(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$19;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$19;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startPublishCDNStream(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "TRTCAdapter-ext"

    .line 8
    .line 9
    const-string p1, "startPublishCDNStream -> error!!! cdn url is null."

    .line 10
    .line 11
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    new-instance v0, Lcom/tencent/iliveroom/a/a$28;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$28;-><init>(Lcom/tencent/iliveroom/a/a;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public startRemoteRender(JLandroid/view/SurfaceView;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$3;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/a$3;-><init>(Lcom/tencent/iliveroom/a/a;JLandroid/view/SurfaceView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public startRemoteRender(JLandroid/view/TextureView;)V
    .locals 1

    .line 10
    new-instance v0, Lcom/tencent/iliveroom/a/a$4;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/tencent/iliveroom/a/a$4;-><init>(Lcom/tencent/iliveroom/a/a;JLandroid/view/TextureView;)V

    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public stopAllEffect()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$24;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$24;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopAllRemoteRender()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$6;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$6;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopEffectWithId(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$22;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$22;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopMusic()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getAudioEffectManager()Lcom/tencent/liteav/audio/TXAudioEffectManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7fffffff

    .line 6
    .line 7
    .line 8
    invoke-interface {p0, v0}, Lcom/tencent/liteav/audio/TXAudioEffectManager;->stopPlayMusic(I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public stopPublishCDNStream()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$29;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tencent/iliveroom/a/a$29;-><init>(Lcom/tencent/iliveroom/a/a;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stopRemoteRender(J)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$5;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/iliveroom/a/a$5;-><init>(Lcom/tencent/iliveroom/a/a;J)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public switchRole(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/a/a$44;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/tencent/iliveroom/a/a$44;-><init>(Lcom/tencent/iliveroom/a/a;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/tencent/iliveroom/a/a;->runOnSDKThread(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
