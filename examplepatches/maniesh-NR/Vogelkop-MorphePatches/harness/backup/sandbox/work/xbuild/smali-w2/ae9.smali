.class public final synthetic Lae9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqwl;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lle9;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/io/Serializable;

.field public final synthetic g:Ljava/lang/Object;

.field public final synthetic h:Lcom/opera/api/Callback;


# direct methods
.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lse9;Lse9;)V
    .registers 9

    .line 21
    const/4 v0, 0x1

    iput-byte v0, p0, Lae9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lae9;->b:Lle9;

    iput-object p2, p0, Lae9;->c:Ljava/lang/String;

    iput-object p3, p0, Lae9;->d:Ljava/lang/String;

    iput-object p4, p0, Lae9;->e:Ljava/lang/Object;

    iput-object p5, p0, Lae9;->f:Ljava/io/Serializable;

    iput-object p6, p0, Lae9;->g:Ljava/lang/Object;

    iput-object p7, p0, Lae9;->h:Lcom/opera/api/Callback;

    return-void
.end method

.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lx1b;Lqn;Laxl;)V
    .registers 9

    .line 22
    const/4 p2, 0x2

    iput-byte p2, p0, Lae9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lae9;->b:Lle9;

    iput-object p3, p0, Lae9;->c:Ljava/lang/String;

    iput-object p4, p0, Lae9;->d:Ljava/lang/String;

    iput-object p5, p0, Lae9;->e:Ljava/lang/Object;

    iput-object p6, p0, Lae9;->f:Ljava/io/Serializable;

    iput-object p7, p0, Lae9;->g:Ljava/lang/Object;

    iput-object p8, p0, Lae9;->h:Lcom/opera/api/Callback;

    return-void
.end method

