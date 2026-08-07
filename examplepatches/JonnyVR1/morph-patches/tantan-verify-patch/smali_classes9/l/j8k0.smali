.class public Ll/j8k0;
.super Ll/ms2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/ms2<",
        "Ll/i8k0;",
        "TD;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lv/VText;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lv/VText;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ms2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/i8k0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/i8k0;-><init>(Lv/VText;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/i8k0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/i8k0;->d()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/ms2;->g4()Ll/vak0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/vak0;->c:Ll/nsv;

    .line 16
    .line 17
    invoke-static {v0}, Ll/f3t;->e(Ll/nsv;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->profileConfig:Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast p0, Ll/i8k0;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMaskProfileConfig;->buttonConfig:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/i8k0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    :goto_0
    return-void
.end method

.method public j4(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->backgroundColorConfig:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonColorConfig;

    .line 6
    .line 7
    invoke-virtual {p0, v1}, Ll/j8k0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;->setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 12
    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->borderColorConfig:Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonColorConfig;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/j8k0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;->setBorderColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 28
    .line 29
    return-object p0
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ms2;->a4()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/16 v1, 0xed8

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->anchorJumpUrl:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, v1, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonConfig;->userJumpUrl:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0, v1, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final l4(Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;->newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonColorConfig;->gradientDirection:I

    .line 6
    .line 7
    int-to-long v0, v0

    .line 8
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->setGradientDirection(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 9
    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonColorConfig;->colors:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->addAllColors(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 14
    .line 15
    .line 16
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserCardButtonColorConfig;->transparency:I

    .line 17
    .line 18
    int-to-long v0, p1

    .line 19
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;->setTransparency(J)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 27
    .line 28
    return-object p0
.end method
