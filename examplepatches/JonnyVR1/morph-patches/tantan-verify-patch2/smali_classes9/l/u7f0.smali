.class public Ll/u7f0;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/u7f0;->b(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->showEffectsDanmakuDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/sre$a;

    .line 12
    .line 13
    invoke-direct {p1}, Ll/sre$a;-><init>()V

    .line 14
    .line 15
    .line 16
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->STORM:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Ll/sre$a;->c(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;)Ll/sre$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/4 p2, 0x1

    .line 23
    invoke-virtual {p1, p2}, Ll/sre$a;->b(Z)Ll/sre$a;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/sre$a;->a()Ll/sre;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
