.class public final Lhpc;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Z

.field public final synthetic v:Ljpc;


# direct methods
.method public synthetic constructor <init>(Ljpc;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lhpc;->t:B

    iput-object p1, p0, Lhpc;->v:Ljpc;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Lhpc;->t:B

    iget-object p0, p0, Lhpc;->v:Ljpc;

    packed-switch p1, :pswitch_data_16

    new-instance p1, Lhpc;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Lhpc;-><init>(Ljpc;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Lhpc;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Lhpc;-><init>(Ljpc;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lhpc;->t:B

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    packed-switch v0, :pswitch_data_24

    invoke-virtual {p0, p1, p2}, Lhpc;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lhpc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lhpc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    invoke-virtual {p0, p1, p2}, Lhpc;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lhpc;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lhpc;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-byte v0, p0, Lhpc;->t:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    iget-object v3, p0, Lhpc;->v:Ljpc;

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_a8

    iget-object v0, v3, Ljpc;->a:Lxnc;

    sget-object v5, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Lhpc;->u:Z

    if-eqz v6, :cond_1d

    if-ne v6, v4, :cond_19

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_56

    :cond_19
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_58

    :cond_1d
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v0, Lxnc;->a:Lkze;

    invoke-static {p1}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p1

    iget-object v0, v0, Lxnc;->b:Lkze;

    invoke-static {v0}, Lxf8;->t(Lekc;)Lf99;

    move-result-object v0

    iget-object v1, v3, Ljpc;->c:Lrlh;

    new-instance v6, Lipc;

    const-string v11, "calculateIsFollowingAnyTeam(ZZLjava/util/List;)Z"

    const/4 v12, 0x4

    const/4 v7, 0x4

    sget-object v8, Ljpc;->e:Lfpc;

    const-class v9, Lfpc;

    const-string v10, "calculateIsFollowingAnyTeam"

    invoke-direct/range {v6 .. v12}, Lkr;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-static {p1, v0, v1, v6}, Lnb6;->l(Lf99;Lf99;Lf99;Ldr9;)Lcw;

    move-result-object p1

    invoke-static {p1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iget-object v0, v3, Ljpc;->d:Lxoc;

    new-instance v1, Lgpc;

    invoke-direct {v1, v0, v4}, Lgpc;-><init>(Lxoc;B)V

    iput-boolean v4, p0, Lhpc;->u:Z

    invoke-interface {p1, v1, p0}, Lf99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v5, :cond_56

    move-object v1, v5

    goto :goto_58

    :cond_56
    :goto_56
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_58
    return-object v1

    :pswitch_59
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v5, p0, Lhpc;->u:Z

    if-eqz v5, :cond_69

    if-ne v5, v4, :cond_65

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_a5

    :cond_65
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_a7

    :cond_69
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v3, Ljpc;->a:Lxnc;

    iget-object p1, p1, Lxnc;->a:Lkze;

    invoke-static {p1}, Lxf8;->t(Lekc;)Lf99;

    move-result-object p1

    iget-object v1, v3, Ljpc;->b:Ljze;

    invoke-static {v1}, Lxf8;->t(Lekc;)Lf99;

    move-result-object v1

    new-instance v5, Lvkc;

    const/4 v11, 0x4

    const/4 v12, 0x1

    const/4 v6, 0x3

    sget-object v7, Ljpc;->e:Lfpc;

    const-class v8, Lfpc;

    const-string v9, "calculateFeatureEnabledState"

    const-string v10, "calculateFeatureEnabledState(ZZ)Lcom/opera/android/analytics/AggroFeatureEnableState;"

    invoke-direct/range {v5 .. v12}, Lvkc;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v2, Lya9;

    const/4 v6, 0x0

    invoke-direct {v2, p1, v1, v5, v6}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    iget-object v1, v3, Ljpc;->d:Lxoc;

    new-instance v2, Lgpc;

    invoke-direct {v2, v1, v6}, Lgpc;-><init>(Lxoc;B)V

    iput-boolean v4, p0, Lhpc;->u:Z

    invoke-interface {p1, v2, p0}, Lf99;->collect(Ll99;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_a5

    move-object v1, v0

    goto :goto_a7

    :cond_a5
    :goto_a5
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_a7
    return-object v1

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_59
    .end packed-switch
.end method
