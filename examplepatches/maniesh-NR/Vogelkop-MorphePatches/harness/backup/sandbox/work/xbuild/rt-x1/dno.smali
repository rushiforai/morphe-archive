.class public final Ldno;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic t:B

.field public u:Lhuo;

.field public v:Z

.field public final synthetic w:Landroid/app/Application;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Application;Lmt5;B)V
    .registers 4

    iput-byte p3, p0, Ldno;->t:B

    iput-object p1, p0, Ldno;->w:Landroid/app/Application;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    iget-byte p1, p0, Ldno;->t:B

    packed-switch p1, :pswitch_data_18

    new-instance p1, Ldno;

    iget-object p0, p0, Ldno;->w:Landroid/app/Application;

    const/4 v0, 0x1

    invoke-direct {p1, p0, p2, v0}, Ldno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    :pswitch_e
    new-instance p1, Ldno;

    iget-object p0, p0, Ldno;->w:Landroid/app/Application;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p2, v0}, Ldno;-><init>(Landroid/app/Application;Lmt5;B)V

    return-object p1

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-byte v0, p0, Ldno;->t:B

    packed-switch v0, :pswitch_data_28

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ldno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ldno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ldno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_16
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Ldno;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Ldno;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Ldno;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_28
    .packed-switch 0x0
        :pswitch_16
    .end packed-switch
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Ldno;->t:B

    const/4 v1, 0x0

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    iget-object v3, p0, Ldno;->w:Landroid/app/Application;

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_b4

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Ldno;->v:Z

    if-eqz v6, :cond_1e

    if-ne v6, v4, :cond_1a

    iget-object p0, p0, Ldno;->u:Lhuo;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_36

    :cond_1a
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_48

    :cond_1e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Loxo;->a:Loxo;

    invoke-static {v3}, Loxo;->a(Landroid/content/Context;)Lhuo;

    move-result-object p1

    iput-object p1, p0, Ldno;->u:Lhuo;

    iput-boolean v4, p0, Ldno;->v:Z

    invoke-static {v3, p0}, Loxo;->e(Landroid/content/Context;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_33

    move-object v5, v0

    goto :goto_48

    :cond_33
    move-object v7, p1

    move-object p1, p0

    move-object p0, v7

    :goto_36
    check-cast p1, Ljzo;

    sget-object v0, Loxo;->a:Loxo;

    invoke-static {v3, v1}, Loxo;->c(Landroid/content/Context;Z)Lwwo;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v5, v1}, Loxo;->b(Lwjo;I)Lmwo;

    move-result-object v1

    new-instance v5, Lp5p;

    invoke-direct {v5, p0, p1, v0, v1}, Lp5p;-><init>(Lhuo;Ljzo;Lwwo;Lmwo;)V

    :goto_48
    return-object v5

    :pswitch_49
    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v6, p0, Ldno;->v:Z

    if-eqz v6, :cond_5b

    if-ne v6, v4, :cond_57

    iget-object p0, p0, Ldno;->u:Lhuo;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_94

    :cond_57
    invoke-static {v2}, Lqp2;->n(Ljava/lang/String;)V

    goto :goto_ab

    :cond_5b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "prepare send data for events, modGeneration: "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Ljno;->b:Lmhk;

    iget v5, v2, Lmhk;->b:I

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v5, "scheduleSend"

    invoke-static {v5, p1}, Lnxg;->g(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, v2, Lmhk;->c:Ljava/lang/Object;

    check-cast p1, Li72;

    invoke-virtual {p1}, Li72;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_ac

    sget-object p1, Loxo;->a:Loxo;

    invoke-static {v3}, Loxo;->a(Landroid/content/Context;)Lhuo;

    move-result-object p1

    iput-object p1, p0, Ldno;->u:Lhuo;

    iput-boolean v4, p0, Ldno;->v:Z

    invoke-static {v3, p0}, Loxo;->e(Landroid/content/Context;Lkuk;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_91

    move-object v5, v0

    goto :goto_ab

    :cond_91
    move-object v7, p1

    move-object p1, p0

    move-object p0, v7

    :goto_94
    check-cast p1, Ljzo;

    sget-object v0, Loxo;->a:Loxo;

    invoke-static {v3, v1}, Loxo;->c(Landroid/content/Context;Z)Lwwo;

    move-result-object v0

    sget-object v1, Ljno;->b:Lmhk;

    iget-object v1, v1, Lmhk;->c:Ljava/lang/Object;

    check-cast v1, Li72;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v1

    new-instance v5, Lexo;

    invoke-direct {v5, p0, p1, v0, v1}, Lexo;-><init>(Lhuo;Ljzo;Lwwo;Ljava/util/List;)V

    :goto_ab
    return-object v5

    :cond_ac
    new-instance p0, Ljava/util/concurrent/CancellationException;

    const-string p1, "No events to send"

    invoke-direct {p0, p1}, Ljava/util/concurrent/CancellationException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_49
    .end packed-switch
.end method
