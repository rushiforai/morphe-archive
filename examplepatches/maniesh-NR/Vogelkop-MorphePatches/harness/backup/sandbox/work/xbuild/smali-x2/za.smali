.class public final synthetic Lza;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;JLjava/lang/Object;B)V
    .registers 8

    .line 17
    iput-byte p7, p0, Lza;->a:B

    iput-object p1, p0, Lza;->c:Ljava/lang/Object;

    iput-object p2, p0, Lza;->d:Ljava/lang/Object;

    iput-object p3, p0, Lza;->e:Ljava/lang/Object;

    iput-wide p4, p0, Lza;->b:J

    iput-object p6, p0, Lza;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;JLshf;Leof;)V
    .registers 8

    const/4 v0, 0x2

    iput-byte v0, p0, Lza;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lza;->c:Ljava/lang/Object;

    iput-object p2, p0, Lza;->d:Ljava/lang/Object;

    iput-wide p3, p0, Lza;->b:J

    iput-object p5, p0, Lza;->e:Ljava/lang/Object;

    iput-object p6, p0, Lza;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 14

    iget-byte v0, p0, Lza;->a:B

    const/4 v1, 0x0

    iget-wide v2, p0, Lza;->b:J

    iget-object v4, p0, Lza;->f:Ljava/lang/Object;

    iget-object v5, p0, Lza;->e:Ljava/lang/Object;

    iget-object v6, p0, Lza;->d:Ljava/lang/Object;

    iget-object v7, p0, Lza;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1d2

    check-cast v7, Ljava/lang/String;

    check-cast v6, Ljava/lang/String;

    check-cast v5, Lshf;

    check-cast v4, Leof;

    check-cast p1, Landroid/net/Uri;

    new-instance p0, Lfvh;

    invoke-direct {p0}, Lfvh;-><init>()V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lrma;

    const/4 v8, 0x4

    invoke-direct {v0, v8}, Lrma;-><init>(B)V

    invoke-virtual {v0, p1, v1}, Lrma;->o(Ljava/lang/String;Lhra;)V

    invoke-virtual {v0}, Lrma;->d()Lhra;

    move-result-object p1

    const-string v0, "api/v1/vpn/extend/"

    invoke-virtual {p1, v0}, Lhra;->i(Ljava/lang/String;)Lhra;

    move-result-object p1

    if-eqz p1, :cond_c9

    iput-object p1, p0, Lfvh;->a:Lhra;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Bearer "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Authorization"

    invoke-virtual {p0, v0, p1}, Lfvh;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "subscription_id"

    :try_start_54
    invoke-static {v6}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5b
    .catch Lorg/json/JSONException; {:try_start_54 .. :try_end_5b} :catch_c3

    const-string v0, "known_expires_at"

    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy-MM-dd"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v1, v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v6, "UTC"

    invoke-static {v6}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v6}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    :try_start_78
    invoke-static {v1}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_7f
    .catch Lorg/json/JSONException; {:try_start_78 .. :try_end_7f} :catch_bd

    sget-object v0, Lrvh;->Companion:Lqvh;

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Lesd;->e:Lkotlin/text/Regex;

    const-string v1, "application/json"

    invoke-static {v1}, Lwyh;->x(Ljava/lang/String;)Lesd;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1, v1}, Lqvh;->b(Ljava/lang/String;Lesd;)Lpvh;

    move-result-object p1

    invoke-virtual {p0, p1}, Lfvh;->f(Lrvh;)V

    new-instance p1, Lkvh;

    invoke-direct {p1, p0}, Lkvh;-><init>(Lfvh;)V

    iget-object p0, v5, Lshf;->b:Ljava/lang/Object;

    check-cast p0, Lumi;

    new-instance v0, Lb94;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v4, v1}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v5, Lshf;->c:Ljava/lang/Object;

    check-cast p0, Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    invoke-virtual {p0, p1}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    new-instance p1, Loji;

    invoke-direct {p1, v0}, Loji;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, p1}, Lv84;->enqueue(Lf94;)V

    goto :goto_ce

    :catch_bd
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_ce

    :catch_c3
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_ce

    :cond_c9
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_ce
    return-void

    :pswitch_cf
    move-object v1, v7

    check-cast v1, Lafe;

    move-object v2, v6

    check-cast v2, Ljava/util/Map;

    move-object v3, v5

    check-cast v3, Lxkn;

    move-object v6, v4

    check-cast v6, Ljava/lang/Integer;

    check-cast p1, Ldnn;

    new-instance v0, Lypd;

    iget-wide v4, p0, Lza;->b:J

    invoke-direct/range {v0 .. v6}, Lypd;-><init>(Lafe;Ljava/util/Map;Lxkn;JLjava/lang/Integer;)V

    invoke-virtual {p1, v0}, Ldnn;->a(Lann;)V

    return-void

    :pswitch_e8
    check-cast v7, Ldb;

    check-cast v6, Landroid/os/CancellationSignal;

    check-cast v5, Lcom/opera/api/Callback;

    check-cast v4, Ljava/lang/Runnable;

    check-cast p1, Lehf;

    invoke-virtual {v6}, Landroid/os/CancellationSignal;->isCanceled()Z

    move-result p0

    if-nez p0, :cond_1d1

    if-nez p1, :cond_101

    const-string p0, "Account info request failed"

    invoke-interface {v5, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto/16 :goto_1d1

    :cond_101
    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-wide v8, p0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    const-wide/16 v10, 0x0

    cmp-long p0, v8, v10

    if-nez p0, :cond_10d

    move-object p0, v1

    goto :goto_113

    :cond_10d
    invoke-static {v8, v9}, LJ/N;->MIPULsoq(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :goto_113
    iget-object v0, p1, Lehf;->a:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_122

    const-string p0, "Outdated account info"

    invoke-interface {v5, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto/16 :goto_1d1

    :cond_122
    iget-boolean p0, p1, Lehf;->d:Z

    if-eqz p0, :cond_131

    const/4 p0, 0x1

    invoke-virtual {v7, p0}, Ldb;->j(Z)V

    const-string p0, "Account deleted"

    invoke-interface {v5, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto/16 :goto_1d1

    :cond_131
    iget-boolean p0, p1, Lehf;->c:Z

    iget-object v0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    const-string v5, "display_name"

    const-string v6, "full_name"

    if-eqz p0, :cond_14d

    invoke-virtual {v0, v1}, Lcom/opera/android/oauth2/OAuth2Account;->d(Ljava/lang/String;)V

    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    invoke-virtual {p0, v6, v1}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    invoke-virtual {p0, v5, v1}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_164

    :cond_14d
    iget-object p0, p1, Lehf;->b:Ljava/lang/String;

    invoke-virtual {v0, p0}, Lcom/opera/android/oauth2/OAuth2Account;->d(Ljava/lang/String;)V

    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-object v0, p1, Lehf;->g:Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    invoke-virtual {p0, v6, v0}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-object v0, p1, Lehf;->h:Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    invoke-virtual {p0, v5, v0}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    :goto_164
    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-object v0, p1, Lehf;->i:Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    const-string v1, "profile_picture"

    invoke-virtual {p0, v1, v0}, Lrb;->c(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-boolean v0, p1, Lehf;->e:Z

    invoke-virtual {p0, v0}, Lcom/opera/android/oauth2/OAuth2Account;->e(Z)V

    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-boolean v0, p1, Lehf;->f:Z

    invoke-virtual {p0, v0}, Lcom/opera/android/oauth2/OAuth2Account;->c(Z)V

    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-boolean v0, p1, Lehf;->j:Z

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "has_default_profile_picture"

    invoke-static {p0, v1, v0}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-object p0, v7, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    iget-boolean p1, p1, Lehf;->k:Z

    iget-object p0, p0, Lcom/opera/android/oauth2/OAuth2Account;->a:Lrb;

    iget-object p0, p0, Lrb;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "has_2fa"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    iget-object p0, v7, Ldb;->b:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "last_account_update_timestamp"

    invoke-interface {p0, p1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, v7, Ldb;->e:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_1be
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1ce

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcb;

    invoke-virtual {p1}, Lcb;->f()V

    goto :goto_1be

    :cond_1ce
    invoke-interface {v4}, Ljava/lang/Runnable;->run()V

    :cond_1d1
    :goto_1d1
    return-void

    :pswitch_data_1d2
    .packed-switch 0x0
        :pswitch_e8
        :pswitch_cf
    .end packed-switch
.end method
