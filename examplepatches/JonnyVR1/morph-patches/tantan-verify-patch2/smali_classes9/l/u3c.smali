.class public Ll/u3c;
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
        "Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/y2c;

.field public final j:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public k:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/y2c;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/y2c;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/u3c;->i:Ll/y2c;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/u3c;->j:Lrx/subjects/b;

    .line 16
    .line 17
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic J3(Ll/u3c;Ll/z2c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3c;->c4(Ll/z2c;)V

    return-void
.end method

.method public static synthetic K3(Ll/u3c;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3c;->b4(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V

    return-void
.end method

.method public static synthetic L3(Ll/u3c;Ll/c0r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3c;->e4(Ll/c0r;)V

    return-void
.end method

.method public static synthetic M3(Ll/u3c;Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3c;->Z3(Ll/uxj0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N3(Ll/u3c;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u3c;->Y3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic O3(Ll/u3c;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/u3c;->d4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic P3(Ll/u3c;Ll/t610;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3c;->f4(Ll/t610;)V

    return-void
.end method

.method public static synthetic R3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/a;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic S3(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic T3(Ll/u3c;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3c;->X3(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V

    return-void
.end method

.method public static synthetic U3(Ll/u3c;Ll/uxj0;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u3c;->a4(Ll/uxj0;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic Y3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/u3c;->k:Z

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/u3c;->j:Lrx/subjects/b;

    .line 10
    .line 11
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method private synthetic d4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u3c;->i4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->h()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/n3c;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/n3c;-><init>(Ll/u3c;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftTraysEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;->onAnimationStateChange()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lrx/c;

    .line 56
    .line 57
    new-instance v1, Ll/o3c;

    .line 58
    .line 59
    invoke-direct {v1}, Ll/o3c;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftTraysEvent:Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftTraysEvent;->playGiftLayer()Ll/v3f$d;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lrx/c;

    .line 81
    .line 82
    new-instance v2, Ll/p3c;

    .line 83
    .line 84
    invoke-direct {v2}, Ll/p3c;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-static {v0, v1}, Lrx/c;->merge(Lrx/c;Lrx/c;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-instance v1, Ll/q3c;

    .line 100
    .line 101
    invoke-direct {v1, p0}, Ll/q3c;-><init>(Ll/u3c;)V

    .line 102
    .line 103
    .line 104
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Ll/u3c;->j:Lrx/subjects/b;

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0}, Lrx/c;->onBackpressureBuffer()Lrx/c;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    new-instance v1, Ll/r3c;

    .line 130
    .line 131
    invoke-direct {v1, p0}, Ll/r3c;-><init>(Ll/u3c;)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/s3c;

    .line 139
    .line 140
    invoke-direct {v1, p0}, Ll/s3c;-><init>(Ll/u3c;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    new-instance v1, Ll/t3c;

    .line 148
    .line 149
    invoke-direct {v1}, Ll/t3c;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/i3c;

    .line 157
    .line 158
    invoke-direct {v1}, Ll/i3c;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v1}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    new-instance v1, Ll/j3c;

    .line 166
    .line 167
    invoke-direct {v1, p0}, Ll/j3c;-><init>(Ll/u3c;)V

    .line 168
    .line 169
    .line 170
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 182
    .line 183
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onDanmakuSendSuccess()Ll/v3f$d;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    check-cast v0, Lrx/c;

    .line 192
    .line 193
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-static {}, Lrx/schedulers/Schedulers;->computation()Ll/f2e0;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    new-instance v1, Ll/k3c;

    .line 206
    .line 207
    invoke-direct {v1, p0}, Ll/k3c;-><init>(Ll/u3c;)V

    .line 208
    .line 209
    .line 210
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method public W3()[I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/rwn0;

    .line 6
    .line 7
    const/4 v1, 0x3

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    iget-boolean p0, p0, Ll/u3c;->k:Z

    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x1

    .line 16
    const/4 v0, 0x2

    .line 17
    filled-new-array {p0, v0, v1}, [I

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    :goto_0
    filled-new-array {v1}, [I

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic X3(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u3c;->i:Ll/y2c;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/y2c;->a(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/u3c;->j:Lrx/subjects/b;

    .line 7
    .line 8
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic Z3(Ll/uxj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/u3c;->W3()[I

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->e([I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic a4(Ll/uxj0;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u3c;->i:Ll/y2c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/y2c;->e()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic b4(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/u3c;->W3()[I

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;->j(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;[I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic c4(Ll/z2c;)V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Ll/z2c;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->staticUrl:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;->setStaticUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p1, Ll/z2c;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMaskAvatarConfig;->frameConfig:Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAvatarFrameConfig;->dynamicUrl:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;->setDynamicUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;->setFrameConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserPictureConfig$Builder;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;->setAvatarConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p1, Ll/z2c;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 46
    .line 47
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;->setAvatar(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p1, Ll/z2c;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 54
    .line 55
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;->setName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v1, p1, Ll/z2c;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 62
    .line 63
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;->setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-object v1, p1, Ll/z2c;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 70
    .line 71
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->fakeType:Ljava/lang/String;

    .line 72
    .line 73
    invoke-static {v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;->setFakeType(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;->newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget-object v2, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->style:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;

    .line 94
    .line 95
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;->backgroundColors:Ljava/util/List;

    .line 96
    .line 97
    if-eqz v2, :cond_0

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;->addAllBackgroundColors(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 100
    .line 101
    .line 102
    :cond_0
    iget-object v2, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 103
    .line 104
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->style:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;->borderColors:Ljava/util/List;

    .line 107
    .line 108
    if-eqz v2, :cond_1

    .line 109
    .line 110
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;->addAllBorderColors(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 111
    .line 112
    .line 113
    :cond_1
    iget-object v2, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 114
    .line 115
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->style:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;

    .line 116
    .line 117
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;->borderColor:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;->setBorderColor(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iget-object v2, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 124
    .line 125
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->style:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;

    .line 126
    .line 127
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;->opacity:I

    .line 128
    .line 129
    int-to-long v2, v2

    .line 130
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;->setOpacity(J)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iget-object v2, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 135
    .line 136
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->style:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;

    .line 137
    .line 138
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItemStyle;->backgroundUrl:Ljava/lang/String;

    .line 139
    .line 140
    invoke-virtual {v1, v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;->setBackgroundUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle$Builder;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    check-cast v1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;

    .line 149
    .line 150
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    iget-object v3, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 155
    .line 156
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->userHierarchy:I

    .line 157
    .line 158
    int-to-long v3, v3

    .line 159
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;->setUserHierarchy(J)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    iget-object v3, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 164
    .line 165
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->content:Ljava/lang/String;

    .line 166
    .line 167
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;->setContent(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    iget-object v3, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 172
    .line 173
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->iconUrl:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;->setIconUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 176
    .line 177
    .line 178
    move-result-object v2

    .line 179
    const-wide/16 v3, -0x1

    .line 180
    .line 181
    invoke-virtual {v2, v3, v4}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;->setPriority(J)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    iget-object v3, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 186
    .line 187
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->type:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v2, v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;->setType(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-virtual {v2, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;->setStyle(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentStyle;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    iget-object p1, p1, Ll/z2c;->b:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;

    .line 198
    .line 199
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuItem;->payAmount:I

    .line 200
    .line 201
    int-to-long v2, p1

    .line 202
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;->setPayAmount(J)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment$Builder;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 211
    .line 212
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo$Builder;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    invoke-virtual {v1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo$Builder;->addMasks(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo$Builder;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    invoke-virtual {v0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo$Builder;->setVideoLiveBulletComment(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo$Builder;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;

    .line 229
    .line 230
    iget-object v0, p0, Ll/u3c;->i:Ll/y2c;

    .line 231
    .line 232
    invoke-virtual {v0, p1}, Ll/y2c;->a(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V

    .line 233
    .line 234
    .line 235
    iget-object p0, p0, Ll/u3c;->j:Lrx/subjects/b;

    .line 236
    .line 237
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 238
    .line 239
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    return-void
.end method

.method public final synthetic e4(Ll/c0r;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 4
    .line 5
    iget p1, p1, Ll/c0r;->b:I

    .line 6
    .line 7
    neg-int p1, p1

    .line 8
    int-to-float p1, p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic f4(Ll/t610;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/t610;->b:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->pk:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 4
    .line 5
    if-eq p1, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/u3c;->i4()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public g4()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u3c;->j:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public h4(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;)V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getMasks(I)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getUserId()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->show()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/16 v2, 0x4b0

    .line 21
    .line 22
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->builder(I)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->userId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 39
    .line 40
    const/16 v4, 0x64

    .line 41
    .line 42
    invoke-static {p0, v3, v0, v4}, Ll/csq;->a(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setFromIdentity(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    invoke-virtual {v3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {p0, v3, v0, v4}, Ll/csq;->d(Ll/i6t;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setTo(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    const-string v3, "live"

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setScene(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const-string v3, "chat"

    .line 75
    .line 76
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->setSource(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    const-string v3, "liveMessage"

    .line 81
    .line 82
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->trackFrom(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData$Builder;->build()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v1, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 106
    .line 107
    const-string v3, "anchor_id"

    .line 108
    .line 109
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    invoke-virtual {v3}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getPayAmount()J

    .line 118
    .line 119
    .line 120
    move-result-wide v3

    .line 121
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    const-string v4, "bullet_price"

    .line 126
    .line 127
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$BulletCommentInfo;->getVideoLiveBulletComment()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$VideoLiveBulletComment;->getType()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    const-string v4, "bullet_type"

    .line 140
    .line 141
    invoke-static {v4, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    const-string v4, "bullet_user_id"

    .line 146
    .line 147
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    const-string v4, "live_id"

    .line 160
    .line 161
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    filled-new-array {v2, v3, p1, v0, p0}, [Ll/pf60;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    const-string p1, "e_live_bullet_chat"

    .line 170
    .line 171
    invoke-static {p1, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public i4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/x6t;->M3()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->multi_call:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 16
    .line 17
    const/high16 v0, 0x42780000    # 62.0f

    .line 18
    .line 19
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    neg-int v0, v0

    .line 24
    int-to-float v0, v0

    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 30
    .line 31
    iget-object v0, v0, Ll/dum;->j:Ll/x6t;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/x6t;->M3()Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;->pk:Lcom/p1/mobile/putong/live/livingroom/archi/motion/MotionType;

    .line 38
    .line 39
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    if-ne v0, v1, :cond_1

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 44
    .line 45
    const/high16 v0, 0x43080000    # 136.0f

    .line 46
    .line 47
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    neg-int v0, v0

    .line 52
    int-to-float v0, v0

    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/show/DanmakuViewPort;

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/u3c;->i:Ll/y2c;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/y2c;->b()V

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
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MotionEvent:Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MotionEvent;->motionSwitch()Ll/v3f$d;

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
    new-instance v1, Ll/h3c;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/h3c;-><init>(Ll/u3c;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->onChatInputDialogDismiss()Ll/v3f$c;

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
    new-instance v1, Ll/l3c;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/l3c;-><init>(Ll/u3c;)V

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
    new-instance v1, Ll/m3c;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/m3c;-><init>(Ll/u3c;)V

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
    invoke-virtual {p0}, Ll/u3c;->i4()V

    .line 101
    .line 102
    .line 103
    return-void
.end method
