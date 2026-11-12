.class public final synthetic Ln6p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ln1p;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lo7p;

.field public final synthetic c:Lgqo;


# direct methods
.method public synthetic constructor <init>(Lgqo;Lo7p;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ln6p;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln6p;->c:Lgqo;

    iput-object p2, p0, Ln6p;->b:Lo7p;

    return-void
.end method

.method public synthetic constructor <init>(Lo7p;Lgqo;)V
    .registers 4

    .line 11
    const/4 v0, 0x1

    iput-byte v0, p0, Ln6p;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln6p;->b:Lo7p;

    iput-object p2, p0, Ln6p;->c:Lgqo;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Ln6p;->a:B

    iget-object v1, p0, Ln6p;->c:Lgqo;

    iget-object p0, p0, Ln6p;->b:Lo7p;

    check-cast p1, Lt0i;

    packed-switch v0, :pswitch_data_9c

    iget-object v0, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v0, Lq0i;

    const/4 v3, 0x0

    if-eqz v2, :cond_14

    move-object v2, v3

    goto :goto_15

    :cond_14
    move-object v2, v0

    :goto_15
    check-cast v2, Ly2p;

    if-eqz v2, :cond_3c

    iget-object v2, v2, Ly2p;->D:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsro;

    if-eqz v2, :cond_32

    invoke-virtual {v1, p1}, Lgqo;->invoke(Ljava/lang/Object;)V

    sget-object p1, Lw2p;->a:La64;

    new-instance v0, Ly6p;

    invoke-direct {v0, p0, v2, v3}, Ly6p;-><init>(Lo7p;Lsro;Lmt5;)V

    const/4 p0, 0x3

    invoke-static {p1, v3, v3, v0, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_65

    :cond_32
    new-instance p1, Lvjo;

    const/16 v2, 0x232e

    const-string v4, "Main image is missing after a successful download"

    invoke-direct {p1, v2, v4}, Lvjo;-><init>(ILjava/lang/String;)V

    goto :goto_3d

    :cond_3c
    move-object p1, v3

    :goto_3d
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-nez v0, :cond_4c

    if-nez p1, :cond_4d

    new-instance p1, Lvjo;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v3}, Lvjo;-><init>(ILjava/lang/String;)V

    goto :goto_4d

    :cond_4c
    move-object p1, v0

    :cond_4d
    :goto_4d
    new-instance v0, Lq0i;

    invoke-direct {v0, p1}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    new-instance v2, Lt0i;

    invoke-direct {v2, v0}, Lt0i;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lgqo;->invoke(Ljava/lang/Object;)V

    iget-object p0, p0, Lpxo;->c:Luuj;

    if-eqz p0, :cond_65

    invoke-static {p1}, Lb8h;->a(Ljava/lang/Throwable;)Lcm;

    move-result-object p1

    invoke-virtual {p0, p1}, Luuj;->g(Lcm;)V

    :cond_65
    :goto_65
    return-void

    :pswitch_66
    invoke-virtual {v1, p1}, Lgqo;->invoke(Ljava/lang/Object;)V

    iget-object p1, p1, Lt0i;->a:Ljava/lang/Object;

    instance-of v0, p1, Lq0i;

    if-nez v0, :cond_8a

    move-object v0, p1

    check-cast v0, Lylp;

    new-instance v1, Lny3;

    iget-object v2, p0, Lpxo;->i:Lp7p;

    new-instance v3, Lu6p;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lu6p;-><init>(Lo7p;B)V

    iget-object v4, p0, Lo7p;->t:Lbxk;

    invoke-direct {v1, v0, v2, v3, v4}, Lny3;-><init>(Lylp;Lp7p;Lu6p;Lbxk;)V

    iput-object v1, p0, Lo7p;->o:Lny3;

    iget-object v0, p0, Lpxo;->c:Luuj;

    if-eqz v0, :cond_8a

    invoke-virtual {v0}, Luuj;->a()V

    :cond_8a
    invoke-static {p1}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-eqz p1, :cond_9b

    iget-object p0, p0, Lpxo;->c:Luuj;

    if-eqz p0, :cond_9b

    invoke-static {p1}, Lb8h;->a(Ljava/lang/Throwable;)Lcm;

    move-result-object p1

    invoke-virtual {p0, p1}, Luuj;->g(Lcm;)V

    :cond_9b
    return-void

    :pswitch_data_9c
    .packed-switch 0x0
        :pswitch_66
    .end packed-switch
.end method
