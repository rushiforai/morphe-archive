.class public Ll/pbl0;
.super Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;
.source "SourceFile"


# instance fields
.field public final f:Ll/fcl0;

.field public g:Ll/ncl0;

.field public h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

.field public i:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

.field public final j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/fcl0;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/obl0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/obl0;-><init>(Ll/pbl0;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pbl0;->j:Ll/y20;

    .line 10
    .line 11
    iput-object p1, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic c1(Ll/pbl0;Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pbl0;->m1(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;)V

    return-void
.end method

.method public static synthetic d1([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x21c

    .line 3
    .line 4
    aput v1, p0, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/16 v1, 0x3c0

    .line 8
    .line 9
    aput v1, p0, v0

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e1([I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/16 v1, 0x1e0

    .line 3
    .line 4
    aput v1, p0, v0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/16 v1, 0x280

    .line 8
    .line 9
    aput v1, p0, v0

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public B0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/eas;->B0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 5
    .line 6
    iget-object v0, p0, Ll/fcl0;->m:Ll/aam;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-interface {v0, p0}, Ll/aam;->onTokenPrivilegeWillExpire(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fcl0;->m:Ll/aam;

    .line 7
    .line 8
    invoke-interface {p0, p1, p2}, Ll/aam;->U(Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public I(JZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->I(JZ)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fcl0;->m:Ll/aam;

    .line 7
    .line 8
    invoke-interface {p0, p1, p2, p3}, Ll/aam;->I(JZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->S(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;II)V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x3f3

    .line 5
    .line 6
    if-ne p3, p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/16 p1, 0x6d

    .line 10
    .line 11
    if-ne p3, p1, :cond_1

    .line 12
    .line 13
    :goto_0
    return-void

    .line 14
    :cond_1
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 15
    .line 16
    iget-object p0, p0, Ll/fcl0;->m:Ll/aam;

    .line 17
    .line 18
    invoke-interface {p0, p3}, Ll/aam;->Q1(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public U0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->U0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 5
    .line 6
    iget-object p0, p0, Ll/v1f;->d:Ll/q410;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/q410;->U0()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public W0()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->W0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pbl0;->g:Ll/ncl0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ncl0;->b()V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 10
    .line 11
    iget-object v0, v0, Ll/v1f;->h:Ll/q510;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/q510;->c()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 17
    .line 18
    iget-object p0, p0, Ll/v1f;->b:Ll/v6m;

    .line 19
    .line 20
    invoke-interface {p0}, Ll/v6m;->a()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public b(JI)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->b(JI)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pbl0;->g:Ll/ncl0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ncl0;->f()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/fcl0;->m:Ll/aam;

    .line 12
    .line 13
    invoke-interface {p0, p1, p2, p3}, Ll/aam;->b(JI)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public b1()I
    .locals 3

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->b1()I

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/pbl0;->k1()Ll/ncl0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/pbl0;->g:Ll/ncl0;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 11
    .line 12
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Ll/q410;->Y0(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 19
    .line 20
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 21
    .line 22
    iget-object v2, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 23
    .line 24
    iget-boolean v2, v2, Ll/fcl0;->l:Z

    .line 25
    .line 26
    xor-int/2addr v1, v2

    .line 27
    invoke-virtual {v0, v1}, Ll/q410;->N(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 31
    .line 32
    iget-object v0, v0, Ll/v1f;->h:Ll/q510;

    .line 33
    .line 34
    iget-object v1, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 35
    .line 36
    iget-object v1, v1, Ll/fcl0;->f:Landroid/widget/FrameLayout;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/q510;->b(Landroid/widget/FrameLayout;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 42
    .line 43
    iget-object v0, v0, Ll/v1f;->h:Ll/q510;

    .line 44
    .line 45
    iget-object v1, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 46
    .line 47
    iget-object v1, v1, Ll/fcl0;->e:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ll/q510;->k(Landroid/widget/FrameLayout;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 53
    .line 54
    iget-object v0, v0, Ll/v1f;->h:Ll/q510;

    .line 55
    .line 56
    iget-object v1, p0, Ll/pbl0;->g:Ll/ncl0;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Ll/q510;->d(Ll/p510;)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 62
    .line 63
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->T0()Ll/cgu;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Ll/q410;->c1(Ll/cgu;)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 73
    .line 74
    iget-boolean v0, v0, Ll/fcl0;->l:Z

    .line 75
    .line 76
    if-eqz v0, :cond_0

    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 79
    .line 80
    iget-object v0, v0, Ll/v1f;->c:Ll/a210;

    .line 81
    .line 82
    iget-object v1, p0, Ll/pbl0;->j:Ll/y20;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ll/a210;->d1(Ll/y20;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 88
    .line 89
    iget-object v1, v0, Ll/v1f;->c:Ll/a210;

    .line 90
    .line 91
    iget-object v0, v0, Ll/v1f;->a:Landroid/content/Context;

    .line 92
    .line 93
    iget-object v2, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 94
    .line 95
    iget-object v2, v2, Ll/fcl0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 96
    .line 97
    invoke-virtual {v1, v0, v2}, Ll/a210;->F0(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 101
    .line 102
    iget-object p0, p0, Ll/v1f;->h:Ll/q510;

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/q510;->a()V

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_0
    invoke-virtual {p0}, Ll/pbl0;->h1()V

    .line 109
    .line 110
    .line 111
    :goto_0
    const-string p0, "videoChat"

    .line 112
    .line 113
    const-string v0, "start video chat motion"

    .line 114
    .line 115
    invoke-static {p0, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    const/4 p0, 0x0

    .line 119
    return p0
.end method

.method public d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fcl0;->m:Ll/aam;

    .line 7
    .line 8
    invoke-interface {p0, p1, p2, p3}, Ll/aam;->S1(Ljava/lang/String;J)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e(JZ)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->e(JZ)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pbl0;->g:Ll/ncl0;

    .line 5
    .line 6
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    xor-int/lit8 v2, p3, 0x1

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/ncl0;->g(Ljava/lang/Long;Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 16
    .line 17
    iget-object p0, p0, Ll/fcl0;->m:Ll/aam;

    .line 18
    .line 19
    invoke-interface {p0, p1, p2, p3}, Ll/aam;->e(JZ)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public f1()Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->role:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 9
    .line 10
    iget-object v1, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 11
    .line 12
    invoke-virtual {p0, v1, v0}, Ll/pbl0;->n1(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;)V

    .line 13
    .line 14
    .line 15
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userId:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 24
    .line 25
    iget-object v1, p0, Ll/fcl0;->i:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channel:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v1, p0, Ll/fcl0;->g:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->confId:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v1, p0, Ll/fcl0;->h:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->channelKey:Ljava/lang/String;

    .line 36
    .line 37
    iget-object p0, p0, Ll/fcl0;->k:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->userSig:Ljava/lang/String;

    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    iput-boolean p0, v0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->isHost:Z

    .line 43
    .line 44
    return-object v0
.end method

.method public g1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 3

    .line 1
    invoke-virtual {p0, p1}, Ll/pbl0;->l1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 10
    .line 11
    .line 12
    const v1, 0xfa00

    .line 13
    .line 14
    .line 15
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 19
    .line 20
    const v1, 0xac44

    .line 21
    .line 22
    .line 23
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 26
    .line 27
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->fps:I

    .line 28
    .line 29
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 30
    .line 31
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->width:I

    .line 32
    .line 33
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 34
    .line 35
    iget v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->height:I

    .line 36
    .line 37
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 38
    .line 39
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->bitRate:I

    .line 40
    .line 41
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 42
    .line 43
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->videoCodecType:I

    .line 44
    .line 45
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoCodecType:I

    .line 46
    .line 47
    iget-object p1, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->c:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 56
    .line 57
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->b:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 66
    .line 67
    return-object v0

    .line 68
    :cond_0
    invoke-virtual {p0}, Ll/pbl0;->i1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method public h1()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 2
    .line 3
    iget-object v0, v0, Ll/v1f;->c:Ll/a210;

    .line 4
    .line 5
    iget-object v1, p0, Ll/pbl0;->j:Ll/y20;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/a210;->k1(Ll/y20;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 11
    .line 12
    iget-object v0, v0, Ll/fcl0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->mixEncode:Lcom/p1/mobile/putong/live/base/data/BLiveMixEncode;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/pbl0;->j1(Lcom/p1/mobile/putong/live/base/data/BLiveMixEncode;)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/pbl0;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 21
    .line 22
    iget-object v0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 23
    .line 24
    iget-object v0, v0, Ll/fcl0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/pbl0;->g1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/pbl0;->i:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 33
    .line 34
    iget-object v1, v1, Ll/v1f;->d:Ll/q410;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/pbl0;->f1()Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, p0, Ll/pbl0;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 41
    .line 42
    invoke-virtual {v1, v0, v2, v3}, Ll/q410;->S0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 46
    .line 47
    iget-boolean v0, v0, Ll/fcl0;->l:Z

    .line 48
    .line 49
    xor-int/lit8 v0, v0, 0x1

    .line 50
    .line 51
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/pbl0;->o1(Ljava/lang/Boolean;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final i1()Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 4

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    const v1, 0xfa00

    .line 7
    .line 8
    .line 9
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 13
    .line 14
    const v1, 0xac44

    .line 15
    .line 16
    .line 17
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 18
    .line 19
    const/16 v1, 0x14

    .line 20
    .line 21
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 22
    .line 23
    const/16 v1, 0x21c

    .line 24
    .line 25
    const/16 v2, 0x3c0

    .line 26
    .line 27
    filled-new-array {v1, v2}, [I

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/mbl0;

    .line 32
    .line 33
    invoke-direct {v2, v1}, Ll/mbl0;-><init>([I)V

    .line 34
    .line 35
    .line 36
    new-instance v3, Ll/nbl0;

    .line 37
    .line 38
    invoke-direct {v3, v1}, Ll/nbl0;-><init>([I)V

    .line 39
    .line 40
    .line 41
    invoke-static {v2, v3}, Ll/m210;->a(Ll/x20;Ll/x20;)V

    .line 42
    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    aget v2, v1, v2

    .line 46
    .line 47
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 48
    .line 49
    const/4 v2, 0x1

    .line 50
    aget v1, v1, v2

    .line 51
    .line 52
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 53
    .line 54
    const v1, 0x124f80

    .line 55
    .line 56
    .line 57
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 58
    .line 59
    iget-object v1, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 60
    .line 61
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->c:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 68
    .line 69
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->b:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 78
    .line 79
    return-object v0
.end method

.method public j1(Lcom/p1/mobile/putong/live/base/data/BLiveMixEncode;)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;
    .locals 0

    .line 1
    new-instance p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public k1()Ll/ncl0;
    .locals 1

    .line 1
    new-instance p0, Ll/ncl0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, v0}, Ll/ncl0;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public final l1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->capture:Lcom/p1/mobile/putong/live/base/data/BLiveCapture;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCapture;->isValid()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->isValid()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public final synthetic m1(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;->ACTION_AFTER_PREVIEW:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/momoengine/CoreEngineAction;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/pbl0;->h1()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n1(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;)V
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "momo"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfMM:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 12
    .line 13
    iput-object p0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->d:Ljava/lang/String;

    .line 17
    .line 18
    const-string p1, "volcengine"

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfVolc:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 27
    .line 28
    iput-object p0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;->MMLiveTypeConfAG:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 32
    .line 33
    iput-object p0, p2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->linkType:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;

    .line 34
    .line 35
    return-void
.end method

.method public o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/fcl0;->m:Ll/aam;

    .line 7
    .line 8
    invoke-interface {p0, p1, p2, p3}, Ll/aam;->H(JI)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public o1(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "sdk setVideoMute:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 21
    .line 22
    iget-boolean v0, v0, Ll/fcl0;->l:Z

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 28
    .line 29
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    invoke-virtual {v0, v1}, Ll/q410;->N(Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    iget-object p1, v0, Ll/v1f;->c:Ll/a210;

    .line 47
    .line 48
    invoke-virtual {p1}, Ll/a210;->a()V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 52
    .line 53
    iget-object p0, p0, Ll/v1f;->h:Ll/q510;

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/q510;->c()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    iget-object p1, v0, Ll/v1f;->h:Ll/q510;

    .line 60
    .line 61
    iget-object v0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 62
    .line 63
    iget-object v0, v0, Ll/fcl0;->f:Landroid/widget/FrameLayout;

    .line 64
    .line 65
    invoke-virtual {p1, v0}, Ll/q510;->b(Landroid/widget/FrameLayout;)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 69
    .line 70
    iget-object v0, p1, Ll/v1f;->c:Ll/a210;

    .line 71
    .line 72
    iget-object p1, p1, Ll/v1f;->a:Landroid/content/Context;

    .line 73
    .line 74
    iget-object v1, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 75
    .line 76
    iget-object v1, v1, Ll/fcl0;->n:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 77
    .line 78
    invoke-virtual {v0, p1, v1}, Ll/a210;->F0(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 82
    .line 83
    iget-object p0, p0, Ll/v1f;->h:Ll/q510;

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/q510;->a()V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public x0(JII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->x0(JII)V

    .line 2
    .line 3
    .line 4
    const-string p0, "videoChat"

    .line 5
    .line 6
    const-string p1, "onReceivedFirstVideoFrame"

    .line 7
    .line 8
    invoke-static {p0, p1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public z0(JLandroid/view/SurfaceView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->z0(JLandroid/view/SurfaceView;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/pbl0;->g:Ll/ncl0;

    .line 5
    .line 6
    invoke-virtual {v0, p1, p2, p3}, Ll/ncl0;->e(JLandroid/view/SurfaceView;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/pbl0;->f:Ll/fcl0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/fcl0;->m:Ll/aam;

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Ll/aam;->a1(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
