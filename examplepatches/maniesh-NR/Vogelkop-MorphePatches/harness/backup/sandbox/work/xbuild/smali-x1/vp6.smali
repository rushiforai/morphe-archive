.class public final Lvp6;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:Lcq6;


# direct methods
.method public synthetic constructor <init>(Lcq6;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Lvp6;->t:B

    iput-object p1, p0, Lvp6;->v:Lcq6;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 5

    iget-byte v0, p0, Lvp6;->t:B

    iget-object p0, p0, Lvp6;->v:Lcq6;

    packed-switch v0, :pswitch_data_22

    new-instance v0, Lvp6;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p2, v1}, Lvp6;-><init>(Lcq6;Lmt5;B)V

    iput-object p1, v0, Lvp6;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_10
    new-instance v0, Lvp6;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lvp6;-><init>(Lcq6;Lmt5;B)V

    iput-object p1, v0, Lvp6;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_19
    new-instance v0, Lvp6;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p2, v1}, Lvp6;-><init>(Lcq6;Lmt5;B)V

    iput-object p1, v0, Lvp6;->u:Ljava/lang/Object;

    return-object v0

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_19
        :pswitch_10
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Lvp6;->t:B

    packed-switch v0, :pswitch_data_38

    check-cast p1, Ljava/util/List;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lvp6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lvp6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lvp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Ljmc;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lvp6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lvp6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lvp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_27
    check-cast p1, Ljava/util/Set;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lvp6;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lvp6;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lvp6;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_27
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lvp6;->t:B

    iget-object v1, p0, Lvp6;->v:Lcq6;

    iget-object p0, p0, Lvp6;->u:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_c6

    check-cast p0, Ljava/util/List;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lcq6;->d:Lti9;

    iget-object p1, p1, Lti9;->k:Lxh7;

    check-cast p0, Ljava/lang/Iterable;

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {p0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_25
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_71

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzmc;

    new-instance v3, Lpoc;

    invoke-interface {v1}, Lzmc;->a()Llmc;

    move-result-object v4

    iget-wide v4, v4, Llmc;->a:J

    instance-of v6, v1, Lwmc;

    if-eqz v6, :cond_42

    sget-object v2, Ljnc;->b:Ljnc;

    :goto_40
    move-object v6, v2

    goto :goto_5e

    :cond_42
    instance-of v6, v1, Lqmc;

    if-eqz v6, :cond_49

    sget-object v2, Ljnc;->c:Ljnc;

    goto :goto_40

    :cond_49
    instance-of v6, v1, Lnmc;

    if-eqz v6, :cond_50

    sget-object v2, Ljnc;->d:Ljnc;

    goto :goto_40

    :cond_50
    instance-of v6, v1, Lkmc;

    if-eqz v6, :cond_57

    sget-object v2, Ljnc;->e:Ljnc;

    goto :goto_40

    :cond_57
    instance-of v6, v1, Lpmc;

    if-eqz v6, :cond_6d

    sget-object v2, Ljnc;->f:Ljnc;

    goto :goto_40

    :goto_5e
    invoke-interface {v1}, Lzmc;->a()Llmc;

    move-result-object v1

    iget-object v1, v1, Llmc;->e:Lrmc;

    iget-wide v7, v1, Lrmc;->a:J

    invoke-direct/range {v3 .. v8}, Lpoc;-><init>(JLjnc;J)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_25

    :cond_6d
    invoke-static {}, Lh9o;->p()V

    goto :goto_7d

    :cond_71
    iget-object p0, p1, Lxh7;->c:Ljava/lang/Object;

    check-cast p0, Lnak;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v2, v0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_7d
    return-object v2

    :pswitch_7e
    check-cast p0, Ljmc;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lcq6;->b:Lfs6;

    if-eqz p0, :cond_8b

    const/4 p0, 0x1

    goto :goto_8c

    :cond_8b
    const/4 p0, 0x0

    :goto_8c
    iget-boolean v0, p1, Lfs6;->i:Z

    if-eq v0, p0, :cond_a2

    iput-boolean p0, p1, Lfs6;->i:Z

    iget-object p0, p1, Lfs6;->e:Ljze;

    invoke-virtual {p1}, Lfs6;->a()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p0, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lfs6;->c()V

    :cond_a2
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_a5
    check-cast p0, Ljava/util/Set;

    sget-object v0, Lpx5;->a:Lpx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, v1, Lcq6;->e:Lqs6;

    iput-object p0, p1, Lqs6;->g:Ljava/util/Set;

    iget-object v0, p1, Lqs6;->d:Ligi;

    iget-object v1, p1, Lqs6;->a:Landroid/content/Context;

    iget-object p1, p1, Lqs6;->e:Ljze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {v0, v1, p1, p0}, Ligi;->Z(Landroid/content/Context;ZLjava/util/Set;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_c6
    .packed-switch 0x0
        :pswitch_a5
        :pswitch_7e
    .end packed-switch
.end method
