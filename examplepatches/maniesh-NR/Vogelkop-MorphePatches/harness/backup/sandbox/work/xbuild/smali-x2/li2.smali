.class public final Lli2;
.super Lhi2;
.source "SourceFile"


# instance fields
.field public final g:Li1;

.field public h:B

.field public i:Lih4;

.field public j:J

.field public k:Z


# direct methods
.method public constructor <init>(Lmyk;Lgi2;Ljava/lang/String;Lbm8;)V
    .registers 5

    invoke-direct {p0, p1, p2, p3, p4}, Lhi2;-><init>(Lmyk;Lgi2;Ljava/lang/String;Lii2;)V

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lli2;->j:J

    invoke-virtual {p0}, Lhi2;->d()Li1;

    move-result-object p1

    iput-object p1, p0, Lli2;->g:Li1;

    if-nez p1, :cond_16

    const-string p1, "Unable to get device state"

    const/4 p2, 0x2

    invoke-virtual {p0, p2, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :cond_16
    const/4 p2, 0x1

    iput-byte p2, p0, Lli2;->h:B

    new-instance p2, Lji2;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p3}, Lji2;-><init>(Lli2;B)V

    new-instance p3, Lorb;

    invoke-direct {p3}, Lorb;-><init>()V

    const-string p4, "device_state"

    invoke-static {p1}, Lhi2;->e(Li1;)Lorb;

    move-result-object p1

    invoke-virtual {p3, p1, p4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "ReadyForPairingRequestMessage"

    invoke-virtual {p0, p1, p3, p2}, Lhi2;->j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lli2;->i:Lih4;

    return-void
.end method

.method public static q(Lorb;)Li1;
    .registers 12

    const-string v0, "oauth2_session_state"

    invoke-virtual {p0, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v0

    const-string v1, "session_state"

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    invoke-static {v3}, Lvep;->B(I)[I

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x0

    move v7, v6

    :goto_14
    if-ge v7, v5, :cond_25

    aget v8, v4, v7

    invoke-static {v8}, Lvep;->i(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_26

    add-int/lit8 v7, v7, 0x1

    goto :goto_14

    :cond_25
    move v8, v6

    :cond_26
    if-eqz v8, :cond_9c

    iget-object v1, v0, Lorb;->a:Lorg/json/JSONObject;

    const-string v2, "user_id"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    const/4 v4, 0x0

    if-eqz v1, :cond_35

    move-object v0, v4

    goto :goto_39

    :cond_35
    invoke-virtual {v0, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_39
    iget-object v1, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string v2, "sync_state"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_86

    invoke-virtual {p0, v2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p0

    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    const-string v1, "enabled_types"

    invoke-virtual {p0, v1}, Lorb;->b(Ljava/lang/String;)Lvpb;

    move-result-object v1

    move v2, v6

    :goto_53
    iget-object v5, v1, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v2, v5, :cond_65

    invoke-virtual {v1, v2}, Lvpb;->d(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_53

    :cond_65
    const-string v1, "passphrase_type"

    invoke-virtual {p0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3}, Lvep;->B(I)[I

    move-result-object v3

    array-length v5, v3

    move v7, v6

    :goto_71
    if-ge v7, v5, :cond_84

    aget v9, v3, v7

    invoke-static {v9}, Lvep;->j(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_81

    move v6, v9

    goto :goto_84

    :cond_81
    add-int/lit8 v7, v7, 0x1

    goto :goto_71

    :cond_84
    :goto_84
    if-eqz v6, :cond_8c

    :cond_86
    new-instance p0, Li1;

    invoke-direct {p0, v8, v0, v4, v6}, Li1;-><init>(ILjava/lang/String;Ljava/util/HashSet;I)V

    return-object p0

    :cond_8c
    new-instance v0, Lorg/json/JSONException;

    invoke-virtual {p0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "Unknown value for passphrase_type: "

    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9c
    new-instance p0, Lorg/json/JSONException;

    invoke-virtual {v0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Unknown value for session_state: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public final a()V
    .registers 2

    invoke-super {p0}, Lhi2;->a()V

    iget-object v0, p0, Lli2;->i:Lih4;

    if-eqz v0, :cond_d

    invoke-interface {v0}, Lih4;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lli2;->i:Lih4;

    :cond_d
    return-void
.end method

.method public final b()V
    .registers 3

    const-string v0, "Aborted"

    const/4 v1, 0x2

    invoke-virtual {p0, v1, v0}, Lli2;->m(ILjava/lang/String;)V

    return-void
.end method

.method public final g(JLjava/lang/String;Lorb;)V
    .registers 10

    iget-object p1, p4, Lorb;->a:Lorg/json/JSONObject;

    const-string p2, "start_sync_data"

    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x2

    const/4 v3, -0x1

    sparse-switch v0, :sswitch_data_ae

    goto :goto_2c

    :sswitch_f
    const-string v0, "SpawnStartSyncDataResponseMessage"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2c

    move v3, v2

    goto :goto_2c

    :sswitch_19
    const-string v0, "ReadyForPairingResponseMessage"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2c

    move v3, v1

    goto :goto_2c

    :sswitch_23
    const-string v0, "SignInToSyncResponseMessage"

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_2c

    const/4 v3, 0x0

    :cond_2c
    :goto_2c
    const-string p3, "Invalid message"

    const-string v0, "error_detail"

    const/4 v4, 0x0

    packed-switch v3, :pswitch_data_bc

    goto/16 :goto_ac

    :pswitch_36
    invoke-virtual {p0, p4}, Lli2;->p(Lorb;)Z

    move-result v1

    if-eqz v1, :cond_ac

    :try_start_3c
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_44

    move-object p2, v4

    goto :goto_48

    :cond_44
    invoke-virtual {p4, p2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p2

    :goto_48
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_52

    invoke-virtual {p4, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v4

    :cond_52
    invoke-virtual {p0, p2, v4}, Lli2;->o(Lorb;Lorb;)V
    :try_end_55
    .catch Lorg/json/JSONException; {:try_start_3c .. :try_end_55} :catch_56

    return-void

    :catch_56
    move-exception p1

    invoke-virtual {p0, v2, p3}, Lli2;->m(ILjava/lang/String;)V

    throw p1

    :pswitch_5b
    invoke-virtual {p0, p4}, Lli2;->p(Lorb;)Z

    move-result p2

    if-eqz p2, :cond_ac

    iput-boolean v1, p0, Lli2;->k:Z

    const-string p2, "device_state"

    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p1

    iget-object v0, p0, Lli2;->g:Li1;

    if-eqz p1, :cond_71

    invoke-virtual {p0, v0, v4}, Lli2;->n(Li1;Li1;)V

    return-void

    :cond_71
    :try_start_71
    invoke-virtual {p4, p2}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p1

    invoke-static {p1}, Lli2;->q(Lorb;)Li1;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lli2;->n(Li1;Li1;)V
    :try_end_7c
    .catch Lorg/json/JSONException; {:try_start_71 .. :try_end_7c} :catch_7d

    return-void

    :catch_7d
    move-exception p1

    invoke-virtual {p0, v2, p3}, Lli2;->m(ILjava/lang/String;)V

    throw p1

    :pswitch_82
    invoke-virtual {p0, p4}, Lli2;->p(Lorb;)Z

    move-result p2

    if-eqz p2, :cond_ac

    :try_start_88
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_92

    invoke-virtual {p4, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object v4

    :cond_92
    iget-byte p1, p0, Lli2;->h:B

    const/4 p2, 0x3

    if-eq p1, p2, :cond_9d

    const-string p1, "Message out of order"

    invoke-virtual {p0, v2, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :cond_9d
    if-nez v4, :cond_a3

    invoke-virtual {p0}, Lli2;->r()V

    return-void

    :cond_a3
    invoke-virtual {p0, v2, v4}, Lli2;->l(ILorb;)V
    :try_end_a6
    .catch Lorg/json/JSONException; {:try_start_88 .. :try_end_a6} :catch_a7

    return-void

    :catch_a7
    move-exception p1

    invoke-virtual {p0, v2, p3}, Lli2;->m(ILjava/lang/String;)V

    throw p1

    :cond_ac
    :goto_ac
    return-void

    nop

    :sswitch_data_ae
    .sparse-switch
        -0xd1dd0d2 -> :sswitch_23
        0xcb35484 -> :sswitch_19
        0x1016f71a -> :sswitch_f
    .end sparse-switch

    :pswitch_data_bc
    .packed-switch 0x0
        :pswitch_82
        :pswitch_5b
        :pswitch_36
    .end packed-switch
.end method

.method public final l(ILorb;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lli2;->h:B

    iget-boolean v1, p0, Lli2;->k:Z

    if-eqz v1, :cond_2b

    iget-object v1, p0, Lli2;->i:Lih4;

    if-eqz v1, :cond_11

    invoke-interface {v1}, Lih4;->cancel()V

    const/4 v1, 0x0

    iput-object v1, p0, Lli2;->i:Lih4;

    :cond_11
    iput-boolean v0, p0, Lli2;->k:Z

    new-instance v0, Lki2;

    invoke-direct {v0, p0, p1}, Lki2;-><init>(Lli2;I)V

    new-instance p1, Lorb;

    invoke-direct {p1}, Lorb;-><init>()V

    const-string v1, "error_detail"

    invoke-virtual {p1, p2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "NotifyHostScenarioResultMessage"

    invoke-virtual {p0, p2, p1, v0}, Lhi2;->j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lli2;->i:Lih4;

    return-void

    :cond_2b
    invoke-virtual {p0, p1}, Lhi2;->c(I)V

    return-void
.end method

.method public final m(ILjava/lang/String;)V
    .registers 5

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, "error_string"

    invoke-virtual {v0, p2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lli2;->l(ILorb;)V

    return-void
.end method

.method public final n(Li1;Li1;)V
    .registers 11

    iget-byte v0, p0, Lli2;->h:B

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v2, :cond_c

    const-string p1, "Message out of order"

    invoke-virtual {p0, v1, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :cond_c
    if-nez p2, :cond_14

    const-string p1, "Other device not ready"

    invoke-virtual {p0, v1, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :cond_14
    iget v0, p2, Li1;->b:I

    iget v3, p1, Li1;->b:I

    invoke-static {v3}, Lvep;->A(I)I

    move-result v3

    const/16 v4, 0x8

    const/4 v5, 0x0

    const/4 v6, 0x3

    if-eqz v3, :cond_62

    if-ne v3, v2, :cond_6a

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_46

    if-ne v0, v2, :cond_6a

    iget-object p1, p1, Li1;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_40

    iget-object p2, p2, Li1;->d:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_40

    invoke-virtual {p0}, Lli2;->r()V

    return-void

    :cond_40
    const-string p1, "Devices signed in to different accounts"

    invoke-virtual {p0, v6, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :cond_46
    iput-byte v6, p0, Lli2;->h:B

    new-instance p1, Lji2;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lji2;-><init>(Lli2;B)V

    new-instance p2, Lji2;

    invoke-direct {p2, p0, v1}, Lji2;-><init>(Lli2;B)V

    new-instance v0, Lmgh;

    invoke-direct {v0, v5, p2, v4}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p2, Ls14;

    iget-object v1, p0, Lhi2;->c:Ljava/lang/String;

    invoke-direct {p2, p0, v1, v0, p1}, Ls14;-><init>(Lhi2;Ljava/lang/String;Lmgh;Lcom/opera/api/Callback;)V

    iput-object v0, p0, Lli2;->i:Lih4;

    return-void

    :cond_62
    invoke-static {v0}, Lvep;->A(I)I

    move-result p1

    if-eqz p1, :cond_86

    if-eq p1, v2, :cond_70

    :cond_6a
    const-string p1, "Bad logic"

    invoke-virtual {p0, v1, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :cond_70
    iput-byte v1, p0, Lli2;->h:B

    new-instance p1, Lji2;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lji2;-><init>(Lli2;B)V

    new-instance p2, Lorb;

    invoke-direct {p2}, Lorb;-><init>()V

    const-string v0, "SpawnStartSyncDataRequestMessage"

    invoke-virtual {p0, v0, p2, p1}, Lhi2;->j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lli2;->i:Lih4;

    return-void

    :cond_86
    new-instance v3, Lji2;

    invoke-direct {v3, p0, v6}, Lji2;-><init>(Lli2;B)V

    move p1, v4

    new-instance v4, Lji2;

    const/4 p2, 0x4

    invoke-direct {v4, p0, p2}, Lji2;-><init>(Lli2;B)V

    move p2, v1

    iget-object v1, p0, Lhi2;->a:Lmyk;

    iget-object v0, v1, Lmyk;->b:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    sget-object v2, Lbf9;->A:Lbxl;

    if-eqz v0, :cond_a6

    const-string p1, "Already signed in"

    invoke-virtual {v4, p1}, Lji2;->run(Ljava/lang/Object;)V

    goto/16 :goto_117

    :cond_a6
    iget-object v0, v1, Lmyk;->a:Lbf9;

    invoke-virtual {v0}, Lbf9;->u()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_b0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfxl;

    iget-boolean v7, v6, Lfxl;->b:Z

    if-eqz v7, :cond_b0

    goto :goto_c2

    :cond_c1
    move-object v6, v5

    :goto_c2
    if-nez v6, :cond_ca

    const-string p1, "Failed to find local device"

    invoke-virtual {v4, p1}, Lji2;->run(Ljava/lang/Object;)V

    goto :goto_117

    :cond_ca
    const/16 v0, 0x12

    new-array v0, v0, [B

    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v2, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    invoke-static {v0, p2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    iget-object p2, v6, Lfxl;->a:Lpwl;

    iget-object v6, p2, Lpwl;->a:Ljava/lang/String;

    move-object v0, v5

    new-instance v5, Lmgh;

    invoke-direct {v5, v0, v4, p1}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, v1, Lmyk;->e:Ldi2;

    iget-object p2, p2, Lpwl;->b:Ljava/lang/String;

    new-instance v0, Lay1;

    invoke-direct/range {v0 .. v5}, Lay1;-><init>(Lmyk;Ljava/lang/String;Lji2;Lji2;Lmgh;)V

    new-instance v1, Lzzh;

    const/16 v3, 0x14

    invoke-direct {v1, v4, v3}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "group_id"

    const-string v4, "device_id"

    invoke-static {v3, p2, v4, v6}, Lo18;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p2

    invoke-static {}, LJ/N;->MsWGZerj()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "service"

    invoke-virtual {p2, v3, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v3, "password"

    invoke-virtual {p2, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lai2;

    invoke-direct {v2, p1, v1, p2, v0}, Lai2;-><init>(Ldi2;Lzzh;Lorb;Lay1;)V

    iput-object v2, v5, Lmgh;->b:Ljava/lang/Object;

    move-object v2, v5

    :goto_117
    iput-object v2, p0, Lli2;->i:Lih4;

    return-void
.end method

.method public final o(Lorb;Lorb;)V
    .registers 14

    iget-byte v0, p0, Lli2;->h:B

    const/4 v1, 0x2

    if-eq v0, v1, :cond_b

    const-string p1, "Message out of order"

    invoke-virtual {p0, v1, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :cond_b
    if-eqz p2, :cond_11

    invoke-virtual {p0, v1, p2}, Lli2;->l(ILorb;)V

    return-void

    :cond_11
    if-eqz p1, :cond_58

    iget-object p2, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v0, "credential"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p2

    const/4 v2, 0x0

    if-eqz p2, :cond_20

    move-object p2, v2

    goto :goto_24

    :cond_20
    invoke-virtual {p1, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p2

    :goto_24
    invoke-static {p2}, Lhi2;->i(Lorb;)Lbpd;

    move-result-object p2

    invoke-static {p1}, Lhi2;->h(Lorb;)Lei2;

    move-result-object v0

    const-string v3, "auth_token"

    invoke-virtual {p1, v3}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lei2;->a:Ljava/lang/String;

    if-eqz p2, :cond_42

    iget-object p1, p2, Lbpd;->b:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Ljava/lang/String;

    iget-object p1, p2, Lbpd;->c:Ljava/lang/Object;

    check-cast p1, [B

    move-object v8, p1

    move-object v7, v2

    goto :goto_44

    :cond_42
    move-object v7, v2

    move-object v8, v7

    :goto_44
    new-instance v9, Lbi2;

    invoke-direct {v9, p0, v0, v1}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v10, Lji2;

    const/4 p1, 0x6

    invoke-direct {v10, p0, p1}, Lji2;-><init>(Lli2;B)V

    iget-object v4, p0, Lhi2;->a:Lmyk;

    invoke-virtual/range {v4 .. v10}, Lmyk;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/Runnable;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lli2;->i:Lih4;

    return-void

    :cond_58
    const-string p1, "Empty SpawnStartSyncDataResponseMessage"

    invoke-virtual {p0, v1, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void
.end method

.method public final p(Lorb;)Z
    .registers 6

    const-string v0, "in_response_to"

    :try_start_2
    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0
    :try_end_e
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_e} :catch_1c

    iget-wide v2, p0, Lli2;->j:J

    cmp-long p1, v0, v2

    if-nez p1, :cond_1a

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lli2;->j:J

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0

    :catch_1c
    new-instance p0, Lorg/json/JSONException;

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Bad value for in_response_to: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public final r()V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lli2;->h:B

    iget-boolean v1, p0, Lli2;->k:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_2c

    iget-object v1, p0, Lli2;->i:Lih4;

    if-eqz v1, :cond_11

    invoke-interface {v1}, Lih4;->cancel()V

    iput-object v2, p0, Lli2;->i:Lih4;

    :cond_11
    iput-boolean v0, p0, Lli2;->k:Z

    new-instance v0, Lji2;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lji2;-><init>(Lli2;B)V

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    const-string v3, "error_detail"

    invoke-virtual {v1, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v2, "NotifyHostScenarioResultMessage"

    invoke-virtual {p0, v2, v1, v0}, Lhi2;->j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object v0

    iput-object v0, p0, Lli2;->i:Lih4;

    return-void

    :cond_2c
    invoke-virtual {p0}, Lli2;->a()V

    iget-object v0, p0, Lhi2;->d:Lii2;

    if-nez v0, :cond_34

    return-void

    :cond_34
    iput-object v2, p0, Lhi2;->d:Lii2;

    const/4 p0, 0x1

    invoke-interface {v0, p0}, Lii2;->f(I)V

    return-void
.end method
