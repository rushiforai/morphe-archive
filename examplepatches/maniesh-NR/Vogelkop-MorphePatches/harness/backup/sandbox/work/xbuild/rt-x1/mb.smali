.class public final Lmb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lchf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lmb;->a:B

    iput-object p1, p0, Lmb;->b:Ljava/lang/Object;

    iput-object p2, p0, Lmb;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/oauth2/OperaAccessToken;)V
    .registers 9

    iget-byte v0, p0, Lmb;->a:B

    iget-object v1, p0, Lmb;->c:Ljava/lang/Object;

    iget-object p0, p0, Lmb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_9a

    check-cast p0, Lxbf;

    iput-object p1, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    iget-object p0, p1, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-interface {v1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_15
    check-cast p0, Lghj;

    new-instance v0, Lfhj;

    const/4 v2, 0x1

    invoke-direct {v0, p1, v2}, Lfhj;-><init>(Lcom/opera/android/oauth2/OperaAccessToken;Z)V

    iput-object v0, p0, Lghj;->e:Lfhj;

    check-cast v1, Lcom/opera/api/Callback;

    new-instance p0, Ljsl;

    iget-object p1, p1, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    invoke-direct {p0, p1}, Ljsl;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2c
    check-cast p0, Lrn9;

    iget-boolean v0, p0, Lrn9;->b:Z

    if-nez v0, :cond_98

    check-cast v1, Lehf;

    iget-object v0, v1, Lehf;->a:Ljava/lang/String;

    iget-object p1, p1, Lcom/opera/android/oauth2/OperaAccessToken;->a:Ljava/lang/String;

    iget-object v1, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v1, Lqb;

    iget-object v2, v1, Lqb;->f:Ls62;

    if-eqz v2, :cond_98

    invoke-virtual {v2}, Ls62;->c()Lp62;

    move-result-object v2

    if-eqz v2, :cond_98

    new-instance v3, Lq3;

    const/4 v4, 0x2

    invoke-direct {v3, p0, v1, v4}, Lq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v2, Lp62;->a:Lole;

    new-instance v1, Lbi;

    const/16 v2, 0x19

    invoke-direct {v1, v3, v2}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    invoke-virtual {v2, v3}, Lvpb;->a(Ljava/lang/Object;)V

    const-string v4, "token"

    const-string v5, "id"

    invoke-static {v5, v0, v4, p1}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p1

    const-string v0, "userToMerge"

    invoke-virtual {v3, p1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lqq8;

    invoke-virtual {p0}, Lqq8;->h()Ljava/lang/String;

    move-result-object p1

    const-string v0, "2.0"

    const-string v3, "method"

    const-string v4, "jsonrpc"

    const-string v6, "actions.v1.mergeUser"

    invoke-static {v4, v0, v3, v6}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v0

    const-string v3, "params"

    invoke-virtual {v0, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Lt02;

    const/16 v2, 0x9

    invoke-direct {p1, v1, v2}, Lt02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0, p1}, Lqq8;->l(Lorb;Lkotlin/jvm/functions/Function1;)V

    :cond_98
    return-void

    nop

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_2c
        :pswitch_15
    .end packed-switch
.end method

.method public final b()V
    .registers 5

    iget-byte v0, p0, Lmb;->a:B

    iget-object v1, p0, Lmb;->c:Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object p0, p0, Lmb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_34

    check-cast p0, Lxbf;

    iput-object v2, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    invoke-interface {v1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_14
    check-cast p0, Lghj;

    iget-object v0, p0, Lghj;->e:Lfhj;

    if-eqz v0, :cond_21

    iget-boolean v0, v0, Lfhj;->b:Z

    const/4 v3, 0x1

    if-ne v0, v3, :cond_21

    iput-object v2, p0, Lghj;->e:Lfhj;

    :cond_21
    check-cast v1, Lcom/opera/api/Callback;

    sget-object p0, Lhsl;->a:Lhsl;

    invoke-interface {v1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_29
    check-cast p0, Lrn9;

    iget-boolean v0, p0, Lrn9;->b:Z

    if-nez v0, :cond_32

    invoke-virtual {p0}, Lrn9;->k()V

    :cond_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_29
        :pswitch_14
    .end packed-switch
.end method

.method public final c()V
    .registers 5

    iget-byte v0, p0, Lmb;->a:B

    iget-object v1, p0, Lmb;->c:Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object p0, p0, Lmb;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3a

    check-cast p0, Lxbf;

    iput-object v2, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    invoke-interface {v1, v2}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_14
    check-cast p0, Lghj;

    iget-object v0, p0, Lghj;->e:Lfhj;

    if-eqz v0, :cond_21

    iget-boolean v0, v0, Lfhj;->b:Z

    const/4 v3, 0x1

    if-ne v0, v3, :cond_21

    iput-object v2, p0, Lghj;->e:Lfhj;

    :cond_21
    check-cast v1, Lcom/opera/api/Callback;

    sget-object p0, Lhsl;->a:Lhsl;

    invoke-interface {v1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_29
    check-cast p0, Lrn9;

    iget-boolean v0, p0, Lrn9;->b:Z

    if-nez v0, :cond_39

    iget-object v0, p0, Lrn9;->d:Ljava/lang/Object;

    check-cast v0, Lqb;

    invoke-virtual {v0}, Lqb;->a()V

    invoke-virtual {p0}, Lrn9;->k()V

    :cond_39
    return-void

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_29
        :pswitch_14
    .end packed-switch
.end method
