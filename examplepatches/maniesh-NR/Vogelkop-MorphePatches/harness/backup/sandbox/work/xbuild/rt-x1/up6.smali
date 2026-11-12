.class public final synthetic Lup6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcq6;


# direct methods
.method public synthetic constructor <init>(Lcq6;B)V
    .registers 3

    iput-byte p2, p0, Lup6;->a:B

    iput-object p1, p0, Lup6;->b:Lcq6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    iget-byte v0, p0, Lup6;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    iget-object p0, p0, Lup6;->b:Lcq6;

    packed-switch v0, :pswitch_data_62

    iget-object v0, p0, Lcq6;->d:Lti9;

    iget-object v3, v0, Lti9;->q:Ljdj;

    iget-object v4, p0, Lcq6;->a:Lnx5;

    new-instance v5, Lwp6;

    const/4 v6, 0x1

    invoke-direct {v5, p0, v2, v6}, Lwp6;-><init>(Lcq6;Lmt5;B)V

    invoke-static {v3, v4, v5}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    iget-object v3, v0, Lti9;->o:Lrlh;

    new-instance v5, Lwp6;

    invoke-direct {v5, p0, v2, v1}, Lwp6;-><init>(Lcq6;Lmt5;B)V

    invoke-static {v3, v4, v5}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    iget-object v0, v0, Lti9;->p:Ljdj;

    new-instance v1, Lwp6;

    const/4 v3, 0x3

    invoke-direct {v1, p0, v2, v3}, Lwp6;-><init>(Lcq6;Lmt5;B)V

    invoke-static {v0, v4, v1}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    return-void

    :pswitch_2e
    iget-object v0, p0, Lcq6;->c:Lgmc;

    iget-object v0, v0, Lgmc;->q:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3e
    :goto_3e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_61

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkoc;

    iget-boolean v4, v3, Lkoc;->b:Z

    if-eqz v4, :cond_3e

    iget-object v4, p0, Lcq6;->f:Lo0i;

    iget-object v3, v3, Lkoc;->a:Ljoc;

    iget-object v5, v4, Lo0i;->a:Lnx5;

    iget-object v6, v4, Lo0i;->c:Ldx5;

    new-instance v7, Lp71;

    const/16 v8, 0x14

    invoke-direct {v7, v4, v3, v2, v8}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v5, v6, v2, v7, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_3e

    :cond_61
    return-void

    :pswitch_data_62
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method
