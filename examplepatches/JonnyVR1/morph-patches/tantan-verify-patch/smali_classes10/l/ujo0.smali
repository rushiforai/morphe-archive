.class public Ll/ujo0;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z

.field public j:Ll/kcg0;


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

.method public static synthetic J3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/ujo0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ujo0;->N3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic L3(Ll/ujo0;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ujo0;->M3()Z

    move-result p0

    return p0
.end method

.method private M3()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method private synthetic N3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput-boolean p1, p0, Ll/ujo0;->i:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ujo0;->O3()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final O3()V
    .locals 2

    .line 1
    new-instance v0, Ll/r410;

    .line 2
    .line 3
    const/16 v1, 0x2328

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/r410;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ll/xzl;

    .line 13
    .line 14
    iget-boolean p0, p0, Ll/ujo0;->i:Z

    .line 15
    .line 16
    invoke-interface {v0, p0}, Ll/xzl;->p(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/ujo0;->i:Z

    .line 6
    .line 7
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/wrv;->v()Ll/nam;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-interface {v1, v2}, Ll/nam;->c(Ll/pcj;)V

    .line 15
    .line 16
    .line 17
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 18
    .line 19
    invoke-virtual {v1}, Ll/wrv;->v()Ll/nam;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-interface {v1, v0}, Ll/nam;->d(Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/ujo0;->j:Ll/kcg0;

    .line 27
    .line 28
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/wrv;->v()Ll/nam;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {v0}, Ll/nam;->e()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/rjo0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/rjo0;-><init>(Ll/ujo0;)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Ll/sjo0;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/sjo0;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/ujo0;->j:Ll/kcg0;

    .line 33
    .line 34
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 35
    .line 36
    invoke-virtual {v0}, Ll/wrv;->v()Ll/nam;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ll/tjo0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/tjo0;-><init>(Ll/ujo0;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0, v1}, Ll/nam;->c(Ll/pcj;)V

    .line 46
    .line 47
    .line 48
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/wrv;->v()Ll/nam;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const/4 v0, 0x1

    .line 55
    invoke-interface {p0, v0}, Ll/nam;->d(Z)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
