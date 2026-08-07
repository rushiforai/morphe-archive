.class public Ll/e510;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/c0m;

.field public final j:Ll/kcg0;

.field public final k:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p1}, Ll/oo2;->H0()Ll/c0m;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Ll/oo2;->H0()Ll/c0m;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iput-object p1, p0, Ll/e510;->i:Ll/c0m;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    new-instance p1, Ll/r210;

    .line 26
    .line 27
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 28
    .line 29
    invoke-direct {p1, v0}, Ll/r210;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/e510;->i:Ll/c0m;

    .line 33
    .line 34
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object v0, p0, Ll/e510;->i:Ll/c0m;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Ll/oo2;->Z1(Ll/c0m;)V

    .line 41
    .line 42
    .line 43
    new-instance p1, Ll/v410;

    .line 44
    .line 45
    invoke-direct {p1, p0}, Ll/v410;-><init>(Ll/e510;)V

    .line 46
    .line 47
    .line 48
    const-class v0, Ll/r410;

    .line 49
    .line 50
    invoke-virtual {p0, v0, p1}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 51
    .line 52
    .line 53
    new-instance p1, Ll/w410;

    .line 54
    .line 55
    invoke-direct {p1, p0}, Ll/w410;-><init>(Ll/e510;)V

    .line 56
    .line 57
    .line 58
    const-class v0, Ll/c210;

    .line 59
    .line 60
    invoke-virtual {p0, v0, p1}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 61
    .line 62
    .line 63
    new-instance p1, Ll/x410;

    .line 64
    .line 65
    invoke-direct {p1, p0}, Ll/x410;-><init>(Ll/e510;)V

    .line 66
    .line 67
    .line 68
    const-class v0, Ll/k210;

    .line 69
    .line 70
    invoke-virtual {p0, v0, p1}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 71
    .line 72
    .line 73
    new-instance p1, Ll/y410;

    .line 74
    .line 75
    invoke-direct {p1, p0}, Ll/y410;-><init>(Ll/e510;)V

    .line 76
    .line 77
    .line 78
    const-class v0, Ll/z310;

    .line 79
    .line 80
    invoke-virtual {p0, v0, p1}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 81
    .line 82
    .line 83
    new-instance p1, Ll/z410;

    .line 84
    .line 85
    invoke-direct {p1, p0}, Ll/z410;-><init>(Ll/e510;)V

    .line 86
    .line 87
    .line 88
    const-class v0, Ll/w1f;

    .line 89
    .line 90
    invoke-virtual {p0, v0, p1}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 91
    .line 92
    .line 93
    new-instance p1, Ll/a510;

    .line 94
    .line 95
    invoke-direct {p1, p0}, Ll/a510;-><init>(Ll/e510;)V

    .line 96
    .line 97
    .line 98
    const-class v0, Ll/s510;

    .line 99
    .line 100
    invoke-virtual {p0, v0, p1}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 108
    .line 109
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->sdkActionEvent()Ll/v3f$d;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    check-cast p1, Lrx/c;

    .line 118
    .line 119
    new-instance v0, Ll/b510;

    .line 120
    .line 121
    invoke-direct {v0, p0}, Ll/b510;-><init>(Ll/e510;)V

    .line 122
    .line 123
    .line 124
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Ll/e510;->j:Ll/kcg0;

    .line 133
    .line 134
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MomoSdkEvent:Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;

    .line 139
    .line 140
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MomoSdkEvent;->renewRtcToken()Ll/v3f$d;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    check-cast p1, Lrx/c;

    .line 149
    .line 150
    new-instance v0, Ll/c510;

    .line 151
    .line 152
    invoke-direct {v0, p0}, Ll/c510;-><init>(Ll/e510;)V

    .line 153
    .line 154
    .line 155
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p0, Ll/e510;->k:Ll/kcg0;

    .line 164
    .line 165
    return-void
.end method

.method public static synthetic J3(Ll/e510;Ll/s510;)Ll/d0m;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e510;->X3(Ll/s510;)Ll/d0m;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic K3(Ll/e510;Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e510;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V

    return-void
.end method

.method public static synthetic L3(Ll/e510;Ll/r410;)Ll/xzl;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e510;->S3(Ll/r410;)Ll/xzl;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/e510;Ll/w1f;)Ll/wsl;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e510;->W3(Ll/w1f;)Ll/wsl;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/e510;Ll/k210;)Ll/uzl;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e510;->U3(Ll/k210;)Ll/uzl;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/e510;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e510;->Y3(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic P3(Ll/e510;Ll/c210;)Ll/szl;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e510;->T3(Ll/c210;)Ll/szl;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Ll/e510;Ll/z310;)Ll/h0m;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/e510;->V3(Ll/z310;)Ll/h0m;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic S3(Ll/r410;)Ll/xzl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/c0m;->e()Ll/xzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic T3(Ll/c210;)Ll/szl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/c0m;->f()Ll/szl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic U3(Ll/k210;)Ll/uzl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/c0m;->a()Ll/uzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic V3(Ll/z310;)Ll/h0m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/c0m;->d()Ll/h0m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic W3(Ll/w1f;)Ll/wsl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/c0m;->b()Ll/wsl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic X3(Ll/s510;)Ll/d0m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/c0m;->c()Ll/d0m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic Y3(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/c0m;->onPause()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, 0x2

    .line 19
    if-ne p1, v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/c0m;->onResume()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/c0m;->e()Ll/xzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/xzl;->o(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public a4(Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e510;->i:Ll/c0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/c0m;->e()Ll/xzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveRtcToken;->channelKey:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/xzl;->o(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public b4(Ll/f510;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/f510;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p1, Ll/f510;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/f510;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->o7(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/d510;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/d510;-><init>(Ll/e510;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/e510;->j:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/e510;->k:Ll/kcg0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/oo2;->Y0()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/e510;->i:Ll/c0m;

    .line 25
    .line 26
    invoke-interface {v0}, Ll/c0m;->release()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p0, v0}, Ll/oo2;->Z1(Ll/c0m;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method
