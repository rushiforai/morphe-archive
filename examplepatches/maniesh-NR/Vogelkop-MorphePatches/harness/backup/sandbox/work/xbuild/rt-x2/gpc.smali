.class public final synthetic Lgpc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll99;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxoc;


# direct methods
.method public synthetic constructor <init>(Lxoc;B)V
    .registers 3

    iput-byte p2, p0, Lgpc;->a:B

    iput-object p1, p0, Lgpc;->b:Lxoc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 10

    iget-byte v0, p0, Lgpc;->a:B

    packed-switch v0, :pswitch_data_26

    new-instance v1, Lkr;

    const-string v6, "reportFollowsTeam(Z)V"

    const/4 v7, 0x4

    const/4 v2, 0x2

    iget-object v3, p0, Lgpc;->b:Lxoc;

    const-class v4, Lxoc;

    const-string v5, "reportFollowsTeam"

    invoke-direct/range {v1 .. v7}, Lkr;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_15
    new-instance v2, Lkr;

    const-string v7, "reportFeatureEnableState(Lcom/opera/android/analytics/AggroFeatureEnableState;)V"

    const/4 v8, 0x4

    const/4 v3, 0x2

    iget-object v4, p0, Lgpc;->b:Lxoc;

    const-class v5, Lxoc;

    const-string v6, "reportFeatureEnableState"

    invoke-direct/range {v2 .. v8}, Lkr;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2

    nop

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method

.method public final emit(Ljava/lang/Object;Lmt5;)Ljava/lang/Object;
    .registers 6

    iget-byte p2, p0, Lgpc;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lgpc;->b:Lxoc;

    packed-switch p2, :pswitch_data_4e

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lxoc;->a:Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-eqz p2, :cond_28

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-static {p2, v1}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object p2

    iget-object p2, p2, Lqp0;->b:Lb66;

    const/16 v2, 0x4a

    invoke-virtual {p2, v2, v0, p1}, Ljf0;->r(IIZ)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    :cond_28
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2b
    check-cast p1, Lvd0;

    iget-object p0, p0, Lxoc;->a:Lx5f;

    iget-boolean p2, p0, Lx5f;->h:Z

    if-eqz p2, :cond_4b

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, p2}, Lx56;->F(Lzpa;)Lb66;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p1, :cond_43

    const/4 v0, 0x0

    :cond_43
    const/16 v2, 0x49

    invoke-virtual {p2, v2, v0, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    :cond_4b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lgpc;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_34

    instance-of v0, p1, Ll99;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Ll99;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Lgpc;->a:B

    packed-switch v0, :pswitch_data_18

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
