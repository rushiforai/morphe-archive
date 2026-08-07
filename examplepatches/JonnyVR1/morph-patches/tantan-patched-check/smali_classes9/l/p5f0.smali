.class public Ll/p5f0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# instance fields
.field public final i:Ll/z4f0;

.field public j:I

.field public k:I

.field public l:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

.field public final m:Ll/ft5;

.field public n:I

.field public final o:Ll/fyd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/z4f0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/z4f0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/p5f0;->i:Ll/z4f0;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Ll/p5f0;->j:I

    .line 13
    .line 14
    iput p1, p0, Ll/p5f0;->k:I

    .line 15
    .line 16
    new-instance v0, Ll/ft5;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/p5f0;->m:Ll/ft5;

    .line 22
    .line 23
    iput p1, p0, Ll/p5f0;->n:I

    .line 24
    .line 25
    new-instance p1, Ll/fyd0;

    .line 26
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v1, "shoot_game_task_stage_clicked_"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 42
    .line 43
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-direct {p1, v0}, Ll/fyd0;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Ll/p5f0;->o:Ll/fyd0;

    .line 58
    .line 59
    return-void
.end method

.method public static synthetic J3(Ll/p5f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p5f0;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    return-void
.end method

.method public static synthetic K3(Ll/p5f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p5f0;->d4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    return-void
.end method

.method public static synthetic L3(Ljava/lang/Long;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic M3(Ll/p5f0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p5f0;->c4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic O3(Ll/p5f0;Ll/a5f0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p5f0;->f4(Ll/a5f0;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P3(Ll/p5f0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p5f0;->Z3(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic R3(Ll/p5f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p5f0;->b4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    return-void
.end method

.method public static synthetic S3(Ll/p5f0;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/p5f0;->a4(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic T3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic U3(Ll/p5f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p5f0;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V

    return-void
.end method

.method public static synthetic V3(Ll/p5f0;Ll/c5f0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p5f0;->e4(Ll/c5f0;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method private synthetic a4(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iget p1, p0, Ll/p5f0;->j:I

    .line 2
    .line 3
    add-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput p1, p0, Ll/p5f0;->j:I

    .line 6
    .line 7
    iget p1, p0, Ll/p5f0;->k:I

    .line 8
    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    iput p1, p0, Ll/p5f0;->k:I

    .line 12
    .line 13
    return-void
.end method

.method private synthetic c4(Ll/jsv;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/p5f0;->i:Ll/z4f0;

    .line 2
    .line 3
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget p0, p0, Ll/p5f0;->j:I

    .line 10
    .line 11
    invoke-virtual {p1, v0, p0}, Ll/z4f0;->d(Ljava/lang/String;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final W3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "anchor completeTask:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "shootGame"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/p5f0;->i:Ll/z4f0;

    .line 21
    .line 22
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ll/mu40;

    .line 35
    .line 36
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const/4 v4, 0x1

    .line 41
    invoke-virtual {v0, v1, v4, v2, v3}, Ll/z4f0;->c(Ljava/lang/String;ZILjava/lang/String;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v1, Ll/f5f0;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1}, Ll/f5f0;-><init>(Ll/p5f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic X3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Ll/p5f0;->n:I

    .line 3
    .line 4
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 5
    .line 6
    iput-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 7
    .line 8
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 9
    .line 10
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 11
    .line 12
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->ballCount:I

    .line 13
    .line 14
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->ballCount:I

    .line 15
    .line 16
    iget v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 17
    .line 18
    iput v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 19
    .line 20
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v1, "javascript:stageTaskCompleted(\'"

    .line 23
    .line 24
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->toJson()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p1, "\')"

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showShootGameRedPot()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-static {p2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, v1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->executeJs()Ll/v3f$d;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    const-string v1, "anchor serverTask:"

    .line 78
    .line 79
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string p2, ":"

    .line 86
    .line 87
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    const-string p2, "shootGame"

    .line 98
    .line 99
    invoke-static {p2, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object p1, p0, Ll/p5f0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 103
    .line 104
    invoke-virtual {p0, p1}, Ll/p5f0;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p5f0;->l:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p5f0;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic Z3(Ll/uxj0;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showShootGameRedPot()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p1, v0}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/p5f0;->g4()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic b4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p5f0;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput p1, p0, Ll/p5f0;->n:I

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e4(Ll/c5f0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Ll/p5f0;->k:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic f4(Ll/a5f0;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget p0, p0, Ll/p5f0;->n:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final g4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p5f0;->i:Ll/z4f0;

    .line 2
    .line 3
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {v0, v1, v2}, Ll/z4f0;->e(Ljava/lang/String;Z)Lrx/c;

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
    new-instance v1, Ll/j5f0;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/j5f0;-><init>(Ll/p5f0;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/k5f0;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/k5f0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final h4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/p5f0;->o:Ll/fyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fyd0;->d()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    double-to-int v0, v0

    .line 8
    iget-object p0, p0, Ll/p5f0;->o:Ll/fyd0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/fyd0;->e()D

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    double-to-long v1, v1

    .line 15
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->stage:I

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    if-eq v0, p0, :cond_0

    .line 19
    .line 20
    return p1

    .line 21
    :cond_0
    invoke-static {}, Ll/pzi0;->n()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    cmp-long p0, v1, v3

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    return p1

    .line 30
    :cond_1
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public final i4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "anchor shootGameInfo:"

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->toJson()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v1, "shootGame"

    .line 23
    .line 24
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget v0, p0, Ll/p5f0;->j:I

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->anchorDuration:I

    .line 32
    .line 33
    :cond_1
    iput v0, p0, Ll/p5f0;->j:I

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->shootGameTasks:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const/4 v0, 0x0

    .line 42
    const/4 v2, 0x0

    .line 43
    move-object v4, v0

    .line 44
    move v3, v2

    .line 45
    :cond_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    if-eqz v5, :cond_5

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 56
    .line 57
    iget-object v6, v5, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 58
    .line 59
    const-string v7, "received"

    .line 60
    .line 61
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result v6

    .line 65
    if-nez v6, :cond_3

    .line 66
    .line 67
    move-object v4, v5

    .line 68
    :cond_3
    iget-object v6, v5, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 69
    .line 70
    const-string v7, "completed"

    .line 71
    .line 72
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    iget v6, v5, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 76
    .line 77
    add-int/2addr v3, v6

    .line 78
    iget-object v6, v5, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 79
    .line 80
    const-string v7, "default"

    .line 81
    .line 82
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    if-nez v6, :cond_4

    .line 87
    .line 88
    iget-object v6, v5, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->status:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameStatus;

    .line 89
    .line 90
    const-string v7, "ongoing"

    .line 91
    .line 92
    invoke-static {v6, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    if-eqz v6, :cond_2

    .line 97
    .line 98
    :cond_4
    iget p1, p0, Ll/p5f0;->j:I

    .line 99
    .line 100
    sub-int v2, v3, p1

    .line 101
    .line 102
    move-object v0, v5

    .line 103
    :cond_5
    if-eqz v4, :cond_6

    .line 104
    .line 105
    invoke-virtual {p0, v4}, Ll/p5f0;->h4(Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_6

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->showShootGameRedPot()Ll/v3f$d;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 122
    .line 123
    invoke-static {v4, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    invoke-virtual {p1, v4}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    :cond_6
    if-nez v0, :cond_7

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->hideItem()Ll/v3f$d;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_7
    if-gtz v2, :cond_8

    .line 147
    .line 148
    iget v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->duration:I

    .line 149
    .line 150
    sub-int/2addr v3, v2

    .line 151
    iput v3, p0, Ll/p5f0;->j:I

    .line 152
    .line 153
    :cond_8
    iput v2, p0, Ll/p5f0;->k:I

    .line 154
    .line 155
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->OperationsEvent:Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;

    .line 160
    .line 161
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$OperationsEvent;->aloneCountDown()Ll/v3f$d;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iget v3, p0, Ll/p5f0;->k:I

    .line 166
    .line 167
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    invoke-virtual {p1, v3}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    iget-object p1, p0, Ll/p5f0;->m:Ll/ft5;

    .line 175
    .line 176
    invoke-virtual {p1}, Ll/ft5;->c()V

    .line 177
    .line 178
    .line 179
    invoke-static {}, Ll/kdu;->Y()J

    .line 180
    .line 181
    .line 182
    move-result-wide v3

    .line 183
    new-instance p1, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    const-string v5, "anchor task:"

    .line 186
    .line 187
    invoke-direct {p1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->toJson()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v5

    .line 194
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    const-string v5, ":"

    .line 198
    .line 199
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-static {v1, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p0, Ll/p5f0;->m:Ll/ft5;

    .line 219
    .line 220
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    check-cast v1, Ll/mu40;

    .line 225
    .line 226
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 227
    .line 228
    invoke-virtual {v1, v5}, Ll/oo2;->i2(Ljava/util/concurrent/TimeUnit;)Lrx/c;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    invoke-virtual {v1, v2}, Lrx/c;->take(I)Lrx/c;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    new-instance v2, Ll/l5f0;

    .line 237
    .line 238
    invoke-direct {v2, p0}, Ll/l5f0;-><init>(Ll/p5f0;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-virtual {p0, v1}, Ll/i6t;->H3(Lrx/c;)Lrx/c;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 254
    .line 255
    .line 256
    move-result-object v1

    .line 257
    new-instance v2, Ll/m5f0;

    .line 258
    .line 259
    invoke-direct {v2}, Ll/m5f0;-><init>()V

    .line 260
    .line 261
    .line 262
    new-instance v5, Ll/n5f0;

    .line 263
    .line 264
    invoke-direct {v5}, Ll/n5f0;-><init>()V

    .line 265
    .line 266
    .line 267
    new-instance v6, Ll/o5f0;

    .line 268
    .line 269
    invoke-direct {v6, p0, v0}, Ll/o5f0;-><init>(Ll/p5f0;Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;)V

    .line 270
    .line 271
    .line 272
    invoke-static {v2, v5, v6}, Ll/dhw;->f(Ll/y20;Ll/y20;Ll/x20;)Ll/t9t;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-virtual {v1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    invoke-virtual {p1, v0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 281
    .line 282
    .line 283
    iget-object p1, p0, Ll/p5f0;->m:Ll/ft5;

    .line 284
    .line 285
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 286
    .line 287
    invoke-static {v0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 292
    .line 293
    invoke-virtual {v0, v3, v4, v1}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    new-instance v1, Ll/e5f0;

    .line 310
    .line 311
    invoke-direct {v1, p0}, Ll/e5f0;-><init>(Ll/p5f0;)V

    .line 312
    .line 313
    .line 314
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 315
    .line 316
    .line 317
    move-result-object p0

    .line 318
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    invoke-virtual {p1, p0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 323
    .line 324
    .line 325
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/p5f0;->g4()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/mu40;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/obt;

    .line 18
    .line 19
    invoke-direct {v1}, Ll/obt;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/d5f0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/d5f0;-><init>(Ll/p5f0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ShootEvent:Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ShootEvent;->taskReceived()Ll/v3f$d;

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
    const/4 v1, 0x0

    .line 59
    invoke-virtual {p0, v0, v1}, Ll/cyr;->o2(Lrx/c;Z)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/g5f0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/g5f0;-><init>(Ll/p5f0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    new-instance v0, Ll/h5f0;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/h5f0;-><init>(Ll/p5f0;)V

    .line 78
    .line 79
    .line 80
    const-class v1, Ll/c5f0;

    .line 81
    .line 82
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 83
    .line 84
    .line 85
    new-instance v0, Ll/i5f0;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Ll/i5f0;-><init>(Ll/p5f0;)V

    .line 88
    .line 89
    .line 90
    const-class v1, Ll/a5f0;

    .line 91
    .line 92
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method
