.class public Lcom/momo/piplineext/codec/MoMoRtcPushFilter;
.super Lcom/momo/pipline/codec/MediaBaseCodecFilter;
.source "SourceFile"

# interfaces
.implements Lcom/momo/momortc/IAudioFrameObserver;
.implements Ll/dpl;
.implements Ll/wyl;
.implements Ll/o410$f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;
    }
.end annotation


# static fields
.field private static final T2:[F

.field static U2:Ljava/lang/String;

.field static V2:Ljava/lang/String;

.field static W2:Ljava/lang/String;

.field static X2:Ljava/lang/String;

.field static Y2:Ljava/lang/String;

.field static Z2:Ljava/lang/String;

.field static a3:Ljava/lang/String;

.field static b3:Ljava/lang/String;

.field static c3:Ljava/lang/String;

.field static d3:Ljava/lang/String;

.field static e3:Ljava/lang/String;

.field static f3:Ljava/lang/String;

.field static g3:Ljava/lang/String;

.field static h3:Ljava/lang/String;

.field static i3:Ljava/lang/String;

.field static j3:Ljava/lang/String;

.field static k3:Ljava/lang/String;

.field static l3:Ljava/lang/String;

.field static m3:Ljava/lang/String;

.field static n3:Ljava/lang/String;

.field static o3:Ljava/lang/String;

.field static p3:Ljava/lang/String;

.field static q3:Ljava/lang/String;

.field static r3:Ljava/lang/String;

.field static s3:Ljava/lang/String;

.field static t3:Ljava/lang/String;

.field static u3:Ljava/lang/String;

.field static v3:Ljava/lang/String;


# instance fields
.field private A1:Ljava/lang/Object;

.field private A2:Ljava/lang/String;

.field private B1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

.field private B2:Ljava/lang/String;

.field private volatile C1:Z

.field private final C2:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/momo/rtcbase/SurfaceViewRenderer;",
            ">;"
        }
    .end annotation
.end field

.field private D1:Ljava/lang/String;

.field D2:Ljava/util/Timer;

.field private E0:Z

.field private E1:Ljava/lang/String;

.field private E2:Z

.field private F0:Z

.field public F1:Landroid/graphics/SurfaceTexture;

.field private F2:Landroid/os/Handler;

.field private G0:Ljava/lang/String;

.field private G1:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

.field private G2:Z

.field private H0:Ll/g510;

.field private H1:I

.field private H2:Z

.field private I0:Ll/dc1;

.field private I1:I

.field private I2:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

.field private J0:J

.field private J1:Ljava/lang/String;

.field private J2:I

.field private K0:I

.field private K1:Z

.field private K2:I

.field private L0:I

.field private L1:Z

.field private volatile L2:Z

.field private M0:J

.field private M1:Z

.field private M2:Z

.field private N0:J

.field private N1:F

.field private N2:J

.field private O0:J

.field private O1:F

.field private O2:Z

.field private P0:Lcom/momo/momortc/live/MMRtcStats;

.field private P1:F

.field private P2:I

.field private Q0:Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

.field private Q1:F

.field private volatile Q2:Z

.field private R0:Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

.field R1:Lcom/momo/momortc/IMMRtcEngineEventInterface;

.field private R2:Z

.field private final S:Ljava/lang/String;

.field private S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Ll/iny;",
            ">;"
        }
    .end annotation
.end field

.field S1:Ljava/lang/Runnable;

.field private final S2:Landroid/content/BroadcastReceiver;

.field private T:Z

.field private T0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Ll/xhy;",
            ">;"
        }
    .end annotation
.end field

