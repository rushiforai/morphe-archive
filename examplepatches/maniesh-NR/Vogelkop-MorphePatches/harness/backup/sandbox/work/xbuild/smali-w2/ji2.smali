.class public final synthetic Lji2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lli2;


# direct methods
.method public synthetic constructor <init>(Lli2;B)V
    .registers 3

    iput-byte p2, p0, Lji2;->a:B

    iput-object p1, p0, Lji2;->b:Lli2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 12

    iget-byte v0, p0, Lji2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    iget-object p0, p0, Lji2;->b:Lli2;

    packed-switch v0, :pswitch_data_100

    check-cast p1, Ljava/lang/Long;

    iput-object v4, p0, Lli2;->i:Lih4;

    if-nez p1, :cond_15

    invoke-virtual {p0, v3}, Lhi2;->c(I)V

    goto :goto_21

    :cond_15
    invoke-virtual {p0}, Lli2;->a()V

    iget-object p1, p0, Lhi2;->d:Lii2;

    if-eqz p1, :cond_21

    iput-object v4, p0, Lhi2;->d:Lii2;

    invoke-interface {p1, v2}, Lii2;->f(I)V

    :cond_21
    :goto_21
    return-void

    :pswitch_22
    check-cast p1, Ljava/lang/String;

    iput-object v4, p0, Lli2;->i:Lih4;

    invoke-virtual {p0, v3, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :pswitch_2a
    check-cast p1, Ljava/lang/Long;

    iput-object v4, p0, Lli2;->i:Lih4;

    if-nez p1, :cond_34

    invoke-virtual {p0, v3}, Lhi2;->c(I)V

    goto :goto_3a

    :cond_34
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lli2;->j:J

    :goto_3a
    return-void

    :pswitch_3b
    check-cast p1, Ljava/lang/String;

    iput-object v4, p0, Lli2;->i:Lih4;

    invoke-virtual {p0, v3, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :pswitch_43
    check-cast p1, Ljava/lang/String;

    iput-object v4, p0, Lli2;->i:Lih4;

    const/4 p1, 0x3

    iput-byte p1, p0, Lli2;->h:B

    iget-object p1, p0, Lhi2;->c:Ljava/lang/String;

    new-instance v0, Lji2;

    invoke-direct {v0, p0, v1}, Lji2;-><init>(Lli2;B)V

    new-instance v1, Lji2;

    invoke-direct {v1, p0, v3}, Lji2;-><init>(Lli2;B)V

    new-instance v2, Lmgh;

    const/16 v3, 0x8

    invoke-direct {v2, v4, v1, v3}, Lmgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Ls14;

    invoke-direct {v1, p0, p1, v2, v0}, Ls14;-><init>(Lhi2;Ljava/lang/String;Lmgh;Lcom/opera/api/Callback;)V

    iput-object v2, p0, Lli2;->i:Lih4;

    return-void

    :pswitch_65
    check-cast p1, Ljava/lang/String;

    iput-object v4, p0, Lli2;->i:Lih4;

    invoke-virtual {p0, v3, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :pswitch_6d
    check-cast p1, Ljava/lang/String;

    iput-object v4, p0, Lli2;->i:Lih4;

    iget-object v0, p0, Lhi2;->a:Lmyk;

    iget-object v0, v0, Lmyk;->b:Ldb;

    invoke-virtual {v0, v2}, Ldb;->j(Z)V

    invoke-virtual {p0, v3, p1}, Lli2;->m(ILjava/lang/String;)V

    return-void

    :pswitch_7c
    check-cast p1, Ljava/lang/String;

    iput-object v4, p0, Lli2;->i:Lih4;

    iget-object v0, p0, Lhi2;->a:Lmyk;

    invoke-virtual {v0}, Lmyk;->b()Lbpd;

    move-result-object v5

    iget-object v6, v0, Lmyk;->b:Ldb;

    invoke-virtual {v6}, Ldb;->f()Z

    move-result v7

    if-nez v7, :cond_90

    move-object v7, v4

    goto :goto_94

    :cond_90
    invoke-virtual {v6}, Ldb;->c()Ljava/lang/String;

    move-result-object v7

    :goto_94
    iget-object v0, v0, Lmyk;->c:Lzwk;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lcak;->d:Lavj;

    invoke-static {v2}, Lavj;->b(I)Z

    move-result v0

    if-nez v0, :cond_a4

    new-array v0, v1, [Ljava/lang/String;

    goto :goto_aa

    :cond_a4
    invoke-static {}, LJ/N;->MeEAPUBl()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    :goto_aa
    array-length v1, v0

    new-instance v2, Ljava/util/HashSet;

    invoke-static {v1}, Lna2;->j(I)I

    move-result v1

    invoke-direct {v2, v1}, Ljava/util/HashSet;-><init>(I)V

    invoke-static {v2, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    invoke-virtual {v6}, Ldb;->f()Z

    move-result v0

    if-nez v0, :cond_bf

    move-object v0, v4

    goto :goto_c7

    :cond_bf
    invoke-virtual {v6}, Ldb;->d()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_c7
    new-instance v1, Lji2;

    const/4 v6, 0x5

    invoke-direct {v1, p0, v6}, Lji2;-><init>(Lli2;B)V

    new-instance v6, Lorb;

    invoke-direct {v6}, Lorb;-><init>()V

    if-eqz v5, :cond_ee

    iget-object v8, v5, Lbpd;->b:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object v5, v5, Lbpd;->c:Ljava/lang/Object;

    check-cast v5, [B

    const-string v9, "auth_password"

    invoke-static {v9, v8}, Lvep;->p(Ljava/lang/String;Ljava/lang/String;)Lorb;

    move-result-object v8

    if-eqz v5, :cond_e8

    invoke-static {v5, v3}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v4

    :cond_e8
    const-string v3, "bootstrap_token"

    invoke-virtual {v8, v4, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v4, v8

    :cond_ee
    invoke-static {p1, v4, v7, v0, v2}, Lhi2;->f(Ljava/lang/String;Lorb;Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/HashSet;)Lorb;

    move-result-object p1

    const-string v0, "start_sync_data"

    invoke-virtual {v6, p1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "SignInToSyncRequestMessage"

    invoke-virtual {p0, p1, v6, v1}, Lhi2;->j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p1

    iput-object p1, p0, Lli2;->i:Lih4;

    return-void

    :pswitch_data_100
    .packed-switch 0x0
        :pswitch_7c
        :pswitch_6d
        :pswitch_65
        :pswitch_43
        :pswitch_3b
        :pswitch_2a
        :pswitch_22
    .end packed-switch
.end method
