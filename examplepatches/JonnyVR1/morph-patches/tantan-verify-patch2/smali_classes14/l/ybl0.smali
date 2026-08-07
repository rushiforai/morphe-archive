.class public Ll/ybl0;
.super Ll/pbl0;
.source "SourceFile"


# instance fields
.field public final k:Ll/fcl0;

.field public l:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/fcl0;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/pbl0;-><init>(Ll/fcl0;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ybl0;->l:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ybl0;->k:Ll/fcl0;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic p1(Ll/ybl0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ybl0;->s1(Ljava/lang/String;)V

    return-void
.end method

.method public static r1(Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;)Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;
    .locals 1

    .line 1
    instance-of v0, p0, Ll/fcl0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ybl0;

    .line 6
    .line 7
    check-cast p0, Ll/fcl0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ybl0;-><init>(Ll/fcl0;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    sget-object p0, Ll/s610;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;

    .line 14
    .line 15
    return-object p0
.end method

.method private w1()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pbl0;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/pbl0;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/ybl0;->l:Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/xbl0;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/xbl0;-><init>(Ll/ybl0;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 33
    .line 34
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 35
    .line 36
    iget-object v1, p0, Ll/pbl0;->i:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ll/q410;->a1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 42
    .line 43
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 44
    .line 45
    iget-object v1, p0, Ll/pbl0;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/q410;->Z0(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 48
    .line 49
    .line 50
    new-instance v0, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v1, "updateCanvasAndVideoResolution sei = "

    .line 53
    .line 54
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/pbl0;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 58
    .line 59
    invoke-virtual {p0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

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
    const-string v0, "videoChat"

    .line 71
    .line 72
    invoke-static {v0, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method


# virtual methods
.method public C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/pbl0;->C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ll/ybl0;->t1(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/pbl0;->d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(JZ)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/pbl0;->e(JZ)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Ll/ybl0;->x1(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f1()Lcom/immomo/momomediaext/utils/MMLiveRoomParams;
    .locals 1

    .line 1
    invoke-super {p0}, Ll/pbl0;->f1()Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/immomo/momomediaext/utils/MMLiveRoomParams;->isHost:Z

    .line 7
    .line 8
    return-object p0
.end method

.method public g1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/pbl0;->g1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->pushUrl:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->pushUrl:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p1, p0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 16
    .line 17
    :cond_0
    return-object p0
.end method

.method public j1(Lcom/p1/mobile/putong/live/base/data/BLiveMixEncode;)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;
    .locals 8

    .line 1
    new-instance v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    invoke-direct {v7}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMixEncode;->width:I

    .line 7
    .line 8
    iput v1, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 9
    .line 10
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMixEncode;->height:I

    .line 11
    .line 12
    iput v1, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 13
    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMixEncode;->bitRate:I

    .line 15
    .line 16
    iput v0, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoBitrate:I

    .line 17
    .line 18
    new-instance v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 19
    .line 20
    invoke-direct {v1}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 21
    .line 22
    .line 23
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 30
    .line 31
    const/4 v5, 0x0

    .line 32
    const/4 v6, 0x1

    .line 33
    const/high16 v2, 0x3f800000    # 1.0f

    .line 34
    .line 35
    const/high16 v3, 0x3f800000    # 1.0f

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    move-object v0, p0

    .line 39
    invoke-virtual/range {v0 .. v6}, Ll/ybl0;->u1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFFI)V

    .line 40
    .line 41
    .line 42
    iget-object v2, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v2, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ll/ybl0;->l:Ljava/util/HashMap;

    .line 53
    .line 54
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    new-instance v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 66
    .line 67
    invoke-direct {v1}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 68
    .line 69
    .line 70
    iget-object v2, p0, Ll/ybl0;->k:Ll/fcl0;

    .line 71
    .line 72
    iget-object v2, v2, Ll/fcl0;->j:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v2, v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 75
    .line 76
    const/4 v6, 0x2

    .line 77
    const v2, 0x3b449ba6    # 0.003f

    .line 78
    .line 79
    .line 80
    const v3, 0x3b449ba6    # 0.003f

    .line 81
    .line 82
    .line 83
    invoke-virtual/range {v0 .. v6}, Ll/ybl0;->u1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFFI)V

    .line 84
    .line 85
    .line 86
    iget-object v2, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 87
    .line 88
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    iget-object v2, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Ll/ybl0;->l:Ljava/util/HashMap;

    .line 97
    .line 98
    iget-object v2, p0, Ll/ybl0;->k:Ll/fcl0;

    .line 99
    .line 100
    iget-object v2, v2, Ll/fcl0;->j:Ljava/lang/String;

    .line 101
    .line 102
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 103
    .line 104
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/ybl0;->k:Ll/fcl0;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/MotionParams;->c:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    iput v0, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 116
    .line 117
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 118
    .line 119
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->userid:Ljava/lang/String;

    .line 124
    .line 125
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    iput-object v0, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {}, Ll/pzi0;->o()J

    .line 134
    .line 135
    .line 136
    move-result-wide v0

    .line 137
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, v7, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->inv:Ljava/lang/String;

    .line 142
    .line 143
    return-object v7
.end method

.method public k1()Ll/ncl0;
    .locals 1

    .line 1
    new-instance p0, Ll/ncl0;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-direct {p0, v0}, Ll/ncl0;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/pbl0;->o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Ll/ybl0;->t1(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final q1(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ybl0;->l:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ll/ybl0;->w1()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic s1(Ljava/lang/String;)V
    .locals 7

    .line 1
    new-instance v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 2
    .line 3
    invoke-direct {v1}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, v1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v0, p0, Ll/ybl0;->k:Ll/fcl0;

    .line 13
    .line 14
    iget-boolean v0, v0, Ll/fcl0;->l:Z

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    const/4 v5, 0x0

    .line 35
    const/4 v6, 0x1

    .line 36
    const/high16 v2, 0x3f800000    # 1.0f

    .line 37
    .line 38
    const/high16 v3, 0x3f800000    # 1.0f

    .line 39
    .line 40
    const/4 v4, 0x0

    .line 41
    move-object v0, p0

    .line 42
    invoke-virtual/range {v0 .. v6}, Ll/ybl0;->u1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFFI)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move-object v0, p0

    .line 47
    iget-object p0, v0, Ll/ybl0;->l:Ljava/util/HashMap;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_1

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    const/4 v6, 0x2

    .line 63
    const v2, 0x3b449ba6    # 0.003f

    .line 64
    .line 65
    .line 66
    const v3, 0x3b449ba6    # 0.003f

    .line 67
    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    invoke-virtual/range {v0 .. v6}, Ll/ybl0;->u1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFFI)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    const v5, 0x3d89374c    # 0.067f

    .line 75
    .line 76
    .line 77
    const/4 v6, 0x2

    .line 78
    const v2, 0x3e72b021    # 0.237f

    .line 79
    .line 80
    .line 81
    const v3, 0x3e1fbe77    # 0.156f

    .line 82
    .line 83
    .line 84
    const v4, 0x3f39999a    # 0.725f

    .line 85
    .line 86
    .line 87
    invoke-virtual/range {v0 .. v6}, Ll/ybl0;->u1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFFI)V

    .line 88
    .line 89
    .line 90
    :goto_0
    iget-object p0, v0, Ll/pbl0;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 91
    .line 92
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    iget-object p0, v0, Ll/pbl0;->h:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public final t1(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ybl0;->l:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/ybl0;->w1()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final u1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;FFFFI)V
    .locals 0

    .line 1
    iput p2, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 2
    .line 3
    iput p3, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 4
    .line 5
    iput p4, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->x:F

    .line 6
    .line 7
    iput p5, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->y:F

    .line 8
    .line 9
    iput p6, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->z:I

    .line 10
    .line 11
    new-instance p0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string p2, "member:"

    .line 14
    .line 15
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "videoChat"

    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public v1(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "anchor push setRestartWithURL:"

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
    const-string v1, "videoChat"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/sdk/base/b;->d:Ll/v1f;

    .line 21
    .line 22
    iget-object p0, p0, Ll/v1f;->d:Ll/q410;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/q410;->b1(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public x1(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ybl0;->l:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/ybl0;->w1()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public z0(JLandroid/view/SurfaceView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/pbl0;->z0(JLandroid/view/SurfaceView;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p0, p1, p2}, Ll/ybl0;->q1(Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