.field private T1:[Lcom/momo/momortc/AudioVolumeInfo;

.field private U:Lcom/momo/momortc/MMRtcEngine;

.field private U0:Z

.field private U1:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

.field private V:I

.field private V0:Z

.field private V1:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

.field private W:Landroid/opengl/EGLContext;

.field private W0:I

.field private W1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

.field private volatile X:Z

.field private X0:I

.field private X1:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

.field private Y:Z

.field private volatile Y0:I

.field private Y1:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

.field private Z:Z

.field private Z0:Ljava/lang/String;

.field private Z1:Ll/wpw;

.field private a1:Ll/ebl0;

.field private a2:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

.field private b1:Ll/fbl0;

.field private b2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

.field private c1:Ll/gkl0;

.field private c2:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

.field private d1:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

.field private d2:Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

.field private e1:Ll/dpl$a;

.field private e2:Ll/xpw;

.field private f1:Z

.field private f2:Ll/xpw;

.field private g1:Z

.field private g2:Ll/imw;

.field private h1:Ll/q210$a;

.field private h2:Ll/tpw;

.field private i1:F

.field private i2:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;

.field private j1:F

.field private j2:Z

.field private k0:I

.field public k1:I

.field private k2:Z

.field private l1:I

.field private l2:Z

.field private m1:I

.field private m2:Z

.field private n1:I

.field private n2:Lcom/momo/momortc/live/MMLiveTranscoding;

.field private o1:I

.field private o2:Z

.field private p0:I

.field private p1:Ll/ror;

.field private p2:Ljava/lang/String;

.field protected q1:I

.field private q2:I

.field private r1:Z

.field private r2:Ljava/lang/String;

.field private s1:Ljava/lang/String;

.field private s2:I

.field private t1:I

.field private t2:J

.field private u1:Ljava/lang/Object;

.field private u2:Lcom/immomo/mediabase/AudioResampleUtils;

.field private v1:I

.field private v2:Lcom/immomo/mediabase/AudioResampleUtils;

.field private w1:Lcom/momo/rtcbase/EglBase;

.field w2:Ljava/nio/ByteBuffer;

.field private x1:Z

.field x2:Ljava/nio/ByteBuffer;

.field private y1:Z

.field private y2:Ll/kod0;

.field private z1:Z

.field private z2:Ll/brx;


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
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T2:[F

    .line 9
    .line 10
    const-string v0, "v3.momoRtcMsgLogin"

    .line 11
    .line 12
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U2:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "v3.momoRtcMsgOnLogin"

    .line 15
    .line 16
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V2:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "v3.momoRtcMsgHeart"

    .line 19
    .line 20
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W2:Ljava/lang/String;

    .line 21
    .line 22
    const-string v0, "v3.momoRtcMsgJoin"

    .line 23
    .line 24
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X2:Ljava/lang/String;

    .line 25
    .line 26
    const-string v0, "v3.momoRtcMsgOnJoin"

    .line 27
    .line 28
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y2:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "v3.momoRtcMsgLeave"

    .line 31
    .line 32
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z2:Ljava/lang/String;

    .line 33
    .line 34
    const-string v0, "v3.momoRtcMsgOnLeave"

    .line 35
    .line 36
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a3:Ljava/lang/String;

    .line 37
    .line 38
    const-string v0, "v3.momoRtcMsgPeerJoin"

    .line 39
    .line 40
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b3:Ljava/lang/String;

    .line 41
    .line 42
    const-string v0, "v3.momoRtcMsgPeerLeave"

    .line 43
    .line 44
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c3:Ljava/lang/String;

    .line 45
    .line 46
    const-string v0, "v3.momoRtcMsgAddUrl"

    .line 47
    .line 48
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3:Ljava/lang/String;

    .line 49
    .line 50
    const-string v0, "v3.momoRtcMsgRemoveUrl"

    .line 51
    .line 52
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e3:Ljava/lang/String;

    .line 53
    .line 54
    const-string v0, "v3.momoRtcMsgTranscoding"

    .line 55
    .line 56
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3:Ljava/lang/String;

    .line 57
    .line 58
    const-string v0, "v3.momoRtcMsgLocalAudioMute"

    .line 59
    .line 60
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g3:Ljava/lang/String;

    .line 61
    .line 62
    const-string v0, "v3.momoRtcMsgRemoteAudioMute"

    .line 63
    .line 64
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h3:Ljava/lang/String;

    .line 65
    .line 66
    const-string v0, "v3.momoRtcMsgLocalVideoMute"

    .line 67
    .line 68
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3:Ljava/lang/String;

    .line 69
    .line 70
    const-string v0, "v3.momoRtcMsgRemoteVideoMute"

    .line 71
    .line 72
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j3:Ljava/lang/String;

    .line 73
    .line 74
    const-string v0, "v3.momoRtcMsgReJoin"

    .line 75
    .line 76
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3:Ljava/lang/String;

    .line 77
    .line 78
    const-string v0, "v3.momoRtcMsgOnReJoin"

    .line 79
    .line 80
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l3:Ljava/lang/String;

    .line 81
    .line 82
    const-string v0, "v3.momoRtcMsgStartPK"

    .line 83
    .line 84
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m3:Ljava/lang/String;

    .line 85
    .line 86
    const-string v0, "v3.momoRtcMsgOnStartPK"

    .line 87
    .line 88
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n3:Ljava/lang/String;

    .line 89
    .line 90
    const-string v0, "v3.momoRtcMsgStopPK"

    .line 91
    .line 92
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o3:Ljava/lang/String;

    .line 93
    .line 94
    const-string v0, "v3.momoRtcMsgOnStopPK"

    .line 95
    .line 96
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3:Ljava/lang/String;

    .line 97
    .line 98
    const-string v0, "v3.momoRtcMsgPeerLost"

    .line 99
    .line 100
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q3:Ljava/lang/String;

    .line 101
    .line 102
    const-string v0, "v3.momoRtcMsgKeyExpired"

    .line 103
    .line 104
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r3:Ljava/lang/String;

    .line 105
    .line 106
    const-string v0, "v3.momoRtcMsgKeyUpdate"

    .line 107
    .line 108
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s3:Ljava/lang/String;

    .line 109
    .line 110
    const-string v0, "v3.momoRtcMsgChangeRole"

    .line 111
    .line 112
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t3:Ljava/lang/String;

    .line 113
    .line 114
    const-string v0, "v3.momoRtcMsgOnChangeRole"

    .line 115
    .line 116
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u3:Ljava/lang/String;

    .line 117
    .line 118
    const-string v0, "v3.momoRtcMsgOnKicked"

    .line 119
    .line 120
    sput-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v3:Ljava/lang/String;

    .line 121
    .line 122
    return-void

    .line 123
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

.method public constructor <init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;)V
    .locals 8
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "MoMoRtcPushFilter"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T:Z

    .line 10
    .line 11
    const/4 v2, -0x1

    .line 12
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V:I

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 16
    .line 17
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y:Z

    .line 18
    .line 19
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z:Z

    .line 20
    .line 21
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k0:I

    .line 22
    .line 23
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p0:I

    .line 24
    .line 25
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E0:Z

    .line 26
    .line 27
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F0:Z

    .line 28
    .line 29
    const/4 v4, 0x0

    .line 30
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G0:Ljava/lang/String;

    .line 31
    .line 32
    const-wide/16 v5, 0x0

    .line 33
    .line 34
    iput-wide v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J0:J

    .line 35
    .line 36
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K0:I

    .line 37
    .line 38
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L0:I

    .line 39
    .line 40
    iput-wide v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M0:J

    .line 41
    .line 42
    iput-wide v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N0:J

    .line 43
    .line 44
    iput-wide v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O0:J

    .line 45
    .line 46
    new-instance v7, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 47
    .line 48
    invoke-direct {v7}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 52
    .line 53
    new-instance v7, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 54
    .line 55
    invoke-direct {v7}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iput-object v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 59
    .line 60
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U0:Z

    .line 61
    .line 62
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V0:Z

    .line 63
    .line 64
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W0:I

    .line 65
    .line 66
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X0:I

    .line 67
    .line 68
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y0:I

    .line 69
    .line 70
    const-string v7, "1e6127d73cd4d405905aa6f2ad5e1a67"

    .line 71
    .line 72
    iput-object v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z0:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a1:Ll/ebl0;

    .line 75
    .line 76
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b1:Ll/fbl0;

    .line 77
    .line 78
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c1:Ll/gkl0;

    .line 79
    .line 80
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d1:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 81
    .line 82
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 83
    .line 84
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 85
    .line 86
    const v7, 0x3fe66666    # 1.8f

    .line 87
    .line 88
    .line 89
    iput v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i1:F

    .line 90
    .line 91
    const/high16 v7, 0x3f800000    # 1.0f

    .line 92
    .line 93
    iput v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j1:F

    .line 94
    .line 95
    const v7, 0xac44

    .line 96
    .line 97
    .line 98
    iput v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 99
    .line 100
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l1:I

    .line 101
    .line 102
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m1:I

    .line 103
    .line 104
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n1:I

    .line 105
    .line 106
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o1:I

    .line 107
    .line 108
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q1:I

    .line 109
    .line 110
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s1:Ljava/lang/String;

    .line 111
    .line 112
    iput v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 113
    .line 114
    new-instance v2, Ljava/lang/Object;

    .line 115
    .line 116
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 117
    .line 118
    .line 119
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 120
    .line 121
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v1:I

    .line 122
    .line 123
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 124
    .line 125
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 126
    .line 127
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z1:Z

    .line 128
    .line 129
    new-instance v2, Ljava/lang/Object;

    .line 130
    .line 131
    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 132
    .line 133
    .line 134
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A1:Ljava/lang/Object;

    .line 135
    .line 136
    new-instance v2, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 137
    .line 138
    invoke-direct {v2}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    .line 139
    .line 140
    .line 141
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 142
    .line 143
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C1:Z

    .line 144
    .line 145
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F1:Landroid/graphics/SurfaceTexture;

    .line 146
    .line 147
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H1:I

    .line 148
    .line 149
    const v2, 0xb71b0

    .line 150
    .line 151
    .line 152
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I1:I

    .line 153
    .line 154
    const-string v2, ""

    .line 155
    .line 156
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J1:Ljava/lang/String;

    .line 157
    .line 158
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K1:Z

    .line 159
    .line 160
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L1:Z

    .line 161
    .line 162
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M1:Z

    .line 163
    .line 164
    const/4 v7, 0x0

    .line 165
    iput v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N1:F

    .line 166
    .line 167
    iput v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O1:F

    .line 168
    .line 169
    iput v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P1:F

    .line 170
    .line 171
    iput v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q1:F

    .line 172
    .line 173
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S1:Ljava/lang/Runnable;

    .line 174
    .line 175
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T1:[Lcom/momo/momortc/AudioVolumeInfo;

    .line 176
    .line 177
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 178
    .line 179
    new-instance v7, Ll/xpw;

    .line 180
    .line 181
    invoke-direct {v7}, Ll/xpw;-><init>()V

    .line 182
    .line 183
    .line 184
    iput-object v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e2:Ll/xpw;

    .line 185
    .line 186
    new-instance v7, Ll/xpw;

    .line 187
    .line 188
    invoke-direct {v7}, Ll/xpw;-><init>()V

    .line 189
    .line 190
    .line 191
    iput-object v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f2:Ll/xpw;

    .line 192
    .line 193
    new-instance v7, Ll/imw;

    .line 194
    .line 195
    invoke-direct {v7}, Ll/imw;-><init>()V

    .line 196
    .line 197
    .line 198
    iput-object v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g2:Ll/imw;

    .line 199
    .line 200
    new-instance v7, Ll/tpw;

    .line 201
    .line 202
    invoke-direct {v7}, Ll/tpw;-><init>()V

    .line 203
    .line 204
    .line 205
    iput-object v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h2:Ll/tpw;

    .line 206
    .line 207
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j2:Z

    .line 208
    .line 209
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k2:Z

    .line 210
    .line 211
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l2:Z

    .line 212
    .line 213
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m2:Z

    .line 214
    .line 215
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 216
    .line 217
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o2:Z

    .line 218
    .line 219
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r2:Ljava/lang/String;

    .line 220
    .line 221
    const/16 v2, 0xf

    .line 222
    .line 223
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 224
    .line 225
    iput-wide v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t2:J

    .line 226
    .line 227
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 228
    .line 229
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 230
    .line 231
    const/16 v2, 0x2000

    .line 232
    .line 233
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 234
    .line 235
    .line 236
    move-result-object v7

    .line 237
    iput-object v7, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 238
    .line 239
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 244
    .line 245
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A2:Ljava/lang/String;

    .line 246
    .line 247
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B2:Ljava/lang/String;

    .line 248
    .line 249
    new-instance v2, Landroid/util/ArrayMap;

    .line 250
    .line 251
    invoke-direct {v2}, Landroid/util/ArrayMap;-><init>()V

    .line 252
    .line 253
    .line 254
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C2:Ljava/util/Map;

    .line 255
    .line 256
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D2:Ljava/util/Timer;

    .line 257
    .line 258
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E2:Z

    .line 259
    .line 260
    new-instance v2, Landroid/os/Handler;

    .line 261
    .line 262
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    invoke-direct {v2, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 267
    .line 268
    .line 269
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F2:Landroid/os/Handler;

    .line 270
    .line 271
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 272
    .line 273
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H2:Z

    .line 274
    .line 275
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2:I

    .line 276
    .line 277
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K2:I

    .line 278
    .line 279
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L2:Z

    .line 280
    .line 281
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2:Z

    .line 282
    .line 283
    iput-wide v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N2:J

    .line 284
    .line 285
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O2:Z

    .line 286
    .line 287
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2:I

    .line 288
    .line 289
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 290
    .line 291
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2:Z

    .line 292
    .line 293
    new-instance v2, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;

    .line 294
    .line 295
    invoke-direct {v2, p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    .line 296
    .line 297
    .line 298
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S2:Landroid/content/BroadcastReceiver;

    .line 299
    .line 300
    invoke-static {p1}, Lcom/momo/rtcbase/ContextUtils;->initialize(Landroid/content/Context;)V

    .line 301
    .line 302
    .line 303
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H0:Ll/g510;

    .line 304
    .line 305
    move-object p2, p4

    .line 306
    check-cast p2, Ll/ror;

    .line 307
    .line 308
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 309
    .line 310
    iput-boolean v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U0:Z

    .line 311
    .line 312
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V0:Z

    .line 313
    .line 314
    iput-object p3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 315
    .line 316
    invoke-direct {p0, p4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m5(Ll/uow;)Lcom/momo/momortc/MMRtcEngine;

    .line 317
    .line 318
    .line 319
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 320
    .line 321
    const-wide/16 p3, 0x104

    .line 322
    .line 323
    iput-wide p3, p2, Ll/wvx;->d:J

    .line 324
    .line 325
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 326
    .line 327
    .line 328
    move-result p3

    .line 329
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p3

    .line 333
    iput-object p3, p2, Ll/wvx;->e1:Ljava/lang/String;

    .line 334
    .line 335
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 336
    .line 337
    const-wide/16 p3, 0x1

    .line 338
    .line 339
    iput-wide p3, p2, Ll/wvx;->f1:J

    .line 340
    .line 341
    new-instance p2, Landroid/content/IntentFilter;

    .line 342
    .line 343
    invoke-direct {p2}, Landroid/content/IntentFilter;-><init>()V

    .line 344
    .line 345
    .line 346
    const-string p3, "android.intent.action.HEADSET_PLUG"

    .line 347
    .line 348
    invoke-virtual {p2, p3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    if-eqz p1, :cond_0

    .line 352
    .line 353
    invoke-static {p1, v2, p2}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 354
    .line 355
    .line 356
    :cond_0
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 357
    .line 358
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 359
    .line 360
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    invoke-virtual {p1, p0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 365
    .line 366
    .line 367
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/g510;Ll/q210$a;Ll/uow;Ljava/lang/String;)V
    .locals 7

    .line 368
    invoke-direct {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;-><init>(Landroid/content/Context;)V

    .line 369
    const-string v0, "MoMoRtcPushFilter"

    iput-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S:Ljava/lang/String;

    const/4 v0, 0x1

    .line 370
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T:Z

    const/4 v1, -0x1

    .line 371
    iput v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V:I

    const/4 v2, 0x0

    .line 372
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 373
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y:Z

    .line 374
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z:Z

    .line 375
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k0:I

    .line 376
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p0:I

    .line 377
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E0:Z

    .line 378
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F0:Z

    const/4 v3, 0x0

    .line 379
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G0:Ljava/lang/String;

    const-wide/16 v4, 0x0

    .line 380
    iput-wide v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J0:J

    .line 381
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K0:I

    .line 382
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L0:I

    .line 383
    iput-wide v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M0:J

    .line 384
    iput-wide v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N0:J

    .line 385
    iput-wide v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O0:J

    .line 386
    new-instance v6, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v6}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 387
    new-instance v6, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v6}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 388
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U0:Z

    .line 389
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V0:Z

    .line 390
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W0:I

    .line 391
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X0:I

    .line 392
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y0:I

    .line 393
    const-string v6, "1e6127d73cd4d405905aa6f2ad5e1a67"

    iput-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z0:Ljava/lang/String;

    .line 394
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a1:Ll/ebl0;

    .line 395
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b1:Ll/fbl0;

    .line 396
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c1:Ll/gkl0;

    .line 397
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d1:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 398
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 399
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    const v6, 0x3fe66666    # 1.8f

    .line 400
    iput v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i1:F

    const/high16 v6, 0x3f800000    # 1.0f

    .line 401
    iput v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j1:F

    const v6, 0xac44

    .line 402
    iput v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 403
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l1:I

    .line 404
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m1:I

    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n1:I

    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o1:I

    .line 405
    iput v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q1:I

    .line 406
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s1:Ljava/lang/String;

    .line 407
    iput v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 408
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 409
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v1:I

    .line 410
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 411
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 412
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z1:Z

    .line 413
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A1:Ljava/lang/Object;

    .line 414
    new-instance v1, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    invoke-direct {v1}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;-><init>()V

    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 415
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C1:Z

    .line 416
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F1:Landroid/graphics/SurfaceTexture;

    .line 417
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H1:I

    const v1, 0xb71b0

    .line 418
    iput v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I1:I

    .line 419
    const-string v1, ""

    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J1:Ljava/lang/String;

    .line 420
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K1:Z

    .line 421
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L1:Z

    .line 422
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M1:Z

    const/4 v6, 0x0

    .line 423
    iput v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N1:F

    .line 424
    iput v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O1:F

    .line 425
    iput v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P1:F

    .line 426
    iput v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q1:F

    .line 427
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S1:Ljava/lang/Runnable;

    .line 428
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T1:[Lcom/momo/momortc/AudioVolumeInfo;

    .line 429
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 430
    new-instance v6, Ll/xpw;

    invoke-direct {v6}, Ll/xpw;-><init>()V

    iput-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e2:Ll/xpw;

    .line 431
    new-instance v6, Ll/xpw;

    invoke-direct {v6}, Ll/xpw;-><init>()V

    iput-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f2:Ll/xpw;

    .line 432
    new-instance v6, Ll/imw;

    invoke-direct {v6}, Ll/imw;-><init>()V

    iput-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g2:Ll/imw;

    .line 433
    new-instance v6, Ll/tpw;

    invoke-direct {v6}, Ll/tpw;-><init>()V

    iput-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h2:Ll/tpw;

    .line 434
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j2:Z

    .line 435
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k2:Z

    .line 436
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l2:Z

    .line 437
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m2:Z

    .line 438
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 439
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o2:Z

    .line 440
    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r2:Ljava/lang/String;

    const/16 v1, 0xf

    .line 441
    iput v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 442
    iput-wide v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t2:J

    .line 443
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 444
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    const/16 v1, 0x2000

    .line 445
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v6

    iput-object v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 446
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 447
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A2:Ljava/lang/String;

    .line 448
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B2:Ljava/lang/String;

    .line 449
    new-instance v1, Landroid/util/ArrayMap;

    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C2:Ljava/util/Map;

    .line 450
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D2:Ljava/util/Timer;

    .line 451
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E2:Z

    .line 452
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F2:Landroid/os/Handler;

    .line 453
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 454
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H2:Z

    .line 455
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2:I

    .line 456
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K2:I

    .line 457
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L2:Z

    .line 458
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2:Z

    .line 459
    iput-wide v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N2:J

    .line 460
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O2:Z

    .line 461
    iput v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2:I

    .line 462
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 463
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2:Z

    .line 464
    new-instance v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;

    invoke-direct {v1, p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$6;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S2:Landroid/content/BroadcastReceiver;

    .line 465
    iput-object p5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z0:Ljava/lang/String;

    .line 466
    invoke-static {p1}, Lcom/momo/rtcbase/ContextUtils;->initialize(Landroid/content/Context;)V

    .line 467
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H0:Ll/g510;

    .line 468
    move-object p2, p4

    check-cast p2, Ll/ror;

    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 469
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U0:Z

    .line 470
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V0:Z

    .line 471
    iput-object p3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 472
    invoke-direct {p0, p4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m5(Ll/uow;)Lcom/momo/momortc/MMRtcEngine;

    .line 473
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    const-wide/16 p3, 0x104

    iput-wide p3, p2, Ll/wvx;->d:J

    .line 474
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p3

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p2, Ll/wvx;->e1:Ljava/lang/String;

    .line 475
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    const-wide/16 p2, 0x1

    iput-wide p2, p0, Ll/wvx;->f1:J

    .line 476
    new-instance p0, Landroid/content/IntentFilter;

    invoke-direct {p0}, Landroid/content/IntentFilter;-><init>()V

    .line 477
    const-string p2, "android.intent.action.HEADSET_PLUG"

    invoke-virtual {p0, p2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 478
    invoke-static {p1, v1, p0}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method public static synthetic A2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic A3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic A4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->b2()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic B3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q0:Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic B4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H1:I

    .line 2
    .line 3
    return p0
.end method

.method private B5()I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v2, v1

    .line 13
    :cond_1
    :goto_0
    xor-int/lit8 p0, v2, 0x1

    .line 14
    .line 15
    return p0
.end method

.method public static synthetic C2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic C3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;)Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q0:Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic C4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N5()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final C5(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 4
    .line 5
    if-eqz v1, :cond_c

    .line 6
    .line 7
    iget-object v1, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 8
    .line 9
    iget v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k0:I

    .line 10
    .line 11
    invoke-direct {v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o5(I)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    int-to-long v2, v2

    .line 16
    iput-wide v2, v1, Ll/wvx;->C0:J

    .line 17
    .line 18
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Ll/csx;->u0()I

    .line 23
    .line 24
    .line 25
    move-result v7

    .line 26
    const/4 v1, 0x0

    .line 27
    const/4 v2, 0x4

    .line 28
    const/4 v8, 0x1

    .line 29
    if-eqz v7, :cond_4

    .line 30
    .line 31
    const/4 v3, 0x3

    .line 32
    if-eq v7, v8, :cond_3

    .line 33
    .line 34
    const/4 v4, 0x2

    .line 35
    const/4 v5, 0x5

    .line 36
    if-eq v7, v4, :cond_2

    .line 37
    .line 38
    if-eq v7, v3, :cond_1

    .line 39
    .line 40
    iget-object v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 41
    .line 42
    if-eq v7, v2, :cond_0

    .line 43
    .line 44
    invoke-virtual {v4, v1, v2}, Lcom/momo/momortc/MMRtcEngine;->setAudioProfile(II)I

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {v4, v8}, Lcom/momo/momortc/MMRtcEngine;->setSteroAudioCapture(Z)V

    .line 49
    .line 50
    .line 51
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 52
    .line 53
    invoke-virtual {v2, v5, v3}, Lcom/momo/momortc/MMRtcEngine;->setAudioProfile(II)I

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 58
    .line 59
    invoke-virtual {v2, v5, v3}, Lcom/momo/momortc/MMRtcEngine;->setAudioProfile(II)I

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 64
    .line 65
    invoke-virtual {v2, v5, v3}, Lcom/momo/momortc/MMRtcEngine;->setAudioProfile(II)I

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    iget-object v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 70
    .line 71
    invoke-virtual {v4, v2, v3}, Lcom/momo/momortc/MMRtcEngine;->setAudioProfile(II)I

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 76
    .line 77
    invoke-virtual {v3, v1, v2}, Lcom/momo/momortc/MMRtcEngine;->setAudioProfile(II)I

    .line 78
    .line 79
    .line 80
    :goto_0
    iget-boolean v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L1:Z

    .line 81
    .line 82
    if-nez v2, :cond_5

    .line 83
    .line 84
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Ll/csx;->v0()Z

    .line 89
    .line 90
    .line 91
    :cond_5
    iget-boolean v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F0:Z

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l5(Z)V

    .line 94
    .line 95
    .line 96
    iput-boolean v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 97
    .line 98
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 99
    .line 100
    const/4 v2, 0x0

    .line 101
    invoke-virtual {v1, v2}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 102
    .line 103
    .line 104
    iget-boolean v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 105
    .line 106
    if-nez v1, :cond_6

    .line 107
    .line 108
    iget-boolean v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j2:Z

    .line 109
    .line 110
    if-nez v1, :cond_6

    .line 111
    .line 112
    iget-boolean v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k2:Z

    .line 113
    .line 114
    if-nez v1, :cond_6

    .line 115
    .line 116
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e1:Ll/dpl$a;

    .line 117
    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    :cond_6
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 121
    .line 122
    invoke-virtual {v1, v0}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 123
    .line 124
    .line 125
    iput-boolean v8, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 126
    .line 127
    :cond_7
    iget-boolean v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r1:Z

    .line 128
    .line 129
    if-eqz v1, :cond_8

    .line 130
    .line 131
    const-string v1, "1"

    .line 132
    .line 133
    invoke-direct {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D5(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_8
    invoke-direct {v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J6()V

    .line 137
    .line 138
    .line 139
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 140
    .line 141
    if-eqz v1, :cond_9

    .line 142
    .line 143
    iget-boolean v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l2:Z

    .line 144
    .line 145
    if-eqz v2, :cond_9

    .line 146
    .line 147
    invoke-virtual {v1, v8}, Lcom/momo/momortc/MMRtcEngine;->setDefaultAudioRoutetoSpeakerphone(Z)I

    .line 148
    .line 149
    .line 150
    :cond_9
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 151
    .line 152
    iget v2, v1, Ll/tow;->k:I

    .line 153
    .line 154
    if-lez v2, :cond_a

    .line 155
    .line 156
    iget-boolean v3, v1, Ll/ror;->h1:Z

    .line 157
    .line 158
    move v4, v3

    .line 159
    iget v3, v1, Ll/tow;->l:I

    .line 160
    .line 161
    move v5, v4

    .line 162
    iget v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I1:I

    .line 163
    .line 164
    move v6, v5

    .line 165
    const/16 v5, 0xf

    .line 166
    .line 167
    move v9, v6

    .line 168
    iget-object v6, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 169
    .line 170
    move v1, v9

    .line 171
    invoke-direct/range {v0 .. v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d5(ZIIIILjava/lang/String;)V

    .line 172
    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_a
    iget-boolean v2, v1, Ll/ror;->h1:Z

    .line 176
    .line 177
    move v3, v2

    .line 178
    iget v2, v1, Ll/tow;->s:I

    .line 179
    .line 180
    move v4, v3

    .line 181
    iget v3, v1, Ll/tow;->t:I

    .line 182
    .line 183
    move v5, v4

    .line 184
    iget v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I1:I

    .line 185
    .line 186
    move v6, v5

    .line 187
    const/16 v5, 0xf

    .line 188
    .line 189
    iget-object v1, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 190
    .line 191
    move/from16 v20, v6

    .line 192
    .line 193
    move-object v6, v1

    .line 194
    move/from16 v1, v20

    .line 195
    .line 196
    invoke-direct/range {v0 .. v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d5(ZIIIILjava/lang/String;)V

    .line 197
    .line 198
    .line 199
    :goto_1
    const-string v1, "zhangjialiang joinChannel############# begin"

    .line 200
    .line 201
    const-string v2, "MoMoRtcPushFilter"

    .line 202
    .line 203
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 207
    .line 208
    iget-boolean v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M1:Z

    .line 209
    .line 210
    invoke-virtual {v1, v3}, Lcom/momo/momortc/MMRtcEngine;->enableMiddleGroundSignal(Z)V

    .line 211
    .line 212
    .line 213
    iget-object v9, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 214
    .line 215
    iget-object v10, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s1:Ljava/lang/String;

    .line 216
    .line 217
    move/from16 v1, p2

    .line 218
    .line 219
    int-to-long v13, v1

    .line 220
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A2:Ljava/lang/String;

    .line 221
    .line 222
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B2:Ljava/lang/String;

    .line 223
    .line 224
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    if-eqz v3, :cond_b

    .line 229
    .line 230
    const-wide/16 v3, 0x0

    .line 231
    .line 232
    :goto_2
    move-wide/from16 v18, v3

    .line 233
    .line 234
    goto :goto_3

    .line 235
    :cond_b
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B2:Ljava/lang/String;

    .line 236
    .line 237
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 238
    .line 239
    .line 240
    move-result-wide v3

    .line 241
    goto :goto_2

    .line 242
    :goto_3
    const/4 v12, 0x0

    .line 243
    move-object/from16 v11, p1

    .line 244
    .line 245
    move-object/from16 v15, p3

    .line 246
    .line 247
    move-object/from16 v16, p4

    .line 248
    .line 249
    move-object/from16 v17, v1

    .line 250
    .line 251
    invoke-virtual/range {v9 .. v19}, Lcom/momo/momortc/MMRtcEngine;->joinChannel(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;J)I

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    new-instance v3, Ljava/lang/StringBuilder;

    .line 256
    .line 257
    const-string v4, "joinChannel#############"

    .line 258
    .line 259
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-static {v2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    .line 271
    .line 272
    iput-boolean v8, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r1:Z

    .line 273
    .line 274
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 275
    .line 276
    invoke-virtual {v1, v7}, Lcom/momo/momortc/MMRtcEngine;->setAudioLevel(I)I

    .line 277
    .line 278
    .line 279
    const/high16 v1, 0x3f800000    # 1.0f

    .line 280
    .line 281
    invoke-virtual {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y6(F)V

    .line 282
    .line 283
    .line 284
    :cond_c
    return-void
.end method

.method public static synthetic D2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic D3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wpw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z1:Ll/wpw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic D4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o2:Z

    .line 2
    .line 3
    return p0
.end method

.method private final D5(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MoMoRtcPushFilter"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "leaveChannel >>>>>"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {v0, v1, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 25
    .line 26
    monitor-enter p1

    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 33
    .line 34
    iget-object v0, v0, Ll/uow;->v0:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 47
    .line 48
    iget-object v2, v2, Ll/uow;->v0:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Lcom/momo/momortc/MMRtcEngine;->removePublishStreamUrl(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_1

    .line 56
    :cond_0
    :goto_0
    const-string v0, "unint"

    .line 57
    .line 58
    const-string v2, "leaveChannel behin 2431"

    .line 59
    .line 60
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/momo/momortc/MMRtcEngine;->leaveChannel()I

    .line 66
    .line 67
    .line 68
    const-string v0, "unint"

    .line 69
    .line 70
    const-string v2, "leaveChannel end 2433"

    .line 71
    .line 72
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 76
    .line 77
    const/4 v2, 0x0

    .line 78
    invoke-virtual {v0, v2}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 79
    .line 80
    .line 81
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 82
    .line 83
    :cond_1
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r1:Z

    .line 84
    .line 85
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 87
    .line 88
    iget p0, p0, Ll/ror;->e1:I

    .line 89
    .line 90
    return-void

    .line 91
    :goto_1
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    throw p0
.end method

.method public static synthetic E2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic E3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic E4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o2:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic F2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/tpw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h2:Ll/tpw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic F4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q2:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic G2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R0:Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic G4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p2:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic H3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;)Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R0:Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic H4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I1:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic I2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z6(ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic I3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic I4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;ZIIIILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d5(ZIIIILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private I6(Ljava/lang/Object;II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    check-cast p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C2()Ll/gb1;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-interface {p0, p1, p2, p3}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic J2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/kod0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y2:Ll/kod0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic J3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V0:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic J4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f6()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private J6()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "setVideoProfileEx1 bitrate:"

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 18
    .line 19
    iget v2, v2, Ll/tow;->m:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, "<>"

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 30
    .line 31
    iget v3, v3, Ll/tow;->n:I

    .line 32
    .line 33
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 40
    .line 41
    iget v2, v2, Ll/tow;->H:I

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, "<mergecanvasWidth>"

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 52
    .line 53
    iget v2, v2, Ll/tow;->k:I

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v2, "MoMoRtcPushFilter"

    .line 63
    .line 64
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F0:Z

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l5(Z)V

    .line 70
    .line 71
    .line 72
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 73
    .line 74
    if-nez v0, :cond_2

    .line 75
    .line 76
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 77
    .line 78
    const-string v1, "{\"che.video.keyFrameInterval\":1}"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 84
    .line 85
    iget-boolean v1, v0, Ll/uow;->F0:Z

    .line 86
    .line 87
    if-eqz v1, :cond_1

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/uow;->d()I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    const/4 v1, 0x1

    .line 94
    if-ne v0, v1, :cond_1

    .line 95
    .line 96
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 99
    .line 100
    iget v2, v1, Ll/tow;->n:I

    .line 101
    .line 102
    iget v3, v1, Ll/tow;->m:I

    .line 103
    .line 104
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 105
    .line 106
    iget v1, v1, Ll/tow;->H:I

    .line 107
    .line 108
    invoke-virtual {v0, v2, v3, p0, v1}, Lcom/momo/momortc/MMRtcEngine;->setVideoProfile(IIII)I

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 115
    .line 116
    iget v2, v1, Ll/tow;->m:I

    .line 117
    .line 118
    iget v3, v1, Ll/tow;->n:I

    .line 119
    .line 120
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 121
    .line 122
    iget v1, v1, Ll/tow;->H:I

    .line 123
    .line 124
    invoke-virtual {v0, v2, v3, p0, v1}, Lcom/momo/momortc/MMRtcEngine;->setVideoProfile(IIII)I

    .line 125
    .line 126
    .line 127
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic K2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/nnw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method public static synthetic K3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W0:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W0:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic L2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic L3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/imw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g2:Ll/imw;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/rtcbase/EglBase;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w1:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic N2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/rtcbase/EglBase;)Lcom/momo/rtcbase/EglBase;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w1:Lcom/momo/rtcbase/EglBase;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic N3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private N5()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, v0, Ll/wvx;->c:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MoMoRtcPushFilter"

    .line 16
    .line 17
    const-string v2, "AGORA_PUBLISHING"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 23
    .line 24
    const/16 v1, 0x1007

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-interface {v0, v1, v2, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    iput-wide v0, p0, Ll/wvx;->c:J

    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public static synthetic O2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C2:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic O3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private O5([B[B)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 2
    .line 3
    iget v0, v0, Ll/uow;->B0:I

    .line 4
    .line 5
    int-to-long v5, v0

    .line 6
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d1:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F2:Landroid/os/Handler;

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;

    .line 15
    .line 16
    move-object v2, p0

    .line 17
    move-object v3, p1

    .line 18
    move-object v4, p2

    .line 19
    invoke-direct/range {v1 .. v6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$a;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;[B[BJ)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public static synthetic P2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/MMRtcEngine;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic P3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Q2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j2:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic Q3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/gkl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c1:Ll/gkl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/momortc/live/MMRtcStats;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic S3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/momortc/live/MMRtcStats;)Lcom/momo/momortc/live/MMRtcStats;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic T2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/fbl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b1:Ll/fbl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic T3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic U2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic U3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ebl0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a1:Ll/ebl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic V3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method private V5(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 2
    .line 3
    const/16 v1, 0x2005

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-interface {v0, v1, p1, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic W2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic W3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic X2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic X3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic Y2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B1:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Y3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic Z2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F2:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic Z3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ypw;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return-object p0
.end method

.method private Z6(ILjava/lang/String;)V
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    goto/16 :goto_0

    .line 6
    .line 7
    :pswitch_0
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v3:Ljava/lang/String;

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :pswitch_1
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u3:Ljava/lang/String;

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :pswitch_2
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t3:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :pswitch_3
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s3:Ljava/lang/String;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :pswitch_4
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r3:Ljava/lang/String;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :pswitch_5
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q3:Ljava/lang/String;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :pswitch_6
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p3:Ljava/lang/String;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :pswitch_7
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o3:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :pswitch_8
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n3:Ljava/lang/String;

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :pswitch_9
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m3:Ljava/lang/String;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :pswitch_a
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l3:Ljava/lang/String;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :pswitch_b
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k3:Ljava/lang/String;

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :pswitch_c
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j3:Ljava/lang/String;

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :pswitch_d
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i3:Ljava/lang/String;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :pswitch_e
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h3:Ljava/lang/String;

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :pswitch_f
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g3:Ljava/lang/String;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :pswitch_10
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f3:Ljava/lang/String;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :pswitch_11
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e3:Ljava/lang/String;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :pswitch_12
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d3:Ljava/lang/String;

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :pswitch_13
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c3:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :pswitch_14
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b3:Ljava/lang/String;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :pswitch_15
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a3:Ljava/lang/String;

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :pswitch_16
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z2:Ljava/lang/String;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :pswitch_17
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y2:Ljava/lang/String;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :pswitch_18
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X2:Ljava/lang/String;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :pswitch_19
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W2:Ljava/lang/String;

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :pswitch_1a
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V2:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :pswitch_1b
    sget-object p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U2:Ljava/lang/String;

    .line 91
    .line 92
    :goto_0
    if-eqz p1, :cond_0

    .line 93
    .line 94
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 95
    .line 96
    invoke-virtual {p0, p1, p2}, Ll/evx;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void

    .line 100
    nop

    .line 101
    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static synthetic a3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic a4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcQualityHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a2:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method private a7()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1, p0, v1}, Lcom/momo/momortc/MMRtcEngine;->setExternalVideoSource(ZZZ)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic b3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 2
    .line 3
    return-object p1
.end method

.method private final b5(II)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 2
    .line 3
    iput p1, v0, Ll/ror;->e1:I

    .line 4
    .line 5
    iput p2, v0, Ll/ror;->f1:I

    .line 6
    .line 7
    :try_start_0
    new-instance v0, Ljava/io/FileReader;

    .line 8
    .line 9
    const-string v1, "/proc/cpuinfo"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance v1, Ljava/io/BufferedReader;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    const-string v3, "Qualcomm"

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    const-string v3, "qualcomm"

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_0

    .line 40
    .line 41
    const-string v3, "MSM"

    .line 42
    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-nez v3, :cond_0

    .line 48
    .line 49
    const-string v3, "msm"

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {v0}, Ljava/io/Reader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    :catch_0
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a7()V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 63
    .line 64
    if-eqz v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 67
    .line 68
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    const-string v2, "configEngine"

    .line 77
    .line 78
    filled-new-array {v2, v1, p2}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    invoke-virtual {v0, p2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setClientRole(I)I

    .line 88
    .line 89
    .line 90
    :cond_2
    return-void
.end method

.method public static synthetic c3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method private c5(Ljava/lang/String;)V
    .locals 9

    .line 1
    const-string v0, "{canvas:{w:"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 4
    .line 5
    if-eqz v1, :cond_3

    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 8
    .line 9
    if-eqz v1, :cond_3

    .line 10
    .line 11
    iget-object v1, v1, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 12
    .line 13
    if-eqz v1, :cond_3

    .line 14
    .line 15
    iget-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 16
    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    if-eqz p1, :cond_3

    .line 20
    .line 21
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_3

    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-lez v1, :cond_3

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 43
    .line 44
    iget-wide v2, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 45
    .line 46
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, ",h:"

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 55
    .line 56
    iget-wide v2, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 57
    .line 58
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v0, "conf:["

    .line 62
    .line 63
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 73
    .line 74
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_0

    .line 87
    .line 88
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Ljava/lang/String;

    .line 93
    .line 94
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 95
    .line 96
    iget-object v3, v3, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 97
    .line 98
    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    check-cast v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;

    .line 103
    .line 104
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    const-string v5, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 109
    .line 110
    new-instance v6, Ljava/lang/StringBuilder;

    .line 111
    .line 112
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 113
    .line 114
    .line 115
    const-string v7, "llcqxl:<<<<<<<<<,uid:"

    .line 116
    .line 117
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v2, ",uid:"

    .line 124
    .line 125
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    iget-object v2, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->uid:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v2, ",x:"

    .line 134
    .line 135
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    iget-wide v7, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posx:D

    .line 139
    .line 140
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    const-string v2, ",y:"

    .line 144
    .line 145
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    iget-wide v7, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posy:D

    .line 149
    .line 150
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v2, ",width:"

    .line 154
    .line 155
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    iget-wide v7, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->width:D

    .line 159
    .line 160
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    const-string v2, ",height:"

    .line 164
    .line 165
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-wide v7, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->height:D

    .line 169
    .line 170
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v2, ",alpha:"

    .line 174
    .line 175
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget-wide v7, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->alpha:D

    .line 179
    .line 180
    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v2, ",zOrder:"

    .line 184
    .line 185
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    iget v2, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->zOrder:I

    .line 189
    .line 190
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const-string v2, ">>>>>>>>>>"

    .line 194
    .line 195
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-virtual {v4, v5, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    new-instance v2, Ljava/lang/StringBuilder;

    .line 206
    .line 207
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    const-string v0, "{id:"

    .line 214
    .line 215
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-object v0, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->uid:Ljava/lang/String;

    .line 219
    .line 220
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v0, ",x:"

    .line 224
    .line 225
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget-wide v4, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posx:D

    .line 229
    .line 230
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v0, ",y:"

    .line 234
    .line 235
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    iget-wide v4, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posy:D

    .line 239
    .line 240
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v0, ",width:"

    .line 244
    .line 245
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget-wide v4, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->width:D

    .line 249
    .line 250
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string v0, ",height:"

    .line 254
    .line 255
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    iget-wide v3, v3, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->height:D

    .line 259
    .line 260
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v0, "}"

    .line 264
    .line 265
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 275
    .line 276
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    const-string v0, "]"

    .line 283
    .line 284
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 292
    .line 293
    const/4 v2, 0x1

    .line 294
    iput-boolean v2, v1, Lcom/momo/momortc/live/MMLiveTranscoding;->lowLatency:Z

    .line 295
    .line 296
    const/16 v3, 0xf

    .line 297
    .line 298
    iput v3, v1, Lcom/momo/momortc/live/MMLiveTranscoding;->videoGop:I

    .line 299
    .line 300
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 301
    .line 302
    invoke-virtual {v3, v1}, Lcom/momo/momortc/MMRtcEngine;->setLiveTranscoding(Lcom/momo/momortc/live/MMLiveTranscoding;)I

    .line 303
    .line 304
    .line 305
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 310
    .line 311
    iget-object v1, v1, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingExtraInfo:Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    invoke-direct {p0, v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O5([B[B)V

    .line 318
    .line 319
    .line 320
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r2:Ljava/lang/String;

    .line 321
    .line 322
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-nez v0, :cond_1

    .line 327
    .line 328
    const/4 v0, 0x0

    .line 329
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    iput-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r2:Ljava/lang/String;

    .line 334
    .line 335
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z1:Z

    .line 336
    .line 337
    :cond_1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A1:Ljava/lang/Object;

    .line 338
    .line 339
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 340
    :try_start_1
    iget-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z1:Z

    .line 341
    .line 342
    if-nez v1, :cond_2

    .line 343
    .line 344
    iget-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E2:Z

    .line 345
    .line 346
    if-nez v1, :cond_2

    .line 347
    .line 348
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 349
    .line 350
    invoke-virtual {v1, p1, v2}, Lcom/momo/momortc/MMRtcEngine;->addPublishStreamUrl(Ljava/lang/String;Z)I

    .line 351
    .line 352
    .line 353
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z1:Z

    .line 354
    .line 355
    const-string p0, "MoMoRtcPushFilter"

    .line 356
    .line 357
    new-instance v1, Ljava/lang/StringBuilder;

    .line 358
    .line 359
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 360
    .line 361
    .line 362
    const-string v2, "zhangjialiang onStreamPublished addPublishStreamUrl:url="

    .line 363
    .line 364
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    .line 376
    .line 377
    goto :goto_1

    .line 378
    :catchall_0
    move-exception p0

    .line 379
    goto :goto_2

    .line 380
    :cond_2
    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 381
    :try_start_2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    const-string p1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 386
    .line 387
    const-string v0, "addPublishStreamUrl configLiveTransCoding"

    .line 388
    .line 389
    invoke-virtual {p0, p1, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 390
    .line 391
    .line 392
    return-void

    .line 393
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 394
    :try_start_4
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 395
    :cond_3
    return-void

    .line 396
    :catch_0
    move-exception p0

    .line 397
    const-string p1, "MoMoRtcPushFilter"

    .line 398
    .line 399
    new-instance v0, Ljava/lang/StringBuilder;

    .line 400
    .line 401
    const-string v1, "zhangjialiang configLiveTransCoding :"

    .line 402
    .line 403
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 407
    .line 408
    .line 409
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    .line 415
    .line 416
    return-void
.end method

.method public static synthetic d3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/q210$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private d5(ZIIIILjava/lang/String;)V
    .locals 3

    .line 1
    if-nez p6, :cond_0

    .line 2
    .line 3
    const-string p6, ""

    .line 4
    .line 5
    :cond_0
    if-nez p1, :cond_1

    .line 6
    .line 7
    return-void

    .line 8
    :cond_1
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 9
    .line 10
    if-nez p1, :cond_2

    .line 11
    .line 12
    new-instance p1, Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 13
    .line 14
    invoke-direct {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 18
    .line 19
    :cond_2
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Ll/csx;->r0()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 28
    .line 29
    int-to-double v1, p2

    .line 30
    iput-wide v1, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 31
    .line 32
    int-to-double p2, p3

    .line 33
    iput-wide p2, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    const p2, 0x1f400

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_3
    mul-int/lit16 p2, p1, 0x3e8

    .line 42
    .line 43
    :goto_0
    iput p2, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioBitrate:I

    .line 44
    .line 45
    const/4 p2, 0x2

    .line 46
    iput p2, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioChannels:I

    .line 47
    .line 48
    sget-object p2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;->MMLiveAudioSampleRateType44100:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;

    .line 49
    .line 50
    iput-object p2, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->audioSampleRate:Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveAudioSampleRateType;

    .line 51
    .line 52
    iput p4, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoBitrate:I

    .line 53
    .line 54
    iput p5, v0, Lcom/momo/momortc/live/MMLiveTranscoding;->videoFramerate:I

    .line 55
    .line 56
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    new-instance p3, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string p4, "config"

    .line 63
    .line 64
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 68
    .line 69
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p3

    .line 76
    const-string p4, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 77
    .line 78
    invoke-virtual {p2, p4, p3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-direct {p0, p6}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c5(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 85
    .line 86
    const-string p2, "tanscode_aBitrate"

    .line 87
    .line 88
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    filled-new-array {p2, p1}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0, p1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public static synthetic e3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K2:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method private f6()V
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/4 v2, 0x6

    .line 4
    if-ge v1, v2, :cond_2

    .line 5
    .line 6
    new-instance v8, Landroid/graphics/Matrix;

    .line 7
    .line 8
    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 9
    .line 10
    .line 11
    sget-object v2, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T2:[F

    .line 12
    .line 13
    invoke-virtual {v8, v2}, Landroid/graphics/Matrix;->mapVectors([F)V

    .line 14
    .line 15
    .line 16
    new-instance v3, Lcom/momo/rtcbase/TextureBufferImpl;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 19
    .line 20
    iget v4, v2, Ll/tow;->m:I

    .line 21
    .line 22
    iget v5, v2, Ll/tow;->n:I

    .line 23
    .line 24
    sget-object v6, Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;->RGB:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 25
    .line 26
    iget v7, p0, Ll/wej;->texture_in:I

    .line 27
    .line 28
    const/4 v10, 0x0

    .line 29
    const/4 v11, 0x0

    .line 30
    const/4 v9, 0x0

    .line 31
    invoke-direct/range {v3 .. v11}, Lcom/momo/rtcbase/TextureBufferImpl;-><init>(IILcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/momo/rtcbase/YuvConverter;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 35
    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W:Landroid/opengl/EGLContext;

    .line 39
    .line 40
    if-eqz v4, :cond_0

    .line 41
    .line 42
    iget-boolean v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 43
    .line 44
    if-nez v4, :cond_0

    .line 45
    .line 46
    new-instance v4, Lcom/momo/rtcbase/VideoFrame;

    .line 47
    .line 48
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 49
    .line 50
    .line 51
    move-result-wide v5

    .line 52
    invoke-direct {v4, v3, v0, v5, v6}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 53
    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    invoke-virtual {v2, v4, v3}, Lcom/momo/momortc/MMRtcEngine;->pushExternalVideoFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/EglBase$Context;)Z

    .line 57
    .line 58
    .line 59
    :cond_0
    const-string v2, "MoMoRtcPushFilter"

    .line 60
    .line 61
    const-string v3, "zhangjialiang unint pushExternalVideoFrame"

    .line 62
    .line 63
    invoke-static {v2, v3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    return-void
.end method

.method public static synthetic g3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K2:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic g4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic i3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C1:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic j3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I6(Ljava/lang/Object;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/ror;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic k4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcChannelHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X1:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic l4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y1:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic m4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcConnectHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c2:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method private m5(Ll/uow;)Lcom/momo/momortc/MMRtcEngine;
    .locals 5

    .line 1
    const-string v0, "agora_sdk_ver: "

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 4
    .line 5
    iget v1, p1, Ll/tow;->P:I

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l6(I)V

    .line 8
    .line 9
    .line 10
    iget-boolean p1, p1, Ll/tow;->q:Z

    .line 11
    .line 12
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E0:Z

    .line 13
    .line 14
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    new-instance p1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;

    .line 20
    .line 21
    invoke-direct {p1, p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$c;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R1:Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 25
    .line 26
    :try_start_0
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z0:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z0:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R1:Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 44
    .line 45
    invoke-static {p1, v2, v3}, Lcom/momo/momortc/MMRtcEngine;->create(Landroid/content/Context;Ljava/lang/String;Lcom/momo/momortc/IMMRtcEngineEventInterface;)Lcom/momo/momortc/MMRtcEngine;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    const-string v2, "1e6127d73cd4d405905aa6f2ad5e1a67"

    .line 57
    .line 58
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R1:Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 59
    .line 60
    invoke-static {p1, v2, v3}, Lcom/momo/momortc/MMRtcEngine;->create(Landroid/content/Context;Ljava/lang/String;Lcom/momo/momortc/IMMRtcEngineEventInterface;)Lcom/momo/momortc/MMRtcEngine;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 65
    .line 66
    :goto_1
    const-string p1, "MoMoRtcPushFilter"

    .line 67
    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getSdkVersion()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {p1, v0}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 88
    .line 89
    const-string v0, "{\"rtc.log_filter\":34781}"

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 95
    .line 96
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J1:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->setLogFile(Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 102
    .line 103
    const/16 v0, 0xf

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->setLogFilter(I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    .line 107
    .line 108
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 109
    .line 110
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 117
    .line 118
    iget v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 119
    .line 120
    const/4 v2, 0x2

    .line 121
    const/4 v3, 0x1

    .line 122
    const/16 v4, 0x400

    .line 123
    .line 124
    invoke-virtual {p1, v0, v3, v2, v4}, Lcom/momo/momortc/MMRtcEngine;->setRecordingAudioFrameParameters(IIII)I

    .line 125
    .line 126
    .line 127
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 128
    .line 129
    iget v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 130
    .line 131
    invoke-virtual {p1, v0, v3, v1, v4}, Lcom/momo/momortc/MMRtcEngine;->setPlaybackAudioFrameParameters(IIII)I

    .line 132
    .line 133
    .line 134
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 135
    .line 136
    invoke-virtual {p1, v3}, Lcom/momo/momortc/MMRtcEngine;->setChannelProfile(I)I

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 140
    .line 141
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E0:Z

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->enableDualStreamMode(Z)I

    .line 144
    .line 145
    .line 146
    iget-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F0:Z

    .line 147
    .line 148
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l5(Z)V

    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :catch_0
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 153
    .line 154
    const-string p1, "RtcEngineEx.create error"

    .line 155
    .line 156
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    throw p0

    .line 160
    :cond_2
    :goto_2
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 161
    .line 162
    if-eqz p1, :cond_3

    .line 163
    .line 164
    iget-boolean p1, p1, Ll/tow;->b0:Z

    .line 165
    .line 166
    if-eqz p1, :cond_3

    .line 167
    .line 168
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T:Z

    .line 169
    .line 170
    :cond_3
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 171
    .line 172
    return-object p0
.end method

.method public static synthetic n3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic n4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V5(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic o3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic o4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method private o5(I)I
    .locals 1

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_3

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p1, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x4

    .line 13
    if-eq p1, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x5

    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 19
    .line 20
    iget p0, p0, Ll/tow;->S:I

    .line 21
    .line 22
    return p0

    .line 23
    :cond_0
    const p0, 0x2ee00

    .line 24
    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    const p0, 0x1f400

    .line 28
    .line 29
    .line 30
    return p0

    .line 31
    :cond_2
    const p0, 0xdac0

    .line 32
    .line 33
    .line 34
    return p0

    .line 35
    :cond_3
    const/16 p0, 0x4650

    .line 36
    .line 37
    return p0

    .line 38
    :cond_4
    const p0, 0xbb80

    .line 39
    .line 40
    .line 41
    return p0
.end method

.method public static synthetic p3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)[Lcom/momo/momortc/AudioVolumeInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T1:[Lcom/momo/momortc/AudioVolumeInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private p5()Ljava/lang/String;
    .locals 7

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
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/AbstractMap;->entrySet()Ljava/util/Set;

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
    move-result-object v3

    .line 48
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    invoke-virtual {v2}, Ll/iny;->a()J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    invoke-virtual {v2}, Ll/iny;->d()J

    .line 58
    .line 59
    .line 60
    move-result-wide v5

    .line 61
    invoke-virtual {v2, v3, v4, v5, v6}, Ll/iny;->e(JJ)V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    if-nez v1, :cond_2

    .line 66
    .line 67
    const-string p0, "(0)"

    .line 68
    .line 69
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    :cond_2
    const-string p0, "]"

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public static synthetic q2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;[Lcom/momo/momortc/AudioVolumeInfo;)[Lcom/momo/momortc/AudioVolumeInfo;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T1:[Lcom/momo/momortc/AudioVolumeInfo;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic q4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d2:Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d1:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V1:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic r4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method private release()V
    .locals 6

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MoMoRtcPushFilter"

    .line 6
    .line 7
    const-string v2, "MoMoRtcPushFilter release"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 13
    .line 14
    const-string v1, "release"

    .line 15
    .line 16
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L2:Z

    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 28
    .line 29
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 30
    .line 31
    monitor-enter v1

    .line 32
    :try_start_0
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    iput-object v3, v2, Ll/wvx;->a0:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    const-string v4, "MoMoRtcPushFilter"

    .line 46
    .line 47
    const-string v5, "release >>>>>"

    .line 48
    .line 49
    invoke-virtual {v2, v4, v5}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 53
    .line 54
    invoke-virtual {v2, v3}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 55
    .line 56
    .line 57
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 58
    .line 59
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 60
    .line 61
    iget-object v2, v2, Ll/uow;->v0:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-nez v2, :cond_0

    .line 70
    .line 71
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 72
    .line 73
    iget-object v4, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 74
    .line 75
    iget-object v4, v4, Ll/uow;->v0:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v2, v4}, Lcom/momo/momortc/MMRtcEngine;->removePublishStreamUrl(Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catchall_0
    move-exception p0

    .line 82
    goto :goto_1

    .line 83
    :cond_0
    :goto_0
    const-string v2, "unint"

    .line 84
    .line 85
    const-string v4, "leaveChannel begin 2778"

    .line 86
    .line 87
    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 91
    .line 92
    invoke-virtual {v2}, Lcom/momo/momortc/MMRtcEngine;->leaveChannel()I

    .line 93
    .line 94
    .line 95
    const-string v2, "unint"

    .line 96
    .line 97
    const-string v4, "leaveChannel end 2480"

    .line 98
    .line 99
    invoke-static {v2, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->destroy()V

    .line 103
    .line 104
    .line 105
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 106
    .line 107
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d1:Lcom/immomo/mediacore/coninf/MRtcRealLayoutNotifyHander;

    .line 108
    .line 109
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 110
    .line 111
    sget-object v2, Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;->FILTER_IDLE:Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;

    .line 112
    .line 113
    invoke-virtual {p0, v2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 114
    .line 115
    .line 116
    sget-object v2, Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;->STOP:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 117
    .line 118
    iput-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d2()V

    .line 121
    .line 122
    .line 123
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 124
    .line 125
    const/16 v4, 0x1001

    .line 126
    .line 127
    invoke-interface {v2, v4, v0, v0, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 131
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I0:Ll/dc1;

    .line 132
    .line 133
    if-eqz v0, :cond_2

    .line 134
    .line 135
    invoke-virtual {v0}, Ll/dc1;->f()V

    .line 136
    .line 137
    .line 138
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I0:Ll/dc1;

    .line 139
    .line 140
    :cond_2
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 141
    .line 142
    if-eqz v0, :cond_3

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioResampleUtils;->release()V

    .line 145
    .line 146
    .line 147
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 148
    .line 149
    :cond_3
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 150
    .line 151
    if-eqz v0, :cond_4

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioResampleUtils;->release()V

    .line 154
    .line 155
    .line 156
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 157
    .line 158
    :cond_4
    iput-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R1:Lcom/momo/momortc/IMMRtcEngineEventInterface;

    .line 159
    .line 160
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F2:Landroid/os/Handler;

    .line 161
    .line 162
    new-instance v1, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$d;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$d;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 168
    .line 169
    .line 170
    return-void

    .line 171
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 172
    throw p0
.end method

.method public static synthetic s2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcPusherHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I2:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private s5(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le p1, v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p1, v0

    .line 16
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public static synthetic t2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A1:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic t3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H2:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic t4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->l2(Lcom/momo/pipline/codec/MediaBaseCodecFilter$CodecFilterState;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private t5(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-le p1, v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p1, v0

    .line 16
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/nio/Buffer;->position()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-lez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const/4 v2, 0x0

    .line 44
    invoke-virtual {p1, v0, v2, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public static synthetic u2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Lcom/immomo/mediacore/coninf/MRtcAudioHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U1:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic v2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L2:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic v3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Landroid/content/Context;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->a2(Landroid/content/Context;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic v4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method private v5()Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R0:Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E2:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic w3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic w4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D1:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method private w5()Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q0:Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic x4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z1:Z

    .line 2
    .line 3
    return p1
.end method

.method private x5(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, "conf"

    .line 2
    .line 3
    const-string v1, "bType"

    .line 4
    .line 5
    const-string v2, "ts"

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_0

    .line 12
    .line 13
    const-string p0, ""

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 17
    .line 18
    invoke-direct {v3, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-eqz v4, :cond_1

    .line 26
    .line 27
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y1()J

    .line 31
    .line 32
    .line 33
    move-result-wide v4

    .line 34
    invoke-virtual {v3, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    if-eqz v2, :cond_2

    .line 42
    .line 43
    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    :cond_2
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 47
    .line 48
    iget-wide v4, v2, Ll/wvx;->s:J

    .line 49
    .line 50
    invoke-virtual {v3, v1, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 60
    .line 61
    const/4 v1, 0x1

    .line 62
    if-ne p0, v1, :cond_3

    .line 63
    .line 64
    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    :cond_3
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    return-object p0

    .line 72
    :catch_0
    return-object p1
.end method

.method public static synthetic y2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/wvx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic y4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/uow;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z2(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z3(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)Ll/evx;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic z4(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;)Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->J:Lcom/momo/pipline/MomoInterface/MomoCodec$MomoCodecState;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    return-void
.end method

.method public A0()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 2
    .line 3
    iget v0, p0, Ll/tow;->k:I

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/tow;->l:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    iget p0, p0, Ll/tow;->t:I

    .line 11
    .line 12
    return p0
.end method

.method public A5()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngine;->getAudioMixingCurrentPosition()J

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

.method public A6(Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G1:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y5(Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y5(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public B6(I)V
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
    iget v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y0:I

    .line 8
    .line 9
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "setRole"

    .line 14
    .line 15
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 23
    .line 24
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y0:I

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    if-ne p1, v0, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 34
    .line 35
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Lcom/momo/momortc/MMRtcEngine;->setClientRole(I)I

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public C0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C1(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "zk"

    .line 2
    .line 3
    const-string v1, "setMergeSei"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E1:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x6(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P5()[B

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p1, p0}, Lcom/momo/momortc/MMRtcEngine;->setSei([B)I

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    throw p0
.end method

.method public C6(IZ)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H1:I

    .line 2
    .line 3
    return-void
.end method

.method public D0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public D1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-object p0, p0, Ll/wvx;->x:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const-string p0, ""

    .line 9
    .line 10
    return-object p0
.end method

.method public D6(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q1:I

    .line 2
    .line 3
    return-void
.end method

.method public E0(Ll/wzl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->F:Ll/wzl;

    .line 2
    .line 3
    return-void
.end method

.method public E5(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 6
    .line 7
    const-string v1, "muteAllRemoteAudioStream"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->muteAllRemoteAudioStreams(Z)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public E6(Ll/kod0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y2:Ll/kod0;

    .line 2
    .line 3
    return-void
.end method

.method public F()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 2
    .line 3
    return p0
.end method

.method public F0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n1:I

    .line 2
    .line 3
    return p0
.end method

.method public F1()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/momo/momortc/live/MMRtcStats;->txBytes:J

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    return-wide v0
.end method

.method public F5(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 6
    .line 7
    const-string v1, "muteAllRemoteVideoStream"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->muteAllRemoteVideoStreams(Z)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public F6(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gtz v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 8
    .line 9
    mul-float/2addr p1, v0

    .line 10
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j1:F

    .line 11
    .line 12
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->adjustAudioMixingVolume(F)I

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public G0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public G5(Z)V
    .locals 4

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H2:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 6
    .line 7
    iget-boolean v1, v1, Ll/ror;->h1:Z

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "muteLocalAudioStream"

    .line 18
    .line 19
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 31
    .line 32
    iget-boolean v1, v1, Ll/ror;->h1:Z

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Lcom/momo/momortc/MMRtcEngine;->muteLocalAudioStream(Z)I

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 41
    .line 42
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    const-string v3, "muteLocalAudioStream, isHost, mute:"

    .line 49
    .line 50
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 58
    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i1:F

    .line 62
    .line 63
    float-to-int p0, p0

    .line 64
    mul-int/lit8 p0, p0, 0x64

    .line 65
    .line 66
    int-to-long p0, p0

    .line 67
    invoke-virtual {v0, p0, p1}, Lcom/momo/momortc/MMRtcEngine;->adjustRecordingSignalVolume(J)I

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    iget p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i1:F

    .line 72
    .line 73
    float-to-int p1, p1

    .line 74
    mul-int/lit8 p1, p1, 0x64

    .line 75
    .line 76
    int-to-long v1, p1

    .line 77
    invoke-virtual {v0, v1, v2}, Lcom/momo/momortc/MMRtcEngine;->adjustRecordingSignalVolume(J)I

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 81
    .line 82
    const/4 p1, 0x0

    .line 83
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->muteLocalAudioStream(Z)I

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method

.method public G6(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 8
    .line 9
    const-string v2, "set Stream ReplaceMode"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k2:Z

    .line 15
    .line 16
    return-void
.end method

.method public H0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 2
    .line 3
    return-void
.end method

.method public H5(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H2:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 8
    .line 9
    const-string v1, "muteLocalAudioStream"

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->muteLocalAudioStream(Z)I

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public H6(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    int-to-long v0, p1

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/momo/momortc/MMRtcEngine;->setAudioMixingPosition(J)I

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public I1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 3
    .line 4
    return-void
.end method

.method public I5(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 8
    .line 9
    const-string v1, "muteLocalVideoStream"

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->muteLocalVideoStream(Z)I

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public J(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-string v0, "zk"

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setSei"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E1:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 23
    .line 24
    monitor-enter v0

    .line 25
    :try_start_0
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D1:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E1:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w6(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E1:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x6(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 47
    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P5()[B

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Lcom/momo/momortc/MMRtcEngine;->setSei([B)I

    .line 55
    .line 56
    .line 57
    :cond_1
    monitor-exit v0

    .line 58
    return-void

    .line 59
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    throw p0
.end method

.method public J0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public J5(JZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 6
    .line 7
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "muteRemoteAudioStream"

    .line 16
    .line 17
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 25
    .line 26
    long-to-int p1, p1

    .line 27
    int-to-long p1, p1

    .line 28
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/momortc/MMRtcEngine;->muteRemoteAudioStream(JZ)I

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public K1(Ll/oxd0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public K4(Lcom/immomo/mediacore/coninf/MRtcEventHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W1:Lcom/immomo/mediacore/coninf/MRtcEventHandler;

    .line 2
    .line 3
    return-void
.end method

.method public K5(JZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 6
    .line 7
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "muteRemoteMsgStream"

    .line 16
    .line 17
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 25
    .line 26
    long-to-int p1, p1

    .line 27
    int-to-long p1, p1

    .line 28
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/momortc/MMRtcEngine;->muteRemoteMsgStream(JZ)I

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public K6(Ll/ebl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a1:Ll/ebl0;

    .line 2
    .line 3
    return-void
.end method

.method public L(Ll/dpl$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e1:Ll/dpl$a;

    .line 2
    .line 3
    return-void
.end method

.method public L0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public L1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public L4(Ll/upw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public L5(JZ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 6
    .line 7
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    const-string v3, "muteRemoteVideoStream"

    .line 16
    .line 17
    filled-new-array {v3, v1, v2}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 25
    .line 26
    long-to-int p1, p1

    .line 27
    invoke-virtual {p0, p1, p3}, Lcom/momo/momortc/MMRtcEngine;->muteRemoteVideoStream(IZ)I

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public L6(Ll/fbl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b1:Ll/fbl0;

    .line 2
    .line 3
    return-void
.end method

.method public M0()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/wvx;->i:J

    .line 4
    .line 5
    long-to-int p0, v0

    .line 6
    return p0
.end method

.method public M1()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H0:Ll/g510;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W:Landroid/opengl/EGLContext;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/g510;->l()Landroid/opengl/EGLContext;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-eq v1, v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H0:Ll/g510;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/g510;->l()Landroid/opengl/EGLContext;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W:Landroid/opengl/EGLContext;

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W:Landroid/opengl/EGLContext;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Lcom/momo/momortc/MMRtcEngine;->updateSharedContext(Landroid/opengl/EGLContext;)I

    .line 30
    .line 31
    .line 32
    :cond_1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 33
    .line 34
    if-eqz v0, :cond_8

    .line 35
    .line 36
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 37
    .line 38
    if-eqz v0, :cond_8

    .line 39
    .line 40
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 41
    .line 42
    if-nez v0, :cond_8

    .line 43
    .line 44
    new-instance v6, Landroid/graphics/Matrix;

    .line 45
    .line 46
    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    .line 47
    .line 48
    .line 49
    sget-object v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T2:[F

    .line 50
    .line 51
    invoke-virtual {v6, v0}, Landroid/graphics/Matrix;->mapVectors([F)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 55
    .line 56
    iget-boolean v1, v0, Ll/uow;->F0:Z

    .line 57
    .line 58
    const/4 v10, 0x1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/uow;->d()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-ne v0, v10, :cond_2

    .line 66
    .line 67
    new-instance v1, Lcom/momo/rtcbase/TextureBufferImpl;

    .line 68
    .line 69
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 70
    .line 71
    iget v2, v0, Ll/tow;->n:I

    .line 72
    .line 73
    iget v3, v0, Ll/tow;->m:I

    .line 74
    .line 75
    sget-object v4, Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;->RGB:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 76
    .line 77
    iget v5, p0, Ll/wej;->texture_in:I

    .line 78
    .line 79
    const/4 v8, 0x0

    .line 80
    const/4 v9, 0x0

    .line 81
    const/4 v7, 0x0

    .line 82
    invoke-direct/range {v1 .. v9}, Lcom/momo/rtcbase/TextureBufferImpl;-><init>(IILcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/momo/rtcbase/YuvConverter;Ljava/lang/Runnable;)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    new-instance v1, Lcom/momo/rtcbase/TextureBufferImpl;

    .line 87
    .line 88
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 89
    .line 90
    iget v2, v0, Ll/tow;->m:I

    .line 91
    .line 92
    iget v3, v0, Ll/tow;->n:I

    .line 93
    .line 94
    sget-object v4, Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;->RGB:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 95
    .line 96
    iget v5, p0, Ll/wej;->texture_in:I

    .line 97
    .line 98
    const/4 v8, 0x0

    .line 99
    const/4 v9, 0x0

    .line 100
    const/4 v7, 0x0

    .line 101
    invoke-direct/range {v1 .. v9}, Lcom/momo/rtcbase/TextureBufferImpl;-><init>(IILcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/momo/rtcbase/YuvConverter;Ljava/lang/Runnable;)V

    .line 102
    .line 103
    .line 104
    :goto_0
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 105
    .line 106
    monitor-enter v2

    .line 107
    :try_start_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 108
    .line 109
    const/4 v3, 0x0

    .line 110
    if-eqz v0, :cond_4

    .line 111
    .line 112
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L2:Z

    .line 113
    .line 114
    if-nez v0, :cond_4

    .line 115
    .line 116
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W:Landroid/opengl/EGLContext;

    .line 117
    .line 118
    if-eqz v0, :cond_3

    .line 119
    .line 120
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 121
    .line 122
    new-instance v4, Lcom/momo/rtcbase/VideoFrame;

    .line 123
    .line 124
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 125
    .line 126
    .line 127
    move-result-wide v5

    .line 128
    invoke-direct {v4, v1, v3, v5, v6}, Lcom/momo/rtcbase/VideoFrame;-><init>(Lcom/momo/rtcbase/VideoFrame$Buffer;IJ)V

    .line 129
    .line 130
    .line 131
    const/4 v1, 0x0

    .line 132
    invoke-virtual {v0, v4, v1}, Lcom/momo/momortc/MMRtcEngine;->pushExternalVideoFrame(Lcom/momo/rtcbase/VideoFrame;Lcom/momo/rtcbase/EglBase$Context;)Z

    .line 133
    .line 134
    .line 135
    goto :goto_1

    .line 136
    :catchall_0
    move-exception v0

    .line 137
    move-object p0, v0

    .line 138
    goto :goto_2

    .line 139
    :cond_3
    :goto_1
    const-string v0, "MoMoRtcPushFilter"

    .line 140
    .line 141
    const-string v1, "zhangjialiang pushExternalVideoFrame"

    .line 142
    .line 143
    invoke-static {v0, v1}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    :cond_4
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 148
    .line 149
    iget-wide v1, v0, Ll/wvx;->E:J

    .line 150
    .line 151
    const-wide/16 v4, 0x1

    .line 152
    .line 153
    add-long/2addr v1, v4

    .line 154
    iput-wide v1, v0, Ll/wvx;->E:J

    .line 155
    .line 156
    const-wide/16 v4, 0x1e

    .line 157
    .line 158
    cmp-long v0, v1, v4

    .line 159
    .line 160
    const-wide/16 v1, 0x0

    .line 161
    .line 162
    if-gez v0, :cond_5

    .line 163
    .line 164
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 165
    .line 166
    if-eqz v0, :cond_6

    .line 167
    .line 168
    :cond_5
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N5()V

    .line 169
    .line 170
    .line 171
    iget-wide v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N2:J

    .line 172
    .line 173
    cmp-long v0, v4, v1

    .line 174
    .line 175
    if-gtz v0, :cond_6

    .line 176
    .line 177
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 178
    .line 179
    .line 180
    move-result-wide v4

    .line 181
    iput-wide v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N2:J

    .line 182
    .line 183
    :cond_6
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2:Z

    .line 184
    .line 185
    const/16 v4, 0x1008

    .line 186
    .line 187
    if-nez v0, :cond_7

    .line 188
    .line 189
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 190
    .line 191
    iget-wide v5, v0, Ll/wvx;->E:J

    .line 192
    .line 193
    const-wide/16 v7, 0x78

    .line 194
    .line 195
    cmp-long v0, v5, v7

    .line 196
    .line 197
    if-ltz v0, :cond_7

    .line 198
    .line 199
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const-string v5, "MoMoRtcPushFilter"

    .line 204
    .line 205
    const-string v6, "Agora \u63a8\u6d41\u6210\u529f AGORA_RTMP_PUBLISHED"

    .line 206
    .line 207
    invoke-virtual {v0, v5, v6}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    iput-boolean v10, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2:Z

    .line 211
    .line 212
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 213
    .line 214
    invoke-interface {v0, v4, v3, v3, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    :cond_7
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2:Z

    .line 218
    .line 219
    if-nez v0, :cond_8

    .line 220
    .line 221
    iget-wide v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N2:J

    .line 222
    .line 223
    cmp-long v0, v5, v1

    .line 224
    .line 225
    if-lez v0, :cond_8

    .line 226
    .line 227
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 228
    .line 229
    .line 230
    move-result-wide v0

    .line 231
    iget-wide v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N2:J

    .line 232
    .line 233
    sub-long/2addr v0, v5

    .line 234
    const-wide/16 v5, 0x1388

    .line 235
    .line 236
    cmp-long v0, v0, v5

    .line 237
    .line 238
    if-lez v0, :cond_8

    .line 239
    .line 240
    iput-boolean v10, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2:Z

    .line 241
    .line 242
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 243
    .line 244
    invoke-interface {v0, v4, v3, v3, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 245
    .line 246
    .line 247
    return-void

    .line 248
    :goto_2
    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 249
    throw p0

    .line 250
    :cond_8
    return-void
.end method

.method public M4(Lcom/immomo/mediacore/coninf/MRtcAudioHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U1:Lcom/immomo/mediacore/coninf/MRtcAudioHandler;

    .line 2
    .line 3
    return-void
.end method

.method public M5(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "--ktv,muteSingerAudioStream:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m2:Z

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "-->"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "zk"

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m2:Z

    .line 31
    .line 32
    return-void
.end method

.method public M6(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 6
    .line 7
    invoke-direct {p1}, Lcom/momo/momortc/live/MMLiveTranscoding;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 11
    .line 12
    :cond_0
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 13
    .line 14
    iget-object p1, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c5(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public N0()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/momo/momortc/live/MMRtcStats;->txBytes:J

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    const-wide/16 v0, 0x0

    .line 9
    .line 10
    return-wide v0
.end method

.method public N1()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K0:I

    .line 2
    .line 3
    return p0
.end method

.method public N4(Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V1:Lcom/immomo/mediacore/coninf/MRtcAudioHandlerEx;

    .line 2
    .line 3
    return-void
.end method

.method public N6(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I1:I

    .line 2
    .line 3
    return-void
.end method

.method public O0()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public O4(Ll/vpw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public O6(Ll/gkl0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c1:Ll/gkl0;

    .line 2
    .line 3
    return-void
.end method

.method public P0(Ll/g510;IIII)V
    .locals 0

    .line 1
    iput p5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m1:I

    .line 2
    .line 3
    iput p3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n1:I

    .line 4
    .line 5
    iput p4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o1:I

    .line 6
    .line 7
    return-void
.end method

.method public P4(Lcom/immomo/mediacore/coninf/MRtcChannelHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X1:Lcom/immomo/mediacore/coninf/MRtcChannelHandler;

    .line 2
    .line 3
    return-void
.end method

.method public P5()[B
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D1:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x5(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E1:Ljava/lang/String;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    return-object v0
.end method

.method public P6(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 12
    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e1:Ll/dpl$a;

    .line 19
    .line 20
    if-nez p1, :cond_1

    .line 21
    .line 22
    iget-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2:Z

    .line 23
    .line 24
    if-nez p1, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 29
    .line 30
    .line 31
    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 33
    .line 34
    :cond_1
    return-void
.end method

.method public Q0()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->r5()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u5()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public Q4(Lcom/immomo/mediacore/coninf/MRtcConnectHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c2:Lcom/immomo/mediacore/coninf/MRtcConnectHandler;

    .line 2
    .line 3
    return-void
.end method

.method public Q5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->pauseAllEffects()I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Q6(ID)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    double-to-float p2, p2

    .line 8
    const/high16 p3, 0x42c80000    # 100.0f

    .line 9
    .line 10
    mul-float/2addr p2, p3

    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/momo/momortc/MMRtcEngineImpl;->setVolumeOfEffect(IF)I

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public R0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 6

    .line 1
    const-string v0, "setChannalName:"

    .line 2
    .line 3
    iget v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 4
    .line 5
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    if-ne v1, v3, :cond_1

    .line 9
    .line 10
    const-string v1, "M"

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w1()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const-string v1, "MrtcMaster"

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string v1, "MrtcSlaver"

    .line 26
    .line 27
    :goto_0
    iput-object v1, v2, Ll/wvx;->B0:Ljava/lang/String;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    const-string v1, "MrtcAudience"

    .line 31
    .line 32
    iput-object v1, v2, Ll/wvx;->B0:Ljava/lang/String;

    .line 33
    .line 34
    :goto_1
    invoke-super {p0, p1, p2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->R0(Ll/uow;Landroid/opengl/EGLContext;)V

    .line 35
    .line 36
    .line 37
    iget-boolean p2, p1, Ll/tow;->b0:Z

    .line 38
    .line 39
    if-eqz p2, :cond_2

    .line 40
    .line 41
    iget-boolean p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 42
    .line 43
    if-nez p2, :cond_2

    .line 44
    .line 45
    iget-boolean p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 46
    .line 47
    if-nez p2, :cond_2

    .line 48
    .line 49
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i2:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;

    .line 50
    .line 51
    if-nez p2, :cond_2

    .line 52
    .line 53
    new-instance p2, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;

    .line 54
    .line 55
    const-string v1, "live-media-aFFrame"

    .line 56
    .line 57
    invoke-direct {p2, p0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i2:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;

    .line 61
    .line 62
    invoke-virtual {p2}, Ljava/lang/Thread;->start()V

    .line 63
    .line 64
    .line 65
    :cond_2
    iget p2, p1, Ll/uow;->E0:I

    .line 66
    .line 67
    iput p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 68
    .line 69
    const/16 v1, 0x1e

    .line 70
    .line 71
    if-lez p2, :cond_3

    .line 72
    .line 73
    if-le p2, v1, :cond_4

    .line 74
    .line 75
    :cond_3
    const-string p2, "unint"

    .line 76
    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    .line 78
    .line 79
    const-string v4, "error maxFps="

    .line 80
    .line 81
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    iget v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 85
    .line 86
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {p2, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    iput v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 97
    .line 98
    :cond_4
    instance-of p2, p1, Ll/ror;

    .line 99
    .line 100
    if-eqz p2, :cond_10

    .line 101
    .line 102
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 103
    .line 104
    .line 105
    move-result-object p2

    .line 106
    const-string v1, "MoMoRtcPushFilter"

    .line 107
    .line 108
    new-instance v2, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v4, "videoWidth:"

    .line 111
    .line 112
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget v4, p1, Ll/tow;->s:I

    .line 116
    .line 117
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v4, ",videoHeight:"

    .line 121
    .line 122
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget v4, p1, Ll/tow;->t:I

    .line 126
    .line 127
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string v4, ",visualWidth:"

    .line 131
    .line 132
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    iget v4, p1, Ll/tow;->u:I

    .line 136
    .line 137
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v4, ",visualHeight:"

    .line 141
    .line 142
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    iget v4, p1, Ll/tow;->v:I

    .line 146
    .line 147
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    const-string v4, ",encodeWidth:"

    .line 151
    .line 152
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    iget v4, p1, Ll/tow;->m:I

    .line 156
    .line 157
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string v4, ",encodeHeight:"

    .line 161
    .line 162
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget v4, p1, Ll/tow;->n:I

    .line 166
    .line 167
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    const-string v4, ",videoBitrate:"

    .line 171
    .line 172
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    iget v4, p1, Ll/tow;->H:I

    .line 176
    .line 177
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    const-string v4, ",audioBitrate:"

    .line 181
    .line 182
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    iget v4, p1, Ll/tow;->S:I

    .line 186
    .line 187
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    const-string v4, ",videoFPS:"

    .line 191
    .line 192
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    iget v4, p1, Ll/tow;->F:I

    .line 196
    .line 197
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    const-string v4, ",codecFPS:"

    .line 201
    .line 202
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    iget v4, p1, Ll/uow;->E0:I

    .line 206
    .line 207
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 208
    .line 209
    .line 210
    const-string v4, ",mergeCanvasWidth:"

    .line 211
    .line 212
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    move-object v4, p1

    .line 216
    check-cast v4, Ll/ror;

    .line 217
    .line 218
    iget v5, v4, Ll/tow;->k:I

    .line 219
    .line 220
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v5, ",mergeCanvasHeight:"

    .line 224
    .line 225
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget v5, v4, Ll/tow;->l:I

    .line 229
    .line 230
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v5, ",codecFPS:"

    .line 234
    .line 235
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    iget v5, p1, Ll/uow;->E0:I

    .line 239
    .line 240
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v5, ",isHard:"

    .line 244
    .line 245
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget-object v5, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 249
    .line 250
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    invoke-virtual {p2, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    iput-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 261
    .line 262
    iget p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y0:I

    .line 263
    .line 264
    if-ne p2, v3, :cond_5

    .line 265
    .line 266
    return-void

    .line 267
    :cond_5
    iget-object p2, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 268
    .line 269
    sget-object v1, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 270
    .line 271
    const/4 v2, 0x0

    .line 272
    if-eq p2, v1, :cond_6

    .line 273
    .line 274
    iget-boolean p2, v4, Ll/tow;->b0:Z

    .line 275
    .line 276
    if-eqz p2, :cond_7

    .line 277
    .line 278
    :cond_6
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T:Z

    .line 279
    .line 280
    :cond_7
    new-instance p2, Ll/dc1;

    .line 281
    .line 282
    invoke-direct {p2}, Ll/dc1;-><init>()V

    .line 283
    .line 284
    .line 285
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I0:Ll/dc1;

    .line 286
    .line 287
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H0:Ll/g510;

    .line 288
    .line 289
    if-eqz p2, :cond_8

    .line 290
    .line 291
    invoke-virtual {p2}, Ll/g510;->l()Landroid/opengl/EGLContext;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W:Landroid/opengl/EGLContext;

    .line 296
    .line 297
    :cond_8
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 298
    .line 299
    if-eqz p2, :cond_a

    .line 300
    .line 301
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    invoke-virtual {v1}, Ll/csx;->F()I

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    if-ne v1, v3, :cond_9

    .line 310
    .line 311
    move v1, v3

    .line 312
    goto :goto_2

    .line 313
    :cond_9
    move v1, v2

    .line 314
    :goto_2
    invoke-virtual {p2, v1}, Lcom/momo/momortc/MMRtcEngine;->setRobustSignal(Z)V

    .line 315
    .line 316
    .line 317
    :cond_a
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L2:Z

    .line 318
    .line 319
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z1:Z

    .line 320
    .line 321
    iput-boolean v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M2:Z

    .line 322
    .line 323
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 324
    .line 325
    .line 326
    move-result-object p2

    .line 327
    invoke-virtual {p2}, Ll/csx;->C()I

    .line 328
    .line 329
    .line 330
    move-result p2

    .line 331
    if-ne v3, p2, :cond_b

    .line 332
    .line 333
    invoke-virtual {p0, v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h6(Z)V

    .line 334
    .line 335
    .line 336
    :cond_b
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 337
    .line 338
    monitor-enter p2

    .line 339
    :try_start_0
    iget v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 340
    .line 341
    const/16 v2, 0x21

    .line 342
    .line 343
    invoke-direct {p0, v1, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b5(II)V

    .line 344
    .line 345
    .line 346
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 347
    .line 348
    if-eqz v1, :cond_c

    .line 349
    .line 350
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    invoke-virtual {v2}, Ll/csx;->q0()I

    .line 355
    .line 356
    .line 357
    move-result v2

    .line 358
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    invoke-virtual {v4}, Ll/csx;->M()I

    .line 363
    .line 364
    .line 365
    move-result v4

    .line 366
    invoke-virtual {v1, v2, v4}, Lcom/momo/momortc/MMRtcEngine;->setExpandCartonParams(II)V

    .line 367
    .line 368
    .line 369
    goto :goto_3

    .line 370
    :catchall_0
    move-exception p0

    .line 371
    goto/16 :goto_5

    .line 372
    .line 373
    :cond_c
    :goto_3
    invoke-static {}, Ll/arx;->d()Ll/arx;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z2:Ll/brx;

    .line 378
    .line 379
    invoke-virtual {v2}, Ll/brx;->b()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    invoke-virtual {v1, v2}, Ll/arx;->h(Ljava/lang/String;)Ll/arx$d;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    const-string v2, ""

    .line 388
    .line 389
    const-string v4, ""

    .line 390
    .line 391
    if-eqz v1, :cond_d

    .line 392
    .line 393
    iget-object v2, v1, Ll/arx$d;->a:Ljava/lang/String;

    .line 394
    .line 395
    iget-object v4, v1, Ll/arx$d;->b:Ljava/lang/String;

    .line 396
    .line 397
    :cond_d
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 398
    .line 399
    iget-object v5, v1, Ll/ror;->g1:Ljava/lang/String;

    .line 400
    .line 401
    iget v1, v1, Ll/uow;->B0:I

    .line 402
    .line 403
    invoke-direct {p0, v5, v1, v2, v4}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C5(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    .line 404
    .line 405
    .line 406
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 407
    .line 408
    .line 409
    move-result-object v1

    .line 410
    const-string v2, "momortc"

    .line 411
    .line 412
    new-instance v4, Ljava/lang/StringBuilder;

    .line 413
    .line 414
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 418
    .line 419
    iget-object v0, v0, Ll/ror;->g1:Ljava/lang/String;

    .line 420
    .line 421
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    invoke-virtual {v1, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 432
    iput v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y0:I

    .line 433
    .line 434
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 435
    .line 436
    .line 437
    move-result-object p2

    .line 438
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 439
    .line 440
    .line 441
    move-result-object v0

    .line 442
    sget v1, Ll/yt0;->f:I

    .line 443
    .line 444
    invoke-virtual {p2, v0, v1}, Ll/yt0;->p(Landroid/content/Context;I)V

    .line 445
    .line 446
    .line 447
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 448
    .line 449
    invoke-virtual {p1}, Ll/uow;->d()I

    .line 450
    .line 451
    .line 452
    move-result v0

    .line 453
    int-to-long v0, v0

    .line 454
    iput-wide v0, p2, Ll/wvx;->d1:J

    .line 455
    .line 456
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 457
    .line 458
    iget-boolean v0, p1, Ll/tow;->b0:Z

    .line 459
    .line 460
    if-eqz v0, :cond_e

    .line 461
    .line 462
    const-wide/16 v0, 0x1

    .line 463
    .line 464
    goto :goto_4

    .line 465
    :cond_e
    const-wide/16 v0, 0x0

    .line 466
    .line 467
    :goto_4
    iput-wide v0, p2, Ll/wvx;->b1:J

    .line 468
    .line 469
    iget-object v0, p1, Ll/uow;->v0:Ljava/lang/String;

    .line 470
    .line 471
    iput-object v0, p2, Ll/wvx;->x:Ljava/lang/String;

    .line 472
    .line 473
    iget v0, p1, Ll/tow;->H:I

    .line 474
    .line 475
    iput v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J2:I

    .line 476
    .line 477
    iget v1, p1, Ll/uow;->E0:I

    .line 478
    .line 479
    iput v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K2:I

    .line 480
    .line 481
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 482
    .line 483
    iget v2, v1, Ll/uow;->B0:I

    .line 484
    .line 485
    int-to-long v2, v2

    .line 486
    iput-wide v2, p2, Ll/wvx;->W:J

    .line 487
    .line 488
    iget-object v1, v1, Ll/ror;->g1:Ljava/lang/String;

    .line 489
    .line 490
    iput-object v1, p2, Ll/wvx;->X:Ljava/lang/String;

    .line 491
    .line 492
    int-to-long v0, v0

    .line 493
    iput-wide v0, p2, Ll/wvx;->F0:J

    .line 494
    .line 495
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 496
    .line 497
    if-eqz v0, :cond_f

    .line 498
    .line 499
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getSdkVersion()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    iput-object v0, p2, Ll/wvx;->p:Ljava/lang/String;

    .line 504
    .line 505
    :cond_f
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 506
    .line 507
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 508
    .line 509
    .line 510
    move-result-wide v0

    .line 511
    iput-wide v0, p2, Ll/wvx;->e:J

    .line 512
    .line 513
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 514
    .line 515
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 516
    .line 517
    .line 518
    move-result-wide v0

    .line 519
    iput-wide v0, p2, Ll/wvx;->f:J

    .line 520
    .line 521
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 522
    .line 523
    iget p1, p1, Ll/tow;->H:I

    .line 524
    .line 525
    int-to-long v0, p1

    .line 526
    iput-wide v0, p2, Ll/wvx;->F0:J

    .line 527
    .line 528
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 529
    .line 530
    const-string p2, "startRecord"

    .line 531
    .line 532
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 533
    .line 534
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 535
    .line 536
    .line 537
    move-result-object p0

    .line 538
    filled-new-array {p2, p0}, [Ljava/lang/Object;

    .line 539
    .line 540
    .line 541
    move-result-object p0

    .line 542
    invoke-virtual {p1, p0}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 543
    .line 544
    .line 545
    return-void

    .line 546
    :goto_5
    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 547
    throw p0

    .line 548
    :cond_10
    new-instance p0, Ljava/security/InvalidParameterException;

    .line 549
    .line 550
    const-string p1, "Parameters error"

    .line 551
    .line 552
    invoke-direct {p0, p1}, Ljava/security/InvalidParameterException;-><init>(Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    throw p0
.end method

.method public R4(Ll/wpw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Z1:Ll/wpw;

    .line 2
    .line 3
    return-void
.end method

.method public R5(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->pauseEffect(I)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public R6()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2:Z

    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public S0(Ll/brx;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->S0(Ll/brx;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->z2:Ll/brx;

    .line 5
    .line 6
    return-void
.end method

.method public S4(Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->d2:Lcom/immomo/mediacore/coninf/MRtcClientRoleChangedHandler;

    .line 2
    .line 3
    return-void
.end method

.method public S5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "pauseRecording"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v2, "MoMoRtcPushFilter"

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {v0, v1}, Lcom/momo/momortc/MMRtcEngine;->muteLocalAudioStream(Z)I

    .line 27
    .line 28
    .line 29
    :cond_0
    new-instance v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$e;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$e;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S1:Ljava/lang/Runnable;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F2:Landroid/os/Handler;

    .line 37
    .line 38
    const-wide/16 v1, 0x7530

    .line 39
    .line 40
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public S6(Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MoMoRtcPushFilter"

    .line 6
    .line 7
    const-string v2, "startSurroundMusic"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C1:Z

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 19
    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    const/4 v5, 0x0

    .line 23
    const-wide/16 v6, 0x1

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    move-object v3, p1

    .line 27
    invoke-virtual/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngine;->startAudioMixing(Ljava/lang/String;ZZJ)I

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 31
    .line 32
    iget v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j1:F

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->adjustAudioMixingVolume(F)I

    .line 35
    .line 36
    .line 37
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C1:Z

    .line 38
    .line 39
    :cond_1
    const/4 p1, 0x0

    .line 40
    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, p1, v1, v0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I6(Ljava/lang/Object;II)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public T0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public T4(Lcom/immomo/mediacore/coninf/MRtcPusherHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I2:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 2
    .line 3
    return-void
.end method

.method public T5()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngine;->pauseAudioMixing()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public T6(Ljava/lang/String;ZZI)V
    .locals 8

    .line 1
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C1:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 8
    .line 9
    if-eqz v2, :cond_1

    .line 10
    .line 11
    int-to-long v6, p4

    .line 12
    move-object v3, p1

    .line 13
    move v4, p2

    .line 14
    move v5, p3

    .line 15
    invoke-virtual/range {v2 .. v7}, Lcom/momo/momortc/MMRtcEngine;->startAudioMixing(Ljava/lang/String;ZZJ)I

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 19
    .line 20
    iget p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j1:F

    .line 21
    .line 22
    invoke-virtual {p1, p2}, Lcom/momo/momortc/MMRtcEngine;->adjustAudioMixingVolume(F)I

    .line 23
    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C1:Z

    .line 26
    .line 27
    :cond_1
    const/4 p1, 0x0

    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-direct {p0, p1, v1, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I6(Ljava/lang/Object;II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public U4(Lcom/immomo/mediacore/coninf/MRtcQualityHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->a2:Lcom/immomo/mediacore/coninf/MRtcQualityHandler;

    .line 2
    .line 3
    return-void
.end method

.method public U5(ILjava/lang/String;IDDZD)Z
    .locals 12

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    move-object v1, p0

    .line 7
    check-cast v1, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 8
    .line 9
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 10
    .line 11
    mul-double v9, p6, v2

    .line 12
    .line 13
    xor-int/lit8 v11, p8, 0x1

    .line 14
    .line 15
    move v2, p1

    .line 16
    move-object v3, p2

    .line 17
    move v4, p3

    .line 18
    move-wide/from16 v5, p4

    .line 19
    .line 20
    move-wide/from16 v7, p9

    .line 21
    .line 22
    invoke-virtual/range {v1 .. v11}, Lcom/momo/momortc/MMRtcEngineImpl;->playEffect(ILjava/lang/String;IDDDZ)I

    .line 23
    .line 24
    .line 25
    :cond_0
    return v0
.end method

.method public U6()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->stopAllEffects()I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public V0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public V4(Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->b2:Lcom/immomo/mediacore/coninf/MRtcReceiveSeiHandler;

    .line 2
    .line 3
    return-void
.end method

.method public V6(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->stopEffect(I)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public W0()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L0:I

    .line 2
    .line 3
    return p0
.end method

.method public W4(Ll/ypw;)V
    .locals 0

    .line 1
    return-void
.end method

.method public W5()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p5()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iput-object v1, v0, Ll/wvx;->r:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, v0, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/momo/momortc/live/MMRtcRemoteStats;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/momo/momortc/live/MMRtcRemoteStats;->AudioStats:Lcom/momo/momortc/live/MMRtcRemoteAudioStats;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 37
    .line 38
    iget-wide v2, v0, Ll/wvx;->g0:J

    .line 39
    .line 40
    iget-wide v4, v0, Ll/wvx;->f0:J

    .line 41
    .line 42
    add-long/2addr v2, v4

    .line 43
    iput-wide v2, v0, Ll/wvx;->g0:J

    .line 44
    .line 45
    iget-wide v2, v0, Ll/wvx;->i0:J

    .line 46
    .line 47
    iget-wide v4, v0, Ll/wvx;->h0:J

    .line 48
    .line 49
    add-long/2addr v2, v4

    .line 50
    iput-wide v2, v0, Ll/wvx;->i0:J

    .line 51
    .line 52
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/momo/momortc/live/MMRtcRemoteStats;

    .line 61
    .line 62
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcRemoteStats;->AudioStats:Lcom/momo/momortc/live/MMRtcRemoteAudioStats;

    .line 63
    .line 64
    iget v2, v2, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandCount:I

    .line 65
    .line 66
    mul-int/lit8 v2, v2, 0xa

    .line 67
    .line 68
    int-to-long v2, v2

    .line 69
    iget-object v4, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 70
    .line 71
    iget-wide v5, v4, Ll/wvx;->g0:J

    .line 72
    .line 73
    sub-long/2addr v2, v5

    .line 74
    iput-wide v2, v0, Ll/wvx;->f0:J

    .line 75
    .line 76
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    check-cast v0, Lcom/momo/momortc/live/MMRtcRemoteStats;

    .line 85
    .line 86
    iget-object v0, v0, Lcom/momo/momortc/live/MMRtcRemoteStats;->videoStats:Lcom/momo/momortc/live/MMRtcRemoteVideoStats;

    .line 87
    .line 88
    iget-wide v0, v0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoRenderCount:J

    .line 89
    .line 90
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 91
    .line 92
    iget-wide v2, v2, Ll/wvx;->i0:J

    .line 93
    .line 94
    sub-long/2addr v0, v2

    .line 95
    iput-wide v0, v4, Ll/wvx;->h0:J

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 99
    .line 100
    const-wide/16 v1, 0x0

    .line 101
    .line 102
    iput-wide v1, v0, Ll/wvx;->f0:J

    .line 103
    .line 104
    iput-wide v1, v0, Ll/wvx;->h0:J

    .line 105
    .line 106
    :goto_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/evx;->u()V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public W6()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2:Z

    .line 3
    .line 4
    return-void
.end method

.method public X()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 3
    .line 4
    return-void
.end method

.method public X0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public X4(Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y1:Lcom/immomo/mediacore/coninf/MRtcTokenWillExpireHander;

    .line 2
    .line 3
    return-void
.end method

.method public X5()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    iput-wide v1, v0, Ll/wvx;->D:J

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O0()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, v0, Ll/wvx;->F:J

    .line 16
    .line 17
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q1()J

    .line 20
    .line 21
    .line 22
    move-result-wide v1

    .line 23
    iput-wide v1, v0, Ll/wvx;->G:J

    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F1()J

    .line 28
    .line 29
    .line 30
    move-result-wide v1

    .line 31
    iput-wide v1, v0, Ll/wvx;->B:J

    .line 32
    .line 33
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w1()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Ll/wvx;->N:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    int-to-long v1, v1

    .line 48
    iput-wide v1, v0, Ll/wvx;->O:J

    .line 49
    .line 50
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y0()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    int-to-long v1, v1

    .line 57
    iput-wide v1, v0, Ll/wvx;->P:J

    .line 58
    .line 59
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m0()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    int-to-long v1, v1

    .line 66
    iput-wide v1, v0, Ll/wvx;->Q:J

    .line 67
    .line 68
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->getVideoWidth()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    int-to-long v1, v1

    .line 75
    iput-wide v1, v0, Ll/wvx;->v:J

    .line 76
    .line 77
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 78
    .line 79
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k0()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    int-to-long v1, v1

    .line 84
    iput-wide v1, v0, Ll/wvx;->w:J

    .line 85
    .line 86
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h0()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    int-to-long v1, v1

    .line 93
    iput-wide v1, v0, Ll/wvx;->j:J

    .line 94
    .line 95
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 96
    .line 97
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p5()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Ll/wvx;->r:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iget v1, v1, Ll/tow;->w:I

    .line 110
    .line 111
    int-to-long v1, v1

    .line 112
    iput-wide v1, v0, Ll/wvx;->S:J

    .line 113
    .line 114
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Z1()Ll/uow;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iget v1, v1, Ll/tow;->x:I

    .line 121
    .line 122
    int-to-long v1, v1

    .line 123
    iput-wide v1, v0, Ll/wvx;->T:J

    .line 124
    .line 125
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 126
    .line 127
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->B5()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    int-to-long v1, v1

    .line 132
    iput-wide v1, v0, Ll/wvx;->U:J

    .line 133
    .line 134
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 135
    .line 136
    iget-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H2:Z

    .line 137
    .line 138
    if-eqz v1, :cond_0

    .line 139
    .line 140
    const-wide/16 v1, 0x1

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_0
    const-wide/16 v1, 0x0

    .line 144
    .line 145
    :goto_0
    iput-wide v1, v0, Ll/wvx;->V:J

    .line 146
    .line 147
    iget-wide v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N0:J

    .line 148
    .line 149
    iput-wide v1, v0, Ll/wvx;->I0:J

    .line 150
    .line 151
    iget-wide v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->O0:J

    .line 152
    .line 153
    iput-wide v1, v0, Ll/wvx;->J0:J

    .line 154
    .line 155
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 156
    .line 157
    invoke-virtual {p0}, Ll/evx;->H()V

    .line 158
    .line 159
    .line 160
    return-void
.end method

.method public X6(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s1:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->renewToken(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Y(Ll/g510;Ll/uow;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y(Ll/g510;Ll/uow;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H0:Ll/g510;

    .line 5
    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget p1, p2, Ll/uow;->E0:I

    .line 10
    .line 11
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 12
    .line 13
    const/16 v0, 0x1e

    .line 14
    .line 15
    if-lez p1, :cond_1

    .line 16
    .line 17
    if-le p1, v0, :cond_2

    .line 18
    .line 19
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v1, "error maxFps="

    .line 22
    .line 23
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v1, "unint"

    .line 36
    .line 37
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    iput v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 41
    .line 42
    :cond_2
    check-cast p2, Ll/ror;

    .line 43
    .line 44
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J6()V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->H0:Ll/g510;

    .line 50
    .line 51
    if-eqz p1, :cond_3

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/g510;->l()Landroid/opengl/EGLContext;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W:Landroid/opengl/EGLContext;

    .line 58
    .line 59
    :cond_3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance p2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v0, "videoWidth:"

    .line 66
    .line 67
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 71
    .line 72
    iget v0, v0, Ll/tow;->s:I

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v0, ",videoHeight:"

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 83
    .line 84
    iget v0, v0, Ll/tow;->t:I

    .line 85
    .line 86
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v0, ",visualWidth:"

    .line 90
    .line 91
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 95
    .line 96
    iget v0, v0, Ll/tow;->u:I

    .line 97
    .line 98
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v0, ",visualHeight:"

    .line 102
    .line 103
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 107
    .line 108
    iget v0, v0, Ll/tow;->v:I

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const-string v0, ",encodeWidth:"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 119
    .line 120
    iget v0, v0, Ll/tow;->m:I

    .line 121
    .line 122
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v0, ",encodeHeight:"

    .line 126
    .line 127
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 131
    .line 132
    iget v0, v0, Ll/tow;->n:I

    .line 133
    .line 134
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v0, ",videoBitrate:"

    .line 138
    .line 139
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 143
    .line 144
    iget v0, v0, Ll/tow;->H:I

    .line 145
    .line 146
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v0, ",audioBitrate:"

    .line 150
    .line 151
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 155
    .line 156
    iget v0, v0, Ll/tow;->S:I

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v0, ",videoFPS:"

    .line 162
    .line 163
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 167
    .line 168
    iget v0, v0, Ll/tow;->F:I

    .line 169
    .line 170
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    const-string v0, ",codecFPS:"

    .line 174
    .line 175
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 179
    .line 180
    iget v1, v1, Ll/uow;->E0:I

    .line 181
    .line 182
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v1, ",mergeCanvasWidth:"

    .line 186
    .line 187
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 191
    .line 192
    check-cast v1, Ll/ror;

    .line 193
    .line 194
    iget v1, v1, Ll/tow;->k:I

    .line 195
    .line 196
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    const-string v1, ",mergeCanvasHeight:"

    .line 200
    .line 201
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 205
    .line 206
    check-cast v1, Ll/ror;

    .line 207
    .line 208
    iget v1, v1, Ll/tow;->l:I

    .line 209
    .line 210
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 217
    .line 218
    iget v0, v0, Ll/uow;->E0:I

    .line 219
    .line 220
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v0, ",isHard:"

    .line 224
    .line 225
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 229
    .line 230
    iget-object p0, p0, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 231
    .line 232
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    const-string p2, "MoMoRtcPushFilter"

    .line 240
    .line 241
    invoke-virtual {p1, p2, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    return-void
.end method

.method public Y0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/momortc/live/MMRtcStats;->videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;

    .line 6
    .line 7
    iget p0, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoBitrate:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public Y4(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    int-to-long v0, p1

    .line 6
    invoke-virtual {p0, v0, v1}, Lcom/momo/momortc/MMRtcEngine;->adjustPlaybackSignalVolume(J)I

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public Y5(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 14
    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->R2:Z

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/momo/momortc/MMRtcEngine;->registerAudioFrameObserver(Lcom/momo/momortc/IAudioFrameObserver;)I

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f1:Z

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public Y6(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "updateRtmpUrl"

    .line 4
    .line 5
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 17
    .line 18
    if-eqz v1, :cond_2

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E2:Z

    .line 23
    .line 24
    if-nez v1, :cond_2

    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 27
    .line 28
    iput-object p1, v1, Ll/wvx;->a0:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 31
    .line 32
    iget-object v1, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/momo/momortc/MMRtcEngine;->addPublishStreamUrl(Ljava/lang/String;Z)I

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 41
    .line 42
    iget-object v1, v1, Ll/wvx;->x:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, p1, v1}, Ll/evx;->B(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h1:Ll/q210$a;

    .line 48
    .line 49
    if-eqz v0, :cond_0

    .line 50
    .line 51
    const/16 v1, 0x3014

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    invoke-interface {v0, v1, v2, v2, p0}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 58
    .line 59
    iput-object p1, v0, Ll/wvx;->a0:Ljava/lang/String;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I2:Lcom/immomo/mediacore/coninf/MRtcPusherHandler;

    .line 62
    .line 63
    if-eqz p0, :cond_1

    .line 64
    .line 65
    invoke-interface {p0, p1}, Lcom/immomo/mediacore/coninf/MRtcPusherHandler;->onPushChangeStreamUrl(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string v0, "updateRtmpUrl:url="

    .line 73
    .line 74
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const-string v0, "MoMoRtcPushFilter"

    .line 79
    .line 80
    invoke-virtual {p0, v0, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method

.method public Z4(JF)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p1, "{\"che.audio.playout.uid.volume\": {\"uid\":userid,\"volume\":volumeScale}}"

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public Z5(II)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/momo/momortc/MMRtcEngine;->setRemoteVideoStreamType(II)I

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 p2, 0x1

    .line 11
    invoke-virtual {p0, p1, p2}, Lcom/momo/momortc/MMRtcEngine;->setRemoteVideoStreamType(II)I

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public a0()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/wvx;->E:J

    .line 4
    .line 5
    return-wide v0
.end method

.method public a5(I)I
    .locals 5

    .line 1
    const-string v0, "changeRole:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 4
    .line 5
    const-string v2, "changeRole"

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "MoMoRtcPushFilter"

    .line 23
    .line 24
    new-instance v3, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v4, "call changeRole:"

    .line 27
    .line 28
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 42
    .line 43
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u1:Ljava/lang/Object;

    .line 44
    .line 45
    monitor-enter v1

    .line 46
    const/4 v2, 0x1

    .line 47
    if-ne v2, p1, :cond_0

    .line 48
    .line 49
    :try_start_0
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J6()V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    goto :goto_4

    .line 55
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 56
    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    const-string v3, "MoMoRtcPushFilter"

    .line 64
    .line 65
    new-instance v4, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v2, v3, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, Lcom/momo/momortc/MMRtcEngine;->setClientRole(I)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    goto :goto_1

    .line 87
    :cond_1
    const/4 p1, 0x0

    .line 88
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    iget v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 90
    .line 91
    const/4 v1, 0x2

    .line 92
    if-ne v0, v1, :cond_2

    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i2()V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 98
    .line 99
    const-string v1, "MrtcAudience"

    .line 100
    .line 101
    iput-object v1, v0, Ll/wvx;->B0:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_2
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g2()V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 108
    .line 109
    const-string v1, "M"

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w1()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_3

    .line 120
    .line 121
    const-string v1, "MrtcMaster"

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_3
    const-string v1, "MrtcSlaver"

    .line 125
    .line 126
    :goto_2
    iput-object v1, v0, Ll/wvx;->B0:Ljava/lang/String;

    .line 127
    .line 128
    :goto_3
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 129
    .line 130
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 131
    .line 132
    .line 133
    move-result-wide v1

    .line 134
    iput-wide v1, v0, Ll/wvx;->e:J

    .line 135
    .line 136
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 137
    .line 138
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 139
    .line 140
    .line 141
    move-result-wide v0

    .line 142
    iput-wide v0, p0, Ll/wvx;->f:J

    .line 143
    .line 144
    return p1

    .line 145
    :goto_4
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    throw p0
.end method

.method public a6()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->resumeAllEffects()I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public b0()V
    .locals 0

    .line 1
    return-void
.end method

.method public b1()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/momortc/live/MMRtcStats;->videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget p0, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vEncodeCount:I

    .line 10
    .line 11
    int-to-long v0, p0

    .line 12
    return-wide v0

    .line 13
    :cond_0
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    return-wide v0
.end method

.method public b6(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->resumeEffect(I)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public c0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public c1()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    return p0
.end method

.method public c2()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->h2()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->f2()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public c6()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "resumeRecording"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v0, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v2, "MoMoRtcPushFilter"

    .line 17
    .line 18
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {v0, v1}, Lcom/momo/momortc/MMRtcEngine;->muteLocalAudioStream(Z)I

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F2:Landroid/os/Handler;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S1:Ljava/lang/Runnable;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public d1()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X5()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W5()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public d2()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i2()V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g2()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public d6()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngine;->resumeAudioMixing()I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public e0()Landroid/view/Surface;
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public e1(Ll/l6m;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->e1(Ll/l6m;)V

    .line 2
    .line 3
    .line 4
    instance-of p1, p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    check-cast p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/jc00;->r2()V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 19
    .line 20
    check-cast p1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 21
    .line 22
    new-instance v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$b;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$b;-><init>(Lcom/momo/piplineext/codec/MoMoRtcPushFilter;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->J2(Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper$i;)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 31
    .line 32
    check-cast p0, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    invoke-virtual {p0, p1}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s1(I)V

    .line 36
    .line 37
    .line 38
    :cond_1
    :goto_0
    return-void
.end method

.method public e5(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngine;->enableAudio()I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngine;->disableAudio()I

    .line 12
    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public e6(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V:I

    .line 7
    .line 8
    if-ne v2, v1, :cond_0

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {v0, v2, v2}, Lcom/momo/momortc/MMRtcEngine;->createDataStream(ZZ)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V:I

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->V:I

    .line 22
    .line 23
    if-eq p0, v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v0, p0, p1}, Lcom/momo/momortc/MMRtcEngine;->sendStreamMessage(ILjava/lang/String;)I

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public f()V
    .locals 7

    .line 1
    const-string v0, "unint"

    .line 2
    .line 3
    const-string v1, "stopRecord"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 9
    .line 10
    const-string v1, "stopRecord"

    .line 11
    .line 12
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Y0:I

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 28
    .line 29
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->f()V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i2:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;->a()V

    .line 38
    .line 39
    .line 40
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i2:Lcom/momo/piplineext/codec/MoMoRtcPushFilter$f;

    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->stopSurroundMusic()V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D2:Ljava/util/Timer;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/util/Timer;->cancel()V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D2:Ljava/util/Timer;

    .line 53
    .line 54
    :cond_1
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->release()V

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 58
    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    check-cast v1, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 62
    .line 63
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 64
    .line 65
    iget v4, v3, Ll/tow;->P:I

    .line 66
    .line 67
    iget v3, v3, Ll/tow;->R:I

    .line 68
    .line 69
    const-string v5, "NULL"

    .line 70
    .line 71
    const/16 v6, 0x800

    .line 72
    .line 73
    invoke-virtual {v1, v6, v4, v3, v5}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 77
    .line 78
    if-eqz v1, :cond_3

    .line 79
    .line 80
    invoke-interface {v1, v2}, Ll/l6m;->G1(Ll/gb1;)V

    .line 81
    .line 82
    .line 83
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 84
    .line 85
    invoke-interface {v1, v2}, Ll/l6m;->V(Ll/hb1;)V

    .line 86
    .line 87
    .line 88
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 89
    .line 90
    invoke-interface {v1, v2}, Ll/l6m;->R(Ll/fb1;)V

    .line 91
    .line 92
    .line 93
    iput-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 94
    .line 95
    :cond_3
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->p2()V

    .line 96
    .line 97
    .line 98
    invoke-static {}, Ll/yt0;->g()Ll/yt0;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    sget v2, Ll/yt0;->f:I

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Ll/yt0;->q(I)V

    .line 105
    .line 106
    .line 107
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 108
    .line 109
    if-eqz v1, :cond_4

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-nez v1, :cond_4

    .line 116
    .line 117
    const-string v1, "zhengjijian"

    .line 118
    .line 119
    new-instance v2, Ljava/lang/StringBuilder;

    .line 120
    .line 121
    const-string v3, "stopRecord memberInfoMap "

    .line 122
    .line 123
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 127
    .line 128
    invoke-virtual {v3}, Ljava/util/AbstractMap;->size()I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-static {v1, v2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/util/AbstractMap;->clear()V

    .line 145
    .line 146
    .line 147
    :cond_4
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 148
    .line 149
    if-eqz v1, :cond_5

    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/util/AbstractMap;->isEmpty()Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-nez v1, :cond_5

    .line 156
    .line 157
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->S0:Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 158
    .line 159
    invoke-virtual {v1}, Ljava/util/AbstractMap;->clear()V

    .line 160
    .line 161
    .line 162
    :cond_5
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C2:Ljava/util/Map;

    .line 163
    .line 164
    monitor-enter v1

    .line 165
    :try_start_0
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C2:Ljava/util/Map;

    .line 166
    .line 167
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-nez v2, :cond_8

    .line 172
    .line 173
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C2:Ljava/util/Map;

    .line 174
    .line 175
    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    :cond_6
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    if-eqz v3, :cond_7

    .line 188
    .line 189
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v3

    .line 193
    check-cast v3, Lcom/momo/rtcbase/SurfaceViewRenderer;

    .line 194
    .line 195
    if-eqz v3, :cond_6

    .line 196
    .line 197
    invoke-virtual {v3}, Lcom/momo/rtcbase/SurfaceViewRenderer;->release()V

    .line 198
    .line 199
    .line 200
    goto :goto_0

    .line 201
    :catchall_0
    move-exception p0

    .line 202
    goto :goto_1

    .line 203
    :cond_7
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C2:Ljava/util/Map;

    .line 204
    .line 205
    invoke-interface {p0}, Ljava/util/Map;->clear()V

    .line 206
    .line 207
    .line 208
    :cond_8
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 209
    invoke-static {}, Ll/csx;->R()Ll/csx;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-virtual {p0, v0}, Ll/csx;->C1(I)V

    .line 214
    .line 215
    .line 216
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    const-string v0, "MoMoRtcPushFilter"

    .line 221
    .line 222
    const-string v1, "stopRecordOK!!!!!!!!!!!!!!!!!!!!"

    .line 223
    .line 224
    invoke-virtual {p0, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    return-void

    .line 228
    :goto_1
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 229
    throw p0
.end method

.method public f2()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "pullStartV3"

    .line 10
    .line 11
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 27
    .line 28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    iput-wide v1, v0, Ll/wvx;->a:J

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 35
    .line 36
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 37
    .line 38
    .line 39
    move-result-wide v1

    .line 40
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 41
    .line 42
    iget-wide v4, v3, Ll/wvx;->e:J

    .line 43
    .line 44
    sub-long/2addr v1, v4

    .line 45
    iput-wide v1, v0, Ll/wvx;->e:J

    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    iget-object v2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 52
    .line 53
    iget-wide v4, v2, Ll/wvx;->f:J

    .line 54
    .line 55
    sub-long/2addr v0, v4

    .line 56
    iput-wide v0, v3, Ll/wvx;->f:J

    .line 57
    .line 58
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A2:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v0, v2, Ll/wvx;->y:Ljava/lang/String;

    .line 61
    .line 62
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->f2()V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public f5(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->L1:Z

    .line 2
    .line 3
    return-void
.end method

.method public g0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public g1(IILjava/lang/Object;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public g2()V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 5
    .line 6
    const-string v2, "pullStop_v3"

    .line 7
    .line 8
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 16
    .line 17
    iget-wide v2, v1, Ll/wvx;->a:J

    .line 18
    .line 19
    const-wide/16 v4, -0x1

    .line 20
    .line 21
    cmp-long v2, v2, v4

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v2

    .line 29
    iget-object v4, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 30
    .line 31
    iget-wide v4, v4, Ll/wvx;->a:J

    .line 32
    .line 33
    sub-long/2addr v2, v4

    .line 34
    iput-wide v2, v1, Ll/wvx;->h:J

    .line 35
    .line 36
    :cond_0
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object v1, v1, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-lez v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Lcom/momo/momortc/live/MMRtcRemoteStats;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/momo/momortc/live/MMRtcRemoteStats;->AudioStats:Lcom/momo/momortc/live/MMRtcRemoteAudioStats;

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 63
    .line 64
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    check-cast v2, Lcom/momo/momortc/live/MMRtcRemoteStats;

    .line 73
    .line 74
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcRemoteStats;->AudioStats:Lcom/momo/momortc/live/MMRtcRemoteAudioStats;

    .line 75
    .line 76
    iget v2, v2, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandCount:I

    .line 77
    .line 78
    mul-int/lit8 v2, v2, 0xa

    .line 79
    .line 80
    int-to-long v2, v2

    .line 81
    iput-wide v2, v1, Ll/wvx;->f0:J

    .line 82
    .line 83
    iget-object v1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 84
    .line 85
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 86
    .line 87
    iget-object v2, v2, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/momo/momortc/live/MMRtcRemoteStats;

    .line 94
    .line 95
    iget-object v0, v0, Lcom/momo/momortc/live/MMRtcRemoteStats;->videoStats:Lcom/momo/momortc/live/MMRtcRemoteVideoStats;

    .line 96
    .line 97
    iget-wide v2, v0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoRenderCount:J

    .line 98
    .line 99
    iput-wide v2, v1, Ll/wvx;->h0:J

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 103
    .line 104
    const-wide/16 v1, 0x0

    .line 105
    .line 106
    iput-wide v1, v0, Ll/wvx;->f0:J

    .line 107
    .line 108
    iput-wide v1, v0, Ll/wvx;->h0:J

    .line 109
    .line 110
    :goto_0
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 111
    .line 112
    iget-object v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A2:Ljava/lang/String;

    .line 113
    .line 114
    iput-object v1, v0, Ll/wvx;->y:Ljava/lang/String;

    .line 115
    .line 116
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->g2()V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public g5(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p0, "{\"che.audio.live_for_comm\":true}"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const-string p1, "{\"che.audio.live_for_comm\":false}"

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public g6(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "Pipeline_Normal_pip->PIPLINE->AGORA"

    .line 8
    .line 9
    const-string v2, "set double push"

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j2:Z

    .line 15
    .line 16
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 17
    .line 18
    return-void
.end method

.method public getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;
    .locals 0

    return-object p0
.end method

.method public getRoomType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->q1:I

    .line 2
    .line 3
    return p0
.end method

.method public getServerIpAddr()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "0.0.0.0"

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoWidth()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 11
    .line 12
    iget p0, p0, Ll/tow;->m:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public h0()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/momo/momortc/live/MMRtcStats;->rxBytes:J

    .line 6
    .line 7
    long-to-int p0, v0

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public h1()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P0:Lcom/momo/momortc/live/MMRtcStats;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/momortc/live/MMRtcStats;->audioStats:Lcom/momo/momortc/live/MMRtcLocalAudioStats;

    .line 6
    .line 7
    iget-wide v0, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->audioBitrate:J

    .line 8
    .line 9
    long-to-int p0, v0

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public h2()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "pushStartV3"

    .line 10
    .line 11
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 27
    .line 28
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v1

    .line 32
    iput-wide v1, v0, Ll/wvx;->a:J

    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D1()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Ll/wvx;->x:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->getVideoWidth()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    int-to-long v1, v1

    .line 49
    iput-wide v1, v0, Ll/wvx;->v:J

    .line 50
    .line 51
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k0()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    int-to-long v1, v1

    .line 58
    iput-wide v1, v0, Ll/wvx;->w:J

    .line 59
    .line 60
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    int-to-long v1, v1

    .line 67
    iput-wide v1, v0, Ll/wvx;->z:J

    .line 68
    .line 69
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->A0()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    int-to-long v1, v1

    .line 76
    iput-wide v1, v0, Ll/wvx;->A:J

    .line 77
    .line 78
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 79
    .line 80
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 85
    .line 86
    iget-wide v3, v3, Ll/wvx;->e:J

    .line 87
    .line 88
    sub-long/2addr v1, v3

    .line 89
    iput-wide v1, v0, Ll/wvx;->e:J

    .line 90
    .line 91
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->h2()V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public h5(ZLjava/lang/String;)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->K1:Z

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J1:Ljava/lang/String;

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-lez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string p2, "agora_sdk_ver: "

    .line 22
    .line 23
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {}, Lcom/momo/momortc/MMRtcEngine;->getSdkVersion()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    const-string p2, "MoMoRtcPushFilter"

    .line 38
    .line 39
    invoke-static {p2, p1}, Ll/t9c;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 43
    .line 44
    const-string p2, "{\"rtc.log_filter\":34781}"

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 50
    .line 51
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J1:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, p2}, Lcom/momo/momortc/MMRtcEngine;->setLogFile(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 57
    .line 58
    const/16 p1, 0xf

    .line 59
    .line 60
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setLogFilter(I)I

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public h6(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public i2()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "pushStop_v3"

    .line 4
    .line 5
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->Q2:Z

    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 16
    .line 17
    iget-wide v1, v0, Ll/wvx;->a:J

    .line 18
    .line 19
    const-wide/16 v3, -0x1

    .line 20
    .line 21
    cmp-long v1, v1, v3

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v1

    .line 29
    iget-object v3, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 30
    .line 31
    iget-wide v3, v3, Ll/wvx;->a:J

    .line 32
    .line 33
    sub-long/2addr v1, v3

    .line 34
    iput-wide v1, v0, Ll/wvx;->h:J

    .line 35
    .line 36
    :cond_0
    invoke-super {p0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->i2()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public i5(Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "enableDualStreamMode"

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

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
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "call enableDualStreamMode:"

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v2, "MoMoRtcPushFilter"

    .line 35
    .line 36
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->E0:Z

    .line 40
    .line 41
    return-void
.end method

.method public i6(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "momortc setAudioMixingPitch:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "MoMoRtcPushFilter"

    .line 16
    .line 17
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setAudioMixingPitch(I)I

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public j1(IILjava/lang/Object;)J
    .locals 0

    .line 1
    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public j5(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M1:Z

    .line 2
    .line 3
    return-void
.end method

.method public j6(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F0:Z

    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public k0()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->y1:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 11
    .line 12
    iget p0, p0, Ll/tow;->n:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public k5(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public k6(II)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o5(I)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    int-to-long p0, p0

    .line 14
    iput-wide p0, p2, Ll/wvx;->C0:J

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public l0(Ll/uow;Landroid/opengl/EGLContext;)V
    .locals 0

    .line 1
    return-void
.end method

.method public l1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public l5(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->F0:Z

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 4
    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 11
    .line 12
    if-eqz p1, :cond_2

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/momo/momortc/MMRtcEngine;->enableVideo()I

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W:Landroid/opengl/EGLContext;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Lcom/momo/momortc/MMRtcEngine;->updateSharedContext(Landroid/opengl/EGLContext;)I

    .line 27
    .line 28
    .line 29
    :cond_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v2, "setVideoProfileEx1 bitrate:"

    .line 36
    .line 37
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 41
    .line 42
    iget v2, v2, Ll/tow;->H:I

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v2, "MoMoRtcPushFilter"

    .line 52
    .line 53
    invoke-virtual {p1, v2, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 57
    .line 58
    const-string v0, "{\"che.video.keyFrameInterval\":1}"

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 64
    .line 65
    iget-boolean v0, p1, Ll/uow;->F0:Z

    .line 66
    .line 67
    const/16 v2, 0xf

    .line 68
    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    invoke-virtual {p1}, Ll/uow;->d()I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-ne p1, v1, :cond_1

    .line 76
    .line 77
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 78
    .line 79
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 80
    .line 81
    iget v0, p0, Ll/tow;->n:I

    .line 82
    .line 83
    iget v1, p0, Ll/tow;->m:I

    .line 84
    .line 85
    iget p0, p0, Ll/tow;->H:I

    .line 86
    .line 87
    invoke-virtual {p1, v0, v1, v2, p0}, Lcom/momo/momortc/MMRtcEngine;->setVideoProfile(IIII)I

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 92
    .line 93
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 94
    .line 95
    iget v0, p0, Ll/tow;->m:I

    .line 96
    .line 97
    iget v1, p0, Ll/tow;->n:I

    .line 98
    .line 99
    iget p0, p0, Ll/tow;->H:I

    .line 100
    .line 101
    invoke-virtual {p1, v0, v1, v2, p0}, Lcom/momo/momortc/MMRtcEngine;->setVideoProfile(IIII)I

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_2
    invoke-virtual {v0}, Lcom/momo/momortc/MMRtcEngine;->disableVideo()I

    .line 106
    .line 107
    .line 108
    iput-boolean v1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 109
    .line 110
    :cond_3
    return-void
.end method

.method public l6(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 2
    .line 3
    return-void
.end method

.method public m0()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v5()Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    iget p0, p0, Lcom/momo/momortc/IMMRtcEngineEventInterface$LocalVideoStats;->sentFrameRate:I

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w5()Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    iget p0, p0, Lcom/momo/momortc/IMMRtcEngineEventInterface$RemoteVideoStats;->receivedFrameRate:I

    .line 21
    .line 22
    return p0

    .line 23
    :cond_1
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public m1(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public m6(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    iput-wide v0, p0, Ll/wvx;->i:J

    .line 5
    .line 6
    return-void
.end method

.method public n0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public n1()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->o1:I

    .line 2
    .line 3
    return p0
.end method

.method public n2(Ll/uow;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->n2(Ll/uow;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->s:Ll/uow;

    .line 5
    .line 6
    move-object v0, p1

    .line 7
    check-cast v0, Ll/ror;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T:Z

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    iget-object p0, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 18
    .line 19
    sget-object v0, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 20
    .line 21
    if-eq p0, v0, :cond_1

    .line 22
    .line 23
    move-object p0, p1

    .line 24
    check-cast p0, Ll/ror;

    .line 25
    .line 26
    iget-boolean p0, p0, Ll/tow;->b0:Z

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    sget-object p0, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->HARD_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 32
    .line 33
    iput-object p0, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    :goto_0
    sget-object p0, Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;->SOFT_DECODE:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 37
    .line 38
    iput-object p0, p1, Ll/uow;->A0:Lcom/momo/pipline/MomoInterface/MomoPipeline$DecodeType;

    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public n5(JZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lcom/momo/momortc/MMRtcEngine;->forwardDownlinkAudio(JZ)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n6(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->I:Ll/evx;

    .line 2
    .line 3
    const-string v1, "setBusinessType"

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
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 17
    .line 18
    int-to-long v1, p1

    .line 19
    iput-wide v1, v0, Ll/wvx;->s:J

    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v1, "setBusinessType : "

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "MoMoRtcPushFilter"

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/esx;->d(Ljava/lang/String;Ljava/lang/Object;)I

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setRoomMode(I)I

    .line 45
    .line 46
    .line 47
    :cond_0
    return-void
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 6

    .line 1
    const-string p2, "zk"

    .line 2
    .line 3
    const-string p3, "newTextureReady"

    .line 4
    .line 5
    invoke-static {p2, p3}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide p2

    .line 12
    iput p1, p0, Ll/wej;->texture_in:I

    .line 13
    .line 14
    iget p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s2:I

    .line 15
    .line 16
    int-to-long v0, p1

    .line 17
    const-wide/16 v2, 0x3e8

    .line 18
    .line 19
    div-long/2addr v2, v0

    .line 20
    iget-wide v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t2:J

    .line 21
    .line 22
    sub-long/2addr p2, v0

    .line 23
    cmp-long p1, p2, v2

    .line 24
    .line 25
    if-gez p1, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-wide/16 v4, 0x0

    .line 29
    .line 30
    cmp-long p1, v0, v4

    .line 31
    .line 32
    if-eqz p1, :cond_2

    .line 33
    .line 34
    const-wide/16 v4, 0x5

    .line 35
    .line 36
    mul-long/2addr v4, v2

    .line 37
    cmp-long p1, p2, v4

    .line 38
    .line 39
    if-lez p1, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    add-long/2addr v0, v2

    .line 43
    iput-wide v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t2:J

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_2
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide p1

    .line 50
    iput-wide p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t2:J

    .line 51
    .line 52
    :goto_1
    invoke-virtual {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->M1()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public o1(Ljava/nio/ByteBuffer;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v0(Ljava/nio/ByteBuffer;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0
.end method

.method public o6(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s1:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public onPlaybackFrame([BIIII)Z
    .locals 9

    .line 1
    iget-boolean p3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-nez p3, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    const/4 p3, 0x0

    .line 8
    const/4 v1, 0x2

    .line 9
    if-ne p4, v1, :cond_2

    .line 10
    .line 11
    const v2, 0x6baa8

    .line 12
    .line 13
    .line 14
    if-eq p5, v2, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    move v2, p3

    .line 18
    goto :goto_1

    .line 19
    :cond_2
    :goto_0
    move v2, v0

    .line 20
    :goto_1
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I0:Ll/dc1;

    .line 21
    .line 22
    if-eqz v5, :cond_a

    .line 23
    .line 24
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e1:Ll/dpl$a;

    .line 25
    .line 26
    if-eqz v5, :cond_a

    .line 27
    .line 28
    iget-boolean v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 29
    .line 30
    if-eqz v5, :cond_a

    .line 31
    .line 32
    iget-object v5, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 33
    .line 34
    if-nez v5, :cond_3

    .line 35
    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    new-instance v2, Lcom/immomo/mediabase/AudioResampleUtils;

    .line 39
    .line 40
    invoke-direct {v2}, Lcom/immomo/mediabase/AudioResampleUtils;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 44
    .line 45
    iget v6, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 46
    .line 47
    const/4 v7, 0x2

    .line 48
    const/16 v8, 0x10

    .line 49
    .line 50
    const/16 v5, 0x10

    .line 51
    .line 52
    move v4, p4

    .line 53
    move v3, p5

    .line 54
    invoke-virtual/range {v2 .. v8}, Lcom/immomo/mediabase/AudioResampleUtils;->initResampleInfo(IIIIII)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget-object v3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 59
    .line 60
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 61
    .line 62
    .line 63
    if-gez v2, :cond_3

    .line 64
    .line 65
    const-string v2, "mmrtcpushfilter"

    .line 66
    .line 67
    const-string v3, "onPlaybackAudioFrame: \u521b\u5efa\u91cd\u91c7\u6837\u6a21\u5757\u5931\u8d25\uff01\uff01"

    .line 68
    .line 69
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 73
    .line 74
    invoke-virtual {v2}, Lcom/immomo/mediabase/AudioResampleUtils;->release()V

    .line 75
    .line 76
    .line 77
    const/4 v2, 0x0

    .line 78
    iput-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 79
    .line 80
    :cond_3
    iget-object v2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->u2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 81
    .line 82
    if-eqz v2, :cond_4

    .line 83
    .line 84
    invoke-virtual {v2, p1, p2}, Lcom/immomo/mediabase/AudioResampleUtils;->resamplePcmData([BI)Ljava/nio/ByteBuffer;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    if-eqz p1, :cond_5

    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    invoke-direct {p0, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s5(I)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    invoke-virtual {p1}, Ljava/nio/Buffer;->capacity()I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    invoke-virtual {p2, v2, p3, p1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    array-length p2, p1

    .line 112
    invoke-direct {p0, p2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->s5(I)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 116
    .line 117
    array-length v2, p1

    .line 118
    invoke-virtual {p2, p1, p3, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 119
    .line 120
    .line 121
    :cond_5
    :goto_2
    iget-object p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 122
    .line 123
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    :goto_3
    mul-int/lit16 p2, p3, 0x800

    .line 128
    .line 129
    sub-int v2, p1, p2

    .line 130
    .line 131
    const/16 v3, 0x800

    .line 132
    .line 133
    if-lt v2, v3, :cond_8

    .line 134
    .line 135
    iget-boolean v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 136
    .line 137
    if-eqz v4, :cond_8

    .line 138
    .line 139
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    iget-object v4, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 144
    .line 145
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-virtual {v2, v4, p2, v3}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 153
    .line 154
    .line 155
    iget p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t1:I

    .line 156
    .line 157
    if-ne p2, v1, :cond_6

    .line 158
    .line 159
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e1:Ll/dpl$a;

    .line 160
    .line 161
    new-instance v3, Ll/oxd0;

    .line 162
    .line 163
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 164
    .line 165
    .line 166
    move-result-wide v4

    .line 167
    invoke-direct {v3, v2, v4, v5, v1}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V

    .line 168
    .line 169
    .line 170
    invoke-interface {p2, v3}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 171
    .line 172
    .line 173
    goto :goto_4

    .line 174
    :cond_6
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I0:Ll/dc1;

    .line 175
    .line 176
    if-eqz p2, :cond_7

    .line 177
    .line 178
    new-instance v3, Ll/oxd0;

    .line 179
    .line 180
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 181
    .line 182
    .line 183
    move-result-wide v4

    .line 184
    invoke-direct {v3, v2, v4, v5, v1}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, v3}, Ll/dc1;->i(Ll/oxd0;)V

    .line 188
    .line 189
    .line 190
    :cond_7
    :goto_4
    add-int/lit8 p3, p3, 0x1

    .line 191
    .line 192
    goto :goto_3

    .line 193
    :cond_8
    if-lez v2, :cond_9

    .line 194
    .line 195
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iget-object p3, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 200
    .line 201
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->array()[B

    .line 202
    .line 203
    .line 204
    move-result-object p3

    .line 205
    invoke-virtual {p1, p3, p2, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 209
    .line 210
    .line 211
    iget-object p2, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 212
    .line 213
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 214
    .line 215
    .line 216
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 217
    .line 218
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 219
    .line 220
    .line 221
    goto :goto_5

    .line 222
    :cond_9
    if-nez v2, :cond_a

    .line 223
    .line 224
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->w2:Ljava/nio/ByteBuffer;

    .line 225
    .line 226
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 227
    .line 228
    .line 229
    :cond_a
    :goto_5
    return v0
.end method

.method public onRecordFrame([BIIII)Z
    .locals 22

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move/from16 v5, p4

    .line 8
    .line 9
    move/from16 v4, p5

    .line 10
    .line 11
    iget-boolean v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 12
    .line 13
    const/4 v10, 0x1

    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    return v10

    .line 17
    :cond_0
    iget v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l1:I

    .line 18
    .line 19
    rem-int/lit16 v3, v3, 0xc8

    .line 20
    .line 21
    const-string v11, "MoMoRtcPushFilter"

    .line 22
    .line 23
    if-nez v3, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    new-instance v6, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v7, "onRecordFrame samples.len"

    .line 32
    .line 33
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    array-length v7, v1

    .line 37
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v7, " numOfSamples:"

    .line 41
    .line 42
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v6

    .line 52
    invoke-virtual {v3, v11, v6}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    iget v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l1:I

    .line 56
    .line 57
    add-int/2addr v3, v10

    .line 58
    iput v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l1:I

    .line 59
    .line 60
    const/4 v12, 0x2

    .line 61
    const/4 v13, 0x0

    .line 62
    if-ne v5, v12, :cond_3

    .line 63
    .line 64
    const v3, 0x6baa8

    .line 65
    .line 66
    .line 67
    if-eq v4, v3, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move v14, v13

    .line 71
    goto :goto_1

    .line 72
    :cond_3
    :goto_0
    move v14, v10

    .line 73
    :goto_1
    array-length v3, v1

    .line 74
    new-array v3, v3, [B

    .line 75
    .line 76
    iget-boolean v6, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->m2:Z

    .line 77
    .line 78
    if-eqz v6, :cond_4

    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_4
    array-length v6, v1

    .line 82
    invoke-static {v1, v13, v3, v13, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    .line 84
    .line 85
    :goto_2
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 86
    .line 87
    const/4 v15, 0x0

    .line 88
    if-eqz v6, :cond_6

    .line 89
    .line 90
    iget-boolean v6, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 91
    .line 92
    if-eqz v6, :cond_6

    .line 93
    .line 94
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 95
    .line 96
    check-cast v6, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 97
    .line 98
    iget v7, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j1:F

    .line 99
    .line 100
    invoke-virtual {v6, v7}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->W1(F)V

    .line 101
    .line 102
    .line 103
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 104
    .line 105
    check-cast v6, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 106
    .line 107
    invoke-virtual {v6, v5}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->s1(I)V

    .line 108
    .line 109
    .line 110
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 111
    .line 112
    check-cast v6, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 113
    .line 114
    array-length v7, v1

    .line 115
    const-string v8, "momortc"

    .line 116
    .line 117
    invoke-virtual {v6, v7, v4, v5, v8}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->I2(IIILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    iget-object v6, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->K:Ll/l6m;

    .line 121
    .line 122
    check-cast v6, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;

    .line 123
    .line 124
    new-instance v7, Ll/oxd0;

    .line 125
    .line 126
    iget v8, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 127
    .line 128
    int-to-long v8, v8

    .line 129
    invoke-direct {v7, v3, v8, v9, v5}, Ll/oxd0;-><init>([BJI)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v6, v7}, Lcom/momo/piplinemomoext/input/audio/ExtAudioWrapper;->C(Ll/oxd0;)Ll/oxd0;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    if-eqz v3, :cond_5

    .line 137
    .line 138
    iget-object v6, v3, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 139
    .line 140
    if-eqz v6, :cond_5

    .line 141
    .line 142
    array-length v7, v1

    .line 143
    invoke-virtual {v6, v1, v13, v7}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 144
    .line 145
    .line 146
    :cond_5
    move-object v1, v3

    .line 147
    goto :goto_3

    .line 148
    :cond_6
    move-object v1, v15

    .line 149
    :goto_3
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G1:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 150
    .line 151
    if-nez v3, :cond_7

    .line 152
    .line 153
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e1:Ll/dpl$a;

    .line 154
    .line 155
    if-eqz v3, :cond_11

    .line 156
    .line 157
    :cond_7
    iget-boolean v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 158
    .line 159
    if-eqz v3, :cond_11

    .line 160
    .line 161
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 162
    .line 163
    if-nez v3, :cond_8

    .line 164
    .line 165
    if-eqz v14, :cond_8

    .line 166
    .line 167
    new-instance v3, Lcom/immomo/mediabase/AudioResampleUtils;

    .line 168
    .line 169
    invoke-direct {v3}, Lcom/immomo/mediabase/AudioResampleUtils;-><init>()V

    .line 170
    .line 171
    .line 172
    iput-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 173
    .line 174
    iget v7, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 175
    .line 176
    const/4 v8, 0x2

    .line 177
    const/16 v9, 0x10

    .line 178
    .line 179
    const/16 v6, 0x10

    .line 180
    .line 181
    invoke-virtual/range {v3 .. v9}, Lcom/immomo/mediabase/AudioResampleUtils;->initResampleInfo(IIIIII)I

    .line 182
    .line 183
    .line 184
    move-result v3

    .line 185
    iget-object v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 186
    .line 187
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 188
    .line 189
    .line 190
    if-gez v3, :cond_8

    .line 191
    .line 192
    const-string v3, "mmrtcpushfilter"

    .line 193
    .line 194
    const-string v4, "onRecordFrame: \u521b\u5efa\u91cd\u91c7\u6837\u6a21\u5757\u5931\u8d25\uff01\uff01"

    .line 195
    .line 196
    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 200
    .line 201
    invoke-virtual {v3}, Lcom/immomo/mediabase/AudioResampleUtils;->release()V

    .line 202
    .line 203
    .line 204
    iput-object v15, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 205
    .line 206
    :cond_8
    if-eqz v1, :cond_a

    .line 207
    .line 208
    iget-object v3, v1, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 209
    .line 210
    if-eqz v3, :cond_a

    .line 211
    .line 212
    iget-object v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v2:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 213
    .line 214
    if-eqz v4, :cond_9

    .line 215
    .line 216
    if-eqz v14, :cond_9

    .line 217
    .line 218
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {v4, v1, v2}, Lcom/immomo/mediabase/AudioResampleUtils;->resamplePcmData([BI)Ljava/nio/ByteBuffer;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    if-eqz v1, :cond_a

    .line 227
    .line 228
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 229
    .line 230
    .line 231
    move-result v2

    .line 232
    invoke-direct {v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t5(I)V

    .line 233
    .line 234
    .line 235
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 236
    .line 237
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    invoke-virtual {v2, v3, v13, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 246
    .line 247
    .line 248
    goto :goto_4

    .line 249
    :cond_9
    invoke-virtual {v3}, Ljava/nio/Buffer;->capacity()I

    .line 250
    .line 251
    .line 252
    move-result v2

    .line 253
    invoke-direct {v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->t5(I)V

    .line 254
    .line 255
    .line 256
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 257
    .line 258
    iget-object v3, v1, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 259
    .line 260
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    iget-object v1, v1, Ll/oxd0;->b:Ljava/nio/ByteBuffer;

    .line 265
    .line 266
    invoke-virtual {v1}, Ljava/nio/Buffer;->capacity()I

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    invoke-virtual {v2, v3, v13, v1}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 271
    .line 272
    .line 273
    :cond_a
    :goto_4
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 274
    .line 275
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    move v2, v13

    .line 280
    :goto_5
    mul-int/lit16 v3, v2, 0x800

    .line 281
    .line 282
    sub-int v4, v1, v3

    .line 283
    .line 284
    const/16 v5, 0x800

    .line 285
    .line 286
    if-lt v4, v5, :cond_f

    .line 287
    .line 288
    iget-boolean v6, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->g1:Z

    .line 289
    .line 290
    if-eqz v6, :cond_f

    .line 291
    .line 292
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    iget-object v6, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 297
    .line 298
    invoke-virtual {v6}, Ljava/nio/ByteBuffer;->array()[B

    .line 299
    .line 300
    .line 301
    move-result-object v6

    .line 302
    invoke-virtual {v4, v6, v3, v5}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 306
    .line 307
    .line 308
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I0:Ll/dc1;

    .line 309
    .line 310
    if-eqz v3, :cond_b

    .line 311
    .line 312
    const/high16 v5, 0x3f800000    # 1.0f

    .line 313
    .line 314
    invoke-virtual {v3, v5}, Ll/dc1;->j(F)V

    .line 315
    .line 316
    .line 317
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I0:Ll/dc1;

    .line 318
    .line 319
    invoke-virtual {v3}, Ll/dc1;->g()Ll/oxd0;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    move-object v15, v3

    .line 324
    :cond_b
    if-eqz v15, :cond_c

    .line 325
    .line 326
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->I0:Ll/dc1;

    .line 327
    .line 328
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 329
    .line 330
    .line 331
    move-result-object v5

    .line 332
    invoke-virtual {v15}, Ll/oxd0;->c()[B

    .line 333
    .line 334
    .line 335
    move-result-object v6

    .line 336
    invoke-virtual {v15}, Ll/oxd0;->e()I

    .line 337
    .line 338
    .line 339
    move-result v7

    .line 340
    invoke-virtual {v3, v5, v6, v7}, Ll/dc1;->h([B[BI)Ljava/nio/ByteBuffer;

    .line 341
    .line 342
    .line 343
    move-result-object v3

    .line 344
    goto :goto_6

    .line 345
    :cond_c
    move-object v3, v4

    .line 346
    :goto_6
    iget-object v5, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G1:Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;

    .line 347
    .line 348
    if-eqz v5, :cond_d

    .line 349
    .line 350
    iget-object v6, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 351
    .line 352
    iget v6, v6, Ll/uow;->B0:I

    .line 353
    .line 354
    int-to-long v6, v6

    .line 355
    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->array()[B

    .line 356
    .line 357
    .line 358
    move-result-object v19

    .line 359
    iget v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 360
    .line 361
    const/16 v21, 0x0

    .line 362
    .line 363
    move/from16 v20, v4

    .line 364
    .line 365
    move-object/from16 v16, v5

    .line 366
    .line 367
    move-wide/from16 v17, v6

    .line 368
    .line 369
    invoke-interface/range {v16 .. v21}, Lcom/immomo/mediacore/audio/pcmDataAvailableCallback;->onPcmDateCallback(J[BIZ)V

    .line 370
    .line 371
    .line 372
    :cond_d
    new-instance v4, Ll/oxd0;

    .line 373
    .line 374
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    iget v5, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->k1:I

    .line 379
    .line 380
    int-to-long v5, v5

    .line 381
    invoke-direct {v4, v3, v5, v6, v12}, Ll/oxd0;-><init>([BJI)V

    .line 382
    .line 383
    .line 384
    invoke-virtual {v4, v13}, Ll/oxd0;->g(Z)V

    .line 385
    .line 386
    .line 387
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->e1:Ll/dpl$a;

    .line 388
    .line 389
    if-eqz v3, :cond_e

    .line 390
    .line 391
    invoke-interface {v3, v4}, Ll/dpl$a;->C(Ll/oxd0;)Ll/oxd0;

    .line 392
    .line 393
    .line 394
    iget v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2:I

    .line 395
    .line 396
    add-int/lit8 v4, v3, 0x1

    .line 397
    .line 398
    iput v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->P2:I

    .line 399
    .line 400
    rem-int/lit8 v3, v3, 0x32

    .line 401
    .line 402
    if-nez v3, :cond_e

    .line 403
    .line 404
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 405
    .line 406
    .line 407
    move-result-object v3

    .line 408
    const-string v4, "=====replace======:mmrtc send pcm to IJK "

    .line 409
    .line 410
    invoke-virtual {v3, v11, v4}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    :cond_e
    add-int/lit8 v2, v2, 0x1

    .line 414
    .line 415
    goto/16 :goto_5

    .line 416
    .line 417
    :cond_f
    if-lez v4, :cond_10

    .line 418
    .line 419
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 424
    .line 425
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 426
    .line 427
    .line 428
    move-result-object v2

    .line 429
    invoke-virtual {v1, v2, v3, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 430
    .line 431
    .line 432
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 433
    .line 434
    .line 435
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 436
    .line 437
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 438
    .line 439
    .line 440
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 441
    .line 442
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 443
    .line 444
    .line 445
    goto :goto_7

    .line 446
    :cond_10
    if-nez v4, :cond_11

    .line 447
    .line 448
    iget-object v0, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x2:Ljava/nio/ByteBuffer;

    .line 449
    .line 450
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 451
    .line 452
    .line 453
    :cond_11
    :goto_7
    return v10
.end method

.method public p(Ljava/lang/String;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public p1()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 2
    .line 3
    iget v0, p0, Ll/tow;->k:I

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    iget p0, p0, Ll/tow;->s:I

    .line 9
    .line 10
    return p0
.end method

.method public p6(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l2:Z

    .line 2
    .line 3
    return-void
.end method

.method public q1()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->J0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public q5()D
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngineImpl;->getEffectsVolume()F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/high16 v0, 0x42c80000    # 100.0f

    .line 12
    .line 13
    div-float/2addr p0, v0

    .line 14
    float-to-double v0, p0

    .line 15
    return-wide v0

    .line 16
    :cond_0
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    return-wide v0
.end method

.method public q6(D)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/momo/momortc/MMRtcEngineImpl;

    .line 6
    .line 7
    double-to-float p1, p1

    .line 8
    const/high16 p2, 0x42c80000    # 100.0f

    .line 9
    .line 10
    mul-float/2addr p1, p2

    .line 11
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngineImpl;->setEffectsVolume(F)I

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public r0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public r1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j2:Z

    .line 2
    .line 3
    return p0
.end method

.method public r5()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->W0:I

    .line 2
    .line 3
    return p0
.end method

.method public r6(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setEnableSpeakerphone(Z)I

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

.method public s0()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public s6(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setEncryptionMode(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public stopSurroundMusic()V
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "MoMoRtcPushFilter"

    .line 6
    .line 7
    const-string v2, "stopSurroundMusic:"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/momo/momortc/MMRtcEngine;->stopAudioMixing()I

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->C1:Z

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public t6(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setEncryptionSecret(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public u0()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public u1()J
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public u5()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X0:I

    .line 2
    .line 3
    return p0
.end method

.method public u6(Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v1, "che.audio.profile"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    goto :goto_0

    .line 13
    :catch_0
    move-exception v0

    .line 14
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    :goto_0
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    invoke-virtual {p0, p1}, Lcom/momo/momortc/MMRtcEngine;->setParameters(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_1
    return-void
.end method

.method public v0(Ljava/nio/ByteBuffer;)V
    .locals 5

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v4, "writevideo:"

    .line 12
    .line 13
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p1, ";timeStamp:"

    .line 24
    .line 25
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "MoMoRtcPushFilter"

    .line 36
    .line 37
    invoke-virtual {v2, v0, p1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->T:Z

    .line 41
    .line 42
    if-nez p1, :cond_1

    .line 43
    .line 44
    iget-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->X:Z

    .line 45
    .line 46
    if-eqz p1, :cond_1

    .line 47
    .line 48
    iget-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->G2:Z

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iget p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v1:I

    .line 53
    .line 54
    add-int/lit8 p1, p1, 0x1

    .line 55
    .line 56
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->v1:I

    .line 57
    .line 58
    const/16 v0, 0x1e

    .line 59
    .line 60
    if-ge p1, v0, :cond_0

    .line 61
    .line 62
    iget-boolean p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x1:Z

    .line 63
    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    :cond_0
    invoke-direct {p0}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->N5()V

    .line 67
    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public v6(ZZ)V
    .locals 0

    .line 1
    return-void
.end method

.method public w1()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 2
    .line 3
    const-string v0, "M"

    .line 4
    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/ror;->h1:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const-string p0, "S"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    return-object v0
.end method

.method public w6(Ljava/lang/String;)V
    .locals 29

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "renderMode"

    .line 6
    .line 7
    const-string v3, "alpha"

    .line 8
    .line 9
    const-string v4, "z"

    .line 10
    .line 11
    const-string v5, "h"

    .line 12
    .line 13
    const-string v6, "w"

    .line 14
    .line 15
    const-string v7, "y"

    .line 16
    .line 17
    const-string v8, "x"

    .line 18
    .line 19
    const-string v9, "id"

    .line 20
    .line 21
    const-string v10, "has"

    .line 22
    .line 23
    const-string v11, "conf"

    .line 24
    .line 25
    const-string v12, "mid"

    .line 26
    .line 27
    const-string v13, "bType"

    .line 28
    .line 29
    const-string v14, "ts"

    .line 30
    .line 31
    iget-object v15, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 32
    .line 33
    if-eqz v15, :cond_1c

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    goto/16 :goto_f

    .line 38
    .line 39
    :cond_0
    iget-object v15, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 40
    .line 41
    if-nez v15, :cond_1

    .line 42
    .line 43
    new-instance v15, Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 44
    .line 45
    invoke-direct {v15}, Lcom/momo/momortc/live/MMLiveTranscoding;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v15, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v15, v15, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 52
    .line 53
    invoke-interface {v15}, Ljava/util/Map;->clear()V

    .line 54
    .line 55
    .line 56
    :goto_0
    iget-object v15, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 57
    .line 58
    move-object/from16 v16, v2

    .line 59
    .line 60
    iget v2, v15, Ll/tow;->k:I

    .line 61
    .line 62
    move-object/from16 v17, v3

    .line 63
    .line 64
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 65
    .line 66
    if-lez v2, :cond_2

    .line 67
    .line 68
    move-object/from16 v18, v4

    .line 69
    .line 70
    move-object/from16 v19, v5

    .line 71
    .line 72
    int-to-double v4, v2

    .line 73
    iput-wide v4, v3, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 74
    .line 75
    iget v2, v15, Ll/tow;->l:I

    .line 76
    .line 77
    int-to-double v4, v2

    .line 78
    iput-wide v4, v3, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    move-object/from16 v18, v4

    .line 82
    .line 83
    move-object/from16 v19, v5

    .line 84
    .line 85
    iget v2, v15, Ll/tow;->s:I

    .line 86
    .line 87
    int-to-double v4, v2

    .line 88
    iput-wide v4, v3, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 89
    .line 90
    iget v2, v15, Ll/tow;->t:I

    .line 91
    .line 92
    int-to-double v4, v2

    .line 93
    iput-wide v4, v3, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 94
    .line 95
    :goto_1
    iget-boolean v2, v15, Ll/uow;->F0:Z

    .line 96
    .line 97
    const/4 v3, 0x1

    .line 98
    if-eqz v2, :cond_3

    .line 99
    .line 100
    invoke-virtual {v15}, Ll/uow;->d()I

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-ne v2, v3, :cond_3

    .line 105
    .line 106
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 107
    .line 108
    iget-wide v4, v2, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 109
    .line 110
    move-object v15, v6

    .line 111
    move-object/from16 v20, v7

    .line 112
    .line 113
    iget-wide v6, v2, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 114
    .line 115
    iput-wide v6, v2, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 116
    .line 117
    iput-wide v4, v2, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_3
    move-object v15, v6

    .line 121
    move-object/from16 v20, v7

    .line 122
    .line 123
    :goto_2
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 124
    .line 125
    iget-wide v4, v2, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 126
    .line 127
    const-wide/16 v6, 0x0

    .line 128
    .line 129
    cmpg-double v4, v4, v6

    .line 130
    .line 131
    if-lez v4, :cond_1c

    .line 132
    .line 133
    iget-wide v4, v2, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 134
    .line 135
    cmpg-double v2, v4, v6

    .line 136
    .line 137
    if-gtz v2, :cond_4

    .line 138
    .line 139
    goto/16 :goto_f

    .line 140
    .line 141
    :cond_4
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 142
    .line 143
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    if-eqz v4, :cond_5

    .line 151
    .line 152
    invoke-virtual {v2, v14}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    :cond_5
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->Y1()J

    .line 156
    .line 157
    .line 158
    move-result-wide v4

    .line 159
    invoke-virtual {v2, v14, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v4

    .line 166
    if-eqz v4, :cond_6

    .line 167
    .line 168
    invoke-virtual {v2, v13}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    :cond_6
    iget-object v4, v0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 172
    .line 173
    iget-wide v4, v4, Ll/wvx;->s:J

    .line 174
    .line 175
    invoke-virtual {v2, v13, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    .line 177
    .line 178
    goto :goto_3

    .line 179
    :catch_0
    const/4 v2, 0x0

    .line 180
    :goto_3
    if-eqz v2, :cond_7

    .line 181
    .line 182
    :try_start_1
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    :cond_7
    new-instance v2, Lorg/json/JSONObject;

    .line 187
    .line 188
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result v4
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 195
    const-string v5, ""

    .line 196
    .line 197
    if-eqz v4, :cond_8

    .line 198
    .line 199
    :try_start_2
    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    goto :goto_4

    .line 204
    :cond_8
    move-object v4, v5

    .line 205
    :goto_4
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 206
    .line 207
    .line 208
    move-result v12

    .line 209
    if-eqz v12, :cond_9

    .line 210
    .line 211
    goto/16 :goto_f

    .line 212
    .line 213
    :cond_9
    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 214
    .line 215
    .line 216
    move-result v12

    .line 217
    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    .line 218
    .line 219
    if-nez v12, :cond_b

    .line 220
    .line 221
    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v11

    .line 225
    if-nez v11, :cond_a

    .line 226
    .line 227
    goto/16 :goto_f

    .line 228
    .line 229
    :cond_a
    invoke-virtual {v2, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    if-eqz v2, :cond_c

    .line 234
    .line 235
    new-instance v10, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;

    .line 236
    .line 237
    invoke-direct {v10}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;-><init>()V

    .line 238
    .line 239
    .line 240
    iput-object v4, v10, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->uid:Ljava/lang/String;

    .line 241
    .line 242
    iput v3, v10, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->zOrder:I

    .line 243
    .line 244
    iput-wide v6, v10, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posx:D

    .line 245
    .line 246
    iput-wide v6, v10, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posy:D

    .line 247
    .line 248
    iget-object v11, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 249
    .line 250
    iget-wide v6, v11, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 251
    .line 252
    double-to-int v6, v6

    .line 253
    int-to-double v6, v6

    .line 254
    iput-wide v6, v10, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->width:D

    .line 255
    .line 256
    iget-wide v6, v11, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 257
    .line 258
    double-to-int v6, v6

    .line 259
    int-to-double v6, v6

    .line 260
    iput-wide v6, v10, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->height:D

    .line 261
    .line 262
    iput-wide v13, v10, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->alpha:D

    .line 263
    .line 264
    iget-object v6, v11, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 265
    .line 266
    invoke-interface {v6, v4, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    iget-object v4, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 270
    .line 271
    invoke-direct {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x5(Ljava/lang/String;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v6

    .line 275
    iput-object v6, v4, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingExtraInfo:Ljava/lang/String;

    .line 276
    .line 277
    goto :goto_5

    .line 278
    :cond_b
    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    :cond_c
    :goto_5
    if-nez v2, :cond_d

    .line 283
    .line 284
    goto/16 :goto_f

    .line 285
    .line 286
    :cond_d
    const/4 v4, 0x0

    .line 287
    :goto_6
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    .line 288
    .line 289
    .line 290
    move-result v6

    .line 291
    if-ge v4, v6, :cond_1b

    .line 292
    .line 293
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v6

    .line 297
    check-cast v6, Lorg/json/JSONObject;

    .line 298
    .line 299
    if-eqz v6, :cond_e

    .line 300
    .line 301
    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 302
    .line 303
    .line 304
    move-result v7

    .line 305
    if-eqz v7, :cond_e

    .line 306
    .line 307
    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v7

    .line 311
    goto :goto_7

    .line 312
    :cond_e
    move-object v7, v5

    .line 313
    :goto_7
    if-eqz v6, :cond_f

    .line 314
    .line 315
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 316
    .line 317
    .line 318
    move-result v10

    .line 319
    if-eqz v10, :cond_f

    .line 320
    .line 321
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 322
    .line 323
    .line 324
    move-result-wide v10

    .line 325
    goto :goto_8

    .line 326
    :cond_f
    const-wide/16 v10, 0x0

    .line 327
    .line 328
    :goto_8
    if-eqz v6, :cond_10

    .line 329
    .line 330
    move-object/from16 v12, v20

    .line 331
    .line 332
    invoke-virtual {v6, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 333
    .line 334
    .line 335
    move-result v20

    .line 336
    if-eqz v20, :cond_11

    .line 337
    .line 338
    invoke-virtual {v6, v12}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 339
    .line 340
    .line 341
    move-result-wide v21

    .line 342
    goto :goto_9

    .line 343
    :cond_10
    move-object/from16 v12, v20

    .line 344
    .line 345
    :cond_11
    const-wide/16 v21, 0x0

    .line 346
    .line 347
    :goto_9
    if-eqz v6, :cond_12

    .line 348
    .line 349
    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 350
    .line 351
    .line 352
    move-result v20

    .line 353
    if-eqz v20, :cond_12

    .line 354
    .line 355
    invoke-virtual {v6, v15}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 356
    .line 357
    .line 358
    move-result-wide v23

    .line 359
    goto :goto_a

    .line 360
    :cond_12
    move-wide/from16 v23, v13

    .line 361
    .line 362
    :goto_a
    if-eqz v6, :cond_13

    .line 363
    .line 364
    move/from16 v20, v3

    .line 365
    .line 366
    move-object/from16 v3, v19

    .line 367
    .line 368
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 369
    .line 370
    .line 371
    move-result v19

    .line 372
    if-eqz v19, :cond_14

    .line 373
    .line 374
    invoke-virtual {v6, v3}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 375
    .line 376
    .line 377
    move-result-wide v25

    .line 378
    goto :goto_b

    .line 379
    :cond_13
    move/from16 v20, v3

    .line 380
    .line 381
    move-object/from16 v3, v19

    .line 382
    .line 383
    :cond_14
    move-wide/from16 v25, v13

    .line 384
    .line 385
    :goto_b
    if-eqz v6, :cond_15

    .line 386
    .line 387
    move-object/from16 v13, v18

    .line 388
    .line 389
    invoke-virtual {v6, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 390
    .line 391
    .line 392
    move-result v14

    .line 393
    if-eqz v14, :cond_16

    .line 394
    .line 395
    invoke-virtual {v6, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 396
    .line 397
    .line 398
    move-result v14

    .line 399
    add-int/lit8 v14, v14, 0x1

    .line 400
    .line 401
    goto :goto_c

    .line 402
    :cond_15
    move-object/from16 v13, v18

    .line 403
    .line 404
    :cond_16
    move/from16 v14, v20

    .line 405
    .line 406
    :goto_c
    if-eqz v6, :cond_17

    .line 407
    .line 408
    move-object/from16 p1, v2

    .line 409
    .line 410
    move-object/from16 v2, v17

    .line 411
    .line 412
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 413
    .line 414
    .line 415
    move-result v17

    .line 416
    if-eqz v17, :cond_18

    .line 417
    .line 418
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 419
    .line 420
    .line 421
    goto :goto_d

    .line 422
    :cond_17
    move-object/from16 p1, v2

    .line 423
    .line 424
    move-object/from16 v2, v17

    .line 425
    .line 426
    :cond_18
    :goto_d
    if-eqz v6, :cond_19

    .line 427
    .line 428
    move-object/from16 v17, v2

    .line 429
    .line 430
    move-object/from16 v2, v16

    .line 431
    .line 432
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 433
    .line 434
    .line 435
    move-result v16

    .line 436
    if-eqz v16, :cond_1a

    .line 437
    .line 438
    invoke-virtual {v6, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    goto :goto_e

    .line 442
    :cond_19
    move-object/from16 v17, v2

    .line 443
    .line 444
    move-object/from16 v2, v16

    .line 445
    .line 446
    :cond_1a
    :goto_e
    new-instance v6, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;

    .line 447
    .line 448
    invoke-direct {v6}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;-><init>()V

    .line 449
    .line 450
    .line 451
    iput-object v7, v6, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->uid:Ljava/lang/String;

    .line 452
    .line 453
    iput v14, v6, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->zOrder:I

    .line 454
    .line 455
    move-object/from16 v16, v2

    .line 456
    .line 457
    move-object/from16 v19, v3

    .line 458
    .line 459
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 460
    .line 461
    iput-wide v2, v6, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->alpha:D

    .line 462
    .line 463
    iget-object v14, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 464
    .line 465
    iget-wide v2, v14, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 466
    .line 467
    mul-double/2addr v10, v2

    .line 468
    double-to-int v10, v10

    .line 469
    int-to-double v10, v10

    .line 470
    iput-wide v10, v6, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posx:D

    .line 471
    .line 472
    iget-wide v10, v14, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 473
    .line 474
    move-wide/from16 v27, v2

    .line 475
    .line 476
    mul-double v2, v10, v21

    .line 477
    .line 478
    double-to-int v2, v2

    .line 479
    int-to-double v2, v2

    .line 480
    iput-wide v2, v6, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posy:D

    .line 481
    .line 482
    mul-double v2, v27, v23

    .line 483
    .line 484
    double-to-int v2, v2

    .line 485
    int-to-double v2, v2

    .line 486
    iput-wide v2, v6, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->width:D

    .line 487
    .line 488
    mul-double v10, v10, v25

    .line 489
    .line 490
    double-to-int v2, v10

    .line 491
    int-to-double v2, v2

    .line 492
    iput-wide v2, v6, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->height:D

    .line 493
    .line 494
    iget-object v2, v14, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 495
    .line 496
    invoke-interface {v2, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    .line 498
    .line 499
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 500
    .line 501
    invoke-direct {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x5(Ljava/lang/String;)Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v3

    .line 505
    iput-object v3, v2, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingExtraInfo:Ljava/lang/String;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    .line 506
    .line 507
    add-int/lit8 v4, v4, 0x1

    .line 508
    .line 509
    move-object/from16 v2, p1

    .line 510
    .line 511
    move-object/from16 v18, v13

    .line 512
    .line 513
    move/from16 v3, v20

    .line 514
    .line 515
    const-wide/high16 v13, 0x3ff0000000000000L    # 1.0

    .line 516
    .line 517
    move-object/from16 v20, v12

    .line 518
    .line 519
    goto/16 :goto_6

    .line 520
    .line 521
    :cond_1b
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 522
    .line 523
    iget-object v1, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 524
    .line 525
    invoke-direct {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c5(Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    return-void

    .line 529
    :catch_1
    move-exception v0

    .line 530
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 531
    .line 532
    .line 533
    :cond_1c
    :goto_f
    return-void
.end method

.method public x1()J
    .locals 2

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->l1:I

    .line 2
    .line 3
    mul-int/lit16 p0, p0, 0x400

    .line 4
    .line 5
    int-to-long v0, p0

    .line 6
    return-wide v0
.end method

.method public x6(Ljava/lang/String;)V
    .locals 33

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "renderMode"

    .line 6
    .line 7
    const-string v3, "alpha"

    .line 8
    .line 9
    const-string v4, "z"

    .line 10
    .line 11
    const-string v5, "h"

    .line 12
    .line 13
    const-string v6, "w"

    .line 14
    .line 15
    const-string v7, "y"

    .line 16
    .line 17
    const-string v8, "x"

    .line 18
    .line 19
    const-string v9, "id"

    .line 20
    .line 21
    const-string v10, "has"

    .line 22
    .line 23
    const-string v11, "conf"

    .line 24
    .line 25
    const-string v12, "mid"

    .line 26
    .line 27
    iget-object v13, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 28
    .line 29
    if-eqz v13, :cond_14

    .line 30
    .line 31
    if-nez v1, :cond_0

    .line 32
    .line 33
    goto/16 :goto_c

    .line 34
    .line 35
    :cond_0
    iget-object v13, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 36
    .line 37
    if-nez v13, :cond_1

    .line 38
    .line 39
    new-instance v13, Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 40
    .line 41
    invoke-direct {v13}, Lcom/momo/momortc/live/MMLiveTranscoding;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v13, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-object v13, v13, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 48
    .line 49
    invoke-interface {v13}, Ljava/util/Map;->clear()V

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object v13, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 53
    .line 54
    iget-object v14, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 55
    .line 56
    iget v15, v14, Ll/tow;->k:I

    .line 57
    .line 58
    move-object/from16 v16, v2

    .line 59
    .line 60
    move-object/from16 v17, v3

    .line 61
    .line 62
    int-to-double v2, v15

    .line 63
    iput-wide v2, v13, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 64
    .line 65
    iget v14, v14, Ll/tow;->l:I

    .line 66
    .line 67
    int-to-double v14, v14

    .line 68
    iput-wide v14, v13, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 69
    .line 70
    move-wide/from16 v18, v2

    .line 71
    .line 72
    const/16 v2, 0xf

    .line 73
    .line 74
    iput v2, v13, Lcom/momo/momortc/live/MMLiveTranscoding;->videoGop:I

    .line 75
    .line 76
    const-wide/16 v2, 0x0

    .line 77
    .line 78
    cmpg-double v13, v18, v2

    .line 79
    .line 80
    if-lez v13, :cond_14

    .line 81
    .line 82
    cmpg-double v13, v14, v2

    .line 83
    .line 84
    if-gtz v13, :cond_2

    .line 85
    .line 86
    goto/16 :goto_c

    .line 87
    .line 88
    :cond_2
    :try_start_0
    new-instance v13, Lorg/json/JSONObject;

    .line 89
    .line 90
    invoke-direct {v13, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v13, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 94
    .line 95
    .line 96
    move-result v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    const-string v14, ""

    .line 98
    .line 99
    if-eqz v1, :cond_3

    .line 100
    .line 101
    :try_start_1
    invoke-virtual {v13, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    goto :goto_1

    .line 106
    :cond_3
    move-object v1, v14

    .line 107
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 108
    .line 109
    .line 110
    move-result v12

    .line 111
    if-eqz v12, :cond_4

    .line 112
    .line 113
    goto/16 :goto_c

    .line 114
    .line 115
    :cond_4
    invoke-virtual {v13, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 116
    .line 117
    .line 118
    move-result v12

    .line 119
    move-wide/from16 v18, v2

    .line 120
    .line 121
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 122
    .line 123
    const/4 v15, 0x1

    .line 124
    if-nez v12, :cond_6

    .line 125
    .line 126
    invoke-virtual {v13, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v11

    .line 130
    if-nez v11, :cond_5

    .line 131
    .line 132
    goto/16 :goto_c

    .line 133
    .line 134
    :cond_5
    invoke-virtual {v13, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 135
    .line 136
    .line 137
    move-result-object v10

    .line 138
    if-eqz v10, :cond_7

    .line 139
    .line 140
    new-instance v11, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;

    .line 141
    .line 142
    invoke-direct {v11}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;-><init>()V

    .line 143
    .line 144
    .line 145
    iput v15, v11, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->zOrder:I

    .line 146
    .line 147
    iput-wide v2, v11, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->alpha:D

    .line 148
    .line 149
    iput-object v1, v11, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->uid:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v12, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 152
    .line 153
    iget-wide v2, v12, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 154
    .line 155
    const-wide v20, 0x3f9758e220000000L    # 0.02280000038444996

    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    move-wide/from16 v22, v2

    .line 161
    .line 162
    mul-double v2, v22, v20

    .line 163
    .line 164
    double-to-int v2, v2

    .line 165
    int-to-double v2, v2

    .line 166
    iput-wide v2, v11, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posx:D

    .line 167
    .line 168
    iget-wide v2, v12, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 169
    .line 170
    move-wide/from16 v20, v2

    .line 171
    .line 172
    mul-double v2, v20, v18

    .line 173
    .line 174
    double-to-int v2, v2

    .line 175
    int-to-double v2, v2

    .line 176
    iput-wide v2, v11, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posy:D

    .line 177
    .line 178
    const-wide v2, 0x3fd0bac720000000L    # 0.2614000141620636

    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    mul-double v2, v2, v22

    .line 184
    .line 185
    double-to-int v2, v2

    .line 186
    int-to-double v2, v2

    .line 187
    iput-wide v2, v11, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->width:D

    .line 188
    .line 189
    const-wide v2, 0x3fd000a7c0000000L    # 0.2500399947166443

    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    mul-double v2, v2, v20

    .line 195
    .line 196
    double-to-int v2, v2

    .line 197
    int-to-double v2, v2

    .line 198
    iput-wide v2, v11, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->height:D

    .line 199
    .line 200
    iget-object v2, v12, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 201
    .line 202
    invoke-interface {v2, v1, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 206
    .line 207
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D1:Ljava/lang/String;

    .line 208
    .line 209
    invoke-direct {v0, v2}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x5(Ljava/lang/String;)Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    iput-object v2, v1, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingExtraInfo:Ljava/lang/String;

    .line 214
    .line 215
    goto :goto_2

    .line 216
    :cond_6
    invoke-virtual {v13, v11}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 217
    .line 218
    .line 219
    move-result-object v10

    .line 220
    :cond_7
    :goto_2
    if-eqz v10, :cond_14

    .line 221
    .line 222
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-nez v1, :cond_8

    .line 227
    .line 228
    goto/16 :goto_c

    .line 229
    .line 230
    :cond_8
    const/4 v1, 0x0

    .line 231
    :goto_3
    invoke-virtual {v10}, Lorg/json/JSONArray;->length()I

    .line 232
    .line 233
    .line 234
    move-result v2

    .line 235
    if-ge v1, v2, :cond_13

    .line 236
    .line 237
    invoke-virtual {v10, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    check-cast v2, Lorg/json/JSONObject;

    .line 242
    .line 243
    if-eqz v2, :cond_9

    .line 244
    .line 245
    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v3

    .line 249
    if-eqz v3, :cond_9

    .line 250
    .line 251
    invoke-virtual {v2, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v3

    .line 255
    goto :goto_4

    .line 256
    :cond_9
    move-object v3, v14

    .line 257
    :goto_4
    if-eqz v2, :cond_a

    .line 258
    .line 259
    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 260
    .line 261
    .line 262
    move-result v11

    .line 263
    if-eqz v11, :cond_a

    .line 264
    .line 265
    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 266
    .line 267
    .line 268
    move-result-wide v11

    .line 269
    goto :goto_5

    .line 270
    :cond_a
    move-wide/from16 v11, v18

    .line 271
    .line 272
    :goto_5
    if-eqz v2, :cond_b

    .line 273
    .line 274
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 275
    .line 276
    .line 277
    move-result v13

    .line 278
    if-eqz v13, :cond_b

    .line 279
    .line 280
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 281
    .line 282
    .line 283
    move-result-wide v20

    .line 284
    goto :goto_6

    .line 285
    :cond_b
    move-wide/from16 v20, v18

    .line 286
    .line 287
    :goto_6
    if-eqz v2, :cond_c

    .line 288
    .line 289
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 290
    .line 291
    .line 292
    move-result v13

    .line 293
    if-eqz v13, :cond_c

    .line 294
    .line 295
    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 296
    .line 297
    .line 298
    move-result-wide v22

    .line 299
    goto :goto_7

    .line 300
    :cond_c
    const-wide/high16 v22, 0x3ff0000000000000L    # 1.0

    .line 301
    .line 302
    :goto_7
    if-eqz v2, :cond_d

    .line 303
    .line 304
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 305
    .line 306
    .line 307
    move-result v13

    .line 308
    if-eqz v13, :cond_d

    .line 309
    .line 310
    invoke-virtual {v2, v5}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 311
    .line 312
    .line 313
    move-result-wide v24

    .line 314
    goto :goto_8

    .line 315
    :cond_d
    const-wide/high16 v24, 0x3ff0000000000000L    # 1.0

    .line 316
    .line 317
    :goto_8
    if-eqz v2, :cond_e

    .line 318
    .line 319
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 320
    .line 321
    .line 322
    move-result v13

    .line 323
    if-eqz v13, :cond_e

    .line 324
    .line 325
    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 326
    .line 327
    .line 328
    move-result v13

    .line 329
    add-int/2addr v13, v15

    .line 330
    goto :goto_9

    .line 331
    :cond_e
    move v13, v15

    .line 332
    :goto_9
    if-eqz v2, :cond_f

    .line 333
    .line 334
    move-object/from16 v15, v17

    .line 335
    .line 336
    invoke-virtual {v2, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 337
    .line 338
    .line 339
    move-result v17

    .line 340
    if-eqz v17, :cond_10

    .line 341
    .line 342
    invoke-virtual {v2, v15}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 343
    .line 344
    .line 345
    move-result-wide v26

    .line 346
    move-object/from16 v17, v4

    .line 347
    .line 348
    move-wide/from16 v31, v26

    .line 349
    .line 350
    move-object/from16 v26, v5

    .line 351
    .line 352
    move-wide/from16 v4, v31

    .line 353
    .line 354
    goto :goto_a

    .line 355
    :cond_f
    move-object/from16 v15, v17

    .line 356
    .line 357
    :cond_10
    move-object/from16 v17, v4

    .line 358
    .line 359
    move-object/from16 v26, v5

    .line 360
    .line 361
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 362
    .line 363
    :goto_a
    if-eqz v2, :cond_11

    .line 364
    .line 365
    move/from16 v27, v1

    .line 366
    .line 367
    move-object/from16 v1, v16

    .line 368
    .line 369
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 370
    .line 371
    .line 372
    move-result v16

    .line 373
    if-eqz v16, :cond_12

    .line 374
    .line 375
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    goto :goto_b

    .line 379
    :cond_11
    move/from16 v27, v1

    .line 380
    .line 381
    move-object/from16 v1, v16

    .line 382
    .line 383
    :cond_12
    :goto_b
    new-instance v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;

    .line 384
    .line 385
    invoke-direct {v2}, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;-><init>()V

    .line 386
    .line 387
    .line 388
    iput-object v3, v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->uid:Ljava/lang/String;

    .line 389
    .line 390
    iput v13, v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->zOrder:I

    .line 391
    .line 392
    iget-object v13, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 393
    .line 394
    move-object/from16 v16, v6

    .line 395
    .line 396
    move-object/from16 v28, v7

    .line 397
    .line 398
    iget-wide v6, v13, Lcom/momo/momortc/live/MMLiveTranscoding;->width:D

    .line 399
    .line 400
    mul-double/2addr v11, v6

    .line 401
    double-to-int v11, v11

    .line 402
    int-to-double v11, v11

    .line 403
    iput-wide v11, v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posx:D

    .line 404
    .line 405
    iget-wide v11, v13, Lcom/momo/momortc/live/MMLiveTranscoding;->height:D

    .line 406
    .line 407
    move-wide/from16 v29, v6

    .line 408
    .line 409
    mul-double v6, v11, v20

    .line 410
    .line 411
    double-to-int v6, v6

    .line 412
    int-to-double v6, v6

    .line 413
    iput-wide v6, v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->posy:D

    .line 414
    .line 415
    mul-double v6, v29, v22

    .line 416
    .line 417
    double-to-int v6, v6

    .line 418
    int-to-double v6, v6

    .line 419
    iput-wide v6, v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->width:D

    .line 420
    .line 421
    mul-double v11, v11, v24

    .line 422
    .line 423
    double-to-int v6, v11

    .line 424
    int-to-double v6, v6

    .line 425
    iput-wide v6, v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->height:D

    .line 426
    .line 427
    double-to-float v4, v4

    .line 428
    float-to-double v4, v4

    .line 429
    iput-wide v4, v2, Lcom/momo/momortc/live/MMLiveTranscoding$MMLiveTranscodingUser;->alpha:D

    .line 430
    .line 431
    iget-object v4, v13, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingUserMap:Ljava/util/Map;

    .line 432
    .line 433
    invoke-interface {v4, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 434
    .line 435
    .line 436
    iget-object v2, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->n2:Lcom/momo/momortc/live/MMLiveTranscoding;

    .line 437
    .line 438
    iget-object v3, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->D1:Ljava/lang/String;

    .line 439
    .line 440
    invoke-direct {v0, v3}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->x5(Ljava/lang/String;)Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    iput-object v3, v2, Lcom/momo/momortc/live/MMLiveTranscoding;->transcodingExtraInfo:Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 445
    .line 446
    add-int/lit8 v2, v27, 0x1

    .line 447
    .line 448
    move-object/from16 v6, v16

    .line 449
    .line 450
    move-object/from16 v4, v17

    .line 451
    .line 452
    move-object/from16 v5, v26

    .line 453
    .line 454
    move-object/from16 v7, v28

    .line 455
    .line 456
    move-object/from16 v16, v1

    .line 457
    .line 458
    move v1, v2

    .line 459
    move-object/from16 v17, v15

    .line 460
    .line 461
    const/4 v15, 0x1

    .line 462
    goto/16 :goto_3

    .line 463
    .line 464
    :cond_13
    iget-object v1, v0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->p1:Ll/ror;

    .line 465
    .line 466
    iget-object v1, v1, Ll/uow;->v0:Ljava/lang/String;

    .line 467
    .line 468
    invoke-direct {v0, v1}, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->c5(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    return-void

    .line 472
    :catch_0
    move-exception v0

    .line 473
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 474
    .line 475
    .line 476
    :cond_14
    :goto_c
    return-void
.end method

.method public y(II)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    int-to-long v0, p1

    .line 6
    int-to-long p1, p2

    .line 7
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/momo/momortc/MMRtcEngine;->enableAudioVolumeIndication(JJ)I

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public y0(III)V
    .locals 0

    .line 1
    return-void
.end method

.method public y5()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->j1:F

    .line 2
    .line 3
    return p0
.end method

.method public y6(F)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p1, v0

    .line 3
    .line 4
    if-gtz v1, :cond_0

    .line 5
    .line 6
    move p1, v0

    .line 7
    :cond_0
    const v0, 0x3fe66666    # 1.8f

    .line 8
    .line 9
    .line 10
    mul-float/2addr p1, v0

    .line 11
    iput p1, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->i1:F

    .line 12
    .line 13
    iget-object v0, p0, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->H:Ll/wvx;

    .line 14
    .line 15
    iput p1, v0, Ll/wvx;->H0:F

    .line 16
    .line 17
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/high16 v0, 0x42c80000    # 100.0f

    .line 22
    .line 23
    mul-float/2addr p1, v0

    .line 24
    float-to-int p1, p1

    .line 25
    int-to-long v0, p1

    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/momo/momortc/MMRtcEngine;->adjustRecordingSignalVolume(J)I

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public z5()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/piplineext/codec/MoMoRtcPushFilter;->U:Lcom/momo/momortc/MMRtcEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/momo/momortc/MMRtcEngine;->getAudioMixingDuration()J

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

.method public z6(ZI)V
    .locals 0

    .line 1
    return-void
.end method
