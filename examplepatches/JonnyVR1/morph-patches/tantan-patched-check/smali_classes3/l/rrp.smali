.class public Ll/rrp;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/urp;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Ll/krp;

.field public j:Ll/zqp;

.field public k:Landroid/view/View;


# direct methods
.method public constructor <init>(Ll/dum;Ll/urp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Ll/urp;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/rrp;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rrp;->S3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic K3(Ll/rrp;Ll/jl80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Ll/rrp;->T3(Ll/jl80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic L3(Ll/rrp;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rrp;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic M3(Ll/rrp;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rrp;->R3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final O3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;Z)V
    .locals 0

    .line 1
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;->gradientIndex:I

    .line 2
    .line 3
    xor-int/lit8 p3, p3, 0x1

    .line 4
    .line 5
    invoke-static {p1, p2, p3}, Ll/qbo;->f(Ljava/lang/String;IZ)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance p2, Ll/prp;

    .line 14
    .line 15
    invoke-direct {p2, p0}, Ll/prp;-><init>(Ll/rrp;)V

    .line 16
    .line 17
    .line 18
    new-instance p3, Ll/qrp;

    .line 19
    .line 20
    invoke-direct {p3, p0}, Ll/qrp;-><init>(Ll/rrp;)V

    .line 21
    .line 22
    .line 23
    invoke-static {p2, p3}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/rrp;->j:Ll/zqp;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceRoomBgEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRoomBgEvent;->changeMeTab()Ll/v3f$c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 19
    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Pi:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic R3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rrp;->j:Ll/zqp;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 6
    .line 7
    .line 8
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    move-object v0, p1

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 16
    .line 17
    const v1, 0xa81f

    .line 18
    .line 19
    .line 20
    if-ne v0, v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->showRechargeDialog()Ll/v3f$c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 33
    .line 34
    .line 35
    :cond_1
    invoke-static {p1}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic S3(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/urp;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/urp;->i(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic T3(Ll/jl80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2, p3, p4}, Ll/rrp;->O3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public U3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/qbo;->h()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/mrp;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/mrp;-><init>(Ll/rrp;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/r5k;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public V3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/rrp;->k:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->o2:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/rrp;->k:Landroid/view/View;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/rrp;->k:Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Ll/rrp;->k:Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 33
    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    iget-object v0, p0, Ll/rrp;->k:Landroid/view/View;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Landroid/view/ViewGroup;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 45
    .line 46
    .line 47
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->newDialog()Ll/jl80$a;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v1, p0, Ll/rrp;->k:Landroid/view/View;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-virtual {v0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/jl80$a;->O()Ll/jl80;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    iget-object v0, p0, Ll/rrp;->k:Landroid/view/View;

    .line 71
    .line 72
    sget v1, Ll/mdc0;->D0:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    check-cast v0, Landroid/widget/TextView;

    .line 79
    .line 80
    new-instance v1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ri:I

    .line 90
    .line 91
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v2, " "

    .line 99
    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;->price:I

    .line 104
    .line 105
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-static {}, Ll/u8n;->a()Z

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    if-eqz v4, :cond_2

    .line 120
    .line 121
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ak:I

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_2
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Qi:I

    .line 125
    .line 126
    :goto_0
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/rrp;->k:Landroid/view/View;

    .line 141
    .line 142
    sget v1, Ll/mdc0;->a3:I

    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    new-instance v1, Ll/nrp;

    .line 149
    .line 150
    invoke-direct {v1, v3}, Ll/nrp;-><init>(Ll/jl80;)V

    .line 151
    .line 152
    .line 153
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/rrp;->k:Landroid/view/View;

    .line 157
    .line 158
    sget v1, Ll/mdc0;->r5:I

    .line 159
    .line 160
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Ll/orp;

    .line 165
    .line 166
    move-object v2, p0

    .line 167
    move-object v4, p1

    .line 168
    move-object v5, p2

    .line 169
    move v6, p3

    .line 170
    invoke-direct/range {v1 .. v6}, Ll/orp;-><init>(Ll/rrp;Ll/jl80;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackgroundPriceGradient;Z)V

    .line 171
    .line 172
    .line 173
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v3}, Ll/jl80;->show()V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method public W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 1

    .line 1
    new-instance v0, Ll/zqp;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/zqp;-><init>(Ll/rrp;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/rrp;->j:Ll/zqp;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/zqp;->w0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rrp;->i:Ll/krp;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/krp;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Ll/krp;-><init>(Ll/rrp;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/rrp;->i:Ll/krp;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/rrp;->i:Ll/krp;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ll/krp;->r0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
