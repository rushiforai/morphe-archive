.class public final Ln6m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ln9h;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:J


# direct methods
.method public constructor <init>(Lqsh;Ln9h;Ljava/util/ArrayList;J)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ln6m;->a:Ln9h;

    iput-object p3, p0, Ln6m;->b:Ljava/util/ArrayList;

    iput-wide p4, p0, Ln6m;->c:J

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Ln6m;->c:J

    add-long/2addr v0, v2

    iget-object v2, p0, Ln6m;->a:Ln9h;

    iget-object v3, v2, Ln9h;->c:Ljava/lang/Object;

    check-cast v3, Lm6m;

    const/4 v4, 0x0

    iput-object v4, v3, Lm6m;->e:Lk6m;

    iget-object v4, v3, Lm6m;->b:Lx5f;

    iget-object p0, p0, Ln6m;->b:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    iget-boolean v6, v4, Lx5f;->h:Z

    if-eqz v6, :cond_38

    new-instance v6, Lz56;

    const/16 v7, 0x98b

    const/16 v8, 0x15

    const/4 v9, 0x1

    invoke-direct {v6, v7, v9, v8}, Ljf0;-><init>(III)V

    const/16 v7, 0xa

    int-to-long v10, v5

    invoke-virtual {v6, v7, v9, v10, v11}, Ljf0;->p(IIJ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v5

    const/16 v7, 0x13

    invoke-virtual {v5, v7, v9, v6}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v4, v5}, Lx5f;->U0(Lx56;)V

    :cond_38
    new-instance v4, Lqq8;

    iget-object v2, v2, Ln9h;->b:Ljava/lang/Object;

    check-cast v2, Lk6m;

    invoke-direct {v4, p0, v0, v1, v2}, Lqq8;-><init>(Ljava/util/List;JLk6m;)V

    iput-object v4, v3, Lm6m;->d:Lqq8;

    iget-object p0, v3, Lm6m;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    iget-object v0, v3, Lm6m;->d:Lqq8;

    iget-object v0, v0, Lqq8;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :catch_5e
    :goto_5e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_87

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj6m;

    :try_start_6a
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "query"

    iget-object v6, v2, Lj6m;->a:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v2, v2, Lj6m;->b:Landroid/net/Uri;

    if-eqz v2, :cond_83

    const-string v5, "search"

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_83
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_86
    .catch Lorg/json/JSONException; {:try_start_6a .. :try_end_86} :catch_5e

    goto :goto_5e

    :cond_87
    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "trending"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    iget-object v0, v3, Lm6m;->d:Lqq8;

    iget-wide v0, v0, Lqq8;->a:J

    const-string v2, "expires"

    invoke-interface {p0, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    iget-object v0, v3, Lm6m;->d:Lqq8;

    iget-object v0, v0, Lqq8;->c:Ljava/lang/Object;

    check-cast v0, Lk6m;

    iget-object v0, v0, Lk6m;->a:Ljava/lang/String;

    const-string v1, "country_code"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    iget-object v0, v3, Lm6m;->d:Lqq8;

    iget-object v0, v0, Lqq8;->c:Ljava/lang/Object;

    check-cast v0, Lk6m;

    iget-object v0, v0, Lk6m;->b:Ljava/lang/String;

    const-string v1, "language_code"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
