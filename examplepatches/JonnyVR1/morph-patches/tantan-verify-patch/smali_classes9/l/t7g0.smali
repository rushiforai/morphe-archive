.class public Ll/t7g0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/t7g0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t7g0;->N3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic K3(Ll/t7g0;Ll/w7g0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t7g0;->O3(Ll/w7g0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/t7g0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/t7g0;->M3(Ll/uxj0;)V

    return-void
.end method


# virtual methods
.method public final synthetic M3(Ll/uxj0;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/t7g0;->j:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyPushStreamReady()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    sget-object p1, Ll/v2t;->b:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "notifyStreamReady success:"

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Ll/t7g0;->i:Z

    .line 26
    .line 27
    return-void
.end method

.method public final synthetic N3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/t7g0;->j:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->LivePusherEvent:Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$LivePusherEvent;->notifyPushStreamReady()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 15
    .line 16
    .line 17
    sget-object p1, Ll/v2t;->b:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "notifyStreamReady fail"

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    iput-boolean p1, p0, Ll/t7g0;->i:Z

    .line 26
    .line 27
    return-void
.end method

.method public final synthetic O3(Ll/w7g0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/t7g0;->j:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public P3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/cyr;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p0, Ll/t7g0;->i:Z

    .line 6
    .line 7
    if-nez v1, :cond_1

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/p1/mobile/android/app/c;->a:Z

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/t7g0;->i:Z

    .line 22
    .line 23
    sget-object v0, Ll/v2t;->b:Ljava/lang/String;

    .line 24
    .line 25
    const-string v1, "notifyStreamReady start"

    .line 26
    .line 27
    invoke-static {v0, v1}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/dw40;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->v6(Ljava/lang/String;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/r7g0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/r7g0;-><init>(Ll/t7g0;)V

    .line 51
    .line 52
    .line 53
    new-instance v2, Ll/s7g0;

    .line 54
    .line 55
    invoke-direct {v2, p0}, Ll/s7g0;-><init>(Ll/t7g0;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 63
    .line 64
    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/q7g0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/q7g0;-><init>(Ll/t7g0;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/w7g0;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
