.class public final Lfmo;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public t:Z

.field public final synthetic u:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lfmo;->u:Landroid/content/Context;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 3

    new-instance p1, Lfmo;

    iget-object p0, p0, Lfmo;->u:Landroid/content/Context;

    invoke-direct {p1, p0, p2}, Lfmo;-><init>(Landroid/content/Context;Lmt5;)V

    return-object p1
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lfmo;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lfmo;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lfmo;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    sget-object v0, Lpx5;->a:Lpx5;

    iget-boolean v1, p0, Lfmo;->t:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_14

    if-ne v1, v3, :cond_e

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    return-object p1

    :cond_e
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_14
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lemo;

    iget-object v1, p0, Lfmo;->u:Landroid/content/Context;

    invoke-direct {p1, v1}, Lemo;-><init>(Landroid/content/Context;)V

    iput-boolean v3, p0, Lfmo;->t:Z

    sget-object v1, Lkotlin/coroutines/h;->a:Lkotlin/coroutines/h;

    new-instance v3, Lfb9;

    const/4 v4, 0x5

    invoke-direct {v3, v4, v2, p1}, Lfb9;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v1, v3, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2f

    return-object v0

    :cond_2f
    return-object p0
.end method
