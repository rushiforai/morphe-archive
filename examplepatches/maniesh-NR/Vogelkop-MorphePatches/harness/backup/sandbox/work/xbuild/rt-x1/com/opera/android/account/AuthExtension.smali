.class public final Lcom/opera/android/account/AuthExtension;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    sput-object v0, Lcom/opera/android/account/AuthExtension;->a:Li7f;

    return-void
.end method

.method public static emailVerified(Ljava/lang/String;)V
    .registers 7
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "user_id"

    :try_start_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_75

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_6d

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    iget-object v0, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    const/4 v1, 0x0

    if-eqz v0, :cond_3d

    iget-wide v2, v0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_3d

    invoke-static {v2, v3}, LJ/N;->MIPULsoq(J)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    :cond_3d
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_7d

    sget-object p0, Lcom/opera/android/account/AuthExtension;->a:Li7f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :cond_4d
    :goto_4d
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_7d

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzh2;

    iget-object v1, p0, Lzh2;->b:Ltcc;

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_4d

    iget-object p0, p0, Lzh2;->a:Lqt3;

    invoke-virtual {p0}, Lqt3;->run()V

    goto :goto_4d

    :cond_6d
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "user_id is null"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_75
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Null field"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_7d
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_7d} :catch_7d

    :catch_7d
    :cond_7d
    return-void
.end method

.method public static getAccessToken(J)V
    .registers 5

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    invoke-virtual {v0}, Ldb;->d()Z

    move-result v1

    if-nez v1, :cond_1f

    invoke-virtual {v0}, Ldb;->e()Z

    move-result v1

    if-nez v1, :cond_1f

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, LJ/N;->MG9GgC1E(JLjava/lang/Object;)V

    return-void

    :cond_1f
    new-instance v1, Lyh2;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Lyh2;-><init>(JB)V

    new-instance p0, Leme;

    invoke-direct {p0, v0, v1}, Leme;-><init>(Ldb;Lcom/opera/api/Callback;)V

    iget-object p1, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-nez p1, :cond_32

    invoke-virtual {p0}, Leme;->b()V

    return-void

    :cond_32
    invoke-virtual {p1, v2, p0}, Lcom/opera/android/oauth2/OAuth2Account;->a(ILahf;)V

    return-void
.end method

.method public static login(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "google"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_21

    const-string v0, "facebook"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    const-string v0, "twitter"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_21

    const-string v0, "vk"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_23

    :cond_21
    move-object v8, v0

    goto :goto_3a

    :cond_23
    const-string v0, "email"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "password"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_39

    const-string v0, "credentials"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    :cond_39
    move-object v8, v2

    :goto_3a
    sget-object p1, Lt8;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_50

    move-object v6, v2

    goto :goto_51

    :cond_50
    move-object v6, p2

    :goto_51
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_59

    move-object v7, v2

    goto :goto_5a

    :cond_59
    move-object v7, p3

    :goto_5a
    const/4 v5, 0x0

    move-object v4, p0

    invoke-virtual/range {v3 .. v8}, Ldb;->i(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static logout(Z)V
    .registers 3

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    invoke-virtual {v0, p0}, Ldb;->j(Z)V

    return-void
.end method

.method public static upgradeSuccessful(Ljava/lang/String;)V
    .registers 6
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "email"

    :try_start_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_ba

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_b2

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "password"

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->opt(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2d

    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v0, v2, :cond_2d

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2e

    :cond_2d
    move-object v0, v1

    :goto_2e
    sget-object v2, Lt8;->a:Landroid/content/Context;

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v3

    invoke-virtual {v3}, Ldb;->d()Z

    move-result v4

    if-eqz v4, :cond_52

    if-eqz v0, :cond_c2

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v1

    invoke-virtual {v1, p0, v0}, Lbf9;->P(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_52
    if-nez v0, :cond_c2

    invoke-virtual {v3}, Ldb;->e()Z

    move-result v0

    if-eqz v0, :cond_c2

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v0

    invoke-virtual {v0}, Lbf9;->s()Lmyk;

    move-result-object v0

    if-eqz v0, :cond_c2

    iget-object v0, v0, Lmyk;->b:Ldb;

    iget-object v0, v0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz v0, :cond_c2

    invoke-virtual {v0}, Lcom/opera/android/oauth2/OAuth2Account;->b()Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, v0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object v2, v2, Lrb;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "pun_1"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_8c

    const/4 v1, 0x1

    goto :goto_8d

    :cond_8c
    const/4 v1, 0x0

    :goto_8d
    if-nez v1, :cond_c2

    invoke-virtual {v0, p0}, Lcom/opera/android/oauth2/OAuth2Account;->d(Ljava/lang/String;)V

    iget-object p0, v0, Lcom/opera/android/oauth2/OAuth2Account;->b:Lyqa;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Ldb;

    iget-object p0, p0, Ldb;->e:Lh7f;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Lh7f;)V

    :goto_a2
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_c2

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcb;

    invoke-virtual {p0}, Lcb;->f()V

    goto :goto_a2

    :cond_b2
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "email is null"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_ba
    new-instance p0, Lorg/json/JSONException;

    const-string v0, "Null field"

    invoke-direct {p0, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_c2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_c2} :catch_c2

    :catch_c2
    :cond_c2
    return-void
.end method
