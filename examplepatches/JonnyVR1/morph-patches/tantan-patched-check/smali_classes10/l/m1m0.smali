.class public abstract Ll/m1m0;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/oam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        "V::",
        "Ll/iam;",
        ">",
        "Ll/i6t<",
        "TD;TV;>;",
        "Ll/oam;"
    }
.end annotation


# instance fields
.field public final i:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/ado0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/m1m0;->i:Lrx/subjects/a;

    .line 9
    .line 10
    new-instance v0, Ll/thn0;

    .line 11
    .line 12
    invoke-direct {v0, p1, p0}, Ll/thn0;-><init>(Ll/dum;Ll/oam;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static synthetic J3(Ll/m1m0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m1m0;->b4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;)V

    return-void
.end method

.method public static synthetic K3(Ll/m1m0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m1m0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic L3(Ll/m1m0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m1m0;->a4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V

    return-void
.end method

.method public static synthetic M3(Ll/m1m0;Ll/x8p0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m1m0;->Y3(Ll/x8p0;)V

    return-void
.end method

.method public static synthetic N3(Ll/m1m0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m1m0;->c4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    return-void
.end method

.method public static synthetic O3(Ll/m1m0;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m1m0;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method

.method public static synthetic P3(Ll/m1m0;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m1m0;->S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V

    return-void
.end method

.method private c4(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/hrk0;->p()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/l1m0;

    .line 19
    .line 20
    invoke-direct {v1, p0, p1}, Ll/l1m0;-><init>(Ll/m1m0;Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public abstract N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
.end method

.method public R3(Ll/hrk0$a;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/m1m0;->i:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/hrk0;->r()Ll/ado0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleMemberUpdate\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[voice][call]"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;->Count:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/rwn0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/hrk0;->r()Ll/ado0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getTotal()J

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    invoke-virtual {v0, v1, v2}, Ll/ado0;->U(J)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getTotal()J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    invoke-virtual {p0, v0, v1}, Ll/m1m0;->W3(J)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;->Remove:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate$UpdateType;

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_1

    .line 76
    .line 77
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Ll/rwn0;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getMemberId()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-virtual {v0, p1}, Ll/hrk0;->x(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_1
    new-instance v0, Ll/h64;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getMemberId()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-direct {v0, v1, v2, v3}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getMemberId()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-static {v2}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    check-cast v3, Ll/rwn0;

    .line 141
    .line 142
    invoke-virtual {v3}, Ll/rwn0;->W0()Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    invoke-virtual {v0, v1, v2, v3}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    check-cast v1, Ll/rwn0;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceMemberUpdate;->getMemberId()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-static {v1, p1}, Ll/i9o0;->f(Ll/rwn0;Ljava/lang/String;)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    check-cast v1, Ll/rwn0;

    .line 169
    .line 170
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v1, v0, p1}, Ll/hrk0;->g(Ll/nsv;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :goto_0
    iget-object p1, p0, Ll/m1m0;->i:Lrx/subjects/a;

    .line 178
    .line 179
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    check-cast p0, Ll/rwn0;

    .line 184
    .line 185
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {p0}, Ll/hrk0;->r()Ll/ado0;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p1, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 194
    .line 195
    .line 196
    return-void
.end method

.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCallVolume;->volumes:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Ljava/lang/Float;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const v1, 0x3ca3d70a    # 0.02f

    .line 18
    .line 19
    .line 20
    cmpg-float v0, v0, v1

    .line 21
    .line 22
    if-ltz v0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 29
    .line 30
    cmpl-float v0, v0, v1

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isSpeak:Z

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    iput p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->volume:F

    .line 50
    .line 51
    :goto_1
    invoke-virtual {p0, p2}, Ll/m1m0;->N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public abstract U3(Ll/nsv;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract V3(Ll/nsv;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;ZLjava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation
.end method

.method public W3(J)V
    .locals 0

    .line 1
    return-void
.end method

.method public X3(Ll/ado0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final Y3(Ll/x8p0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Ll/x8p0;->c:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p1, v0}, Ll/v1n0;->g(Ll/x8p0;Ll/nsv;)V

    .line 18
    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {v0}, Ll/nsv;->g()Ll/pyl;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/l6o0;

    .line 28
    .line 29
    iget-object v2, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 34
    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    :goto_0
    return-void

    .line 42
    :cond_1
    iget-object v1, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 45
    .line 46
    iget-object p1, p1, Ll/x8p0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 47
    .line 48
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/m1m0;->U3(Ll/nsv;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public final Z3(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 22
    .line 23
    if-eqz v2, :cond_0

    .line 24
    .line 25
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iput-object p1, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ll/rwn0;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    :goto_0
    return-void

    .line 53
    :cond_1
    invoke-virtual {p0, v0}, Ll/m1m0;->U3(Ll/nsv;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public final a4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/rwn0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {v0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v2, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    iget-object v2, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->checkNeedChangeVoice()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_2

    .line 54
    .line 55
    :goto_0
    return-void

    .line 56
    :cond_2
    iput-object p1, v1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/m1m0;->U3(Ll/nsv;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final b4(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;)V
    .locals 11

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getUserIdsList()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getUserIdsList()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x2

    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/rwn0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Ll/hrk0;->r()Ll/ado0;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0, p1}, Ll/ado0;->X(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getUserIds(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x1

    .line 48
    invoke-virtual {p1, v1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getUserIds(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Ll/rwn0;

    .line 57
    .line 58
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, v0}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    check-cast v2, Ll/rwn0;

    .line 71
    .line 72
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    invoke-virtual {v2, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ll/rwn0;

    .line 85
    .line 86
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v2, v0}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 91
    .line 92
    .line 93
    move-result-object v6

    .line 94
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Ll/rwn0;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 105
    .line 106
    .line 107
    move-result-object v7

    .line 108
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getOn()Z

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getVerticalCallConnectionEffectSvga()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v9

    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpEffect;->getHorizontalCallConnectionEffectSvga()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v10

    .line 120
    move-object v3, p0

    .line 121
    invoke-virtual/range {v3 .. v10}, Ll/m1m0;->V3(Ll/nsv;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;ZLjava/lang/String;Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :cond_1
    :goto_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->J0()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/d1m0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/d1m0;-><init>(Ll/m1m0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CallEvent:Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CallEvent;->memberVolume()Ll/v3f$d;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lrx/c;

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-instance v1, Ll/e1m0;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/e1m0;-><init>(Ll/m1m0;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ll/rwn0;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v0}, Ll/aj1;->l0()Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Ll/f1m0;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Ll/f1m0;-><init>(Ll/m1m0;)V

    .line 87
    .line 88
    .line 89
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Ll/rwn0;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v0}, Ll/aj1;->c1()Lrx/c;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    new-instance v1, Ll/g1m0;

    .line 115
    .line 116
    invoke-direct {v1, p0}, Ll/g1m0;-><init>(Ll/m1m0;)V

    .line 117
    .line 118
    .line 119
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Ll/rwn0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ll/h1m0;

    .line 149
    .line 150
    invoke-direct {v1, p0}, Ll/h1m0;-><init>(Ll/m1m0;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 158
    .line 159
    .line 160
    iget-object v0, p0, Ll/m1m0;->i:Lrx/subjects/a;

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    new-instance v1, Ll/i1m0;

    .line 175
    .line 176
    invoke-direct {v1, p0}, Ll/i1m0;-><init>(Ll/m1m0;)V

    .line 177
    .line 178
    .line 179
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Ll/rwn0;

    .line 191
    .line 192
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-virtual {v0}, Ll/aj1;->r1()Lrx/c;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    new-instance v1, Ll/j1m0;

    .line 205
    .line 206
    invoke-direct {v1, p0}, Ll/j1m0;-><init>(Ll/m1m0;)V

    .line 207
    .line 208
    .line 209
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 210
    .line 211
    .line 212
    move-result-object v1

    .line 213
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 214
    .line 215
    .line 216
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Ll/rwn0;

    .line 221
    .line 222
    invoke-virtual {v0}, Ll/rwn0;->E3()Lrx/c;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    new-instance v1, Ll/k1m0;

    .line 231
    .line 232
    invoke-direct {v1, p0}, Ll/k1m0;-><init>(Ll/m1m0;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 240
    .line 241
    .line 242
    return-void
.end method
