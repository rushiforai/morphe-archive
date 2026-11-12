.class public final synthetic Lgqo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln1p;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lgqo;->a:B

    iput-object p1, p0, Lgqo;->b:Ljava/lang/Object;

    iput-object p2, p0, Lgqo;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Lgqo;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_b4

    iget-object v0, p0, Lgqo;->b:Ljava/lang/Object;

    check-cast v0, Lsro;

    iget-object p0, p0, Lgqo;->c:Ljava/lang/Object;

    check-cast p0, Lo7p;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, p1, Lq0i;

    if-nez v2, :cond_24

    move-object v2, p1

    check-cast v2, Lkzo;

    sget-object v2, Lw2p;->a:La64;

    new-instance v3, Ly6p;

    invoke-direct {v3, v0, p0, v1}, Ly6p;-><init>(Lsro;Lo7p;Lmt5;)V

    const/4 v4, 0x3

    invoke-static {v2, v1, v1, v3, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_24
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_35

    iget-object p0, p0, Lpxo;->i:Lp7p;

    if-eqz p0, :cond_35

    iget-object p1, v0, Lyjo;->b:Ljava/lang/String;

    const/16 v0, 0x2329

    invoke-virtual {p0, v0, p1}, Lp7p;->g(ILjava/lang/String;)V

    :cond_35
    return-void

    :pswitch_36
    iget-object v0, p0, Lgqo;->b:Ljava/lang/Object;

    check-cast v0, Lo7p;

    iget-object p0, p0, Lgqo;->c:Ljava/lang/Object;

    check-cast p0, Ly2p;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v1, p1, Lq0i;

    if-nez v1, :cond_63

    iget-object v1, v0, Lpxo;->e:Lbap;

    invoke-virtual {v1}, Lbap;->g()Lbap;

    move-result-object v1

    iput-object v1, v0, Lpxo;->e:Lbap;

    iget-object p0, p0, Lvoo;->q:Lmzo;

    if-eqz p0, :cond_63

    sget-object p0, Lqb7;->h:Ltmj;

    iget-object v1, v0, Lpxo;->a:Landroid/content/Context;

    invoke-virtual {p0, v1}, Ltmj;->f(Landroid/content/Context;)Lqb7;

    move-result-object p0

    new-instance v1, Lkgo;

    const/4 v2, 0x2

    invoke-direct {v1, v0, v2}, Lkgo;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lqb7;->a(Ln1p;)V

    :cond_63
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_71

    iget-object p0, v0, Lpxo;->e:Lbap;

    invoke-virtual {p0}, Lbap;->a()Ln9p;

    move-result-object p0

    iput-object p0, v0, Lpxo;->e:Lbap;

    :cond_71
    return-void

    :pswitch_72
    iget-object v0, p0, Lgqo;->b:Ljava/lang/Object;

    check-cast v0, Lgep;

    iget-object p0, p0, Lgqo;->c:Ljava/lang/Object;

    check-cast p0, Lwjh;

    check-cast p1, Lt0i;

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, p1, Lq0i;

    if-nez v2, :cond_99

    move-object v2, p1

    check-cast v2, Lkzo;

    sget-object v2, Lt0i;->b:Lp0i;

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyjo;

    new-instance v2, Lt0i;

    invoke-direct {v2, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Lgep;->invoke(Ljava/lang/Object;)V

    :cond_99
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_b3

    new-instance p0, Lvjo;

    const/16 p1, 0x232b

    invoke-direct {p0, p1, v1}, Lvjo;-><init>(ILjava/lang/String;)V

    new-instance p1, Lq0i;

    invoke-direct {p1, p0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance p0, Lt0i;

    invoke-direct {p0, p1}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Lgep;->invoke(Ljava/lang/Object;)V

    :cond_b3
    return-void

    :pswitch_data_b4
    .packed-switch 0x0
        :pswitch_72
        :pswitch_36
    .end packed-switch
.end method
