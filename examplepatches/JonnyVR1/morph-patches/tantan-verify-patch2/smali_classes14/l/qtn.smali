.class public Ll/qtn;
.super Ll/txs;
.source "SourceFile"


# instance fields
.field public f:Ll/oun;

.field public g:Landroid/view/ViewGroup;

.field public h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

.field public i:Z


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/txs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/qtn;->g:Landroid/view/ViewGroup;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Q2(Ll/qtn;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qtn;->Y2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic R2(Ll/qtn;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/qtn;->W2()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S2(Ll/qtn;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qtn;->Z2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T2(Ll/qtn;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qtn;->X2(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic U2(Ll/qtn;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qtn;->a3(Ljava/lang/String;)V

    return-void
.end method

.method private synthetic W2()Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ll/evs;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/evs;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/qtn;->g:Landroid/view/ViewGroup;

    .line 5
    .line 6
    new-instance v1, Ll/ltn;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/ltn;-><init>(Ll/qtn;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/qtn;->V2(Landroid/view/ViewGroup;Ll/egj0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->IntlGameOperationEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$IntlGameOperationEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$IntlGameOperationEvent;->gameEntranceViewVisibility()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lrx/c;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/mtn;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/mtn;-><init>(Ll/qtn;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public V2(Landroid/view/ViewGroup;Ll/egj0;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 5
    .line 6
    .line 7
    sget v1, Ll/qa00;->h:I

    .line 8
    .line 9
    const/high16 v2, 0x41100000    # 9.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 17
    .line 18
    .line 19
    const v1, 0x800055

    .line 20
    .line 21
    .line 22
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sget v2, Ll/xec0;->L:I

    .line 33
    .line 34
    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 39
    .line 40
    iput-object v1, p0, Ll/qtn;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/qtn;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    new-instance p1, Ll/oun;

    .line 51
    .line 52
    iget-object v0, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/4 v2, 0x1

    .line 59
    invoke-direct {p1, v0, v1, v2, p2}, Ll/oun;-><init>(Ll/ner;Ll/nus;ZLl/egj0;)V

    .line 60
    .line 61
    .line 62
    iput-object p1, p0, Ll/qtn;->f:Ll/oun;

    .line 63
    .line 64
    iget-object v0, p0, Ll/qtn;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 65
    .line 66
    invoke-virtual {p1, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/qtn;->f:Ll/oun;

    .line 70
    .line 71
    invoke-virtual {p1}, Ll/oun;->I2()V

    .line 72
    .line 73
    .line 74
    iget-object p1, p0, Ll/qtn;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 75
    .line 76
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 77
    .line 78
    invoke-virtual {v0}, Ll/vwt;->V6()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_0

    .line 83
    .line 84
    iget-boolean v0, p0, Ll/qtn;->i:Z

    .line 85
    .line 86
    if-nez v0, :cond_0

    .line 87
    .line 88
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/ppi0;->x()Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_0

    .line 97
    .line 98
    const-string v0, "p_audio_explore_recommend"

    .line 99
    .line 100
    invoke-interface {p2}, Ll/egj0;->v()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p2

    .line 108
    if-nez p2, :cond_0

    .line 109
    .line 110
    move p2, v2

    .line 111
    goto :goto_0

    .line 112
    :cond_0
    move p2, v3

    .line 113
    :goto_0
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object p1, p0, Ll/qtn;->f:Ll/oun;

    .line 117
    .line 118
    if-eqz p1, :cond_1

    .line 119
    .line 120
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1}, Ll/ppi0;->x()Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-nez p1, :cond_1

    .line 129
    .line 130
    iget-object p1, p0, Ll/qtn;->f:Ll/oun;

    .line 131
    .line 132
    invoke-virtual {p1, v2}, Ll/oun;->B3(Z)V

    .line 133
    .line 134
    .line 135
    :cond_1
    sget-object p1, Ll/t4u;->e:Lrx/subjects/b;

    .line 136
    .line 137
    invoke-virtual {p0, p1, v3}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    new-instance p2, Ll/ntn;

    .line 146
    .line 147
    invoke-direct {p2, p0}, Ll/ntn;-><init>(Ll/qtn;)V

    .line 148
    .line 149
    .line 150
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 155
    .line 156
    .line 157
    sget-object p1, Ll/itd0;->b:Ll/itd0;

    .line 158
    .line 159
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    check-cast p1, Ll/fk3;

    .line 164
    .line 165
    invoke-virtual {p1}, Ll/fk3;->z()Lrx/c;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p0, p1, v3}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    new-instance p2, Ll/otn;

    .line 178
    .line 179
    invoke-direct {p2, p0}, Ll/otn;-><init>(Ll/qtn;)V

    .line 180
    .line 181
    .line 182
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 183
    .line 184
    .line 185
    move-result-object p2

    .line 186
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    iget-object p1, p1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 194
    .line 195
    invoke-virtual {p1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    check-cast p1, Lrx/c;

    .line 204
    .line 205
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    new-instance p2, Ll/ptn;

    .line 210
    .line 211
    invoke-direct {p2, p0}, Ll/ptn;-><init>(Ll/qtn;)V

    .line 212
    .line 213
    .line 214
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 219
    .line 220
    .line 221
    return-void
.end method

.method public final synthetic X2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ll/qtn;->i:Z

    .line 9
    .line 10
    iget-object p1, p0, Ll/qtn;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/qtn;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic Y2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qtn;->f:Ll/oun;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Ll/oun;->B3(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic Z2(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/qtn;->f:Ll/oun;

    .line 2
    .line 3
    const-string v0, "live_tab_red_dot"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0, p1}, Ll/oun;->C3(ZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic a3(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qtn;->h:Lcom/p1/mobile/putong/live/external/intl/view/widgets/IntlLiveActivitiesEntryView;

    .line 2
    .line 3
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/vwt;->V6()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Ll/qtn;->i:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Ll/y6u;->o(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const-string p0, "square-live-circle"

    .line 22
    .line 23
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_0

    .line 28
    .line 29
    const-string p0, "square-intlGame"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    :goto_0
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
