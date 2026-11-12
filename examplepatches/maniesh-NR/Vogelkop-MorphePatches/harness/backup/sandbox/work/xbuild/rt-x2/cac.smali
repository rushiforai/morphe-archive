.class public final Lcac;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Le84;

.field public final c:Lr9c;

.field public volatile d:I

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Le84;Lr9c;)V
    .registers 4

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcac;->a:Landroid/content/Context;

    iput-object p2, p0, Lcac;->b:Le84;

    iput-object p3, p0, Lcac;->c:Lr9c;

    return-void
.end method

.method public static a(Z)Ljava/lang/String;
    .registers 1

    if-eqz p0, :cond_5

    const-string p0, "yes"

    return-object p0

    :cond_5
    const-string p0, "no"

    return-object p0
.end method


# virtual methods
.method public final b(Ljava/util/Map;)V
    .registers 3

    iget-object p0, p0, Lcac;->c:Lr9c;

    iget-boolean v0, p0, Lr9c;->a:Z

    if-nez v0, :cond_c

    iget-object p0, p0, Lr9c;->b:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    return-void

    :cond_c
    invoke-static {p1}, Lcom/leanplum/Leanplum;->setUserAttributes(Ljava/util/Map;)V

    return-void
.end method

.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    check-cast p1, [Ljava/lang/Void;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iget-object v0, p0, Lcac;->a:Landroid/content/Context;

    sget-object v1, Lhs3;->a:Ln9a;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Ln9a;->t(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Branding"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "Legacy user"

    const-string v1, "no"

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "com.opera.mini.native"

    iget-object v1, p0, Lcac;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Lcac;->a(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Mini"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "com.opera.app.news"

    iget-object v1, p0, Lcac;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Lcac;->a(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "News"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "com.opera.browser.beta"

    iget-object v1, p0, Lcac;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Lcac;->a(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Ofa beta"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "com.opera.touch"

    iget-object v1, p0, Lcac;->a:Landroid/content/Context;

    invoke-static {v1, v0}, Lr9n;->D(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Lcac;->a(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Touch"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcac;->a:Landroid/content/Context;

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v2, "fb"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "page"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-wide/16 v3, 0x0

    invoke-static {v0, v2, v3, v4}, Lr9n;->I(Landroid/content/Context;Landroid/content/Intent;J)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_a3

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ResolveInfo;

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    if-eqz v0, :cond_a3

    const-string v1, "com.facebook.katana"

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a3

    move v3, v2

    :cond_a3
    invoke-static {v3}, Lcac;->a(Z)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Facebook deeplink supported"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcac;->a:Landroid/content/Context;

    invoke-static {v0}, Lfue;->c(Landroid/content/Context;)Lcue;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_c0

    if-eq v0, v2, :cond_bd

    const-string v0, ""

    goto :goto_c2

    :cond_bd
    const-string v0, "newsfeed"

    goto :goto_c2

    :cond_c0
    const-string v0, "none"

    :goto_c2
    const-string v1, "News backend"

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const v0, 0x71de74d2

    iput v0, p0, Lcac;->d:I

    iget-object p0, p0, Lcac;->b:Le84;

    const-string v0, "nothing"

    invoke-virtual {p0, v0}, Le84;->a(Ljava/lang/String;)Z

    return-object p1
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 9

    check-cast p1, Ljava/util/Map;

    iget-boolean v0, p0, Lcac;->e:Z

    if-eqz v0, :cond_b

    const-string v0, "News backend"

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_18
    :goto_18
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_ce

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    iget-object v3, p0, Lcac;->b:Le84;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Le84;->a(Ljava/lang/String;)Z

    move-result v3

    iget-object v4, p0, Lcac;->b:Le84;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Le84;->c(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_18

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v3, :cond_18

    const-string v3, "yes"

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, -0x1

    sparse-switch v3, :sswitch_data_110

    goto :goto_98

    :sswitch_72
    const-string v2, "Touch"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_98

    const/4 v2, 0x3

    goto :goto_99

    :sswitch_7c
    const-string v2, "News"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_98

    const/4 v2, 0x2

    goto :goto_99

    :sswitch_86
    const-string v2, "Mini"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_98

    const/4 v2, 0x1

    goto :goto_99

    :sswitch_90
    const-string v3, "Ofa beta"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_99

    :cond_98
    :goto_98
    move v2, v4

    :cond_99
    :goto_99
    packed-switch v2, :pswitch_data_122

    goto/16 :goto_18

    :pswitch_9e
    iget-object v1, p0, Lcac;->c:Lr9c;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "Installed Touch"

    invoke-static {v1}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;)V

    goto/16 :goto_18

    :pswitch_aa
    iget-object v1, p0, Lcac;->c:Lr9c;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "Installed News"

    invoke-static {v1}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;)V

    goto/16 :goto_18

    :pswitch_b6
    iget-object v1, p0, Lcac;->c:Lr9c;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "Installed Mini"

    invoke-static {v1}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;)V

    goto/16 :goto_18

    :pswitch_c2
    iget-object v1, p0, Lcac;->c:Lr9c;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "Installed Ofa beta"

    invoke-static {v1}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;)V

    goto/16 :goto_18

    :cond_ce
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_d7

    invoke-virtual {p0, v0}, Lcac;->b(Ljava/util/Map;)V

    :cond_d7
    iget-object p1, p0, Lcac;->b:Le84;

    const-string v0, "lp.app.version"

    invoke-virtual {p1, v0}, Le84;->a(Ljava/lang/String;)Z

    move-result p1

    iget-object v1, p0, Lcac;->b:Le84;

    iget v3, p0, Lcac;->d:I

    iget-object v4, v1, Le84;->a:Lb59;

    invoke-virtual {v1, v0}, Le84;->a(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "lpAttr.lp.app.version"

    if-eqz v0, :cond_f9

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-eq v3, v0, :cond_10e

    :cond_f9
    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-static {v0, v1, v3}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    if-eqz p1, :cond_10e

    iget-object p0, p0, Lcac;->c:Lr9c;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p0, "Upgrade"

    invoke-static {p0}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;)V

    :cond_10e
    return-void

    nop

    :sswitch_data_110
    .sparse-switch
        -0x365070fa -> :sswitch_90
        0x249877 -> :sswitch_86
        0x24fef3 -> :sswitch_7c
        0x4d3ef1f -> :sswitch_72
    .end sparse-switch

    :pswitch_data_122
    .packed-switch 0x0
        :pswitch_c2
        :pswitch_b6
        :pswitch_aa
        :pswitch_9e
    .end packed-switch
.end method
