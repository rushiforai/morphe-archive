.class public abstract Lhi2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lih4;


# instance fields
.field public final a:Lmyk;

.field public final b:Lgi2;

.field public final c:Ljava/lang/String;

.field public d:Lii2;

.field public e:J

.field public f:Z


# direct methods
.method public constructor <init>(Lmyk;Lgi2;Ljava/lang/String;Lii2;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lhi2;->e:J

    iput-object p1, p0, Lhi2;->a:Lmyk;

    iput-object p2, p0, Lhi2;->b:Lgi2;

    iput-object p3, p0, Lhi2;->c:Ljava/lang/String;

    iput-object p4, p0, Lhi2;->d:Lii2;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lhi2;->f:Z

    iget-object p2, p1, Lmyk;->h:Ljava/util/HashMap;

    invoke-virtual {p2, p3, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhi2;

    iget-object p0, p1, Lmyk;->j:Lr72;

    if-nez p0, :cond_25

    new-instance p0, Lr72;

    invoke-direct {p0, p1}, Lr72;-><init>(Lmyk;)V

    iput-object p0, p1, Lmyk;->j:Lr72;

    :cond_25
    return-void
.end method

.method public static e(Li1;)Lorb;
    .registers 6

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    iget v1, p0, Li1;->b:I

    iget-object v2, p0, Li1;->d:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    const-string v4, "session_state"

    invoke-static {v1}, Lvep;->i(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "user_id"

    invoke-virtual {v3, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Li1;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    if-eqz v1, :cond_53

    iget p0, p0, Li1;->c:I

    if-eqz p0, :cond_53

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_35
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_45

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_35

    :cond_45
    const-string v1, "enabled_types"

    invoke-virtual {v0, v2, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "passphrase_type"

    invoke-static {p0}, Lvep;->j(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_53
    new-instance p0, Lorb;

    invoke-direct {p0}, Lorb;-><init>()V

    const-string v1, "oauth2_session_state"

    invoke-virtual {p0, v3, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "sync_state"

    invoke-virtual {p0, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object p0
.end method

.method public static f(Ljava/lang/String;Lorb;Ljava/lang/String;Ljava/lang/Boolean;Ljava/util/HashSet;)Lorb;
    .registers 7

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, "auth_token"

    invoke-virtual {v0, p0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "credential"

    invoke-virtual {v0, p1, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "display_name_hint"

    invoke-virtual {v0, p2, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p0, "is_anonymous"

    invoke-virtual {v0, p3, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p0, Lvpb;

    invoke-direct {p0}, Lvpb;-><init>()V

    invoke-virtual {p4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_22
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_32

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-virtual {p0, p2}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_22

    :cond_32
    const-string p1, "start_types"

    invoke-virtual {v0, p0, p1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public static h(Lorb;)Lei2;
    .registers 9

    iget-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string v1, "is_anonymous"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    iget-object v2, p0, Lorb;->a:Lorg/json/JSONObject;

    const/4 v3, 0x1

    const-string v4, "Unknown"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "display_name_hint"

    if-eqz v0, :cond_26

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-virtual {p0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :cond_1d
    new-instance p0, Lei2;

    if-eqz v6, :cond_22

    move-object v4, v6

    :cond_22
    invoke-direct {p0, v5, v4, v3}, Lei2;-><init>(BLjava/lang/String;Z)V

    return-object p0

    :cond_26
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_32

    new-instance p0, Lei2;

    invoke-direct {p0, v5, v6, v5}, Lei2;-><init>(BLjava/lang/String;Z)V

    return-object p0

    :cond_32
    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3e

    new-instance p0, Lei2;

    invoke-direct {p0, v5, v4, v3}, Lei2;-><init>(BLjava/lang/String;Z)V

    return-object p0

    :cond_3e
    invoke-virtual {p0, v7}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lei2;

    invoke-direct {v0, v5, p0, v5}, Lei2;-><init>(BLjava/lang/String;Z)V

    return-object v0
.end method

.method public static i(Lorb;)Lbpd;
    .registers 3

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    iget-object v0, p0, Lorb;->a:Lorg/json/JSONObject;

    const-string v1, "auth_password"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    new-instance v0, Lbpd;

    const-string v1, "bootstrap_token"

    invoke-virtual {p0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-static {p0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    invoke-direct {v0, p0}, Lbpd;-><init>([B)V

    return-object v0

    :cond_1f
    new-instance v0, Lbpd;

    invoke-virtual {p0, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lbpd;-><init>(Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public a()V
    .registers 4

    iget-boolean v0, p0, Lhi2;->f:Z

    if-eqz v0, :cond_32

    const/4 v0, 0x0

    iput-boolean v0, p0, Lhi2;->f:Z

    iget-object v0, p0, Lhi2;->a:Lmyk;

    iget-object v1, v0, Lmyk;->h:Ljava/util/HashMap;

    iget-object p0, p0, Lhi2;->c:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhi2;

    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_32

    iget-object p0, v0, Lmyk;->j:Lr72;

    if-eqz p0, :cond_32

    iget-object v1, p0, Lr72;->b:Ljava/lang/Object;

    check-cast v1, Lq65;

    invoke-virtual {v1}, Ln1;->S()V

    iget-object v1, p0, Lr72;->c:Ljava/lang/Object;

    check-cast v1, Lih4;

    const/4 v2, 0x0

    if-eqz v1, :cond_30

    invoke-interface {v1}, Lih4;->cancel()V

    iput-object v2, p0, Lr72;->c:Ljava/lang/Object;

    :cond_30
    iput-object v2, v0, Lmyk;->j:Lr72;

    :cond_32
    return-void
.end method

.method public b()V
    .registers 2

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lhi2;->c(I)V

    return-void
.end method

.method public final c(I)V
    .registers 4

    invoke-virtual {p0}, Lhi2;->a()V

    iget-object v0, p0, Lhi2;->d:Lii2;

    if-nez v0, :cond_8

    return-void

    :cond_8
    const/4 v1, 0x0

    iput-object v1, p0, Lhi2;->d:Lii2;

    invoke-interface {v0, p1}, Lii2;->f(I)V

    return-void
.end method

.method public final cancel()V
    .registers 1

    invoke-virtual {p0}, Lhi2;->b()V

    return-void
.end method

.method public final d()Li1;
    .registers 8

    iget-object p0, p0, Lhi2;->a:Lmyk;

    iget-object v0, p0, Lmyk;->b:Ldb;

    iget-object p0, p0, Lmyk;->c:Lzwk;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->f()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1c

    iget-object v1, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz v1, :cond_1c

    iget-wide v3, v1, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-nez v1, :cond_1e

    :cond_1c
    move-object v1, v2

    goto :goto_24

    :cond_1e
    invoke-static {v3, v4}, LJ/N;->MIPULsoq(J)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_24
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v1, :cond_35

    invoke-virtual {v0}, Ldb;->f()Z

    move-result p0

    if-eqz p0, :cond_2f

    return-object v2

    :cond_2f
    new-instance p0, Li1;

    invoke-direct {p0, v4, v2, v2, v3}, Li1;-><init>(ILjava/lang/String;Ljava/util/HashSet;I)V

    return-object p0

    :cond_35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lcak;->d:Lavj;

    invoke-static {v4}, Lavj;->b(I)Z

    move-result v0

    if-nez v0, :cond_43

    new-array v0, v3, [Ljava/lang/String;

    goto :goto_49

    :cond_43
    invoke-static {}, LJ/N;->M1i2Gkbz()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    :goto_49
    array-length v2, v0

    new-instance v3, Ljava/util/HashSet;

    invoke-static {v2}, Lna2;->j(I)I

    move-result v2

    invoke-direct {v3, v2}, Ljava/util/HashSet;-><init>(I)V

    invoke-static {v3, v0}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->h()Z

    move-result p0

    const/4 v0, 0x2

    if-eqz p0, :cond_61

    move v4, v0

    :cond_61
    new-instance p0, Li1;

    invoke-direct {p0, v0, v1, v3, v4}, Li1;-><init>(ILjava/lang/String;Ljava/util/HashSet;I)V

    return-object p0
.end method

.method public abstract g(JLjava/lang/String;Lorb;)V
.end method

.method public final j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;
    .registers 16

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "name"

    const/4 v2, 0x0

    :try_start_8
    invoke-static {p1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_f} :catch_6c

    const-string p1, "data"

    :try_start_11
    invoke-static {p2}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_18} :catch_66

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lhi2;->a:Lmyk;

    iget-object v0, p2, Lmyk;->a:Lbf9;

    new-instance v1, Leof;

    const/16 v3, 0x1d

    invoke-direct {v1, p2, p3, v3}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Lbf9;->r()I

    move-result p2

    const/4 p3, 0x2

    sget-object v3, Lbf9;->A:Lbxl;

    if-ge p2, p3, :cond_34

    invoke-virtual {v1, v2}, Leof;->run(Ljava/lang/Object;)V

    return-object v3

    :cond_34
    invoke-virtual {v0, p1}, Lbf9;->j(Ljava/lang/String;)Llyf;

    move-result-object p1

    if-nez p1, :cond_3e

    invoke-virtual {v1, v2}, Leof;->run(Ljava/lang/Object;)V

    return-object v3

    :cond_3e
    iget-object v5, v0, Lbf9;->e:Lle9;

    iget-object p2, p1, Llyf;->a:Ljava/lang/Object;

    move-object v6, p2

    check-cast v6, Ljava/lang/String;

    iget-object p1, p1, Llyf;->b:Ljava/lang/Object;

    move-object v7, p1

    check-cast v7, Ljava/lang/String;

    new-instance v9, Lse9;

    const/4 p1, 0x0

    invoke-direct {v9, v1, p1}, Lse9;-><init>(Leof;B)V

    new-instance v10, Lse9;

    const/4 p1, 0x1

    invoke-direct {v10, v1, p1}, Lse9;-><init>(Leof;B)V

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lvw1;

    const/4 v11, 0x2

    iget-object v8, p0, Lhi2;->c:Ljava/lang/String;

    invoke-direct/range {v4 .. v11}, Lvw1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v4, v10}, Lle9;->c(Lswl;Lcom/opera/api/Callback;)Lzd2;

    move-result-object p0

    return-object p0

    :catch_66
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v2

    :catch_6c
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-object v2
.end method

.method public final k(JLorb;Lcom/opera/api/Callback;)Lih4;
    .registers 7

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    const-string v1, "error_detail"

    invoke-virtual {v0, p3, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p3, "in_response_to"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p1, "SignInToSyncResponseMessage"

    invoke-virtual {p0, p1, v0, p4}, Lhi2;->j(Ljava/lang/String;Lorb;Lcom/opera/api/Callback;)Lih4;

    move-result-object p0

    return-object p0
.end method
