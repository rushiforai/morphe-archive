.class public Ll/j8p0;
.super Ll/atm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/atm0<",
        "Ll/b8p0<",
        "TD;>;TD;>;"
    }
.end annotation


# instance fields
.field public k:Ll/q1d0;

.field public l:Ll/fko0;

.field public m:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/vak0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/atm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/b8p0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/b8p0;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic F4(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/b8p0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/j8p0;->v4()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Ll/b8p0;->k(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic G4(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method private H4()Ll/k8p0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Ll/j8p0;->m:Ll/nsv;

    .line 21
    .line 22
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x1

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 36
    .line 37
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 38
    .line 39
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ll/vak0;->c(Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-nez p0, :cond_1

    .line 50
    .line 51
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->D8:I

    .line 52
    .line 53
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    goto :goto_0

    .line 58
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gh:I

    .line 59
    .line 60
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/4 v1, 0x0

    .line 65
    goto :goto_0

    .line 66
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->qi:I

    .line 67
    .line 68
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    :goto_0
    new-instance v0, Ll/k8p0;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ll/k8p0;->d(Z)V

    .line 78
    .line 79
    .line 80
    return-object v0

    .line 81
    :cond_3
    :goto_1
    const/4 p0, 0x0

    .line 82
    return-object p0
.end method

.method private I4()V
    .locals 1

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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 26
    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->unMuteWords()Ll/v3f$d;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->forbiddenWords()Ll/v3f$d;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 56
    .line 57
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->forbiddenWords()Ll/v3f$d;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 72
    .line 73
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static synthetic l4(Ll/j8p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j8p0;->E4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m4(Ll/j8p0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j8p0;->G4(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic n4(Ll/j8p0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j8p0;->D4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o4(Ll/j8p0;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/j8p0;->C4(Ljava/util/List;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic p4(Ll/j8p0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j8p0;->B4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q4(Ll/j8p0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j8p0;->F4(Ll/vxj0;)V

    return-void
.end method

.method private r4(Ljava/util/List;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/k8p0;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, -0x1

    .line 9
    sparse-switch v0, :sswitch_data_0

    .line 10
    .line 11
    .line 12
    goto/16 :goto_0

    .line 13
    .line 14
    :sswitch_0
    const-string v0, "voice"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    const/16 v1, 0x8

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :sswitch_1
    const-string v0, "jail"

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    const/4 v1, 0x7

    .line 38
    goto :goto_0

    .line 39
    :sswitch_2
    const-string v0, "call"

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    const/4 v1, 0x6

    .line 49
    goto :goto_0

    .line 50
    :sswitch_3
    const-string v0, "blocked"

    .line 51
    .line 52
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_3
    const/4 v1, 0x5

    .line 60
    goto :goto_0

    .line 61
    :sswitch_4
    const-string v0, "unblock"

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_4

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_4
    const/4 v1, 0x4

    .line 71
    goto :goto_0

    .line 72
    :sswitch_5
    const-string v0, "kickRoom"

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_5

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_5
    const/4 v1, 0x3

    .line 82
    goto :goto_0

    .line 83
    :sswitch_6
    const-string v0, "report"

    .line 84
    .line 85
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_6

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_6
    const/4 v1, 0x2

    .line 93
    goto :goto_0

    .line 94
    :sswitch_7
    const-string v0, "managerInvite"

    .line 95
    .line 96
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_7

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_7
    const/4 v1, 0x1

    .line 104
    goto :goto_0

    .line 105
    :sswitch_8
    const-string v0, "sayHello"

    .line 106
    .line 107
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_8

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_8
    const/4 v1, 0x0

    .line 115
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 116
    .line 117
    .line 118
    const/4 p0, 0x0

    .line 119
    goto/16 :goto_2

    .line 120
    .line 121
    :pswitch_0
    invoke-direct {p0}, Ll/j8p0;->u4()Ll/k8p0;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    goto/16 :goto_2

    .line 126
    .line 127
    :pswitch_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ll/rwn0;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_a

    .line 144
    .line 145
    iget-object p0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 146
    .line 147
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->isJailed:Z

    .line 152
    .line 153
    new-instance v0, Ll/k8p0;

    .line 154
    .line 155
    if-eqz p0, :cond_9

    .line 156
    .line 157
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->U1:I

    .line 158
    .line 159
    goto :goto_1

    .line 160
    :cond_9
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t9:I

    .line 161
    .line 162
    :goto_1
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    move-object p0, v0

    .line 170
    goto :goto_2

    .line 171
    :cond_a
    new-instance p0, Ll/k8p0;

    .line 172
    .line 173
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->t9:I

    .line 174
    .line 175
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    goto :goto_2

    .line 183
    :pswitch_2
    invoke-direct {p0}, Ll/j8p0;->H4()Ll/k8p0;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    goto :goto_2

    .line 188
    :pswitch_3
    new-instance p0, Ll/k8p0;

    .line 189
    .line 190
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Bf:I

    .line 191
    .line 192
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    goto :goto_2

    .line 200
    :pswitch_4
    new-instance p0, Ll/k8p0;

    .line 201
    .line 202
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Cf:I

    .line 203
    .line 204
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    goto :goto_2

    .line 212
    :pswitch_5
    new-instance p0, Ll/k8p0;

    .line 213
    .line 214
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ob:I

    .line 215
    .line 216
    invoke-static {v0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    goto :goto_2

    .line 224
    :pswitch_6
    invoke-direct {p0}, Ll/j8p0;->x4()Ll/k8p0;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    goto :goto_2

    .line 229
    :pswitch_7
    invoke-direct {p0}, Ll/j8p0;->w4()Ll/k8p0;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    goto :goto_2

    .line 234
    :pswitch_8
    new-instance p0, Ll/k8p0;

    .line 235
    .line 236
    const-string v0, "\u6253\u62db\u547c"

    .line 237
    .line 238
    invoke-direct {p0, v0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    :goto_2
    if-eqz p0, :cond_b

    .line 242
    .line 243
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, p2}, Ll/k8p0;->e(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    :cond_b
    return-void

    .line 250
    nop

    .line 251
    :sswitch_data_0
    .sparse-switch
        -0x77fbd859 -> :sswitch_8
        -0x49110aea -> :sswitch_7
        -0x37b3aacc -> :sswitch_6
        -0x337963bf -> :sswitch_5
        -0x117a126c -> :sswitch_4
        -0x1471e14 -> :sswitch_3
        0x2e7a5e -> :sswitch_2
        0x31a89a -> :sswitch_1
        0x6b2e132 -> :sswitch_0
    .end sparse-switch

    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    :pswitch_data_0
    .packed-switch 0x0
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

.method private t4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j8p0;->k:Ll/q1d0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q1d0;->h()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/j8p0;->l:Ll/fko0;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fko0;->j()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method private u4()Ll/k8p0;
    .locals 4

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
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Ll/vak0;->c:Ll/nsv;

    .line 16
    .line 17
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    return-object v1

    .line 31
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Ll/atm0;->i0(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    if-eqz v2, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    return-object v1

    .line 46
    :cond_1
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 47
    .line 48
    const/4 v2, 0x1

    .line 49
    if-nez v1, :cond_3

    .line 50
    .line 51
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->oj:I

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    :goto_0
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->oi:I

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/j8p0;->z4()Z

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    if-nez v3, :cond_4

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_5

    .line 72
    .line 73
    :cond_4
    iget-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 74
    .line 75
    if-eqz p0, :cond_5

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_5
    const/4 v2, 0x0

    .line 79
    :goto_1
    move p0, v1

    .line 80
    :goto_2
    new-instance v0, Ll/k8p0;

    .line 81
    .line 82
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0, v2}, Ll/k8p0;->d(Z)V

    .line 90
    .line 91
    .line 92
    return-object v0
.end method

.method private w4()Ll/k8p0;
    .locals 2

    .line 1
    new-instance v0, Ll/x5o0;

    .line 2
    .line 3
    const/16 v1, 0xed8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/x5o0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/util/List;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-instance v1, Ll/h8p0;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/h8p0;-><init>(Ll/j8p0;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Nf:I

    .line 28
    .line 29
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ih:I

    .line 35
    .line 36
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    :goto_0
    new-instance v0, Ll/k8p0;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-object v0
.end method

.method private x4()Ll/k8p0;
    .locals 5

    .line 1
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jfv;

    .line 8
    .line 9
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 22
    .line 23
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 24
    .line 25
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/vwt;->R5()J

    .line 30
    .line 31
    .line 32
    move-result-wide v3

    .line 33
    cmp-long p0, v1, v3

    .line 34
    .line 35
    if-gez p0, :cond_0

    .line 36
    .line 37
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->ac:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->yb:I

    .line 41
    .line 42
    :goto_0
    invoke-virtual {v0, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    new-instance v0, Ll/k8p0;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/k8p0;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object v0
.end method


# virtual methods
.method public final A4()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final synthetic B4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onCancelManager()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic C4(Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/j8p0;->r4(Ljava/util/List;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic D4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 4
    .line 5
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic E4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceManager;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 4
    .line 5
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public J4(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/b8p0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/b8p0;->e()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_1

    .line 13
    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, -0x1

    .line 22
    sparse-switch v0, :sswitch_data_0

    .line 23
    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :sswitch_0
    const-string v0, "realNamePrivateChat"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-nez p1, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    const/4 v1, 0x7

    .line 37
    goto :goto_0

    .line 38
    :sswitch_1
    const-string v0, "voice"

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const/4 v1, 0x6

    .line 48
    goto :goto_0

    .line 49
    :sswitch_2
    const-string v0, "jail"

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-nez p1, :cond_3

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_3
    const/4 v1, 0x5

    .line 59
    goto :goto_0

    .line 60
    :sswitch_3
    const-string v0, "unblock"

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_4

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_4
    const/4 v1, 0x4

    .line 70
    goto :goto_0

    .line 71
    :sswitch_4
    const-string v0, "kickRoom"

    .line 72
    .line 73
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-nez p1, :cond_5

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_5
    const/4 v1, 0x3

    .line 81
    goto :goto_0

    .line 82
    :sswitch_5
    const-string v0, "report"

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-nez p1, :cond_6

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_6
    const/4 v1, 0x2

    .line 92
    goto :goto_0

    .line 93
    :sswitch_6
    const-string v0, "managerInvite"

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-nez p1, :cond_7

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_7
    const/4 v1, 0x1

    .line 103
    goto :goto_0

    .line 104
    :sswitch_7
    const-string v0, "sayHello"

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    if-nez p1, :cond_8

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_8
    const/4 v1, 0x0

    .line 114
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :pswitch_0
    iget-object p1, p0, Ll/j8p0;->m:Ll/nsv;

    .line 119
    .line 120
    if-eqz p1, :cond_9

    .line 121
    .line 122
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 123
    .line 124
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 125
    .line 126
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Ll/j8p0;->L4(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :pswitch_1
    invoke-virtual {p0}, Ll/j8p0;->N4()V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :pswitch_2
    invoke-direct {p0}, Ll/j8p0;->I4()V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :pswitch_3
    iget-object p1, p0, Ll/j8p0;->m:Ll/nsv;

    .line 141
    .line 142
    if-eqz p1, :cond_9

    .line 143
    .line 144
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceBlackListEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;

    .line 149
    .line 150
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;->addBlackList()Ll/v3f$d;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 155
    .line 156
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 157
    .line 158
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    :cond_9
    :goto_1
    return-void

    .line 164
    :pswitch_4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ManagerPersonEvent:Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ManagerPersonEvent;->kickOff()Ll/v3f$d;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 175
    .line 176
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 177
    .line 178
    .line 179
    return-void

    .line 180
    :pswitch_5
    iget-object p1, p0, Ll/j8p0;->m:Ll/nsv;

    .line 181
    .line 182
    invoke-virtual {p0, p1}, Ll/j8p0;->M4(Ll/nsv;)V

    .line 183
    .line 184
    .line 185
    return-void

    .line 186
    :pswitch_6
    invoke-virtual {p0}, Ll/j8p0;->K4()V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :pswitch_7
    const-string p1, "anchorId"

    .line 191
    .line 192
    invoke-virtual {p0}, Ll/i6t;->j3()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    check-cast v0, Ll/rwn0;

    .line 205
    .line 206
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    const-string v1, "liveId"

    .line 211
    .line 212
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iget-object v1, p0, Ll/j8p0;->m:Ll/nsv;

    .line 217
    .line 218
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 219
    .line 220
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 221
    .line 222
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 223
    .line 224
    const-string v2, "receiver_user_id"

    .line 225
    .line 226
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    filled-new-array {p1, v0, v1}, [Ll/pf60;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    const-string v0, "e_audio_greeting"

    .line 235
    .line 236
    const-string v1, "p_audio_profile"

    .line 237
    .line 238
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 239
    .line 240
    .line 241
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 242
    .line 243
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 244
    .line 245
    iget-object p0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 246
    .line 247
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 248
    .line 249
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 250
    .line 251
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 252
    .line 253
    invoke-virtual {p1, v0, p0}, Ll/wrv;->a0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :sswitch_data_0
    .sparse-switch
        -0x77fbd859 -> :sswitch_7
        -0x49110aea -> :sswitch_6
        -0x37b3aacc -> :sswitch_5
        -0x337963bf -> :sswitch_4
        -0x117a126c -> :sswitch_3
        0x31a89a -> :sswitch_2
        0x6b2e132 -> :sswitch_1
        0x42fe9a72 -> :sswitch_0
    .end sparse-switch

    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    :pswitch_data_0
    .packed-switch 0x0
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

.method public final K4()V
    .locals 2

    .line 1
    new-instance v0, Ll/x5o0;

    .line 2
    .line 3
    const/16 v1, 0xed8

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/x5o0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/util/List;

    .line 13
    .line 14
    new-instance v1, Ll/f8p0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/f8p0;-><init>(Ll/j8p0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->m(Ljava/util/Collection;Ll/qcj;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/j8p0;->s4()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/j8p0;->y4()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public L4(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, p0, p1, v2, v2}, Ll/wrv;->z0(Landroid/content/Context;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public M4(Ll/nsv;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x1

    .line 22
    const-string v4, "indonesia"

    .line 23
    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    sget-object v2, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 27
    .line 28
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Ll/rwn0;

    .line 39
    .line 40
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    move-object/from16 v6, p1

    .line 45
    .line 46
    iget-object v4, v6, Ll/nsv;->a:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v2, v4}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    if-eqz v2, :cond_0

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    const/4 v3, 0x0

    .line 60
    :goto_0
    iget-object v2, v0, Ll/j8p0;->l:Ll/fko0;

    .line 61
    .line 62
    if-nez v2, :cond_1

    .line 63
    .line 64
    new-instance v2, Ll/fko0;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/fko0;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v2, v0, Ll/j8p0;->l:Ll/fko0;

    .line 70
    .line 71
    :cond_1
    iget-object v4, v0, Ll/j8p0;->l:Ll/fko0;

    .line 72
    .line 73
    iget-object v5, v0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Ll/rwn0;

    .line 80
    .line 81
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Ll/rwn0;

    .line 90
    .line 91
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    invoke-virtual {v0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 100
    .line 101
    .line 102
    move-result-wide v10

    .line 103
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Ll/rwn0;

    .line 110
    .line 111
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v12

    .line 121
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 122
    .line 123
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Li:I

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v13

    .line 129
    sget-object v1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 132
    .line 133
    .line 134
    move-result v14

    .line 135
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Ll/rwn0;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object v15, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 146
    .line 147
    move-object v7, v6

    .line 148
    move v6, v3

    .line 149
    invoke-virtual/range {v4 .. v15}, Ll/fko0;->p(Lcom/p1/mobile/android/app/Act;ZLl/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Ll/atm0;->i0(Ljava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-eqz v2, :cond_4

    .line 164
    .line 165
    sget-object v2, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 166
    .line 167
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_3

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_3
    new-instance v1, Landroid/content/Intent;

    .line 175
    .line 176
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    const-class v4, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;

    .line 181
    .line 182
    invoke-direct {v1, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 183
    .line 184
    .line 185
    const-string v2, "url"

    .line 186
    .line 187
    sget-object v4, Ll/efv;->v:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 190
    .line 191
    .line 192
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 193
    .line 194
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->ac:I

    .line 195
    .line 196
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    const-string v4, "title"

    .line 201
    .line 202
    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    .line 204
    .line 205
    const-string v2, "hideNavigationBar"

    .line 206
    .line 207
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 222
    .line 223
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_4
    :goto_1
    iget-object v2, v0, Ll/j8p0;->k:Ll/q1d0;

    .line 232
    .line 233
    if-nez v2, :cond_5

    .line 234
    .line 235
    new-instance v2, Ll/q1d0;

    .line 236
    .line 237
    invoke-direct {v2}, Ll/q1d0;-><init>()V

    .line 238
    .line 239
    .line 240
    iput-object v2, v0, Ll/j8p0;->k:Ll/q1d0;

    .line 241
    .line 242
    :cond_5
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    check-cast v2, Ll/rwn0;

    .line 247
    .line 248
    invoke-virtual {v2}, Ll/rwn0;->A0()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    const-string v3, "live"

    .line 253
    .line 254
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    if-eqz v2, :cond_6

    .line 259
    .line 260
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->video:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 261
    .line 262
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    :goto_2
    move v13, v2

    .line 267
    goto :goto_3

    .line 268
    :cond_6
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 269
    .line 270
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    goto :goto_2

    .line 275
    :goto_3
    iget-object v4, v0, Ll/j8p0;->k:Ll/q1d0;

    .line 276
    .line 277
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    check-cast v2, Ll/rwn0;

    .line 286
    .line 287
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    check-cast v2, Ll/rwn0;

    .line 296
    .line 297
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v8

    .line 301
    invoke-virtual {v0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 306
    .line 307
    .line 308
    move-result-wide v9

    .line 309
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    check-cast v0, Ll/rwn0;

    .line 316
    .line 317
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v11

    .line 327
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {v0}, Ll/vwt;->j5()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v12

    .line 335
    move-object/from16 v6, p1

    .line 336
    .line 337
    invoke-virtual/range {v4 .. v13}, Ll/q1d0;->q(Lcom/p1/mobile/android/app/Act;Ll/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;I)V

    .line 338
    .line 339
    .line 340
    return-void
.end method

.method public N4()V
    .locals 4

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
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v1, v1, Ll/vak0;->c:Ll/nsv;

    .line 16
    .line 17
    iget-object v1, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 30
    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/j8p0;->z4()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_4

    .line 44
    .line 45
    :cond_0
    iget-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 57
    .line 58
    iget-boolean v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 59
    .line 60
    if-nez v2, :cond_2

    .line 61
    .line 62
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 63
    .line 64
    if-nez v0, :cond_2

    .line 65
    .line 66
    const/4 v0, 0x1

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    const/4 v0, 0x0

    .line 69
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Ll/rwn0;

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    iget-object v3, v3, Ll/vak0;->c:Ll/nsv;

    .line 80
    .line 81
    iget-object v3, v3, Ll/nsv;->a:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 84
    .line 85
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_3

    .line 92
    .line 93
    const-string v2, "voice-manager"

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_3
    const-string v2, ""

    .line 97
    .line 98
    :goto_1
    invoke-static {p0, v1, v0, v2}, Ll/ydn0;->p(Ll/i6t;Ljava/lang/String;ZLjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_4
    :goto_2
    return-void
.end method

.method public O4(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/j8p0;->m:Ll/nsv;

    .line 20
    .line 21
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/j8p0;->n:Ll/vak0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 40
    .line 41
    const-string v0, "unblock"

    .line 42
    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    iget-object p1, p0, Ll/j8p0;->n:Ll/vak0;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 56
    .line 57
    invoke-interface {p1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iget-object v0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-ge p1, v0, :cond_1

    .line 74
    .line 75
    if-gez p1, :cond_0

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    iget-object p0, p0, Ll/j8p0;->n:Ll/vak0;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 85
    .line 86
    const-string v0, "blocked"

    .line 87
    .line 88
    invoke-interface {p0, p1, v0}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    :cond_1
    :goto_0
    return-void
.end method

.method public j4(Ll/vak0;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iput-object p1, p0, Ll/j8p0;->n:Ll/vak0;

    .line 5
    .line 6
    iget-object p1, p1, Ll/vak0;->c:Ll/nsv;

    .line 7
    .line 8
    iput-object p1, p0, Ll/j8p0;->m:Ll/nsv;

    .line 9
    .line 10
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p1, Ll/b8p0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/b8p0;->isShowing()Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast p1, Ll/b8p0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/j8p0;->v4()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p1, p0}, Ll/b8p0;->j(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/j8p0;->t4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public s4()V
    .locals 5

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
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/vak0;->o()Ll/nsv;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 32
    .line 33
    const/4 v1, 0x5

    .line 34
    invoke-static {v0, v1}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->af:I

    .line 39
    .line 40
    invoke-static {v1, v0}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 49
    .line 50
    invoke-direct {v3, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    if-ltz v2, :cond_0

    .line 54
    .line 55
    new-instance v1, Landroid/text/style/StyleSpan;

    .line 56
    .line 57
    const/4 v4, 0x1

    .line 58
    invoke-direct {v1, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr v0, v2

    .line 66
    const/16 v4, 0x21

    .line 67
    .line 68
    invoke-virtual {v3, v1, v2, v0, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 69
    .line 70
    .line 71
    :cond_0
    new-instance v0, Ll/th0$a;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->cf:I

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    new-instance v1, Ll/i8p0;

    .line 91
    .line 92
    invoke-direct {v1, p0}, Ll/i8p0;-><init>(Ll/j8p0;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->bf:I

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onCancelManager()Ll/v3f$d;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 132
    .line 133
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 134
    .line 135
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->openManageDialog()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/c8p0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/c8p0;-><init>(Ll/j8p0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->setJailed()Ll/v3f$d;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    check-cast v0, Lrx/c;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    new-instance v1, Ll/d8p0;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/d8p0;-><init>(Ll/j8p0;)V

    .line 45
    .line 46
    .line 47
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceBlackListEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceBlackListEvent;->updateBlackStatus()Ll/v3f$d;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lrx/c;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/e8p0;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/e8p0;-><init>(Ll/j8p0;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public v4()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/k8p0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/j8p0;->A4()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Ll/j8p0;->n:Ll/vak0;

    .line 13
    .line 14
    invoke-virtual {v1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->manageButtons:Ljava/util/List;

    .line 19
    .line 20
    new-instance v2, Ll/g8p0;

    .line 21
    .line 22
    invoke-direct {v2, p0, v0}, Ll/g8p0;-><init>(Ll/j8p0;Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-object v0
.end method

.method public y4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceLiveManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceLiveManagerEvent;->onInviteUserBecomeManager()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/vak0;->o()Ll/nsv;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public z4()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    const-string v0, ""

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
