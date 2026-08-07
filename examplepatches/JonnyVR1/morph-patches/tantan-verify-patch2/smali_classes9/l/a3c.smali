.class public Ll/a3c;
.super Ll/nn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/nn2<",
        "TD;",
        "Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/nn2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public Y3(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/nn2;->Y3(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->d(FZ)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public Z3(ZI)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/nn2;->Z3(ZI)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    int-to-float p1, p2

    .line 9
    const/high16 p2, 0x43700000    # 240.0f

    .line 10
    .line 11
    cmpg-float v1, p1, p2

    .line 12
    .line 13
    if-gtz v1, :cond_0

    .line 14
    .line 15
    div-float v0, p1, p2

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->j(F)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    int-to-float p1, p2

    .line 26
    const/high16 p2, 0x43340000    # 180.0f

    .line 27
    .line 28
    div-float/2addr p1, p2

    .line 29
    sub-float/2addr v0, p1

    .line 30
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 31
    .line 32
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;

    .line 33
    .line 34
    const/4 p1, 0x0

    .line 35
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;->d(FZ)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d4()V
    .locals 3

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
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->dismissDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->showEffectsDanmakuDialog()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/sre$a;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/sre$a;-><init>()V

    .line 27
    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->STORM:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ll/sre$a;->c(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;)Ll/sre$a;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Ll/sre$a;->a()Ll/sre;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v1, "bullet_show_type"

    .line 48
    .line 49
    const-string v2, "special_effects"

    .line 50
    .line 51
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    const-string v1, "e_live_bullet_storm_entrance"

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {v1, p0, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public e4()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "bullet_show_type"

    .line 7
    .line 8
    const-string v2, "text"

    .line 9
    .line 10
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    const-string v1, "e_live_bullet_storm_entrance"

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {v1, p0, v0}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
