.class public Ll/f05;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public i:Ll/w25;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/w25<",
            "TD;>;"
        }
    .end annotation
.end field

.field public j:Ll/mw4;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/mw4<",
            "TD;>;"
        }
    .end annotation
.end field

.field public k:Ll/or2;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V
    .locals 5
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
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/zze;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/zze;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/hez;

    .line 10
    .line 11
    invoke-direct {v1}, Ll/hez;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v2, Ll/n500;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/n500;-><init>()V

    .line 17
    .line 18
    .line 19
    const/4 v3, 0x3

    .line 20
    new-array v3, v3, [Ll/vr4;

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    aput-object v0, v3, v4

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    aput-object v1, v3, v0

    .line 27
    .line 28
    const/4 v0, 0x2

    .line 29
    aput-object v2, v3, v0

    .line 30
    .line 31
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v0}, Ll/vr4;->a(Ljava/util/List;)Ll/vr4;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/or2;

    .line 40
    .line 41
    iput-object v0, p0, Ll/f05;->k:Ll/or2;

    .line 42
    .line 43
    new-instance v0, Ll/mw4;

    .line 44
    .line 45
    invoke-direct {v0, p1}, Ll/mw4;-><init>(Ll/dum;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ll/mw4;

    .line 53
    .line 54
    iput-object v0, p0, Ll/f05;->j:Ll/mw4;

    .line 55
    .line 56
    new-instance v0, Ll/w25;

    .line 57
    .line 58
    invoke-direct {v0, p1, p2, p3}, Ll/w25;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/ChatView;Lcom/p1/mobile/putong/live/livingroom/common/chat/inputEntry/ChatInputEntryView;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ll/w25;

    .line 66
    .line 67
    iput-object p1, p0, Ll/f05;->i:Ll/w25;

    .line 68
    .line 69
    return-void
.end method

.method public static synthetic J3(Ll/f05;Ll/w2c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f05;->Y3(Ll/w2c;)V

    return-void
.end method

.method public static synthetic K3(Ll/f05;Ll/rz4;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f05;->V3(Ll/rz4;)V

    return-void
.end method

.method public static synthetic L3(Ll/f05;Ll/vf3$c;)Ll/g4$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f05;->a4(Ll/vf3$c;)Ll/g4$a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/f05;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f05;->g4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic N3(Ll/f05;Ll/gw40;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f05;->X3(Ll/gw40;)V

    return-void
.end method

.method public static synthetic O3(Ll/f05;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f05;->f4(Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic P3(Ll/f05;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/f05;->Z3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic R3(Ll/f05;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f05;->e4(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic S3(Ll/f05;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f05;->d4(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic T3(Ll/f05;Landroid/util/Size;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f05;->b4(Landroid/util/Size;)V

    return-void
.end method

.method public static synthetic U3(Ll/f05;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f05;->c4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method private synthetic Z3(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f05;->h4()V

    .line 2
    .line 3
    .line 4
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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

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
    new-instance v1, Ll/tz4;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/tz4;-><init>(Ll/f05;)V

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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendNormalMessage()Ll/v3f$d;

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
    new-instance v1, Ll/wz4;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/wz4;-><init>(Ll/f05;)V

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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendDanmakuMessage()Ll/v3f$d;

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
    new-instance v1, Ll/xz4;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/xz4;-><init>(Ll/f05;)V

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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onChatInputDialogDismiss()Ll/v3f$c;

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
    new-instance v1, Ll/yz4;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Ll/yz4;-><init>(Ll/f05;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 130
    .line 131
    .line 132
    new-instance v0, Ll/zz4;

    .line 133
    .line 134
    invoke-direct {v0, p0}, Ll/zz4;-><init>(Ll/f05;)V

    .line 135
    .line 136
    .line 137
    const-class v1, Ll/vf3$c;

    .line 138
    .line 139
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 147
    .line 148
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    check-cast v0, Lrx/c;

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    new-instance v1, Ll/a05;

    .line 163
    .line 164
    invoke-direct {v1, p0}, Ll/a05;-><init>(Ll/f05;)V

    .line 165
    .line 166
    .line 167
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 168
    .line 169
    .line 170
    move-result-object v1

    .line 171
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->sendChatMessage()Ll/v3f$d;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Lrx/c;

    .line 189
    .line 190
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    new-instance v1, Ll/b05;

    .line 203
    .line 204
    invoke-direct {v1, p0}, Ll/b05;-><init>(Ll/f05;)V

    .line 205
    .line 206
    .line 207
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method public final V3(Ll/rz4;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Ll/rz4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Ll/rz4$a;->a(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;)Ll/rz4$a;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;->getMessageOnly()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1, v0}, Ll/f05;->m4(Ljava/lang/String;Ll/rz4$a;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public W3(Ljava/lang/String;)Ll/g4$a;
    .locals 1

    .line 1
    const-string v0, "chatButtonBubble"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "bulletCommentButtonBubble"

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "stormCommentButtonBubble"

    .line 18
    .line 19
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0

    .line 28
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/f05;->i:Ll/w25;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/w25;->W3(Ljava/lang/String;)Ll/g4$a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final synthetic X3(Ll/gw40;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/gw40;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Ll/gw40;->b:Ll/rz4$a;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/f05;->m4(Ljava/lang/String;Ll/rz4$a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Y3(Ll/w2c;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/w2c;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, Ll/w2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Ll/f05;->l4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic a4(Ll/vf3$c;)Ll/g4$a;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/vf3;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f05;->W3(Ljava/lang/String;)Ll/g4$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic b4(Landroid/util/Size;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/f05;->i:Ll/w25;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Ll/w25;->U3(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Ll/f05;->i:Ll/w25;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iget-object p0, p0, Ll/f05;->j:Ll/mw4;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/mw4;->p4()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {v0, p1, p0}, Ll/w25;->b4(IZ)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public final synthetic c4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/f05;->i4(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/f05;->j:Ll/mw4;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/mw4;->n4()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSendSuccess()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p1, Ll/z2c;

    .line 20
    .line 21
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->masks:Ljava/util/List;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 31
    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveData;->videoLiveBulletComment:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 35
    .line 36
    invoke-direct {p1, v0, p2}, Ll/z2c;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic d4(Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "0"

    .line 3
    .line 4
    invoke-virtual {p0, v0, p1, v1}, Ll/f05;->o4(ZLjava/lang/CharSequence;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic e4(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v1, p2

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v1, v1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v2, 0xa03d

    .line 11
    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->FastRechargeEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$FastRechargeEventGroup;->showFastRechargeDialog()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    new-instance v0, Ll/bkg$a;

    .line 26
    .line 27
    invoke-direct {v0}, Ll/bkg$a;-><init>()V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x2

    .line 31
    invoke-virtual {v0, v1}, Ll/bkg$a;->g(I)Ll/bkg$a;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "liveGiftDanMuKuClick"

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/bkg$a;->j(Ljava/lang/String;)Ll/bkg$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/vz4;

    .line 42
    .line 43
    invoke-direct {v1, p0, p1}, Ll/vz4;-><init>(Ll/f05;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/bkg$a;->f(Ll/x20;)Ll/bkg$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ll/bkg$a;->e()Ll/bkg;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p2, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/f05;->j:Ll/mw4;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/mw4;->n4()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    if-eqz v0, :cond_2

    .line 64
    .line 65
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 66
    .line 67
    iget p0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 68
    .line 69
    iget-object p1, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 70
    .line 71
    const p2, 0x9ca3

    .line 72
    .line 73
    .line 74
    if-ne p0, p2, :cond_1

    .line 75
    .line 76
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_2

    .line 85
    .line 86
    invoke-static {p1}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    return-void
.end method

.method public final synthetic f4(Ljava/lang/String;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendMessageResult()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/f05;->j4(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic g4(Ljava/lang/Throwable;)V
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
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendMessageResult()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1}, Ll/snt;->a(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public h4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f05;->i:Ll/w25;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/w25;->d4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f05;->j:Ll/mw4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mw4;->A4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j4(Ljava/lang/String;)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/f05;->j:Ll/mw4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/mw4;->D4(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final k4()V
    .locals 1

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    iput-object v0, p0, Ll/f05;->l:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Ll/f05;->n:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Ll/f05;->m:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public l4(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v5, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 36
    .line 37
    move-object v1, p1

    .line 38
    move-object v2, p2

    .line 39
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->C7(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    new-instance p2, Ll/c05;

    .line 48
    .line 49
    invoke-direct {p2, p0, v1}, Ll/c05;-><init>(Ll/f05;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    new-instance v0, Ll/d05;

    .line 53
    .line 54
    invoke-direct {v0, p0, v1}, Ll/d05;-><init>(Ll/f05;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p2, v0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public m4(Ljava/lang/String;Ll/rz4$a;)V
    .locals 4
    .param p2    # Ll/rz4$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    new-instance p2, Ll/rz4$a;

    .line 6
    .line 7
    invoke-direct {p2, v0}, Ll/rz4$a;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object v1, p0, Ll/f05;->k:Ll/or2;

    .line 11
    .line 12
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v1, v2}, Ll/or2;->g(Ll/pf60;)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ll/vwt;->Y3()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    iget-object v1, p0, Ll/f05;->n:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_2

    .line 45
    .line 46
    iget-object v1, p0, Ll/f05;->n:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, p0, Ll/f05;->n:Ljava/lang/String;

    .line 53
    .line 54
    :cond_2
    const-string v1, "3"

    .line 55
    .line 56
    iget-object v2, p0, Ll/f05;->l:Ljava/lang/String;

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_3

    .line 63
    .line 64
    iget-object v1, p0, Ll/f05;->m:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_3

    .line 71
    .line 72
    iget-object v1, p0, Ll/f05;->n:Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_3

    .line 79
    .line 80
    iget-object v1, p0, Ll/f05;->n:Ljava/lang/String;

    .line 81
    .line 82
    const-string v2, "@"

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    if-eqz v1, :cond_3

    .line 89
    .line 90
    iget-object v1, p0, Ll/f05;->n:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-eqz v1, :cond_3

    .line 97
    .line 98
    iget-object v1, p0, Ll/f05;->n:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iget-object v3, p0, Ll/f05;->m:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v3, p2, Ll/rz4$a;->b:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v3, p0, Ll/f05;->n:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v3, v2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p2, Ll/rz4$a;->c:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    invoke-virtual {p0}, Ll/f05;->k4()V

    .line 118
    .line 119
    .line 120
    move-object v1, p1

    .line 121
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0, v1, p2}, Ll/oo2;->V1(Ljava/lang/String;Ll/rz4$a;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-virtual {p0, p2}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 130
    .line 131
    .line 132
    move-result-object p2

    .line 133
    new-instance v0, Ll/e05;

    .line 134
    .line 135
    invoke-direct {v0, p0, p1}, Ll/e05;-><init>(Ll/f05;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    new-instance p1, Ll/uz4;

    .line 139
    .line 140
    invoke-direct {p1, p0}, Ll/uz4;-><init>(Ll/f05;)V

    .line 141
    .line 142
    .line 143
    invoke-static {v0, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public n4(Ll/vv4;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Ll/vv4;->c:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Ll/f05;->l:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "3"

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p1, Ll/vv4;->f:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Ll/f05;->m:Ljava/lang/String;

    .line 19
    .line 20
    iget-object v0, p1, Ll/vv4;->b:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Ll/f05;->n:Ljava/lang/String;

    .line 23
    .line 24
    :cond_1
    iget-object v0, p0, Ll/f05;->i:Ll/w25;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/w25;->V3()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/f05;->i:Ll/w25;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, v1}, Ll/w25;->h4(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/f05;->j:Ll/mw4;

    .line 36
    .line 37
    iget-boolean v3, p1, Ll/vv4;->a:Z

    .line 38
    .line 39
    iget-object v4, p1, Ll/vv4;->b:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v5, p1, Ll/vv4;->c:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v6, p1, Ll/vv4;->d:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v7, p1, Ll/vv4;->e:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual/range {v2 .. v7}, Ll/mw4;->K4(ZLjava/lang/CharSequence;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public o4(ZLjava/lang/CharSequence;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f05;->i:Ll/w25;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/w25;->V3()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/f05;->i:Ll/w25;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {v0, v1}, Ll/w25;->h4(Z)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/f05;->j:Ll/mw4;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Ll/mw4;->J4(ZLjava/lang/CharSequence;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
