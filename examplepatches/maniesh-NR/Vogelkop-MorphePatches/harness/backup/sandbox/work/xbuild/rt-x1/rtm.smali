.class public final Lrtm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk7j;
.implements Lq8j;


# instance fields
.field public final a:Lisd;

.field public final b:Lb59;

.field public c:Ld93;

.field public d:Z

.field public e:Lwtm;

.field public final synthetic f:Lstm;


# direct methods
.method public constructor <init>(Lstm;Lisd;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrtm;->f:Lstm;

    iput-object p2, p0, Lrtm;->a:Lisd;

    iget-object p2, p1, Lstm;->m:Landroid/content/Context;

    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "id_pref"

    invoke-static {p2, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p2

    iput-object p2, p0, Lrtm;->b:Lb59;

    iget-object p1, p1, Lstm;->l:Lg93;

    invoke-virtual {p1, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Lrtm;->f:Lstm;

    invoke-virtual {p0}, Lt7j;->c()V

    return-void
.end method

.method public final b()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lrtm;->d:Z

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    check-cast v1, Ld93;

    iget-boolean v2, v0, Lrtm;->d:Z

    if-nez v2, :cond_1d4

    iget-object v3, v0, Lrtm;->a:Lisd;

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-nez v1, :cond_16

    if-nez v2, :cond_1d4

    invoke-virtual {v3, v5, v4}, Lisd;->E(Ljava/lang/Object;Z)V

    return-void

    :cond_16
    iget-object v2, v0, Lrtm;->f:Lstm;

    iget-object v6, v2, Lstm;->m:Landroid/content/Context;

    iget-object v7, v2, Lstm;->j:Lta7;

    iget-object v8, v0, Lrtm;->b:Lb59;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/SharedPreferences;

    const-string v9, "ndid"

    invoke-interface {v8, v9, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "user_id"

    const/4 v12, 0x1

    const-string v13, "user_host"

    if-eqz v10, :cond_7f

    const-string v14, "dashboard"

    invoke-virtual {v6, v14, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    const-string v14, "news_feed_host"

    invoke-interface {v6, v14, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_7f

    :try_start_3f
    new-instance v14, Ljava/net/URL;

    invoke-direct {v14, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6, v13, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_50

    move v6, v12

    goto :goto_58

    :cond_50
    invoke-static {v14}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v6, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    :goto_58
    if-eqz v6, :cond_7c

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-static {v14}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v6, v13, v14}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6, v11, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_7c
    .catch Ljava/net/MalformedURLException; {:try_start_3f .. :try_end_7c} :catch_7c

    :catch_7c
    :cond_7c
    invoke-static {v8, v9}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    :cond_7f
    iput-object v1, v0, Lrtm;->c:Ld93;

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v6

    invoke-interface {v6, v11, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    if-eqz v19, :cond_c4

    iget-object v6, v1, Ld93;->a:Lyla;

    iget-object v6, v6, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v8

    invoke-interface {v8, v13, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-nez v8, :cond_9b

    move v6, v12

    goto :goto_a3

    :cond_9b
    invoke-static {v6}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    :goto_a3
    if-eqz v6, :cond_c4

    iput-object v5, v0, Lrtm;->e:Lwtm;

    new-instance v14, Lqtm;

    iget-object v15, v1, Ld93;->a:Lyla;

    iget-wide v5, v1, Ld93;->b:J

    iget-object v1, v1, Ld93;->c:Ljava/lang/String;

    move-object/from16 v18, v1

    move-wide/from16 v16, v5

    invoke-direct/range {v14 .. v19}, Lqtm;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;)V

    move-object/from16 v1, v19

    invoke-virtual {v0, v14, v1, v4}, Lrtm;->e(Ld93;Ljava/lang/String;Z)V

    iget-boolean v0, v0, Lrtm;->d:Z

    if-nez v0, :cond_1d4

    invoke-virtual {v3, v14, v12}, Lisd;->E(Ljava/lang/Object;Z)V

    goto/16 :goto_1d4

    :cond_c4
    iget-object v1, v0, Lrtm;->c:Ld93;

    iget-object v3, v1, Ld93;->a:Lyla;

    iget-object v3, v3, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v8, "known_user_id_"

    invoke-direct {v6, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v3}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_f1

    iput-object v5, v0, Lrtm;->e:Lwtm;

    invoke-virtual {v0, v1, v3}, Lrtm;->d(Ld93;Ljava/lang/String;)V

    goto/16 :goto_1d4

    :cond_f1
    iget-object v2, v2, Lstm;->k:Ls9i;

    new-instance v3, Lwtm;

    iget-object v4, v2, Ls9i;->b:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    iget-object v2, v2, Ls9i;->c:Ljava/lang/Object;

    check-cast v2, Lga6;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v6

    iput-object v6, v3, Lwtm;->a:Ljava/lang/Object;

    invoke-static {v4}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v6

    iput-object v6, v3, Lwtm;->b:Ljava/lang/Object;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object v4

    iput-object v4, v3, Lwtm;->c:Ljava/lang/Object;

    iput-object v3, v0, Lrtm;->e:Lwtm;

    new-instance v4, Loam;

    invoke-direct {v4, v0, v3, v1}, Loam;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, v3, Lwtm;->c:Ljava/lang/Object;

    check-cast v0, Le00;

    iget-object v6, v3, Lwtm;->a:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/settings/SettingsManager;

    const-string v8, "personalized_ads"

    invoke-virtual {v6, v8}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_14c

    invoke-virtual {v0}, Le00;->b()Lc00;

    move-result-object v6

    iget-boolean v6, v6, Lc00;->b:Z

    if-nez v6, :cond_14c

    invoke-virtual {v0}, Le00;->b()Lc00;

    move-result-object v0

    iget-object v0, v0, Lc00;->a:Ljava/lang/String;

    sget-object v5, Laik;->a:[Ljava/lang/String;

    if-nez v0, :cond_16f

    const-string v0, ""

    goto :goto_16f

    :cond_14c
    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v6, "user_uuid"

    invoke-interface {v0, v6, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_16f

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5, v6, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_16f
    :goto_16f
    iget-object v5, v1, Ld93;->a:Lyla;

    iget-object v5, v5, Lyla;->a:Ljava/net/URL;

    new-instance v6, Landroid/net/Uri$Builder;

    invoke-direct {v6}, Landroid/net/Uri$Builder;-><init>()V

    invoke-virtual {v5}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/net/URL;->getAuthority()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/net/Uri$Builder;->encodedAuthority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    invoke-virtual {v5}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    const-string v7, "device_id"

    invoke-virtual {v5, v7}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    iget-object v7, v3, Lwtm;->b:Ljava/lang/Object;

    check-cast v7, Lv1;

    invoke-virtual {v7}, Lv1;->x()Ljava/lang/String;

    move-result-object v7

    const-string v8, "abgroup"

    invoke-virtual {v5, v8, v7}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    iget-object v1, v1, Ld93;->c:Ljava/lang/String;

    if-eqz v1, :cond_1ac

    const-string v5, "config_bundle"

    invoke-virtual {v6, v5, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_1ac
    new-instance v1, Lz7;

    invoke-virtual {v6}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "advertising_id"

    :try_start_1bd
    invoke-static {v0}, Lorb;->t(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v6, v7, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1c4
    .catch Lorg/json/JSONException; {:try_start_1bd .. :try_end_1c4} :catch_1d5

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v5, v0, v12}, Lz7;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    new-instance v0, Lkp4;

    const/4 v5, 0x2

    invoke-direct {v0, v3, v4, v5}, Lkp4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v1, v0}, Lga6;->a(Lz7;Lz4o;)V

    :cond_1d4
    :goto_1d4
    return-void

    :catch_1d5
    move-exception v0

    invoke-static {v0}, Lt3p;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public final d(Ld93;Ljava/lang/String;)V
    .registers 14

    iget-object v0, p0, Lrtm;->f:Lstm;

    iget-object v1, v0, Lstm;->j:Lta7;

    invoke-virtual {v1}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "user_id"

    invoke-interface {v1, v2, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object v1, v0, Lstm;->j:Lta7;

    iget-object v3, p1, Ld93;->a:Lyla;

    iget-object v3, v3, Lyla;->a:Ljava/net/URL;

    invoke-virtual {v1}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-static {v3}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "user_host"

    invoke-interface {v1, v4, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance v5, Lqtm;

    iget-object v6, p1, Ld93;->a:Lyla;

    iget-wide v7, p1, Ld93;->b:J

    iget-object v9, p1, Ld93;->c:Ljava/lang/String;

    move-object v10, p2

    invoke-direct/range {v5 .. v10}, Lqtm;-><init>(Lyla;JLjava/lang/String;Ljava/lang/String;)V

    iget-boolean p1, p0, Lrtm;->d:Z

    if-nez p1, :cond_46

    iget-object p0, p0, Lrtm;->a:Lisd;

    const/4 p1, 0x1

    invoke-virtual {p0, v5, p1}, Lisd;->E(Ljava/lang/Object;Z)V

    :cond_46
    iget-object p0, v0, Lstm;->m:Landroid/content/Context;

    const-string p1, "newsfeed"

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, v4, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_61

    invoke-interface {p0, v2, p1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_61

    new-instance p1, Lsre;

    invoke-direct {p1, v1, p0, p2}, Lsre;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    :cond_61
    iget-object p0, v0, Lstm;->n:Lx5f;

    iget-object p2, p1, Lsre;->a:Ljava/lang/String;

    iget-boolean v1, p0, Lx5f;->h:Z

    if-eqz v1, :cond_7c

    iget-object v1, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v3, Lck0;

    invoke-direct {v3, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    const/16 v1, 0x22

    invoke-virtual {v2, v1, p2}, Lx56;->V(ILjava/lang/String;)V

    invoke-virtual {p0, v2}, Lx5f;->U0(Lx56;)V

    :cond_7c
    iget-object p0, v0, Lstm;->o:Lx5f;

    iget-object p1, p1, Lsre;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p2, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    new-instance v1, Lck0;

    invoke-direct {v1, p2, v0}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object p2, v1, Lck0;->c:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lxf0;

    iget-object p2, p2, Lxf0;->a:Ltf0;

    const/4 v1, 0x4

    invoke-virtual {p2, v1, p1}, Ltf0;->x(ILjava/lang/String;)V

    invoke-virtual {p0, v0}, Lx5f;->U0(Lx56;)V

    new-instance p0, Ltre;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final e(Ld93;Ljava/lang/String;Z)V
    .registers 8

    iget-object p1, p1, Ld93;->a:Lyla;

    iget-object p1, p1, Lyla;->a:Ljava/net/URL;

    iget-object p0, p0, Lrtm;->f:Lstm;

    iget-object v0, p0, Lstm;->j:Lta7;

    invoke-virtual {v0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "known_user_id_"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_28

    if-nez p3, :cond_28

    return-void

    :cond_28
    iget-object p0, p0, Lstm;->j:Lta7;

    invoke-virtual {p0}, Lta7;->s()Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Lta7;->q(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
