.class public final synthetic Lmi2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpi2;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Lpi2;JB)V
    .registers 5

    iput-byte p4, p0, Lmi2;->a:B

    iput-object p1, p0, Lmi2;->b:Lpi2;

    iput-wide p2, p0, Lmi2;->c:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 12

    iget-byte v0, p0, Lmi2;->a:B

    const/4 v1, 0x1

    const-string v2, "error_string"

    const/16 v3, 0x16

    iget-wide v4, p0, Lmi2;->c:J

    iget-object p0, p0, Lmi2;->b:Lpi2;

    check-cast p1, Ljava/lang/String;

    packed-switch v0, :pswitch_data_dc

    iget-object v0, p0, Lhi2;->a:Lmyk;

    iget-object v0, v0, Lmyk;->b:Ldb;

    invoke-virtual {v0, v1}, Ldb;->j(Z)V

    new-instance v0, Lab;

    invoke-direct {v0, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, p1}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p1

    invoke-virtual {p0, v4, v5, p1, v0}, Lhi2;->k(JLorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lpi2;->h:Lih4;

    return-void

    :pswitch_27
    new-instance v0, Lab;

    invoke-direct {v0, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, p1}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p1

    invoke-virtual {p0, v4, v5, p1, v0}, Lhi2;->k(JLorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lpi2;->h:Lih4;

    return-void

    :pswitch_37
    new-instance v0, Lab;

    invoke-direct {v0, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, p1}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object p1

    invoke-virtual {p0, v4, v5, p1, v0}, Lhi2;->k(JLorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lpi2;->h:Lih4;

    return-void

    :pswitch_47
    const/4 v0, 0x0

    iput-object v0, p0, Lpi2;->h:Lih4;

    iget-object v2, p0, Lhi2;->a:Lmyk;

    invoke-virtual {v2}, Lmyk;->b()Lbpd;

    move-result-object v6

    iget-object v7, v2, Lmyk;->b:Ldb;

    invoke-virtual {v7}, Ldb;->f()Z

    move-result v8

    if-nez v8, :cond_5a

    move-object v8, v0

    goto :goto_5e

    :cond_5a
    invoke-virtual {v7}, Ldb;->c()Ljava/lang/String;

    move-result-object v8

    :goto_5e
    iget-object v2, v2, Lmyk;->c:Lzwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lcak;->d:Lavj;

    invoke-static {v1}, Lavj;->b(I)Z

    move-result v1

    if-nez v1, :cond_6f

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    goto :goto_75

    :cond_6f
    invoke-static {}, LJ/N;->MeEAPUBl()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    :goto_75
    array-length v2, v1

    new-instance v9, Ljava/util/HashSet;

    invoke-static {v2}, Lna2;->j(I)I

    move-result v2

    invoke-direct {v9, v2}, Ljava/util/HashSet;-><init>(I)V

    invoke-static {v9, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    invoke-virtual {v7}, Ldb;->f()Z

    move-result v1

    if-nez v1, :cond_8a

    move-object v1, v0

    goto :goto_92

    :cond_8a
    invoke-virtual {v7}, Ldb;->d()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    :goto_92
    new-instance v2, Lab;

    invoke-direct {v2, p0, v3}, Lab;-><init>(Ljava/lang/Object;B)V

    if-eqz v6, :cond_b6

    iget-object v3, v6, Lbpd;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    iget-object v6, v6, Lbpd;->c:Ljava/lang/Object;

    check-cast v6, [B

    const-string v7, "auth_password"

    invoke-static {v7, v3}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v3

    if-eqz v6, :cond_af

    const/4 v7, 0x2

    invoke-static {v6, v7}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v6

    goto :goto_b0

    :cond_af
    move-object v6, v0

    :goto_b0
    const-string v7, "bootstrap_token"

    invoke-virtual {v3, v6, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_b7

    :cond_b6
    move-object v3, v0

    :goto_b7
    invoke-static {p1, v3, v8, v1, v9}, Lhi2;->f(Ljava/lang/String;Lorb;Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/HashSet;)Lorb;

    move-result-object p1

    new-instance v1, Lorb;

    invoke-direct {v1}, Lorb;-><init>()V

    const-string v3, "start_sync_data"

    invoke-virtual {v1, p1, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "error_detail"

    invoke-virtual {v1, v0, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "in_response_to"

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "SpawnStartSyncDataResponseMessage"

    invoke-virtual {p0, p1, v1, v2}, Lhi2;->j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lpi2;->h:Lih4;

    return-void

    :pswitch_data_dc
    .packed-switch 0x0
        :pswitch_47
        :pswitch_37
        :pswitch_27
    .end packed-switch
.end method