.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/Object;Lcom/opera/api/Callback;Lcom/opera/api/Callback;B)V
    .registers 9

    .line 23
    iput-byte p8, p0, Lae9;->a:B

    iput-object p1, p0, Lae9;->b:Lle9;

    iput-object p2, p0, Lae9;->c:Ljava/lang/String;

    iput-object p3, p0, Lae9;->f:Ljava/io/Serializable;

    iput-object p4, p0, Lae9;->d:Ljava/lang/String;

    iput-object p5, p0, Lae9;->e:Ljava/lang/Object;

    iput-object p6, p0, Lae9;->g:Ljava/lang/Object;

    iput-object p7, p0, Lae9;->h:Lcom/opera/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lle9;Ljava/lang/String;Lpwl;Ljava/lang/String;[BLjava/lang/Runnable;Lcom/opera/api/Callback;)V
    .registers 9

    const/4 v0, 0x3

    iput-byte v0, p0, Lae9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lae9;->b:Lle9;

    iput-object p2, p0, Lae9;->c:Ljava/lang/String;

    iput-object p3, p0, Lae9;->e:Ljava/lang/Object;

    iput-object p4, p0, Lae9;->d:Ljava/lang/String;

    iput-object p5, p0, Lae9;->f:Ljava/io/Serializable;

    iput-object p6, p0, Lae9;->g:Ljava/lang/Object;

    iput-object p7, p0, Lae9;->h:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final run()Lih4;
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lae9;->a:B

    const-string v2, "authentication_string"

    const-wide/16 v3, 0x3e8

    iget-object v5, v0, Lae9;->h:Lcom/opera/api/Callback;

    iget-object v6, v0, Lae9;->g:Ljava/lang/Object;

    iget-object v7, v0, Lae9;->e:Ljava/lang/Object;

    iget-object v8, v0, Lae9;->d:Ljava/lang/String;

    iget-object v9, v0, Lae9;->f:Ljava/io/Serializable;

    packed-switch v1, :pswitch_data_112

    check-cast v9, Ljava/security/PublicKey;

    move-object v15, v7

    check-cast v15, Lvz;

    move-object/from16 v16, v6

    check-cast v16, Lcxl;

    move-object v12, v5

    check-cast v12, Lve9;

    iget-object v11, v0, Lae9;->b:Lle9;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    div-long/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    new-instance v14, Lorb;

    invoke-direct {v14}, Lorb;-><init>()V

    const-string v3, "token"

    iget-object v4, v15, Lvz;->a:Ljava/lang/String;

    invoke-virtual {v14, v4, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v15, Lvz;->b:Ljava/lang/String;

    invoke-static {v8, v3, v9, v1}, Lle9;->d(Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v14, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "allow_reconnect"

    const/4 v2, 0x1

    invoke-virtual {v14, v1, v2}, Lorb;->r(Ljava/lang/String;Z)V

    new-instance v10, Lde9;

    iget-object v13, v0, Lae9;->c:Ljava/lang/String;

    invoke-direct/range {v10 .. v16}, Lde9;-><init>(Lle9;Lve9;Ljava/lang/String;Lorb;Lvz;Lcxl;)V

    return-object v10

    :pswitch_52
    check-cast v7, Lpwl;

    check-cast v9, [B

    move-object v15, v6

    check-cast v15, Ljava/lang/Runnable;

    iget-object v1, v7, Lpwl;->a:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-static {v9, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    const-string v3, "device_id"

    const-string v4, "content"

    invoke-static {v3, v1, v4, v8}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v14

    const-string v1, "signature"

    invoke-virtual {v14, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v10, Lnwl;

    const/16 v16, 0x2

    iget-object v11, v0, Lae9;->b:Lle9;

    iget-object v12, v0, Lae9;->h:Lcom/opera/api/Callback;

    iget-object v13, v0, Lae9;->c:Ljava/lang/String;

    invoke-direct/range {v10 .. v16}, Lnwl;-><init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Lorb;Ljava/lang/Runnable;B)V

    return-object v10

    :pswitch_7b
    check-cast v7, Ljava/lang/String;

    check-cast v9, Lx1b;

    move-object v15, v6

    check-cast v15, Lqn;

    move-object v12, v5

    check-cast v12, Laxl;

    const-string v1, "client_version"

    const-string v2, "notification_token"

    invoke-static {v1, v8, v2, v7}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v14

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    invoke-virtual {v9}, Lx1b;->n()Lomm;

    move-result-object v2

    :goto_96
    move-object v3, v2

    check-cast v3, Lgmb;

    iget-boolean v4, v3, Lgmb;->f:Z

    if-nez v4, :cond_a7

    invoke-virtual {v3}, Lgmb;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v1, v3}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_96

    :cond_a7
    const-string v2, "client_capabilities"

    invoke-virtual {v14, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v10, Lnwl;

    const/16 v16, 0x0

    iget-object v11, v0, Lae9;->b:Lle9;

    iget-object v13, v0, Lae9;->c:Ljava/lang/String;

    invoke-direct/range {v10 .. v16}, Lnwl;-><init>(Lle9;Lcom/opera/api/Callback;Ljava/lang/String;Lorb;Ljava/lang/Runnable;B)V

    return-object v10

    :pswitch_b8
    check-cast v7, Ljava/lang/String;

    move-object v13, v9

    check-cast v13, Ljava/lang/String;

    move-object/from16 v16, v6

    check-cast v16, Lse9;

    move-object v12, v5

    check-cast v12, Lse9;

    iget-object v11, v0, Lae9;->b:Lle9;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v15, Lorb;

    invoke-direct {v15}, Lorb;-><init>()V

    const-string v1, "payload"

    invoke-virtual {v15, v8, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "payload_iv"

    invoke-virtual {v15, v7, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v10, Lde9;

    iget-object v14, v0, Lae9;->c:Ljava/lang/String;

    invoke-direct/range {v10 .. v16}, Lde9;-><init>(Lle9;Lse9;Ljava/lang/String;Ljava/lang/String;Lorb;Lse9;)V

    return-object v10

    :pswitch_e0
    check-cast v9, Ljava/security/PublicKey;

    check-cast v7, Ljava/lang/String;

    move-object v15, v6

    check-cast v15, Lsu;

    move-object v12, v5

    check-cast v12, Lve9;

    iget-object v11, v0, Lae9;->b:Lle9;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    div-long/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    new-instance v14, Lorb;

    invoke-direct {v14}, Lorb;-><init>()V

    const-string v3, "fallback"

    const/4 v4, 0x0

    invoke-virtual {v14, v3, v4}, Lorb;->r(Ljava/lang/String;Z)V

    invoke-static {v8, v7, v9, v1}, Lle9;->d(Ljava/lang/String;Ljava/lang/String;Ljava/security/PublicKey;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v14, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v10, Lxf1;

    iget-object v13, v0, Lae9;->c:Ljava/lang/String;

    invoke-direct/range {v10 .. v15}, Lxf1;-><init>(Lle9;Lve9;Ljava/lang/String;Lorb;Lsu;)V

    return-object v10

    :pswitch_data_112
    .packed-switch 0x0
        :pswitch_e0
        :pswitch_b8
        :pswitch_7b
        :pswitch_52
    .end packed-switch
.end method
