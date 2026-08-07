.class public Ll/m180;
.super Ll/s680;
.source "SourceFile"


# instance fields
.field public final p:Ll/j080;

.field public final q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

.field public r:Landroidx/appcompat/app/a;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;)V
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->pkView:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Ll/s680;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/m180;->q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 7
    .line 8
    new-instance p2, Ll/j080;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Ll/j080;-><init>(Ll/dum;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/m180;->p:Ll/j080;

    .line 14
    .line 15
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ll/ha80;->R3(Ll/u2m;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic A4(Ll/m180;Lcom/p1/mobile/putong/live/base/data/BLivePk;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m180;->H4(Lcom/p1/mobile/putong/live/base/data/BLivePk;)V

    return-void
.end method

.method public static synthetic B4(Ll/m180;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m180;->J4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic C4(Ll/m180;Ljava/lang/String;ZLl/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/m180;->G4(Ljava/lang/String;ZLl/y20;)V

    return-void
.end method

.method private synthetic J4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m180;->T4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic u4(Ll/m180;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m180;->M4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method

.method public static synthetic v4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "pk_cdn_fail"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic w4(Ll/m180;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m180;->O4()V

    return-void
.end method

.method public static synthetic x4(Ll/m180;Ll/gu70;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m180;->K4(Ll/gu70;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y4(Ll/m180;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m180;->I4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic z4(Ll/m180;Ll/h880;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m180;->L4(Ll/h880;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final D4()V
    .locals 2

    .line 1
    new-instance v0, Ll/k210;

    .line 2
    .line 3
    const/16 v1, 0x258

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/k210;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ll/uzl;

    .line 13
    .line 14
    const/16 v0, 0x3e9

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ll/uzl;->G(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final E4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m180;->r:Landroidx/appcompat/app/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/m180;->r:Landroidx/appcompat/app/a;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public F4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s680;->j:Ll/d880;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/d880;->e4()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/m180;->p:Ll/j080;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/j080;->C4()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/m180;->D4()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, v0}, Ll/su70;->d(Ll/i6t;Z)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/su70;->c(Ll/i6t;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/s680;->k:Ll/o8b0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/o8b0;->R3()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/s680;->W3()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/m180;->E4()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic G4(Ljava/lang/String;ZLl/y20;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "setMuteRemoteAudio name = "

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
    const-string v1, " isMute = "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, p2, v0}, Ll/m180;->Q4(ZZ)V

    .line 28
    .line 29
    .line 30
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p3, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2, p1}, Ll/c680;->j(ZLjava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic H4(Lcom/p1/mobile/putong/live/base/data/BLivePk;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    invoke-static {p0, p1, v0}, Ll/n180;->g(Ll/i6t;ZLjava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic I4(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0, p1}, Ll/n180;->g(Ll/i6t;ZLjava/lang/Throwable;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic K4(Ll/gu70;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/m180;->U3()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0}, Ll/s680;->g4()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1, v0, p0}, Ll/vwt;->t5(IZ)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic L4(Ll/h880;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s680;->m4()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final M4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->state:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v3, -0x1

    .line 16
    sparse-switch v1, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :sswitch_0
    const-string v1, "ended"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v3, 0x3

    .line 30
    goto :goto_0

    .line 31
    :sswitch_1
    const-string v1, "playing"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    const/4 v3, 0x2

    .line 41
    goto :goto_0

    .line 42
    :sswitch_2
    const-string v1, "punishing"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-nez v0, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    move v3, v2

    .line 52
    goto :goto_0

    .line 53
    :sswitch_3
    const-string v1, "preparing"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_3

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_3
    const/4 v3, 0x0

    .line 63
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :pswitch_0
    invoke-virtual {p0}, Ll/m180;->P4()V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/m180;->F4()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :pswitch_1
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 75
    .line 76
    const-string v1, "pk_anchor_start_trace"

    .line 77
    .line 78
    const-string v2, "start_pk"

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, p1}, Ll/m180;->S4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ll/m180;->P4()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :pswitch_2
    iget-object v0, p0, Ll/s680;->j:Ll/d880;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->lastStateIsPlaying()Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    invoke-virtual {v0, v2, p1, v1}, Ll/d880;->x4(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Z)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Ll/dw40;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 114
    .line 115
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->winnerId:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_5

    .line 122
    .line 123
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->mvpUserId:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getUser(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    if-nez v0, :cond_4

    .line 132
    .line 133
    const-wide/16 v0, 0x0

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_4
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 137
    .line 138
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 139
    .line 140
    :goto_1
    iget-object v2, p0, Ll/s680;->j:Ll/d880;

    .line 141
    .line 142
    invoke-virtual {v2, v0, v1}, Ll/d880;->d4(J)V

    .line 143
    .line 144
    .line 145
    :cond_5
    invoke-virtual {p0, p1}, Ll/s680;->S3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :pswitch_3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkPrepare()Ll/v3f$d;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p0, Ll/m180;->p:Ll/j080;

    .line 163
    .line 164
    invoke-virtual {p0, p1}, Ll/j080;->b4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    nop

    .line 169
    :sswitch_data_0
    .sparse-switch
        -0x3c48fbfc -> :sswitch_3
        -0x33863113 -> :sswitch_2
        -0x1d6b2fd2 -> :sswitch_1
        0x5c2caba -> :sswitch_0
    .end sparse-switch

    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public N4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/m180;->D4()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s680;->j:Ll/d880;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/d880;->v4()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->pkOnceMoreSuccess()Ll/v3f$c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/s680;->k:Ll/o8b0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/o8b0;->R3()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final O4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m180;->p:Ll/j080;

    .line 2
    .line 3
    const-string v0, "leave"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/j080;->g4(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final P4()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, v0}, Ll/m180;->Q4(ZZ)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->n0(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final Q4(ZZ)V
    .locals 5

    .line 1
    :try_start_0
    new-instance v0, Ll/z310;

    .line 2
    .line 3
    const/16 v1, 0x258

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/z310;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/h0m;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/h0m;->a()Lcom/p1/mobile/putong/live/livingroom/archi/sdk/motion/base/b;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v2, Ll/r410;

    .line 19
    .line 20
    invoke-direct {v2, v1}, Ll/r410;-><init>(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ll/xzl;

    .line 28
    .line 29
    iget-object v2, p0, Ll/s680;->i:Ll/ha80;

    .line 30
    .line 31
    invoke-virtual {v2}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    if-eqz v1, :cond_0

    .line 40
    .line 41
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    invoke-interface {v1, v3, p1}, Ll/xzl;->P(IZ)V

    .line 46
    .line 47
    .line 48
    :cond_0
    instance-of v3, v0, Ll/p880;

    .line 49
    .line 50
    if-eqz v3, :cond_1

    .line 51
    .line 52
    move-object v3, v0

    .line 53
    check-cast v3, Ll/p880;

    .line 54
    .line 55
    invoke-virtual {v3, v2, p1}, Ll/p880;->F1(Ljava/lang/String;Z)V

    .line 56
    .line 57
    .line 58
    :cond_1
    const/4 v3, 0x0

    .line 59
    const/4 v4, 0x1

    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    move v1, v4

    .line 63
    goto :goto_0

    .line 64
    :cond_2
    move v1, v3

    .line 65
    :goto_0
    if-nez v0, :cond_3

    .line 66
    .line 67
    move v3, v4

    .line 68
    :cond_3
    invoke-static {p0, v1, v3, v2, p1}, Ll/n180;->c(Ll/i6t;ZZLjava/lang/String;Z)V

    .line 69
    .line 70
    .line 71
    if-eqz p2, :cond_4

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/s680;->T3()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->w6(Ljava/lang/String;Z)Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    new-instance p2, Ll/j180;

    .line 86
    .line 87
    invoke-direct {p2, p0}, Ll/j180;-><init>(Ll/m180;)V

    .line 88
    .line 89
    .line 90
    new-instance v0, Ll/k180;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ll/k180;-><init>(Ll/m180;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    :cond_4
    return-void

    .line 103
    :catch_0
    move-exception p0

    .line 104
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final R4()V
    .locals 1

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/dw40;

    .line 23
    .line 24
    iget-object p0, p0, Ll/oo2;->z:Ll/p1w;

    .line 25
    .line 26
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;->anchorTemplateId:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ll/p1w;->v(I)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final S4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/s680;->S3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isOnceMore()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/m180;->R4()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/m180;->p:Ll/j080;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/j080;->B4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Ll/m180;->p:Ll/j080;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/j080;->y4()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/m180;->N4()V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/r410;

    .line 28
    .line 29
    const/16 v1, 0x258

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/xzl;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->channelKey:Ljava/lang/String;

    .line 43
    .line 44
    invoke-interface {v0, v1}, Ll/xzl;->o(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object p0, p0, Ll/s680;->j:Ll/d880;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-virtual {p0, v0, p1, v1}, Ll/d880;->x4(ZLcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;Z)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public T4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->cancelMatch()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/m180;->p:Ll/j080;

    .line 15
    .line 16
    const-string v0, "leave"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/j080;->g4(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public U3()I
    .locals 2

    .line 1
    new-instance v0, Ll/ku70;

    .line 2
    .line 3
    const/16 v1, 0x258

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/ku70;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1}, Ll/s680;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/m180$a;->a:[I

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    aget v0, v0, v1

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    if-eq v0, v1, :cond_2

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x3

    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p0, p0, Ll/m180;->p:Ll/j080;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->getExtra()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLivePkStage;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/j080;->v4(Lcom/p1/mobile/putong/live/base/data/BLivePkStage;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->clickOnceMore()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget-object p0, p0, Ll/s680;->i:Ll/ha80;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser()Lcom/p1/mobile/putong/data/User;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    iget-object p1, p0, Ll/s680;->j:Ll/d880;

    .line 61
    .line 62
    new-instance v0, Ll/c180;

    .line 63
    .line 64
    invoke-direct {v0, p0}, Ll/c180;-><init>(Ll/m180;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, v0}, Ll/d880;->y4(Ll/x20;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Ll/dw40;

    .line 79
    .line 80
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 85
    .line 86
    const-string v1, "liveId"

    .line 87
    .line 88
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Ll/dw40;

    .line 97
    .line 98
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 103
    .line 104
    const-string v1, "anchorId"

    .line 105
    .line 106
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    const-string v0, "e_pk_close_button"

    .line 115
    .line 116
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public p4(ZLjava/lang/String;Ll/y20;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/l180;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1, p3}, Ll/l180;-><init>(Ll/m180;Ljava/lang/String;ZLl/y20;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, p0, p1, p2, v1}, Ll/c680;->o(Lcom/p1/mobile/android/app/Act;Ll/i6t;ZLjava/lang/String;Ll/x20;)Landroidx/appcompat/app/a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/m180;->r:Landroidx/appcompat/app/a;

    .line 13
    .line 14
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/s680;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/s680;->i:Ll/ha80;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ha80;->P3()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/d180;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/d180;-><init>(Ll/m180;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/s680;->i:Ll/ha80;

    .line 27
    .line 28
    iget-object v1, p0, Ll/m180;->q:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;

    .line 29
    .line 30
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkLaunchData;->message:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/ha80;->V3(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LivePkMessage;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LivePkEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LivePkEvent;->liveEndEvent()Ll/v3f$c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lrx/c;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/e180;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/e180;-><init>(Ll/m180;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 65
    .line 66
    .line 67
    new-instance v0, Ll/f180;

    .line 68
    .line 69
    invoke-direct {v0, p0}, Ll/f180;-><init>(Ll/m180;)V

    .line 70
    .line 71
    .line 72
    const-class v1, Ll/gu70;

    .line 73
    .line 74
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Ll/g180;

    .line 78
    .line 79
    invoke-direct {v0, p0}, Ll/g180;-><init>(Ll/m180;)V

    .line 80
    .line 81
    .line 82
    const-class v1, Ll/h880;

    .line 83
    .line 84
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    check-cast v0, Ll/dw40;

    .line 92
    .line 93
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/aj1;->U()Lrx/c;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Ll/h180;

    .line 106
    .line 107
    invoke-direct {v1}, Ll/h180;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object p0, p0, Ll/m180;->p:Ll/j080;

    .line 115
    .line 116
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    new-instance v1, Ll/i180;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/i180;-><init>(Ll/j080;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    return-void
.end method
