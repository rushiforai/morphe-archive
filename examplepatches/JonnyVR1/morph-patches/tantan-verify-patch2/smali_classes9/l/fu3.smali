.class public Ll/fu3;
.super Ll/tz0;
.source "SourceFile"


# instance fields
.field public y:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

.field public final z:Ll/fyd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p7}, Ll/tz0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;IILjava/lang/String;ILjava/lang/String;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/fu3;->y:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 6
    .line 7
    new-instance p1, Ll/fyd0;

    .line 8
    .line 9
    new-instance p2, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p3, "shoot_game_task_stage_clicked_"

    .line 12
    .line 13
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    sget-object p3, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {p3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-direct {p1, p2}, Ll/fyd0;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/fu3;->z:Ll/fyd0;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public V3(Landroid/view/View;)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/e80;->j4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/bae0$a;

    .line 16
    .line 17
    iget v3, p0, Ll/kf2;->m:I

    .line 18
    .line 19
    invoke-direct {v2, v3}, Ll/bae0$a;-><init>(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/bae0$a;->c()Ll/bae0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/fu3;->y:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v1, p0, Ll/fu3;->z:Ll/fyd0;

    .line 38
    .line 39
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 40
    .line 41
    int-to-double v2, v0

    .line 42
    invoke-static {}, Ll/pzi0;->n()J

    .line 43
    .line 44
    .line 45
    move-result-wide v4

    .line 46
    long-to-double v4, v4

    .line 47
    const/4 v6, 0x0

    .line 48
    invoke-virtual/range {v1 .. v6}, Ll/fyd0;->g(DDLjava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showShootGameRedPot()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    const/4 v1, 0x0

    .line 62
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    invoke-super {p0, p1}, Ll/e80;->V3(Landroid/view/View;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public X3()Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;
    .locals 0

    .line 1
    const-string p0, "shootGame"

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/kf2;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/fu3;->y:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showShootGameRedPot()Ll/v3f$d;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p0, v0}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
