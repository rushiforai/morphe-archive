.class public final Laxo;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic A:Lwjo;

.field public final synthetic B:Ljava/lang/Boolean;

.field public t:B

.field public final synthetic u:Lsm;

.field public final synthetic v:Landroid/content/Context;

.field public final synthetic w:Lako;

.field public final synthetic x:Ljava/lang/String;

.field public final synthetic y:Ljava/lang/String;

.field public final synthetic z:Leq;


# direct methods
.method public constructor <init>(Lsm;Leq;Lmt5;Lwjo;Lako;Landroid/content/Context;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V
    .registers 10

    iput-object p1, p0, Laxo;->u:Lsm;

    iput-object p6, p0, Laxo;->v:Landroid/content/Context;

    iput-object p5, p0, Laxo;->w:Lako;

    iput-object p8, p0, Laxo;->x:Ljava/lang/String;

    iput-object p9, p0, Laxo;->y:Ljava/lang/String;

    iput-object p2, p0, Laxo;->z:Leq;

    iput-object p4, p0, Laxo;->A:Lwjo;

    iput-object p7, p0, Laxo;->B:Ljava/lang/Boolean;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 13

    new-instance v0, Laxo;

    iget-object v4, p0, Laxo;->A:Lwjo;

    iget-object v7, p0, Laxo;->B:Ljava/lang/Boolean;

    iget-object v1, p0, Laxo;->u:Lsm;

    iget-object v2, p0, Laxo;->z:Leq;

    iget-object v5, p0, Laxo;->w:Lako;

    iget-object v6, p0, Laxo;->v:Landroid/content/Context;

    iget-object v8, p0, Laxo;->x:Ljava/lang/String;

    iget-object v9, p0, Laxo;->y:Ljava/lang/String;

    move-object v3, p2

    invoke-direct/range {v0 .. v9}, Laxo;-><init>(Lsm;Leq;Lmt5;Lwjo;Lako;Landroid/content/Context;Ljava/lang/Boolean;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Laxo;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Laxo;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Laxo;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 14

    iget-object v0, p0, Laxo;->v:Landroid/content/Context;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, p0, Laxo;->t:B

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_22

    if-eq v2, v5, :cond_1e

    if-ne v2, v4, :cond_18

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto/16 :goto_8b

    :cond_18
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_1e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_51

    :cond_22
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Laxo;->u:Lsm;

    iget-object p1, p1, Lsm;->b:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_6e

    iput-byte v5, p0, Laxo;->t:B

    sget-object p1, Llah;->a:Ljava/lang/String;

    if-eqz p1, :cond_3e

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_4f

    :cond_3e
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sget-object v2, Lbb7;->a:Lcv6;

    sget-object v2, Lmr6;->b:Lmr6;

    new-instance v6, Ljho;

    invoke-direct {v6, p1, v5, v3}, Ljho;-><init>(Landroid/content/Context;ZLmt5;)V

    invoke-static {v2, v6, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    :goto_4f
    if-eq p1, v1, :cond_8a

    :goto_51
    invoke-static {v0}, Lfcp;->e(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_6e

    iget-object p0, p0, Laxo;->w:Lako;

    sget-object p1, Lt0i;->b:Lp0i;

    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "WebView min version not satisfied"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1, v0}, Lako;->a(ILjava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_6e
    sget-object v2, Loxo;->a:Loxo;

    iget-object v3, p0, Laxo;->v:Landroid/content/Context;

    move p1, v4

    iget-object v4, p0, Laxo;->x:Ljava/lang/String;

    iget-object v5, p0, Laxo;->u:Lsm;

    iget-object v6, p0, Laxo;->y:Ljava/lang/String;

    iget-object v7, p0, Laxo;->z:Leq;

    iget-object v8, p0, Laxo;->A:Lwjo;

    iget-object v9, p0, Laxo;->B:Ljava/lang/Boolean;

    iget-object v10, p0, Laxo;->w:Lako;

    iput-byte p1, p0, Laxo;->t:B

    move-object v11, p0

    invoke-virtual/range {v2 .. v11}, Loxo;->f(Landroid/content/Context;Ljava/lang/String;Lsm;Ljava/lang/String;Leq;Lwjo;Ljava/lang/Boolean;Lako;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_8b

    :cond_8a
    return-object v1

    :cond_8b
    :goto_8b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
