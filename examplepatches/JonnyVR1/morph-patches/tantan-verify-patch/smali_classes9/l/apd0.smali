.class public Ll/apd0;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.source "SourceFile"


# instance fields
.field public final h:Ll/fpd0;

.field public final i:[I

.field public j:I

.field public k:Ll/kcg0;

.field public l:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;


# direct methods
.method public constructor <init>(Ll/fpd0;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x21c

    .line 5
    .line 6
    const/16 v1, 0x3c0

    .line 7
    .line 8
    filled-new-array {v0, v1}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Ll/apd0;->i:[I

    .line 13
    .line 14
    const v0, 0x124f80

    .line 15
    .line 16
    .line 17
    iput v0, p0, Ll/apd0;->j:I

    .line 18
    .line 19
    iput-object p1, p0, Ll/apd0;->h:Ll/fpd0;

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic p1(Ll/apd0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/apd0;->x1(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic q1(Ll/apd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/apd0;->v1()V

    return-void
.end method

.method public static synthetic r1(Ll/apd0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/apd0;->w1()V

    return-void
.end method

.method private s1([I)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;
    .locals 8

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    aget v2, p1, v1

    .line 8
    .line 9
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    aget p1, p1, v2

    .line 13
    .line 14
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 15
    .line 16
    iget p1, p0, Ll/apd0;->j:I

    .line 17
    .line 18
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->videoBitrate:I

    .line 19
    .line 20
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    const/4 v6, 0x0

    .line 27
    const/4 v7, 0x0

    .line 28
    const/high16 v4, 0x3f800000    # 1.0f

    .line 29
    .line 30
    const/high16 v5, 0x3f800000    # 1.0f

    .line 31
    .line 32
    move-object v2, p0

    .line 33
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->V0(Ljava/lang/String;FFFF)Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    iget-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    iput-object p0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->userid:Ljava/lang/String;

    .line 54
    .line 55
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    iput-object p0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->mid:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 64
    .line 65
    .line 66
    move-result-wide p0

    .line 67
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iput-object p0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->inv:Ljava/lang/String;

    .line 72
    .line 73
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 74
    .line 75
    return-object v0
.end method

.method private t1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
    .locals 4

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioChannels:I

    .line 8
    .line 9
    const v1, 0xac44

    .line 10
    .line 11
    .line 12
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioSampleRate:I

    .line 13
    .line 14
    const v1, 0xfa00

    .line 15
    .line 16
    .line 17
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->audioBitrate:I

    .line 18
    .line 19
    const v1, 0x124f80

    .line 20
    .line 21
    .line 22
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 23
    .line 24
    const/16 v2, 0x14

    .line 25
    .line 26
    iput v2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 27
    .line 28
    iput v1, p0, Ll/apd0;->j:I

    .line 29
    .line 30
    new-instance v1, Ll/xod0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/xod0;-><init>(Ll/apd0;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/yod0;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/yod0;-><init>(Ll/apd0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Ll/l210;->a(Ll/x20;Ll/x20;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/apd0;->i:[I

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    aget v3, v1, v2

    .line 47
    .line 48
    iput v3, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    aget v1, v1, v3

    .line 52
    .line 53
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 54
    .line 55
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->url:Ljava/lang/String;

    .line 56
    .line 57
    iput-object p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->ipv6Url:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    if-eqz p1, :cond_0

    .line 64
    .line 65
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->isValid()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_0

    .line 72
    .line 73
    iget-object p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->encode:Lcom/p1/mobile/putong/live/base/data/BLiveEncode;

    .line 74
    .line 75
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->fps:I

    .line 76
    .line 77
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 78
    .line 79
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->bitRate:I

    .line 80
    .line 81
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 82
    .line 83
    iput p2, p0, Ll/apd0;->j:I

    .line 84
    .line 85
    iget-object p2, p0, Ll/apd0;->i:[I

    .line 86
    .line 87
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->width:I

    .line 88
    .line 89
    aput v1, p2, v2

    .line 90
    .line 91
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEncode;->heigth:I

    .line 92
    .line 93
    aput p1, p2, v3

    .line 94
    .line 95
    iget p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->videoCodecType:I

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 99
    .line 100
    iget-object p1, p1, Ll/u1f;->c:Ll/b210;

    .line 101
    .line 102
    invoke-virtual {p1}, Ll/b210;->a1()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    if-eqz p1, :cond_1

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->isValid()Z

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    if-eqz p2, :cond_1

    .line 113
    .line 114
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushFps:I

    .line 115
    .line 116
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoFPS:I

    .line 117
    .line 118
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushBitrate:I

    .line 119
    .line 120
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoBitRate:I

    .line 121
    .line 122
    iput p2, p0, Ll/apd0;->j:I

    .line 123
    .line 124
    iget-object p2, p0, Ll/apd0;->i:[I

    .line 125
    .line 126
    iget p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushWidth:I

    .line 127
    .line 128
    aput p3, p2, v2

    .line 129
    .line 130
    iget p3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->pushHeight:I

    .line 131
    .line 132
    aput p3, p2, v3

    .line 133
    .line 134
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQuality;->videoCodecType:I

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_1
    move p1, v2

    .line 138
    :goto_0
    iget-object p2, p0, Ll/apd0;->i:[I

    .line 139
    .line 140
    aget p3, p2, v2

    .line 141
    .line 142
    iput p3, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 143
    .line 144
    aget p2, p2, v3

    .line 145
    .line 146
    iput p2, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 147
    .line 148
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->videoCodecType:I

    .line 149
    .line 150
    iget-object p1, p0, Ll/apd0;->h:Ll/fpd0;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->c:Ljava/lang/String;

    .line 153
    .line 154
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->businessType:I

    .line 159
    .line 160
    iget-object p0, p0, Ll/apd0;->h:Ll/fpd0;

    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->b:Ljava/lang/String;

    .line 163
    .line 164
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result p0

    .line 168
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->cdnType:I

    .line 169
    .line 170
    return-object v0
.end method

.method public static u1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_NORMAL:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    new-instance v0, Ll/apd0;

    .line 12
    .line 13
    check-cast p0, Ll/fpd0;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/apd0;-><init>(Ll/fpd0;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private synthetic v1()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/apd0;->i:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/16 v1, 0x21c

    .line 5
    .line 6
    aput v1, p0, v0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    const/16 v1, 0x3c0

    .line 10
    .line 11
    aput v1, p0, v0

    .line 12
    .line 13
    return-void
.end method

.method private synthetic w1()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/apd0;->i:[I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/16 v1, 0x1e0

    .line 5
    .line 6
    aput v1, p0, v0

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    const/16 v1, 0x280

    .line 10
    .line 11
    aput v1, p0, v0

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public B0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->B0()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/apd0;->h:Ll/fpd0;

    .line 5
    .line 6
    iget-object v0, v0, Ll/fpd0;->m:Ll/z20;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Ll/apd0;->h:Ll/fpd0;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 16
    .line 17
    invoke-interface {v0, v1, p0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public X0()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->X0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->Y0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public a1()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a1()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/apd0;->k:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public e1()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/apd0;->h:Ll/fpd0;

    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->e:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public i1()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;->RTC:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$MomoPushType;

    .line 2
    .line 3
    return-object p0
.end method

.method public o1()I
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->o1()I

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->destroy()V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance v1, Ll/ax40;

    .line 15
    .line 16
    invoke-direct {v1}, Ll/ax40;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 20
    .line 21
    iget-object v2, v2, Ll/u1f;->h:Ll/r510;

    .line 22
    .line 23
    invoke-virtual {v2, v1}, Ll/r510;->d(Ll/o510;)V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/apd0;->h:Ll/fpd0;

    .line 27
    .line 28
    iget-object v2, v1, Ll/nw40;->l:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v3, v1, Ll/nw40;->k:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, v1, Ll/nw40;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 33
    .line 34
    invoke-direct {p0, v2, v3, v1}, Ll/apd0;->t1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object v2, p0, Ll/apd0;->i:[I

    .line 39
    .line 40
    invoke-direct {p0, v2}, Ll/apd0;->s1([I)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    iput-object v2, p0, Ll/apd0;->l:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 45
    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 47
    .line 48
    iget-object v2, v2, Ll/u1f;->d:Ll/p410;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->W0()Ll/cgu;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v2, v3}, Ll/p410;->i1(Ll/cgu;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/apd0;->e1()Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    const-string v3, "intl_rtc_up"

    .line 62
    .line 63
    if-eqz v2, :cond_1

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 66
    .line 67
    iget-object v1, v1, Ll/u1f;->d:Ll/p410;

    .line 68
    .line 69
    iget-object v2, p0, Ll/apd0;->l:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Ll/p410;->f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 72
    .line 73
    .line 74
    const-string v1, "\u666e\u901a\u76f4\u64ad \uff0c \u5df2\u7ecf\u5728rtc\u9891\u9053 \uff0c \u8df3\u8fc7 enterroom"

    .line 75
    .line 76
    invoke-static {v3, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    const-string v2, "\u666e\u901a\u76f4\u64ad\u8fdb\u5165enterroom"

    .line 81
    .line 82
    invoke-static {v3, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 86
    .line 87
    iget-object v2, v2, Ll/u1f;->d:Ll/p410;

    .line 88
    .line 89
    sget-object v3, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 90
    .line 91
    const/4 v4, 0x1

    .line 92
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    iget-object v4, p0, Ll/apd0;->l:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 97
    .line 98
    invoke-virtual {v2, v1, v3, v4}, Ll/p410;->U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 99
    .line 100
    .line 101
    :goto_0
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_2

    .line 106
    .line 107
    invoke-virtual {p0}, Ll/apd0;->y1()V

    .line 108
    .line 109
    .line 110
    :cond_2
    const/4 p0, 0x0

    .line 111
    return p0
.end method

.method public final synthetic x1(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object p1, p1, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    iget-object p0, p0, Ll/apd0;->l:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/p410;->f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final y1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/apd0;->k:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x3

    .line 7
    .line 8
    sget-object v2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 9
    .line 10
    invoke-static {v0, v1, v2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/zod0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/zod0;-><init>(Ll/apd0;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Ll/apd0;->k:Ll/kcg0;

    .line 40
    .line 41
    return-void
.end method
