.class public final Lq1c;
.super Llze;
.source "SourceFile"


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Lp1c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lp1c;)V
    .registers 3

    invoke-direct {p0, p2}, Llze;-><init>(Lt7j;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lq1c;->c:Landroid/content/Context;

    iput-object p2, p0, Lq1c;->d:Lp1c;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Ll1c;

    invoke-virtual {p0}, Lq1c;->e()Ll0c;

    move-result-object p1

    iget-object v0, p0, Lq1c;->c:Landroid/content/Context;

    iget-object v1, p0, Lq1c;->d:Lp1c;

    if-eqz p1, :cond_27

    invoke-virtual {v1, p1}, Lp1c;->g(Ll0c;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    iget-object p1, p1, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string v2, "discover_selected_country"

    invoke-interface {p1, v2}, Ly9j;->remove(Ljava/lang/String;)V

    const-string v2, "discover_selected_language"

    invoke-interface {p1, v2}, Ly9j;->remove(Ljava/lang/String;)V

    :cond_27
    invoke-virtual {p0}, Lq1c;->d()Ll0c;

    move-result-object p0

    if-eqz p0, :cond_43

    invoke-virtual {v1, p0}, Lp1c;->g(Ll0c;)V

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    iget-object p0, p0, Lcom/opera/android/settings/SettingsManager;->a:Ly9j;

    const-string p1, "news_server_configuration_user_choice"

    invoke-interface {p0, p1}, Ly9j;->remove(Ljava/lang/String;)V

    :cond_43
    return-void
.end method

.method public final d()Ll0c;
    .registers 6

    const-string v0, "country"

    const-string v1, "language"

    const-string v2, "code"

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lq1c;->c:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v3, "news_server_configuration_user_choice"

    invoke-virtual {p0, v3}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_22

    return-object v4

    :cond_22
    :try_start_22
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_55

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_55

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {v3, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_55

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_55

    new-instance v1, Ll0c;

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, v0, p0}, Ll0c;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_54
    .catch Lorg/json/JSONException; {:try_start_22 .. :try_end_54} :catch_55

    return-object v1

    :catch_55
    :cond_55
    return-object v4
.end method

.method public final e()Ll0c;
    .registers 3

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lq1c;->c:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v0, "discover_selected_country"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "discover_selected_language"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2c

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2c

    new-instance v1, Ll0c;

    invoke-direct {v1, v0, p0}, Ll0c;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_2c
    const/4 p0, 0x0

    return-object p0
.end method
