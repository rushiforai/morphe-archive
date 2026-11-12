.class public final synthetic Ltbp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln1p;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lylp;

.field public final synthetic c:Lgcp;


# direct methods
.method public synthetic constructor <init>(Lgcp;Lylp;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ltbp;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltbp;->c:Lgcp;

    iput-object p2, p0, Ltbp;->b:Lylp;

    return-void
.end method

.method public synthetic constructor <init>(Lylp;Lgcp;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Ltbp;->a:B

    iput-object p1, p0, Ltbp;->b:Lylp;

    iput-object p2, p0, Ltbp;->c:Lgcp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 9

    iget-byte v0, p0, Ltbp;->a:B

    const/4 v1, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_b8

    iget-object v0, p0, Ltbp;->b:Lylp;

    iget-object p0, p0, Ltbp;->c:Lgcp;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v4, p1, Lq0i;

    if-nez v4, :cond_21

    move-object v4, p1

    check-cast v4, Ljava/io/File;

    sget-object v5, Lw2p;->a:La64;

    new-instance v6, Lubp;

    invoke-direct {v6, v4, v0, v3, v2}, Lubp;-><init>(Ljava/io/File;Lylp;Lmt5;B)V

    invoke-static {v5, v3, v3, v6, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_21
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_32

    iget-object p0, p0, Lpxo;->i:Lp7p;

    if-eqz p0, :cond_32

    sget-object p1, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 p1, 0x2334

    invoke-virtual {p0, p1, v3}, Lp7p;->g(ILjava/lang/String;)V

    :cond_32
    return-void

    :pswitch_33
    iget-object v0, p0, Ltbp;->b:Lylp;

    iget-object p0, p0, Ltbp;->c:Lgcp;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, p1, Lq0i;

    if-nez v2, :cond_4d

    move-object v2, p1

    check-cast v2, Ljava/io/File;

    sget-object v4, Lw2p;->a:La64;

    new-instance v5, Lubp;

    const/4 v6, 0x0

    invoke-direct {v5, v2, v0, v3, v6}, Lubp;-><init>(Ljava/io/File;Lylp;Lmt5;B)V

    invoke-static {v4, v3, v3, v5, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_4d
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_5e

    iget-object p0, p0, Lpxo;->i:Lp7p;

    if-eqz p0, :cond_5e

    sget-object p1, Lp7p;->c:Ljava/util/LinkedHashSet;

    const/16 p1, 0x232c

    invoke-virtual {p0, p1, v3}, Lp7p;->g(ILjava/lang/String;)V

    :cond_5e
    return-void

    :pswitch_5f
    iget-object v0, p0, Ltbp;->c:Lgcp;

    iget-object p0, p0, Ltbp;->b:Lylp;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v1, p1, Lq0i;

    if-nez v1, :cond_9e

    move-object v1, p1

    check-cast v1, Lylp;

    iget-object v1, v0, Lpxo;->e:Lbap;

    invoke-virtual {v1}, Lbap;->g()Lbap;

    move-result-object v1

    iput-object v1, v0, Lpxo;->e:Lbap;

    iget-object v1, v0, Lpxo;->a:Landroid/content/Context;

    iget-object v3, p0, Lvoo;->q:Lmzo;

    if-eqz v3, :cond_97

    sget-object v3, Lqb7;->h:Ltmj;

    invoke-virtual {v3, v1}, Ltmj;->f(Landroid/content/Context;)Lqb7;

    move-result-object v4

    new-instance v5, Ltbp;

    invoke-direct {v5, p0, v0, v2}, Ltbp;-><init>(Lylp;Lgcp;B)V

    invoke-virtual {v4, v5}, Lqb7;->a(Ln1p;)V

    invoke-virtual {v3, v1}, Ltmj;->f(Landroid/content/Context;)Lqb7;

    move-result-object v1

    new-instance v2, Ltbp;

    const/4 v3, 0x2

    invoke-direct {v2, p0, v0, v3}, Ltbp;-><init>(Lylp;Lgcp;B)V

    invoke-virtual {v1, v2}, Lqb7;->c(Ln1p;)V

    :cond_97
    iget-object p0, v0, Lpxo;->c:Luuj;

    if-eqz p0, :cond_9e

    invoke-virtual {p0}, Luuj;->a()V

    :cond_9e
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_b7

    iget-object p1, v0, Lpxo;->e:Lbap;

    invoke-virtual {p1}, Lbap;->a()Ln9p;

    move-result-object p1

    iput-object p1, v0, Lpxo;->e:Lbap;

    iget-object p1, v0, Lpxo;->c:Luuj;

    if-eqz p1, :cond_b7

    invoke-static {p0}, Lb8h;->a(Ljava/lang/Throwable;)Lcm;

    move-result-object p0

    invoke-virtual {p1, p0}, Luuj;->g(Lcm;)V

    :cond_b7
    return-void

    :pswitch_data_b8
    .packed-switch 0x0
        :pswitch_5f
        :pswitch_33
    .end packed-switch
.end method
