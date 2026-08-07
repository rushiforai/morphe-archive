.class public Ll/urr;
.super Ll/txs;
.source "SourceFile"


# instance fields
.field public f:Ll/msr;

.field public g:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/txs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/urr;->g:Landroid/view/ViewGroup;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic Q2(Ll/urr;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/urr;->U2()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R2(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/y6u;->n(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "square-live-circle"

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string v0, "fakePlayground"

    .line 16
    .line 17
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    const-string v0, "square-curated"

    .line 24
    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    const/4 p1, 0x1

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    const/4 p1, 0x0

    .line 34
    :goto_0
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic S2(Ll/urr;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/urr;->V2(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/urr;->g:Landroid/view/ViewGroup;

    .line 5
    .line 6
    new-instance v1, Ll/rrr;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/rrr;-><init>(Ll/urr;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Ll/urr;->T2(Landroid/view/ViewGroup;Ll/egj0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public T2(Landroid/view/ViewGroup;Ll/egj0;)V
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
    invoke-static {}, Ll/mbs;->m()Ll/tq8;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-interface {v2}, Ll/tq8;->h()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    const/high16 v2, 0x42200000    # 40.0f

    .line 20
    .line 21
    :goto_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/high16 v2, 0x41100000    # 9.0f

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :goto_1
    const/4 v3, 0x0

    .line 30
    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 31
    .line 32
    .line 33
    const v1, 0x800055

    .line 34
    .line 35
    .line 36
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Ll/xec0;->h0:I

    .line 47
    .line 48
    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    check-cast v1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    new-instance p1, Ll/msr;

    .line 61
    .line 62
    iget-object v0, p0, Ll/cyr;->lifecycleProviderImpl:Ll/ner;

    .line 63
    .line 64
    invoke-virtual {p0}, Ll/mus;->H2()Ll/nus;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-direct {p1, v0, v2, p2}, Ll/msr;-><init>(Ll/ner;Ll/nus;Ll/egj0;)V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Ll/urr;->f:Ll/msr;

    .line 72
    .line 73
    invoke-virtual {p1, v1}, Ll/l6t;->C(Ll/iam;)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Ll/urr;->f:Ll/msr;

    .line 77
    .line 78
    invoke-virtual {p1}, Ll/msr;->I2()V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p1}, Ll/ppi0;->x()Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_1

    .line 90
    .line 91
    const-string p1, "p_audio_explore_recommend"

    .line 92
    .line 93
    invoke-interface {p2}, Ll/egj0;->v()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-nez p1, :cond_1

    .line 102
    .line 103
    const/4 p1, 0x1

    .line 104
    goto :goto_2

    .line 105
    :cond_1
    move p1, v3

    .line 106
    :goto_2
    invoke-static {v1, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/urr;->f:Ll/msr;

    .line 110
    .line 111
    if-eqz p1, :cond_2

    .line 112
    .line 113
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-virtual {p1}, Ll/ppi0;->x()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-nez p1, :cond_2

    .line 122
    .line 123
    iget-object p1, p0, Ll/urr;->f:Ll/msr;

    .line 124
    .line 125
    invoke-virtual {p1}, Ll/msr;->z3()V

    .line 126
    .line 127
    .line 128
    :cond_2
    sget-object p1, Ll/t4u;->e:Lrx/subjects/b;

    .line 129
    .line 130
    invoke-virtual {p0, p1, v3}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    new-instance p2, Ll/srr;

    .line 139
    .line 140
    invoke-direct {p2, p0}, Ll/srr;-><init>(Ll/urr;)V

    .line 141
    .line 142
    .line 143
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 144
    .line 145
    .line 146
    move-result-object p2

    .line 147
    invoke-virtual {p1, p2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iget-object p1, p1, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 155
    .line 156
    invoke-virtual {p1}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;->tabSelected()Ll/v3f$d;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    check-cast p1, Lrx/c;

    .line 165
    .line 166
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    new-instance p1, Ll/trr;

    .line 171
    .line 172
    invoke-direct {p1, v1}, Ll/trr;-><init>(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesEntryView;)V

    .line 173
    .line 174
    .line 175
    invoke-static {p1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    return-void
.end method

.method public final synthetic U2()Ljava/lang/String;
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

.method public final synthetic V2(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urr;->f:Ll/msr;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/msr;->z3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
