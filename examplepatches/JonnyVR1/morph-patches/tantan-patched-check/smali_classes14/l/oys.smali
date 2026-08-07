.class public Ll/oys;
.super Ll/dvs;
.source "SourceFile"

# interfaces
.implements Ll/sm50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dvs<",
        "Ll/rys;",
        ">;",
        "Ll/sm50;"
    }
.end annotation


# instance fields
.field public final f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

.field public g:Z

.field public final h:Ll/wyd0;

.field public i:Ljava/lang/String;

.field public j:Z


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dvs;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/oys;->g:Z

    .line 6
    .line 7
    new-instance v0, Ll/wyd0;

    .line 8
    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "live_square_start_live_"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/mbs;->o0()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, ""

    .line 28
    .line 29
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/oys;->h:Ll/wyd0;

    .line 33
    .line 34
    iput-object p3, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 35
    .line 36
    new-instance v0, Ll/rys;

    .line 37
    .line 38
    invoke-direct {v0, p3}, Ll/rys;-><init>(Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/zus;

    .line 47
    .line 48
    iget-object p3, p3, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->a:Lv/VDraweeView;

    .line 49
    .line 50
    invoke-direct {v0, p1, p2, p3}, Ll/zus;-><init>(Ll/ner;Ll/nus;Lv/VDraweeView;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic P2(Ll/oys;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oys;->e3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic Q2(Ll/oys;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oys;->g3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic R2(Ll/oys;Lcom/p1/mobile/putong/live/base/data/BLiveTapBarStartLiveConfig;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oys;->m3(Lcom/p1/mobile/putong/live/base/data/BLiveTapBarStartLiveConfig;)V

    return-void
.end method

.method public static synthetic S2(Ll/oys;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/oys;->f3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic T2(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

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

.method public static synthetic U2(Ll/oys;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oys;->c3(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method

.method public static synthetic V2(Ll/oys;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oys;->d3(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic W2(Ll/oys;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oys;->i3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X2(Ll/oys;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oys;->h3(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic Y2(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "StartLiveBubble"

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

.method private synthetic f3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/rys;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput-boolean p1, v0, Ll/rys;->d:Z

    .line 10
    .line 11
    invoke-direct {p0}, Ll/oys;->u3()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private synthetic g3(Ljava/lang/Boolean;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 v0, p1, 0x1

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/oys;->j:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/oys;->Z2()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private u3()V
    .locals 3

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
    move-result-object v0

    .line 10
    check-cast v0, Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v1, Ll/rys;

    .line 15
    .line 16
    invoke-static {}, Ll/mqr;->k()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iput-boolean v2, v1, Ll/rys;->e:Z

    .line 21
    .line 22
    invoke-static {}, Ll/mqr;->k()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_0

    .line 27
    .line 28
    const-string v1, "p_audio_explore_recommend"

    .line 29
    .line 30
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v0, 0x0

    .line 39
    :goto_0
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v1, Ll/rys;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ll/rys;->l(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Ll/oys;->p3(Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public S(ZLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/oys;->t3()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast v0, Ll/rys;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/rys;->d(Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Ll/oys;->i:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Ll/oys;->i:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    iput-object p1, p0, Ll/oys;->i:Ljava/lang/String;

    .line 34
    .line 35
    :cond_1
    const-string p1, "square-curated"

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-virtual {p0, p1}, Ll/oys;->o3(Z)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/rys;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/rys;->r()V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    new-instance v1, Ll/cys;

    .line 20
    .line 21
    invoke-direct {v1}, Ll/cys;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/fys;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/fys;-><init>(Ll/oys;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/live/external/module/api/LiveAssertApi;->getUserStartLiveObs()Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/gys;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/gys;-><init>(Ll/oys;)V

    .line 63
    .line 64
    .line 65
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeStartLiveEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;->showRedDot()Ll/v3f$d;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lrx/c;

    .line 87
    .line 88
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 93
    .line 94
    check-cast v1, Ll/rys;

    .line 95
    .line 96
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    new-instance v2, Ll/hys;

    .line 100
    .line 101
    invoke-direct {v2, v1}, Ll/hys;-><init>(Ll/rys;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeStartLiveEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;

    .line 116
    .line 117
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;->startLiveSkinEvent()Ll/v3f$d;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Lrx/c;

    .line 126
    .line 127
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    new-instance v1, Ll/iys;

    .line 144
    .line 145
    invoke-direct {v1, p0}, Ll/iys;-><init>(Ll/oys;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0}, Ll/ppi0;->y()Lrx/c;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    new-instance v1, Ll/jys;

    .line 180
    .line 181
    invoke-direct {v1, p0}, Ll/jys;-><init>(Ll/oys;)V

    .line 182
    .line 183
    .line 184
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 189
    .line 190
    .line 191
    invoke-static {}, Ll/t4u;->i()Lrx/c;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    new-instance v1, Ll/kys;

    .line 200
    .line 201
    invoke-direct {v1, p0}, Ll/kys;-><init>(Ll/oys;)V

    .line 202
    .line 203
    .line 204
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 216
    .line 217
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->isLiveVideoStyle()Ll/v3f$d;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    check-cast v0, Lrx/c;

    .line 226
    .line 227
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    new-instance v1, Ll/lys;

    .line 232
    .line 233
    invoke-direct {v1, p0}, Ll/lys;-><init>(Ll/oys;)V

    .line 234
    .line 235
    .line 236
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 241
    .line 242
    .line 243
    return-void
.end method

.method public final Z2()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/oys;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/oys;->g:Z

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ll/evs;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/evs;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/mus;->N2(Ll/hk2;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ll/mqr;->k()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    const-string v1, "p_audio_explore_recommend"

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v0, 0x0

    .line 37
    :goto_0
    invoke-virtual {p0, v0}, Ll/oys;->p3(Z)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget-object v0, p0, Ll/oys;->i:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Ll/oys;->i:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const/4 v0, 0x0

    .line 59
    iput-object v0, p0, Ll/oys;->i:Ljava/lang/String;

    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public final a3()Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;
    .locals 3

    .line 1
    sget-object v0, Ll/itd0;->b:Ll/itd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/fk3;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/fk3;->k()Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return-object v1

    .line 17
    :cond_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMonetizationConfig;->bubbleConfigs:Ljava/util/List;

    .line 18
    .line 19
    new-instance v2, Ll/eys;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/eys;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v2}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ll/oys;->j3(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_2

    .line 45
    .line 46
    iget-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    check-cast p0, Ljava/lang/CharSequence;

    .line 54
    .line 55
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    return-object v0

    .line 63
    :cond_2
    :goto_0
    return-object v1
.end method

.method public b2(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/y6u;->n(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final b3()[J
    .locals 13

    .line 1
    iget-object p0, p0, Ll/oys;->h:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x4

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    new-array p0, v1, [J

    .line 17
    .line 18
    fill-array-data p0, :array_0

    .line 19
    .line 20
    .line 21
    return-object p0

    .line 22
    :cond_0
    :try_start_0
    const-string v0, ":"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 v0, 0x0

    .line 29
    aget-object v2, p0, v0

    .line 30
    .line 31
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v2

    .line 35
    const/4 v4, 0x1

    .line 36
    aget-object v5, p0, v4

    .line 37
    .line 38
    invoke-static {v5}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 39
    .line 40
    .line 41
    move-result-wide v5

    .line 42
    const/4 v7, 0x2

    .line 43
    aget-object v8, p0, v7

    .line 44
    .line 45
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v8

    .line 49
    const/4 v10, 0x3

    .line 50
    aget-object p0, p0, v10

    .line 51
    .line 52
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 53
    .line 54
    .line 55
    move-result-wide v11

    .line 56
    new-array p0, v1, [J

    .line 57
    .line 58
    aput-wide v2, p0, v0

    .line 59
    .line 60
    aput-wide v5, p0, v4

    .line 61
    .line 62
    aput-wide v8, p0, v7

    .line 63
    .line 64
    aput-wide v11, p0, v10
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    return-object p0

    .line 67
    :catch_0
    new-array p0, v1, [J

    .line 68
    .line 69
    fill-array-data p0, :array_1

    .line 70
    .line 71
    .line 72
    return-object p0

    .line 73
    :array_0
    .array-data 8
        0x0
        0x0
        0x0
        0x0
    .end array-data

    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    :array_1
    .array-data 8
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public final synthetic c3(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/oys;->u3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d3(Landroid/net/NetworkInfo;)V
    .locals 1

    .line 1
    sget-object p1, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/mof0;->k()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/mys;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/mys;-><init>(Ll/oys;)V

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

.method public final synthetic e3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/oys;->u3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic h3(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/oys;->g:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic i3(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Ll/fwk;->h()Ll/fwk;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/fwk;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/oys;->q3()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final j3(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Z
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/oys;->b3()[J

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    aget-wide v1, p0, v0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    aget-wide v2, p0, v1

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    aget-wide v3, p0, v2

    .line 13
    .line 14
    invoke-static {}, Ll/pzi0;->n()J

    .line 15
    .line 16
    .line 17
    move-result-wide v3

    .line 18
    aget-wide v5, p0, v2

    .line 19
    .line 20
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleUserShowMaxCount:I

    .line 21
    .line 22
    int-to-long v7, v2

    .line 23
    cmp-long v2, v5, v7

    .line 24
    .line 25
    if-gez v2, :cond_1

    .line 26
    .line 27
    aget-wide v5, p0, v0

    .line 28
    .line 29
    cmp-long v2, v3, v5

    .line 30
    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    aget-wide v2, p0, v1

    .line 34
    .line 35
    iget v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEveryDayShowMaxCount:I

    .line 36
    .line 37
    int-to-long v4, v4

    .line 38
    cmp-long v2, v2, v4

    .line 39
    .line 40
    if-gez v2, :cond_1

    .line 41
    .line 42
    :cond_0
    move v2, v1

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move v2, v0

    .line 45
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 46
    .line 47
    .line 48
    move-result-wide v3

    .line 49
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTimeInterval:J

    .line 50
    .line 51
    const-wide/16 v7, 0x3e8

    .line 52
    .line 53
    mul-long/2addr v5, v7

    .line 54
    sub-long/2addr v3, v5

    .line 55
    const/4 p1, 0x3

    .line 56
    aget-wide v5, p0, p1

    .line 57
    .line 58
    cmp-long p0, v3, v5

    .line 59
    .line 60
    if-lez p0, :cond_2

    .line 61
    .line 62
    move p0, v1

    .line 63
    goto :goto_1

    .line 64
    :cond_2
    move p0, v0

    .line 65
    :goto_1
    invoke-static {}, Ll/mqr;->k()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    if-eqz v2, :cond_3

    .line 72
    .line 73
    if-eqz p0, :cond_3

    .line 74
    .line 75
    return v1

    .line 76
    :cond_3
    return v0
.end method

.method public k3(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ll/itd0;->e:Ll/itd0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/tbs;->m(Ll/itd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/fm3;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p1, v0}, Ll/fm3;->i(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "p_live"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/n4u;->l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final m3(Lcom/p1/mobile/putong/live/base/data/BLiveTapBarStartLiveConfig;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/rys;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/rys;->j(Lcom/p1/mobile/putong/live/base/data/BLiveTapBarStartLiveConfig;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final n3()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/oys;->b3()[J

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/pzi0;->n()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    const/4 v3, 0x0

    .line 10
    aget-wide v3, v0, v3

    .line 11
    .line 12
    cmp-long v3, v1, v3

    .line 13
    .line 14
    iget-object p0, p0, Ll/oys;->h:Ll/wyd0;

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    const-wide/16 v5, 0x1

    .line 18
    .line 19
    const-string v7, ":"

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ":1:"

    .line 32
    .line 33
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    aget-wide v1, v0, v4

    .line 37
    .line 38
    add-long/2addr v1, v5

    .line 39
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-static {}, Ll/pzi0;->o()J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    const/4 v1, 0x1

    .line 72
    aget-wide v1, v0, v1

    .line 73
    .line 74
    add-long/2addr v1, v5

    .line 75
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    aget-wide v1, v0, v4

    .line 82
    .line 83
    add-long/2addr v1, v5

    .line 84
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-static {}, Ll/pzi0;->o()J

    .line 91
    .line 92
    .line 93
    move-result-wide v0

    .line 94
    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {p0, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public o3(Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/mbs;->g()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->a()Ll/tq8;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/tq8;->w()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_5

    .line 14
    .line 15
    iget-object v0, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 16
    .line 17
    const/high16 v1, 0x40800000    # 4.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->a:Lv/VDraweeView;

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 38
    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    iget-object p1, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->a:Lv/VDraweeView;

    .line 42
    .line 43
    invoke-static {}, Ll/mbs;->h()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    sget v0, Ll/nbc0;->j0:I

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    sget v0, Ll/nbc0;->i0:I

    .line 53
    .line 54
    :goto_0
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->b:Lv/VDraweeView;

    .line 60
    .line 61
    invoke-static {}, Ll/mbs;->h()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_1

    .line 66
    .line 67
    sget p1, Ll/nbc0;->Z:I

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_1
    sget p1, Ll/nbc0;->Y:I

    .line 71
    .line 72
    :goto_1
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->a:Lv/VDraweeView;

    .line 77
    .line 78
    invoke-static {}, Ll/mbs;->h()Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_3

    .line 83
    .line 84
    sget v0, Ll/nbc0;->h0:I

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_3
    sget v0, Ll/nbc0;->g0:I

    .line 88
    .line 89
    :goto_2
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->b:Lv/VDraweeView;

    .line 95
    .line 96
    invoke-static {}, Ll/mbs;->h()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_4

    .line 101
    .line 102
    sget p1, Ll/nbc0;->X:I

    .line 103
    .line 104
    goto :goto_3

    .line 105
    :cond_4
    sget p1, Ll/nbc0;->W:I

    .line 106
    .line 107
    :goto_3
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_5
    iget-object v0, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 112
    .line 113
    if-eqz p1, :cond_6

    .line 114
    .line 115
    iget-object p1, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->a:Lv/VDraweeView;

    .line 116
    .line 117
    sget v0, Ll/nbc0;->l0:I

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 120
    .line 121
    .line 122
    iget-object p0, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->b:Lv/VDraweeView;

    .line 125
    .line 126
    sget p1, Ll/nbc0;->D0:I

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 129
    .line 130
    .line 131
    return-void

    .line 132
    :cond_6
    iget-object p1, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->a:Lv/VDraweeView;

    .line 133
    .line 134
    sget v0, Ll/nbc0;->k0:I

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p0, Ll/oys;->f:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;

    .line 140
    .line 141
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/topButton/LiveSquareTopButtonLiveView;->b:Lv/VDraweeView;

    .line 142
    .line 143
    sget p1, Ll/nbc0;->C0:I

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setActualImageResource(I)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public final p3(Z)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/oys;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    if-eqz p1, :cond_3

    .line 6
    .line 7
    invoke-static {}, Ll/t4u;->h()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_3

    .line 12
    .line 13
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Ll/ppi0;->x()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    goto/16 :goto_1

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/oys;->a3()Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    goto/16 :goto_1

    .line 32
    .line 33
    :cond_1
    const/4 v0, 0x1

    .line 34
    iput-boolean v0, p0, Ll/oys;->g:Z

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/oys;->r3()V

    .line 37
    .line 38
    .line 39
    new-instance v1, Lv/VText;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-direct {v1, v2}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 49
    .line 50
    sget v3, Ll/bnl0;->e:I

    .line 51
    .line 52
    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextList:Ljava/util/List;

    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    check-cast v2, Ljava/lang/CharSequence;

    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    sget v2, Ll/qa00;->j:I

    .line 71
    .line 72
    const/high16 v3, 0x41300000    # 11.0f

    .line 73
    .line 74
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    invoke-virtual {v1, v2, v4, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 83
    .line 84
    .line 85
    new-instance v2, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v3, "#"

    .line 88
    .line 89
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleTextColor:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result v2

    .line 105
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 106
    .line 107
    .line 108
    new-instance v2, Lcom/p1/mobile/android/ui/bubble/a;

    .line 109
    .line 110
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-direct {v2, v4}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v2, v1}, Lcom/p1/mobile/android/ui/bubble/a;->s(Landroid/view/View;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    new-instance v1, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleStartColor:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    new-instance v2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleEndColor:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v2

    .line 161
    filled-new-array {v1, v2}, [I

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    const/high16 v1, 0x41600000    # 14.0f

    .line 170
    .line 171
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->bubbleDisappear:I

    .line 176
    .line 177
    int-to-long v1, p1

    .line 178
    const-wide/16 v3, 0x3e8

    .line 179
    .line 180
    mul-long/2addr v1, v3

    .line 181
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/ui/bubble/a;->b(J)Lcom/p1/mobile/android/ui/bubble/a;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    new-instance v0, Ll/nys;

    .line 186
    .line 187
    invoke-direct {v0, p0}, Ll/nys;-><init>(Ll/oys;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->j(Lcom/p1/mobile/android/ui/bubble/a$c;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    new-instance v0, Ll/dys;

    .line 195
    .line 196
    invoke-direct {v0, p0}, Ll/dys;-><init>(Ll/oys;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->d(Lcom/p1/mobile/android/ui/bubble/a$b;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->N:I

    .line 204
    .line 205
    sget v1, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 206
    .line 207
    or-int/2addr v0, v1

    .line 208
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 213
    .line 214
    check-cast v0, Ll/rys;

    .line 215
    .line 216
    iget-object v0, v0, Ll/rys;->h:Landroid/view/View;

    .line 217
    .line 218
    instance-of v0, v0, Lv/VText;

    .line 219
    .line 220
    if-eqz v0, :cond_2

    .line 221
    .line 222
    const/high16 v0, 0x40c00000    # 6.0f

    .line 223
    .line 224
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->x(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 229
    .line 230
    .line 231
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 232
    .line 233
    const/high16 v1, 0x41100000    # 9.0f

    .line 234
    .line 235
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 240
    .line 241
    .line 242
    goto :goto_0

    .line 243
    :cond_2
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->P:I

    .line 244
    .line 245
    const/high16 v1, 0x40400000    # 3.0f

    .line 246
    .line 247
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/ui/bubble/a;->o(II)Lcom/p1/mobile/android/ui/bubble/a;

    .line 252
    .line 253
    .line 254
    :goto_0
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 259
    .line 260
    check-cast v1, Ll/rys;

    .line 261
    .line 262
    iget-object v1, v1, Ll/rys;->h:Landroid/view/View;

    .line 263
    .line 264
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/android/ui/bubble/d;->t(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    iput-object p1, p0, Ll/oys;->i:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {p0}, Ll/oys;->n3()V

    .line 271
    .line 272
    .line 273
    :cond_3
    :goto_1
    return-void
.end method

.method public q3()V
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
    const-string v0, "e_live_start_bubble"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public r3()V
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
    const-string v0, "e_live_start_bubble"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public s3()V
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
    const-string v0, "e_post_live"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public t3()V
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
    const-string v0, "e_post_live"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
