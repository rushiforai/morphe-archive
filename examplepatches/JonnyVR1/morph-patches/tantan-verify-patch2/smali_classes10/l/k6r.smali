.class public Ll/k6r;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/data/Pagination;

.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ""

    .line 5
    .line 6
    iput-object p1, p0, Ll/k6r;->j:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J3(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k6r;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic K3(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k6r;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k6r;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/k6r;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k6r;->a4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N3(Ll/k6r;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k6r;->b4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic O3(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k6r;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    return-void
.end method

.method public static synthetic P3(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k6r;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic R3(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k6r;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method private T3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 4
    .line 5
    if-nez p1, :cond_1

    .line 6
    .line 7
    :cond_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->m0()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Ll/k6r;->j:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/k6r;->d4(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method


# virtual methods
.method public S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 2

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
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/rwn0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {v0}, Ll/rqn0;->h(Ljava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/e6r;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/e6r;-><init>(Ll/k6r;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    new-instance v1, Ll/f6r;

    .line 45
    .line 46
    invoke-direct {v1, p0, p1}, Ll/f6r;-><init>(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Ll/g6r;

    .line 54
    .line 55
    invoke-direct {v1, p0, p1}, Ll/g6r;-><init>(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 56
    .line 57
    .line 58
    new-instance p0, Ll/z2e0;

    .line 59
    .line 60
    invoke-direct {p0}, Ll/z2e0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Ll/rwn0;

    .line 76
    .line 77
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_1

    .line 82
    .line 83
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    new-instance v1, Ll/bzm0;

    .line 94
    .line 95
    invoke-direct {v1}, Ll/bzm0;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Ll/rwn0;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v1, Ll/h6r;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Ll/h6r;-><init>(Ll/k6r;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v1, Ll/p3r;

    .line 125
    .line 126
    invoke-direct {v1}, Ll/p3r;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    const/4 v1, 0x1

    .line 134
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/i6r;

    .line 139
    .line 140
    invoke-direct {v1, p0, p1}, Ll/i6r;-><init>(Ll/k6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_1
    new-instance p1, Ll/th0$a;

    .line 152
    .line 153
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-direct {p1, v0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 158
    .line 159
    .line 160
    const-string v0, "\u7533\u8bf7\u4e0a\u9ea6\u6f14\u5531"

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    const-string v0, "\u4e0a\u9ea6\u540e\u624d\u80fd\u5531\u6b4c\u54e6\uff0c\u5411\u7fa4\u4e3b\u7533\u8bf7\u4e0a\u9ea6\u5427"

    .line 167
    .line 168
    invoke-virtual {p1, v0}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    const-string v0, "\u53d1\u51fa\u7533\u8bf7"

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    new-instance v0, Ll/j6r;

    .line 179
    .line 180
    invoke-direct {v0, p0}, Ll/j6r;-><init>(Ll/k6r;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1, v0}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    const-string p1, "\u53d6\u6d88"

    .line 188
    .line 189
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/k6r;->d4(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final U3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    iput-object v0, p0, Ll/k6r;->i:Lcom/p1/mobile/putong/data/Pagination;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->voiceKTVSongs:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->p0(Ljava/util/List;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->status:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "end"

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {p1}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Ll/rwn0;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Ll/rqn0;->n(Ljava/lang/String;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public final synthetic W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)Lrx/c;
    .locals 0

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
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->songCode:Ljava/lang/String;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->provider:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p0, p2, p1}, Ll/rqn0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k6r;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 0

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
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;->template:Ljava/lang/String;

    .line 12
    .line 13
    const-string p1, "ktv"

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic Z3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k6r;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic a4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->KtvDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;->closeKtvDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance p1, Ll/bzm0;

    .line 25
    .line 26
    invoke-direct {p1}, Ll/bzm0;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic b4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/k6r;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public c4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k6r;->i:Lcom/p1/mobile/putong/data/Pagination;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/k6r;->i:Lcom/p1/mobile/putong/data/Pagination;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ll/k6r;->d4(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    :goto_0
    const-string p0, "\u6ca1\u6709\u66f4\u591a\u6570\u636e\u4e86"

    .line 29
    .line 30
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final d4(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/k6r;->j:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0, p1}, Ll/rqn0;->k(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/c6r;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Ll/c6r;-><init>(Ll/k6r;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->changeCurrentKtvPlayInfo()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance v0, Ll/d6r;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/d6r;-><init>(Ll/k6r;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, v0}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final e4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;->isOrdered:Z

    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvSuggestViewModel;->setSongSelected(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKTVSong;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
