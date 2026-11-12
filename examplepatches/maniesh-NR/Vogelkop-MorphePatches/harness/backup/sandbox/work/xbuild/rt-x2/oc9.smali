.class public final synthetic Loc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ls14;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ls14;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Loc9;->a:B

    iput-object p1, p0, Loc9;->b:Ls14;

    iput-object p2, p0, Loc9;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Loc9;->a:B

    packed-switch v1, :pswitch_data_e0

    iget-object v1, v0, Loc9;->b:Ls14;

    iget-object v0, v0, Loc9;->c:Ljava/lang/String;

    iget-boolean v2, v1, Ls14;->b:Z

    if-nez v2, :cond_cb

    iget-object v2, v1, Ls14;->c:Ljava/lang/Object;

    check-cast v2, Lnc9;

    iget-object v3, v2, Lnc9;->d:Ljava/lang/Object;

    monitor-enter v3

    :try_start_16
    iget-object v2, v2, Lnc9;->e:Lmc9;

    const/4 v4, 0x0

    if-nez v2, :cond_26

    new-instance v2, Lmc9;

    new-array v5, v4, [B

    const-wide/16 v6, 0x0

    invoke-direct {v2, v5, v6, v7}, Lmc9;-><init>([BJ)V

    monitor-exit v3

    goto :goto_27

    :cond_26
    monitor-exit v3
    :try_end_27
    .catchall {:try_start_16 .. :try_end_27} :catchall_ce

    :goto_27
    iget-object v1, v1, Ls14;->d:Ljava/lang/Object;

    check-cast v1, Lxe9;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iget-wide v5, v2, Lmc9;->a:J

    iget-object v2, v2, Lmc9;->b:[B

    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v1, Lxe9;->c:Ljava/lang/Object;

    check-cast v3, Lbf9;

    iget-object v7, v1, Lxe9;->d:Ljava/lang/Object;

    check-cast v7, Lk5o;

    iget-object v8, v1, Lxe9;->a:Ljava/lang/String;

    iget-object v9, v1, Lxe9;->b:Ljava/lang/String;

    iget-object v10, v1, Lxe9;->e:Ljava/lang/Object;

    check-cast v10, Lie9;

    iget-object v11, v1, Lxe9;->f:Ljava/lang/Object;

    check-cast v11, Landroid/net/Uri;

    iget-object v1, v1, Lxe9;->g:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-wide v12, v10, Lie9;->c:J

    const-string v10, "text"

    new-instance v14, Lorb;

    invoke-direct {v14}, Lorb;-><init>()V

    new-instance v15, Lorg/json/JSONObject;

    invoke-direct {v15}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "type"

    move-object/from16 v16, v0

    const-string v0, "file2"

    invoke-virtual {v14, v0, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-virtual {v14, v8, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "mimetype"

    invoke-virtual {v14, v9, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "size"

    invoke-virtual {v14, v5, v6, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "expires"

    invoke-virtual {v14, v12, v13, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "iv"

    invoke-virtual {v14, v2, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v11, :cond_8a

    const-string v0, "preview"

    invoke-virtual {v14, v11, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_8a
    :try_start_8a
    invoke-static {v10}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v15, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_91
    .catch Lorg/json/JSONException; {:try_start_8a .. :try_end_91} :catch_c7

    const-string v0, "Update your client to support file messages"

    :try_start_93
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v15, v10, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_9a
    .catch Lorg/json/JSONException; {:try_start_93 .. :try_end_9a} :catch_c2

    new-instance v0, Lw59;

    iget-object v2, v14, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    if-eqz v1, :cond_b1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_b2

    :cond_b1
    const/4 v1, 0x0

    :goto_b2
    invoke-direct {v0, v2, v4, v5, v1}, Lw59;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lpe9;

    const/4 v2, 0x0

    invoke-direct {v1, v7, v2}, Lpe9;-><init>(Lk5o;B)V

    invoke-virtual {v3, v0, v1}, Lbf9;->E(Lw59;Lcom/opera/api/Callback;)Lih4;

    move-result-object v0

    iput-object v0, v7, Lk5o;->b:Ljava/lang/Object;

    goto :goto_cb

    :catch_c2
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_cb

    :catch_c7
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    :cond_cb
    :goto_cb
    return-void

    :goto_cc
    :try_start_cc
    monitor-exit v3
    :try_end_cd
    .catchall {:try_start_cc .. :try_end_cd} :catchall_ce

    throw v0

    :catchall_ce
    move-exception v0

    goto :goto_cc

    :pswitch_d0
    iget-object v1, v0, Loc9;->b:Ls14;

    iget-object v0, v0, Loc9;->c:Ljava/lang/String;

    iget-boolean v2, v1, Ls14;->b:Z

    if-nez v2, :cond_df

    iget-object v1, v1, Ls14;->e:Ljava/lang/Object;

    check-cast v1, Lpe9;

    invoke-virtual {v1, v0}, Lpe9;->run(Ljava/lang/Object;)V

    :cond_df
    return-void

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_d0
    .end packed-switch
.end method
