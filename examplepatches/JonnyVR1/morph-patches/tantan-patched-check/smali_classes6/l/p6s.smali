.class public Ll/p6s;
.super Ll/mof0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/mof0<",
        "Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;",
        ">;"
    }
.end annotation


# instance fields
.field public h:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/y20;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/duk;

    .line 2
    .line 3
    new-instance v1, Ll/vod;

    .line 4
    .line 5
    const-string v2, "_v2"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    const-string v4, "live_client_switch_json"

    .line 9
    .line 10
    invoke-direct {v1, v4, v2, v3}, Ll/vod;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-class v2, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 14
    .line 15
    invoke-static {v2}, Ll/h9t;->b(Ljava/lang/Class;)Ll/d9t;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-instance v3, Ll/f5s;

    .line 20
    .line 21
    invoke-direct {v3}, Ll/f5s;-><init>()V

    .line 22
    .line 23
    .line 24
    const/4 v4, -0x1

    .line 25
    invoke-direct {v0, v1, v4, v2, v3}, Ll/duk;-><init>(Ll/dji$b;ILl/d9t;Ll/pcj;)V

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/g5s;

    .line 29
    .line 30
    invoke-direct {v1, p2}, Ll/g5s;-><init>(Ll/y20;)V

    .line 31
    .line 32
    .line 33
    const-string p2, "BLiveClientSwitches"

    .line 34
    .line 35
    invoke-direct {p0, p2, v0, v1}, Ll/mof0;-><init>(Ljava/lang/String;Ll/dji;Ll/pcj;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/p6s;->h:Landroid/content/Context;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic B(Ll/p6s;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->y1()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->z1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic D(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->p1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->d1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->i1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->m1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->u1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic I(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->r1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic J()Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    return-object v0
.end method

.method public static synthetic K(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->f1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->s1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M(Ll/p6s;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->w1()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic N(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->e1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic O(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->t1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic P(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->S0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Q(Ll/y20;Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic R(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->k1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic S(Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->overseaChineseLiveExp:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

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

.method public static synthetic T(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->q1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->T0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic V(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->U0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->Z0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic X(Ll/p6s;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->x1()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->V0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->h1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a0(Ll/p6s;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->R0()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->v1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c0(Ll/p6s;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->j1()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->l1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->Y0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->o1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->c1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->n1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i0(Ll/p6s;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->W0()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j0(Ll/p6s;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->b1()Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k0(Ll/y20;)Lrx/c;
    .locals 5

    .line 1
    const-string v0, "/live-client-switches"

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 8
    .line 9
    sget-object v2, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;->GET:Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;

    .line 10
    .line 11
    invoke-static {v0}, Ll/rnl;->r(Ljava/lang/String;)Ll/rnl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-class v3, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 16
    .line 17
    invoke-static {v3}, Ll/h9t;->b(Ljava/lang/Class;)Ll/d9t;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const-string v4, ""

    .line 22
    .line 23
    invoke-static {v1, v2, v0, v4, v3}, Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder;->t(Lcom/p1/mobile/putong/api/api/Network;Lcom/p1/mobile/putong/live/base/api/LiveApiBuilder$ReqType;Ll/rnl;Ljava/lang/String;Lcom/tantanapp/common/data/INetParser;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/q5s;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/q5s;-><init>(Ll/y20;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method public static synthetic l0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->a1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->X0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic n0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->Q0()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o0(Ll/p6s;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p6s;->g1()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "TT;>;TT;)TT;"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-interface {p0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    instance-of v0, p0, Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    move-object v0, p0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_0
    return-object p0

    .line 23
    :catch_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    return-object p0

    .line 26
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 v0, 0x0

    .line 31
    aget-object p0, p0, v0

    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    return-object p1
.end method


# virtual methods
.method public A0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/z5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/z5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public A1()Z
    .locals 1

    .line 1
    new-instance v0, Ll/g6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/g6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public B0()I
    .locals 1

    .line 1
    new-instance v0, Ll/t5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/t5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public B1()Z
    .locals 1

    .line 1
    new-instance v0, Ll/u5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/u5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public C0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/i5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public C1()Z
    .locals 1

    .line 1
    new-instance v0, Ll/o5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/o5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public D0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/k6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public D1()Z
    .locals 1

    .line 1
    new-instance v0, Ll/c6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/c6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public E0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/l6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/l6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public E1()Z
    .locals 1

    .line 1
    new-instance v0, Ll/c5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/c5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public F0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/d6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/d6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public F1()Z
    .locals 1

    .line 1
    new-instance v0, Ll/v5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/v5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public G0()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/o6s;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/o6s;-><init>(Ll/p6s;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public G1()Z
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    invoke-static {p0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public H0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/k5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/k5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public H1()Z
    .locals 1

    .line 1
    new-instance v0, Ll/j6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/j6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public I0()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/e6s;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/e6s;-><init>(Ll/p6s;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public I1()I
    .locals 1

    .line 1
    new-instance v0, Ll/e5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/e5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x32

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public J0()I
    .locals 1

    .line 1
    new-instance v0, Ll/h6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/h6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public J1()I
    .locals 1

    .line 1
    new-instance v0, Ll/m5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x3e8

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public K0()Z
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/l5s;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/l5s;-><init>(Ll/p6s;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public K1()I
    .locals 2

    .line 1
    new-instance v0, Ll/p5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/p5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0x64

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v0, v1}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    return p0

    .line 25
    :cond_0
    return v0
.end method

.method public L0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/n5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/n5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public L1()Z
    .locals 1

    .line 1
    new-instance v0, Ll/s5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/s5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public M0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/r5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public N0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/b5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/b5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public O0()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    new-instance v0, Ll/j5s;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/j5s;-><init>(Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public P0()Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    new-instance v0, Ll/a6s;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/a6s;-><init>(Ll/p6s;)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Boolean;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public final synthetic Q0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->clientMonitor:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic R0()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->clientMonitor:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->config:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->frequency:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic S0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->fakeRewardPoint:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic T0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlLiveSquareNewEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic U0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->showLeaderboardScore:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic V0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlFixMultiFragmentEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic W0()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->liveSuperAdmin:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->config:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->url:Ljava/lang/String;

    .line 14
    .line 15
    return-object p0
.end method

.method public final synthetic X0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->newLayoutFile:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Y0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->operatorWindowHangUp:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic Z0()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->pkAcrossRoomOptimization:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic a1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->socketIM:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic b1()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->voiceDemotionLimit:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->config:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->chatHallDemotionLimit:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic c1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->happyEyeballsEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic d1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->officialAccountFollow:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic e1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlAudioProcessSoHookEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic f1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlLiveClearScreen:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic g1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlLiveFeed:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic h1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlLowEndSvga:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic i1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlComboNewUISwitch:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic j1()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlRtcPullConfig:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->config:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->pullRtcFailOverCnt:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic k1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->intlVoiceFeed:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic l1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->isOpenLiveStatus:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic m1()Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->isOpenVoiceLiveStatus:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->isOpenLiveStatus:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 24
    .line 25
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 26
    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method

.method public final synthetic n1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->isOpenVoiceLiveStatus:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic o1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->liveSuperAdmin:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic p1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->promptlyRegisterEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public q0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/i6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/i6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic q1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->removeVirtualAnchor:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public r0()I
    .locals 1

    .line 1
    new-instance v0, Ll/f6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/f6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    const/16 p0, 0xf

    .line 7
    .line 8
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ljava/lang/Integer;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public final synthetic r1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->removeVoiceCdn:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public s0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/d5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/d5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic s1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->voiceInterShowSearch:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public t0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/n6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/n6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic t1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->xeGiftPlayerEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public u0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/m6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/m6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic u1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->momoBeauty:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public v0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/b6s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/b6s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic v1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->userGoActionSwitch:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public w0()Ljava/lang/String;
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    new-instance v0, Ll/y5s;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/y5s;-><init>(Ll/p6s;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public final synthetic w1()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->voiceChatLimit:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->config:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->voiceChatLength:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public x0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/x5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/x5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic x1()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->voiceChatLimit:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->config:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->voiceChatCount:I

    .line 14
    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public y0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/h5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/h5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic y1()Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->androidMaskLimit:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveMaskLimitConfig;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveMaskLimitConfig;->maskLimit:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public z0()Z
    .locals 1

    .line 1
    new-instance v0, Ll/w5s;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/w5s;-><init>(Ll/p6s;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-static {v0, p0}, Ll/p6s;->p0(Ll/pcj;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public final synthetic z1()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mof0;->n()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;->switches:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveClientSwitchesGroup;->voiceMultiAvatar:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitch;->on:Z

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method
