.class public Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;
.super Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;
    }
.end annotation


# instance fields
.field public k:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

.field public l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;->onSuccess(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public G()Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->g:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameConfigModel;

    .line 2
    .line 3
    return-object p0
.end method

.method public H(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyAPPCommonSelfKick(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyAPPCommonGameScore(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, -0x1

    .line 5
    invoke-virtual {p0, v0, v1, v0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyAPPCommonSelfIn(ZIZI)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public K()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyAPPCommonSelfPlaying(ZLjava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyAPPCommonSelfReady(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public M()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyAPPCommonSelfReady(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public N()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->c:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;

    .line 2
    .line 3
    const/4 v0, -0x1

    .line 4
    const/4 v1, 0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {p0, v2, v0, v1, v1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSTAPPDecorator;->notifyAPPCommonSelfIn(ZIZI)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 2
    .line 3
    return-void
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/u8n;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/deg0;->c:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Ll/deg0;->a:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/u8n;->a()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Ll/deg0;->d:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object p0, Ll/deg0;->b:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public k(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/api/IntlGameApiProvider;->getCode(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/uep;

    .line 12
    .line 13
    invoke-direct {p1, p3}, Ll/uep;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V

    .line 14
    .line 15
    .line 16
    new-instance p2, Ll/vep;

    .line 17
    .line 18
    invoke-direct {p2, p3}, Ll/vep;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->k:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iput-object p0, p1, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel;->view_game_rect:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/model/GameViewInfoModel$GameViewRectModel;

    .line 6
    .line 7
    :cond_0
    return-void
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public onGameMGCommonDestroyGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonDestroyGameScene(Ltech/sud/gip/core/ISudFSMStateHandle;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->onGameDestroyed()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onGameMGCommonGameMoneyNotEnough(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameMoneyNotEnough;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameMoneyNotEnough(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameMoneyNotEnough;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->n0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onGameMGCommonGameSound(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSound(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->Q0(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSound;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onGameMGCommonGameSoundState(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonGameSoundState(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->x0(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonGameSoundState;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onGameMGCommonSelfClickJoinBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickJoinBtn;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onGameMGCommonSelfClickJoinBtn(Ltech/sud/gip/core/ISudFSMStateHandle;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonSelfClickJoinBtn;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->J0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onGameStarted()V
    .locals 5

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->onGameStarted()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->onGameStarted()V

    .line 9
    .line 10
    .line 11
    :cond_0
    sget-wide v0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "sud_game_mgid"

    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {p0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "e_sud_game_start_mgid"

    .line 28
    .line 29
    const-string v1, "p_sudgames_game_start"

    .line 30
    .line 31
    invoke-static {v0, v1, p0}, Ll/i4g0;->B(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 35
    .line 36
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/civ;

    .line 41
    .line 42
    iget-object v0, v0, Ll/civ;->w:Ll/jxd0;

    .line 43
    .line 44
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    new-instance v1, Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 57
    .line 58
    .line 59
    sget-wide v2, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->j:J

    .line 60
    .line 61
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    const-string v3, "sud_game_id"

    .line 66
    .line 67
    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    const-string v2, "sud_game_frist_load"

    .line 71
    .line 72
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    sget-object v2, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 80
    .line 81
    const-string v3, "load_game_end"

    .line 82
    .line 83
    invoke-static {v1}, Ll/euk;->d(Ljava/lang/Object;)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    const-string v4, "sud_game_loading"

    .line 88
    .line 89
    invoke-virtual {v2, v4, v3, v1}, Ll/lej0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    check-cast p0, Ll/civ;

    .line 99
    .line 100
    iget-object p0, p0, Ll/civ;->w:Ll/jxd0;

    .line 101
    .line 102
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    :cond_1
    return-void
.end method

.method public onPlayerMGCommonPlayerIn(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerIn(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->R0(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerIn;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onPlayerMGCommonPlayerPlaying(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerPlaying(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->n1(Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerPlaying;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onPlayerMGCommonPlayerReady(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/decorator/SudFSMMGListener;->onPlayerMGCommonPlayerReady(Ltech/sud/gip/core/ISudFSMStateHandle;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-boolean p1, p3, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudMGPWrapper/state/SudMGPMGState$MGCommonPlayerReady;->isReady:Z

    .line 9
    .line 10
    invoke-interface {p0, p2, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->T0(Ljava/lang/String;Z)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->Z(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public y()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;->l:Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a$a;->t0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
