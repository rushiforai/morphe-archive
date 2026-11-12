.class public final Li2p;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public t:B

.field public synthetic u:Ljava/lang/Object;

.field public final synthetic v:J

.field public final synthetic w:J

.field public final synthetic x:Landroid/content/Context;

.field public final synthetic y:Ljava/lang/String;


# direct methods
.method public constructor <init>(JJLandroid/content/Context;Ljava/lang/String;Lmt5;)V
    .registers 8

    iput-wide p1, p0, Li2p;->v:J

    iput-wide p3, p0, Li2p;->w:J

    iput-object p5, p0, Li2p;->x:Landroid/content/Context;

    iput-object p6, p0, Li2p;->y:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p7}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 11

    new-instance v0, Li2p;

    iget-object v5, p0, Li2p;->x:Landroid/content/Context;

    iget-object v6, p0, Li2p;->y:Ljava/lang/String;

    iget-wide v1, p0, Li2p;->v:J

    iget-wide v3, p0, Li2p;->w:J

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Li2p;-><init>(JJLandroid/content/Context;Ljava/lang/String;Lmt5;)V

    iput-object p1, v0, Li2p;->u:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Li2p;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Li2p;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Li2p;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    sget-object v0, Lpx5;->a:Lpx5;

    iget-byte v1, p0, Li2p;->t:B

    const/4 v2, 0x0

    iget-object v3, p0, Li2p;->x:Landroid/content/Context;

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-eqz v1, :cond_31

    if-eq v1, v6, :cond_29

    if-eq v1, v5, :cond_21

    if-ne v1, v4, :cond_1b

    iget-object p0, p0, Li2p;->u:Ljava/lang/Object;

    check-cast p0, Lpqh;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_8e

    :cond_1b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v2

    :cond_21
    iget-object v1, p0, Li2p;->u:Ljava/lang/Object;

    check-cast v1, Lnx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_5a

    :cond_29
    iget-object v1, p0, Li2p;->u:Ljava/lang/Object;

    check-cast v1, Lnx5;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_45

    :cond_31
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Li2p;->u:Ljava/lang/Object;

    move-object v1, p1

    check-cast v1, Lnx5;

    iput-object v1, p0, Li2p;->u:Ljava/lang/Object;

    iput-byte v6, p0, Li2p;->t:B

    iget-wide v6, p0, Li2p;->v:J

    invoke-static {v6, v7, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_8c

    :goto_45
    sget-object p1, Lbb7;->a:Lcv6;

    sget-object p1, Lmr6;->b:Lmr6;

    new-instance v6, Leno;

    const/16 v7, 0x9

    invoke-direct {v6, v7, v2, v3}, Leno;-><init>(BLmt5;Ljava/lang/Object;)V

    iput-object v1, p0, Li2p;->u:Ljava/lang/Object;

    iput-byte v5, p0, Li2p;->t:B

    invoke-static {p1, v6, p0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-eq p1, v0, :cond_8c

    :goto_5a
    new-instance p1, Lpqh;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    :try_start_5f
    sget-object v1, Lt0i;->b:Lp0i;

    new-instance v1, Lh2p;

    invoke-direct {v1, v3, p1}, Lh2p;-><init>(Landroid/content/Context;Lpqh;)V
    :try_end_66
    .catchall {:try_start_5f .. :try_end_66} :catchall_67

    goto :goto_70

    :catchall_67
    move-exception v1

    sget-object v3, Lt0i;->b:Lp0i;

    new-instance v3, Lq0i;

    invoke-direct {v3, v1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v1, v3

    :goto_70
    instance-of v3, v1, Lq0i;

    if-nez v3, :cond_75

    move-object v2, v1

    :cond_75
    check-cast v2, Lh2p;

    if-eqz v2, :cond_80

    iput-object v2, p1, Lpqh;->a:Ljava/lang/Object;

    iget-object v1, p0, Li2p;->y:Ljava/lang/String;

    invoke-virtual {v2, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    :cond_80
    iput-object p1, p0, Li2p;->u:Ljava/lang/Object;

    iput-byte v4, p0, Li2p;->t:B

    iget-wide v1, p0, Li2p;->w:J

    invoke-static {v1, v2, p0}, Lnb6;->q(JLmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_8d

    :cond_8c
    return-object v0

    :cond_8d
    move-object p0, p1

    :goto_8e
    iget-object p0, p0, Lpqh;->a:Ljava/lang/Object;

    check-cast p0, Lf2p;

    if-eqz p0, :cond_9b

    iget-boolean p1, p0, Lf2p;->a:Z

    if-nez p1, :cond_9b

    invoke-virtual {p0}, Lf2p;->destroy()V

    :cond_9b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
