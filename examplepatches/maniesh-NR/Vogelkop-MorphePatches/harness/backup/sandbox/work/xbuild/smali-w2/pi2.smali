.class public final Lpi2;
.super Lhi2;
.source "SourceFile"


# instance fields
.field public final g:Lvdf;

.field public h:Lih4;

.field public i:Z


# direct methods
.method public constructor <init>(Lmyk;Lrgh;Ljava/lang/String;Lvdf;Lkqd;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p5}, Lhi2;-><init>(Lmyk;Lgi2;Ljava/lang/String;Lii2;)V

    iput-object p4, p0, Lpi2;->g:Lvdf;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    invoke-super {p0}, Lhi2;->a()V

    iget-object v0, p0, Lpi2;->h:Lih4;

    if-eqz v0, :cond_d

    invoke-interface {v0}, Lih4;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lpi2;->h:Lih4;

    :cond_d
    return-void
.end method

.method public final g(JLjava/lang/String;Lorb;)V
    .registers 21

    move-object/from16 v1, p0

    move-object/from16 v0, p3

    move-object/from16 v2, p4

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v6, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v7, -0x1

    sparse-switch v3, :sswitch_data_13c

    goto :goto_39

    :sswitch_12
    const-string v3, "ReadyForPairingRequestMessage"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    const/4 v7, 0x3

    goto :goto_39

    :sswitch_1c
    const-string v3, "SignInToSyncRequestMessage"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    move v7, v6

    goto :goto_39

    :sswitch_26
    const-string v3, "NotifyHostScenarioResultMessage"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    move v7, v5

    goto :goto_39

    :sswitch_30
    const-string v3, "SpawnStartSyncDataRequestMessage"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_39

    move v7, v4

    :cond_39
    :goto_39
    const/16 v8, 0x16

    const/4 v0, 0x0

    packed-switch v7, :pswitch_data_14e

    goto/16 :goto_13a

    :pswitch_41
    iget-boolean v0, v1, Lpi2;->i:Z

    if-nez v0, :cond_13a

    iget-object v0, v1, Lpi2;->h:Lih4;

    if-nez v0, :cond_13a

    iput-boolean v5, v1, Lpi2;->i:Z

    invoke-virtual {v1}, Lhi2;->d()Li1;

    move-result-object v0

    new-instance v2, Lab;

    invoke-direct {v2, v1, v8}, Lab;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    const-string v4, "device_state"

    invoke-static {v0}, Lhi2;->e(Li1;)Lorb;

    move-result-object v0

    invoke-virtual {v3, v0, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "in_response_to"

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "ReadyForPairingResponseMessage"

    invoke-virtual {v1, v0, v3, v2}, Lhi2;->j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object v0

    iput-object v0, v1, Lpi2;->h:Lih4;

    iget-object v0, v1, Lpi2;->g:Lvdf;

    if-eqz v0, :cond_13a

    invoke-virtual {v0}, Lvdf;->run()V

    return-void

    :pswitch_7b
    const-string v3, "credential"

    iget-boolean v4, v1, Lpi2;->i:Z

    if-eqz v4, :cond_13a

    iget-object v4, v1, Lpi2;->h:Lih4;

    if-nez v4, :cond_13a

    :try_start_85
    const-string v4, "start_sync_data"

    invoke-virtual {v2, v4}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v2

    iget-object v4, v2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_95

    move-object v3, v0

    goto :goto_99

    :cond_95
    invoke-virtual {v2, v3}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v3

    :goto_99
    invoke-static {v3}, Lhi2;->i(Lorb;)Lbpd;

    move-result-object v3

    invoke-static {v2}, Lhi2;->h(Lorb;)Lei2;

    move-result-object v4

    iget-object v9, v1, Lhi2;->a:Lmyk;

    const-string v5, "auth_token"

    invoke-virtual {v2, v5}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v4, Lei2;->a:Ljava/lang/String;

    if-eqz v3, :cond_b3

    iget-object v2, v3, Lbpd;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    move-object v12, v2

    goto :goto_b4

    :cond_b3
    move-object v12, v0

    :goto_b4
    if-eqz v3, :cond_ba

    iget-object v0, v3, Lbpd;->c:Ljava/lang/Object;

    check-cast v0, [B

    :cond_ba
    move-object v13, v0

    new-instance v14, Lni2;
    :try_end_bd
    .catch Lorg/json/JSONException; {:try_start_85 .. :try_end_bd} :catch_d4

    const/4 v5, 0x0

    move-object v2, v4

    move-object v0, v14

    move-wide/from16 v3, p1

    :try_start_c2
    invoke-direct/range {v0 .. v5}, Lni2;-><init>(Ljava/lang/Object;Ljava/lang/Object;JB)V
    :try_end_c5
    .catch Lorg/json/JSONException; {:try_start_c2 .. :try_end_c5} :catch_d2

    move-wide v2, v3

    :try_start_c6
    new-instance v15, Lmi2;

    invoke-direct {v15, v1, v2, v3, v6}, Lmi2;-><init>(Lpi2;JB)V

    invoke-virtual/range {v9 .. v15}, Lmyk;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/Runnable;Lcom/opera/api/Callback;)Lih4;

    move-result-object v0

    iput-object v0, v1, Lpi2;->h:Lih4;
    :try_end_d1
    .catch Lorg/json/JSONException; {:try_start_c6 .. :try_end_d1} :catch_d6

    goto :goto_13a

    :catch_d2
    move-wide v2, v3

    goto :goto_d6

    :catch_d4
    move-wide/from16 v2, p1

    :catch_d6
    :goto_d6
    new-instance v0, Lab;

    invoke-direct {v0, v1, v8}, Lab;-><init>(Ljava/lang/Object;B)V

    const-string v4, "error_string"

    const-string v5, "Invalid message"

    invoke-static {v4, v5}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4, v0}, Lhi2;->k(JLorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object v0

    iput-object v0, v1, Lpi2;->h:Lih4;

    goto :goto_13a

    :pswitch_ea
    const-string v3, "error_detail"

    iget-boolean v7, v1, Lpi2;->i:Z

    if-eqz v7, :cond_13a

    iget-object v7, v1, Lpi2;->h:Lih4;

    if-nez v7, :cond_13a

    iput-boolean v4, v1, Lpi2;->i:Z

    :try_start_f6
    iget-object v4, v2, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10b

    invoke-virtual {v1}, Lpi2;->a()V

    iget-object v2, v1, Lhi2;->d:Lii2;

    if-eqz v2, :cond_13a

    iput-object v0, v1, Lhi2;->d:Lii2;

    invoke-interface {v2, v5}, Lii2;->f(I)V

    goto :goto_13a

    :cond_10b
    invoke-virtual {v2, v3}, Lorb;->c(Ljava/lang/String;)Lorb;

    invoke-virtual {v1, v6}, Lhi2;->c(I)V
    :try_end_111
    .catch Lorg/json/JSONException; {:try_start_f6 .. :try_end_111} :catch_112

    goto :goto_13a

    :catch_112
    invoke-virtual {v1, v6}, Lhi2;->c(I)V

    goto :goto_13a

    :pswitch_116
    move-wide/from16 v2, p1

    iget-boolean v6, v1, Lpi2;->i:Z

    if-eqz v6, :cond_13a

    iget-object v6, v1, Lpi2;->h:Lih4;

    if-nez v6, :cond_13a

    new-instance v6, Lmi2;

    invoke-direct {v6, v1, v2, v3, v4}, Lmi2;-><init>(Lpi2;JB)V

    new-instance v4, Lmi2;

    invoke-direct {v4, v1, v2, v3, v5}, Lmi2;-><init>(Lpi2;JB)V

    new-instance v2, Lmgh;

    const/16 v3, 0x8

    invoke-direct {v2, v0, v4, v3}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Ls14;

    iget-object v3, v1, Lhi2;->c:Ljava/lang/String;

    invoke-direct {v0, v1, v3, v2, v6}, Ls14;-><init>(Lhi2;Ljava/lang/String;Lmgh;Lcom/opera/api/Callback;)V

    iput-object v2, v1, Lpi2;->h:Lih4;

    :cond_13a
    :goto_13a
    return-void

    nop

    :sswitch_data_13c
    .sparse-switch
        -0x2fea3a9c -> :sswitch_30
        -0x2326ccb7 -> :sswitch_26
        0x21b93ad0 -> :sswitch_1c
        0x752312ba -> :sswitch_12
    .end sparse-switch

    :pswitch_data_14e
    .packed-switch 0x0
        :pswitch_116
        :pswitch_ea
        :pswitch_7b
        :pswitch_41
    .end packed-switch
.end method
