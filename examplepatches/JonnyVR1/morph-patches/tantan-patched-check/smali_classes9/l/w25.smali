.class public Ll/w25;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TD;",
        "Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;",
            "Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 5
    .line 6
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic J3(Ll/h1e;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget p0, p0, Ll/h1e;->b:I

    .line 2
    .line 3
    const/16 v0, 0x50

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic K3(Ll/w25;Ll/c0r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w25;->X3(Ll/c0r;)V

    return-void
.end method

.method public static synthetic L3(Ll/h1e;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/h1e;->a:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CHAT_INPUT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic M3(Ll/w25;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w25;->T3(Z)V

    return-void
.end method

.method public static synthetic N3(Ll/w25;Ll/fyb;Ljava/lang/Float;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w25;->Y3(Ll/fyb;Ljava/lang/Float;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O3(Ll/w25;Ll/h1e;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w25;->a4(Ll/h1e;)V

    return-void
.end method

.method public static synthetic P3(Ll/w25;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w25;->S3(Z)V

    return-void
.end method

.method public static synthetic R3(Ll/w25;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/w25;->Z3(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic Z3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->setLiveMode(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private g4(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->l(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->o(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final S3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->p(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->setApplyLineVisibility()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/n25;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/n25;-><init>(Ll/w25;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->CampaignVisibleChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$CampaignVisibleChangeEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$CampaignVisibleChangeEvent;->VISIBLE()Ll/v3f$d;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/o25;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/o25;-><init>(Ll/w25;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->keyboardDetectorChange()Ll/v3f$d;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/p25;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/p25;-><init>(Ll/w25;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->customChatInputStyle()Ll/v3f$d;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    check-cast v0, Lrx/c;

    .line 115
    .line 116
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget-object v1, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 129
    .line 130
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    new-instance v2, Ll/q25;

    .line 134
    .line 135
    invoke-direct {v2, v1}, Ll/q25;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 150
    .line 151
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->ctypChanged()Ll/v3f$d;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    check-cast v0, Lrx/c;

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->videoSizeChanged()Ll/v3f$d;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    check-cast v1, Lrx/c;

    .line 176
    .line 177
    new-instance v2, Ll/r25;

    .line 178
    .line 179
    invoke-direct {v2, p0}, Ll/r25;-><init>(Ll/w25;)V

    .line 180
    .line 181
    .line 182
    invoke-static {v0, v1, v2}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    new-instance v1, Ll/s25;

    .line 199
    .line 200
    invoke-direct {v1, p0}, Ll/s25;-><init>(Ll/w25;)V

    .line 201
    .line 202
    .line 203
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 208
    .line 209
    .line 210
    return-void
.end method

.method public final T3(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Landroid/view/View;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/j35;->a(Landroid/view/View;Z)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->refreshChatList()Ll/v3f$c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 20
    .line 21
    .line 22
    const/high16 v0, 0x41200000    # 10.0f

    .line 23
    .line 24
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p1, v0

    .line 29
    invoke-virtual {p0, p1}, Ll/w25;->f4(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public U3(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->d(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->f(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public V3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "chatButtonBubble"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public W3(Ljava/lang/String;)Ll/g4$a;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->h(Ljava/lang/String;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/g4$a;

    .line 14
    .line 15
    iget-object p0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->h(Ljava/lang/String;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-direct {v0, p0}, Ll/g4$a;-><init>(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final synthetic X3(Ll/c0r;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 4
    .line 5
    iget-boolean v0, p1, Ll/c0r;->a:Z

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p1, Ll/c0r;->b:I

    .line 12
    .line 13
    iget-boolean p1, p1, Ll/c0r;->c:Z

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->k(Ljava/lang/Boolean;IZ)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic Y3(Ll/fyb;Ljava/lang/Float;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Ll/fyb;->a:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/high16 p2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    cmpl-float p1, p1, p2

    .line 12
    .line 13
    if-lez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 34
    .line 35
    const-string p1, "obs"

    .line 36
    .line 37
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_0

    .line 42
    .line 43
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 47
    .line 48
    return-object p0
.end method

.method public final synthetic a4(Ll/h1e;)V
    .locals 0

    .line 1
    iget-boolean p1, p1, Ll/h1e;->c:Z

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ll/w25;->g4(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b4(IZ)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->scrollToEnd()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->setDefaultHeight(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public c4(ZLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/vv4;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Ll/vv4;-><init>(ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public d4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->f()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->m()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->n(Lcom/p1/mobile/putong/live/base/data/BLiveChatTip;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f4(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatViewRightChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatViewRightChangeEvent;->chatRightChange()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public h4(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->m(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->q(Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->g()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;->l(Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/w25;->i:Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;->o(Z)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->m()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showBubbleByType()Ll/v3f$d;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "chatButtonBubble"

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->DialogCenterEvent:Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$DialogCenterEvent;->changeVisibility()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lrx/c;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/t25;

    .line 63
    .line 64
    invoke-direct {v1}, Ll/t25;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/u25;

    .line 72
    .line 73
    invoke-direct {v1}, Ll/u25;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/v25;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/v25;-><init>(Ll/w25;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    return-void
.end method
