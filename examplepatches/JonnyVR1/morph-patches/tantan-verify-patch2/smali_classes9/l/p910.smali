.class public Ll/p910;
.super Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
.source "SourceFile"


# instance fields
.field public final h:Ll/h910;

.field public i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

.field public j:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

.field public final k:[I

.field public l:I

.field public final m:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/lr10;

.field public final o:Lcom/google/gson/Gson;

.field public p:Ll/tm10;

.field public q:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/h910;)V
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
    iput-object v0, p0, Ll/p910;->k:[I

    .line 13
    .line 14
    const v0, 0x124f80

    .line 15
    .line 16
    .line 17
    iput v0, p0, Ll/p910;->l:I

    .line 18
    .line 19
    new-instance v0, Ljava/util/HashSet;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/p910;->m:Ljava/util/HashSet;

    .line 25
    .line 26
    new-instance v0, Ll/tm10;

    .line 27
    .line 28
    const-string v1, "2x2"

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ll/tm10;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ll/p910;->p:Ll/tm10;

    .line 34
    .line 35
    const-string v0, "https://auto.tancdn.com/v1/images/eyJpZCI6IlpUQVIzWDRFWFhLUTRXQVdaSDI3QldDS0JWVlhMUTEyIiwidyI6Mzc1LCJoIjozNzUsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo5MTg0ODg4NjEwMzA5NDc0MDU1fQ.png"

    .line 36
    .line 37
    iput-object v0, p0, Ll/p910;->q:Ljava/lang/String;

    .line 38
    .line 39
    iput-object p1, p0, Ll/p910;->h:Ll/h910;

    .line 40
    .line 41
    new-instance p1, Lcom/google/gson/Gson;

    .line 42
    .line 43
    invoke-direct {p1}, Lcom/google/gson/Gson;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Ll/p910;->o:Lcom/google/gson/Gson;

    .line 47
    .line 48
    return-void
.end method

.method private synthetic A1()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/p910;->k:[I

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

.method private F1(Landroid/view/SurfaceView;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p910;->n:Ll/lr10;

    .line 2
    .line 3
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1, p1}, Ll/lr10;->g(Ljava/lang/Long;Landroid/view/SurfaceView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p2, p3}, Ll/p910;->w1(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic p1(Ljava/util/concurrent/ConcurrentHashMap;Ll/td1;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/td1;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/td1;->b()F

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic q1(Ll/p910;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/p910;->A1()V

    return-void
.end method

.method public static synthetic r1(Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic s1(Ll/p910;Ljava/lang/Long;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p910;->C1(Ljava/lang/Long;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic t1(Ll/p910;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p910;->D1(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic u1(Ll/p910;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p910;->B1()V

    return-void
.end method

.method public static synthetic v1(Ljava/lang/String;Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method private x1([I)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;
    .locals 7

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
    aget v1, p1, v1

    .line 8
    .line 9
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    aget p1, p1, v1

    .line 13
    .line 14
    iput p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 15
    .line 16
    iget p1, p0, Ll/p910;->l:I

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
    move-result-object v2

    .line 26
    const/4 v5, 0x0

    .line 27
    const/4 v6, 0x0

    .line 28
    const/high16 v3, 0x3f800000    # 1.0f

    .line 29
    .line 30
    const/high16 v4, 0x3f800000    # 1.0f

    .line 31
    .line 32
    move-object v1, p0

    .line 33
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->V0(Ljava/lang/String;FFFF)Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

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
    const/4 p0, 0x3

    .line 74
    iput p0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 75
    .line 76
    return-object v0
.end method

.method private y1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;
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
    iput v1, p0, Ll/p910;->l:I

    .line 29
    .line 30
    new-instance v1, Ll/l910;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/l910;-><init>(Ll/p910;)V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ll/m910;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Ll/m910;-><init>(Ll/p910;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Ll/l210;->a(Ll/x20;Ll/x20;)V

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/p910;->k:[I

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
    iput p2, p0, Ll/p910;->l:I

    .line 84
    .line 85
    iget-object p2, p0, Ll/p910;->k:[I

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
    iput p2, p0, Ll/p910;->l:I

    .line 123
    .line 124
    iget-object p2, p0, Ll/p910;->k:[I

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
    iget-object p2, p0, Ll/p910;->k:[I

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
    iget-object p1, p0, Ll/p910;->h:Ll/h910;

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
    iget-object p0, p0, Ll/p910;->h:Ll/h910;

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

.method public static z1(Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;)Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;->MOTION_MULTI_CALL_ANCHOR:Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams$PusherMotionEnum;

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
    new-instance v0, Ll/p910;

    .line 12
    .line 13
    check-cast p0, Ll/h910;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/p910;-><init>(Ll/h910;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public B0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/eas;->B0()V

    .line 2
    .line 3
    .line 4
    const-string v0, "onRequestChannelKey"

    .line 5
    .line 6
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-static {v1}, Ll/x84;->a(I)Ll/x84;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object p0, p0, Ll/p910;->h:Ll/h910;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1, p0}, Ll/x84;->n(Ljava/lang/String;)Ll/x84;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {v0, p0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final synthetic B1()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/p910;->k:[I

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

.method public C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->C0(Ljava/lang/String;ILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p2, 0x5

    .line 9
    invoke-static {p2}, Ll/x84;->a(I)Ll/x84;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p0, p2}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 14
    .line 15
    .line 16
    :cond_0
    sget-object p0, Ll/cd10;->a:Ljava/lang/String;

    .line 17
    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string p3, "onLocalLeaveChannel"

    .line 21
    .line 22
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p0, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic C1(Ljava/lang/Long;)Ljava/lang/Integer;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 10
    .line 11
    const/4 v0, 0x4

    .line 12
    invoke-static {v0}, Ll/x84;->a(I)Ll/x84;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p1}, Ll/x84;->p(Ljava/lang/Long;)Ll/x84;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/x84;->h()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    const/4 p0, -0x1

    .line 34
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public final synthetic D1(Ljava/lang/Long;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->userid:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 13
    .line 14
    const/4 v2, 0x4

    .line 15
    invoke-static {v2}, Ll/x84;->a(I)Ll/x84;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2, p1}, Ll/x84;->p(Ljava/lang/Long;)Ll/x84;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-interface {v1, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/x84;->i()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput-boolean v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->isMuteAudio:Z

    .line 32
    .line 33
    iget-object v1, p0, Ll/p910;->p:Ll/tm10;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/x84;->h()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v1, v2, v0}, Ll/tm10;->e(ILcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;)V

    .line 40
    .line 41
    .line 42
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p1}, Ll/x84;->g()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_0

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 59
    .line 60
    iget-object p1, p1, Ll/u1f;->c:Ll/b210;

    .line 61
    .line 62
    invoke-static {}, Ll/ynp0;->p()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    int-to-float v1, v1

    .line 67
    iget v2, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 68
    .line 69
    mul-float/2addr v1, v2

    .line 70
    float-to-int v1, v1

    .line 71
    invoke-static {}, Ll/ynp0;->p()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    int-to-float v2, v2

    .line 76
    iget v3, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 77
    .line 78
    mul-float/2addr v2, v3

    .line 79
    float-to-int v2, v2

    .line 80
    invoke-virtual {p1, v1, v2}, Ll/b210;->C(II)V

    .line 81
    .line 82
    .line 83
    :cond_0
    iget p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->w:F

    .line 84
    .line 85
    const/4 v1, 0x0

    .line 86
    cmpl-float p1, p1, v1

    .line 87
    .line 88
    if-lez p1, :cond_1

    .line 89
    .line 90
    iget p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->h:F

    .line 91
    .line 92
    cmpl-float p1, p1, v1

    .line 93
    .line 94
    if-lez p1, :cond_1

    .line 95
    .line 96
    iget-object p1, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 97
    .line 98
    iget-object p1, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 99
    .line 100
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 104
    .line 105
    iget-object p0, p0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 106
    .line 107
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    :cond_1
    return-void
.end method

.method public final E1(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p910;->G1(J)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/p910;->n:Ll/lr10;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/lr10;->k(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final G1(J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p910;->m:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/p910;->n:Ll/lr10;

    .line 11
    .line 12
    invoke-virtual {v0, p1, p2}, Ll/lr10;->k(J)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/p910;->K1()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public H1(Ljava/lang/String;)V
    .locals 3

    .line 1
    sget-object v0, Ll/cd10;->a:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "anchor push setRestartWithURL:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 21
    .line 22
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/p410;->h1(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public I(JZ)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->I(JZ)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p3, "onMemberAudioMuted"

    .line 7
    .line 8
    invoke-direct {p0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public I0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/eas;->I0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/16 p1, 0xb

    .line 9
    .line 10
    invoke-static {p1}, Ll/x84;->a(I)Ll/x84;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public I1(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/tm10;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/tm10;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/p910;->p:Ll/tm10;

    .line 7
    .line 8
    iget-object p1, p0, Ll/p910;->n:Ll/lr10;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ll/lr10;->l(Ll/tm10;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/p910;->K1()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public J1(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Ll/p410;->j1(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public K1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->confMembers:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/p910;->m:Ljava/util/HashSet;

    .line 19
    .line 20
    new-instance v1, Ll/i910;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/i910;-><init>(Ll/p910;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 29
    .line 30
    const/16 v1, 0x438

    .line 31
    .line 32
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasWidth:I

    .line 33
    .line 34
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->canvasHeight:I

    .line 35
    .line 36
    iget-object v1, p0, Ll/p910;->j:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 37
    .line 38
    const/16 v2, 0x21c

    .line 39
    .line 40
    iput v2, v1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeWidth:I

    .line 41
    .line 42
    iput v2, v1, Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;->encodeHeight:I

    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v2, "{\"mode\": "

    .line 47
    .line 48
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v2, p0, Ll/p910;->p:Ll/tm10;

    .line 52
    .line 53
    invoke-virtual {v2}, Ll/tm10;->c()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    const-string v2, "}"

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 70
    .line 71
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 72
    .line 73
    const/4 v1, 0x3

    .line 74
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->ctyp:I

    .line 75
    .line 76
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    const/4 v1, 0x4

    .line 83
    if-le v0, v1, :cond_1

    .line 84
    .line 85
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 86
    .line 87
    const/4 v1, 0x1

    .line 88
    iput v1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->shortSei:I

    .line 89
    .line 90
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 91
    .line 92
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 93
    .line 94
    iget-object v1, p0, Ll/p910;->j:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ll/p410;->g1(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;)V

    .line 97
    .line 98
    .line 99
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 100
    .line 101
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 102
    .line 103
    iget-object v1, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ll/p410;->f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Ll/p910;->n:Ll/lr10;

    .line 109
    .line 110
    invoke-virtual {v0}, Ll/lr10;->b()V

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 114
    .line 115
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 116
    .line 117
    iget-object v1, p0, Ll/p910;->q:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Ll/p410;->k1(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    new-instance v0, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v1, "updateCanvasAndVideoResolution sei = "

    .line 125
    .line 126
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v1, p0, Ll/p910;->o:Lcom/google/gson/Gson;

    .line 130
    .line 131
    iget-object p0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 132
    .line 133
    invoke-virtual {v1, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public L1(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

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
    new-instance v1, Ll/n910;

    .line 9
    .line 10
    invoke-direct {v1, p1}, Ll/n910;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iput-boolean p2, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->isMuteAudio:Z

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->infoMembers:Ljava/util/List;

    .line 26
    .line 27
    new-instance v1, Ll/o910;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/o910;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;

    .line 37
    .line 38
    if-eqz p1, :cond_2

    .line 39
    .line 40
    iput-boolean p2, p1, Lcom/immomo/momomediaext/utils/MMLiveTranscoding$MMLiveLinkMember;->isMuteAudio:Z

    .line 41
    .line 42
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 43
    .line 44
    iget-object p1, p1, Ll/u1f;->d:Ll/p410;

    .line 45
    .line 46
    iget-object p0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Ll/p410;->f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 49
    .line 50
    .line 51
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
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 10
    .line 11
    const/16 p2, 0x6d

    .line 12
    .line 13
    if-ne p3, p2, :cond_1

    .line 14
    .line 15
    const/4 p2, 0x1

    .line 16
    invoke-static {p2}, Ll/x84;->a(I)Ll/x84;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-object p0, p0, Ll/p910;->h:Ll/h910;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->d:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Ll/x84;->n(Ljava/lang/String;)Ll/x84;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p1, p0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    const/4 p0, 0x7

    .line 33
    invoke-static {p0}, Ll/x84;->a(I)Ll/x84;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-interface {p1, p0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 38
    .line 39
    .line 40
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
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a1()V

    .line 2
    .line 3
    .line 4
    const-string v0, "goToEnd"

    .line 5
    .line 6
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 17
    .line 18
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-virtual {v0, v1}, Ll/p410;->N(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 25
    .line 26
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ll/p410;->p(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const-string v0, "intl_rtc_up"

    .line 33
    .line 34
    const-string v1, "\u590d\u7528 rtc\u9891\u9053\uff0cVideoMute false ,audiomute false"

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    const/4 v0, 0x5

    .line 47
    invoke-static {v0}, Ll/x84;->a(I)Ll/x84;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {p0, v0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public b(JI)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->b(JI)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "onVideoChannelRemove uid:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ",reason:"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p3

    .line 26
    invoke-static {p3}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1, p2}, Ll/p910;->G1(J)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->d0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p3}, Ll/p910;->w1(J)V

    .line 5
    .line 6
    .line 7
    new-instance p4, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v0, "onLocalJoinChannel result channel = "

    .line 10
    .line 11
    invoke-direct {p4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string p1, " uid = "

    .line 18
    .line 19
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p4, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-static {p1}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    const/4 p1, 0x6

    .line 37
    invoke-static {p1}, Ll/x84;->a(I)Ll/x84;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p1, p2}, Ll/x84;->p(Ljava/lang/Long;)Ll/x84;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public e(JZ)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->e(JZ)V

    .line 2
    .line 3
    .line 4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v0, "onMemberVideoMuted uid:"

    .line 7
    .line 8
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string p1, ",muted:"

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onMemberJoinChannel"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->e0(Ljava/lang/String;JLcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p2, p3}, Ll/p910;->w1(J)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const/4 p1, 0x3

    .line 29
    invoke-static {p1}, Ll/x84;->a(I)Ll/x84;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-virtual {p1, p2}, Ll/x84;->p(Ljava/lang/Long;)Ll/x84;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 42
    .line 43
    .line 44
    :cond_0
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
    iget-object v0, p0, Ll/p910;->h:Ll/h910;

    .line 9
    .line 10
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/MotionParams;->e:Z

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 15
    .line 16
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/p410;->W0()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
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

.method public l0([Ll/td1;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Ll/eas;->l0([Ll/td1;)V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    aget-object v0, p1, v0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/td1;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/j910;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Ll/j910;-><init>(Ljava/util/concurrent/ConcurrentHashMap;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v1}, Ll/jyb;->A([Ljava/lang/Object;Ll/y20;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;

    .line 37
    .line 38
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;-><init>()V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/p910;->p:Ll/tm10;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/tm10;->c()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iput v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->mode:I

    .line 48
    .line 49
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    const/16 v1, 0x8

    .line 56
    .line 57
    invoke-static {v1}, Ll/x84;->a(I)Ll/x84;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v1, p1}, Ll/x84;->s(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)Ll/x84;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-interface {v0, v1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 66
    .line 67
    .line 68
    :cond_2
    iget-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 69
    .line 70
    iget-object v1, p0, Ll/p910;->o:Lcom/google/gson/Gson;

    .line 71
    .line 72
    invoke-virtual {v1, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, v0, Lcom/immomo/momomediaext/utils/MMLiveTranscoding;->extString:Ljava/lang/String;

    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 79
    .line 80
    iget-object p1, p1, Ll/u1f;->d:Ll/p410;

    .line 81
    .line 82
    iget-object p0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 83
    .line 84
    invoke-virtual {p1, p0}, Ll/p410;->f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/eas;->o0(JILcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLivePushType;)V

    .line 2
    .line 3
    .line 4
    new-instance p3, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string p4, "onMemberLeaveChannel"

    .line 7
    .line 8
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p3

    .line 18
    invoke-static {p3}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/p910;->E1(J)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const/4 p3, 0x2

    .line 29
    invoke-static {p3}, Ll/x84;->a(I)Ll/x84;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p3, p1}, Ll/x84;->p(Ljava/lang/Long;)Ll/x84;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {p0, p1}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public o1()I
    .locals 4

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
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lio/agora/rtc2/RtcEngine;->destroy()V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "start motionParams"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/p910;->h:Ll/h910;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/nw40;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/lr10;

    .line 38
    .line 39
    iget-object v1, p0, Ll/p910;->p:Ll/tm10;

    .line 40
    .line 41
    new-instance v2, Ll/k910;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/k910;-><init>(Ll/p910;)V

    .line 44
    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    invoke-direct {v0, v3, v1, v2}, Ll/lr10;-><init>(ZLl/tm10;Ll/qcj;)V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Ll/p910;->n:Ll/lr10;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 53
    .line 54
    iget-object v1, v1, Ll/u1f;->h:Ll/r510;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Ll/r510;->d(Ll/o510;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Ll/p910;->h:Ll/h910;

    .line 60
    .line 61
    iget-object v1, v0, Ll/nw40;->l:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v2, v0, Ll/nw40;->k:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v0, v0, Ll/nw40;->j:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 66
    .line 67
    invoke-direct {p0, v1, v2, v0}, Ll/p910;->y1(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;)Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iput-object v0, p0, Ll/p910;->j:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 72
    .line 73
    iget-object v0, p0, Ll/p910;->k:[I

    .line 74
    .line 75
    invoke-direct {p0, v0}, Ll/p910;->x1([I)Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 82
    .line 83
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->W0()Ll/cgu;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Ll/p410;->i1(Ll/cgu;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 93
    .line 94
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 95
    .line 96
    iget-object v1, p0, Ll/p910;->h:Ll/h910;

    .line 97
    .line 98
    iget-boolean v1, v1, Ll/h910;->n:Z

    .line 99
    .line 100
    xor-int/2addr v1, v3

    .line 101
    invoke-virtual {v0, v1}, Ll/p410;->N(Z)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ll/p910;->e1()Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 109
    .line 110
    if-eqz v0, :cond_2

    .line 111
    .line 112
    iget-object v0, v1, Ll/u1f;->d:Ll/p410;

    .line 113
    .line 114
    iget-object v1, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ll/p410;->f1(Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)V

    .line 117
    .line 118
    .line 119
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 120
    .line 121
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 126
    .line 127
    .line 128
    move-result-wide v1

    .line 129
    invoke-virtual {p0, v1, v2}, Ll/p910;->w1(J)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->a:Ll/x84$a;

    .line 133
    .line 134
    if-eqz v1, :cond_1

    .line 135
    .line 136
    const/4 v2, 0x6

    .line 137
    invoke-static {v2}, Ll/x84;->a(I)Ll/x84;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    invoke-virtual {v2, v0}, Ll/x84;->q(Ljava/lang/String;)Ll/x84;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-interface {v1, v0}, Ll/x84$a;->a(Ll/x84;)Ll/x84;

    .line 146
    .line 147
    .line 148
    :cond_1
    const-string v0, "intl_rtc_up"

    .line 149
    .line 150
    const-string v1, "\u591a\u4eba\u8fde\u9ea6 \uff0c \u5df2\u7ecf\u5728rtc\u9891\u9053 \uff0c \u8df3\u8fc7 enterroom"

    .line 151
    .line 152
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_2
    iget-object v0, v1, Ll/u1f;->d:Ll/p410;

    .line 157
    .line 158
    iget-object v1, p0, Ll/p910;->j:Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;

    .line 159
    .line 160
    sget-object v2, Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;->MMLiveRTCClientRoleBroadcaster:Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;

    .line 161
    .line 162
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->U0(Lcom/immomo/momomediaext/utils/MMLiveRoomParams$MMLiveClientRole;Z)Lcom/immomo/momomediaext/utils/MMLiveRoomParams;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    iget-object v3, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 167
    .line 168
    invoke-virtual {v0, v1, v2, v3}, Ll/p410;->U0(Lcom/immomo/momomediaext/utils/MMLiveMediaConfig;Lcom/immomo/momomediaext/utils/MMLiveRoomParams;Lcom/immomo/momomediaext/utils/MMLiveTranscoding;)I

    .line 169
    .line 170
    .line 171
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 172
    .line 173
    iget-object v0, v0, Ll/u1f;->d:Ll/p410;

    .line 174
    .line 175
    const/16 v1, 0x3e8

    .line 176
    .line 177
    const/4 v2, 0x3

    .line 178
    invoke-virtual {v0, v1, v2}, Ll/p410;->T0(II)V

    .line 179
    .line 180
    .line 181
    iget-object v0, p0, Ll/p910;->h:Ll/h910;

    .line 182
    .line 183
    iget v0, v0, Ll/h910;->o:I

    .line 184
    .line 185
    if-eqz v0, :cond_3

    .line 186
    .line 187
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;->e:Ll/u1f;

    .line 188
    .line 189
    iget-object p0, p0, Ll/u1f;->d:Ll/p410;

    .line 190
    .line 191
    invoke-virtual {p0, v0}, Ll/p410;->j1(I)V

    .line 192
    .line 193
    .line 194
    :cond_3
    const/4 p0, 0x0

    .line 195
    return p0
.end method

.method public final w1(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p910;->m:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/p910;->K1()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public z0(JLandroid/view/SurfaceView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/eas;->z0(JLandroid/view/SurfaceView;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p3, p1, p2}, Ll/p910;->F1(Landroid/view/SurfaceView;J)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string p2, "onVideoChannelAdded sei = "

    .line 15
    .line 16
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Ll/p910;->o:Lcom/google/gson/Gson;

    .line 20
    .line 21
    iget-object p0, p0, Ll/p910;->i:Lcom/immomo/momomediaext/utils/MMLiveTranscoding;

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/ir10;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
