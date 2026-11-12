.class public final Lcom/opera/android/browser/SystemFontBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static isEnabled()Z
    .registers 3

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lc7j;->values()[Lc7j;

    move-result-object v1

    const-string v2, "app_font"

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v0

    aget-object v0, v1, v0

    sget-object v1, Lc7j;->b:Lc7j;

    if-ne v0, v1, :cond_24

    sget-object v0, Lozk;->a:Ljava/util/Set;

    goto :goto_34

    :cond_24
    sget-object v0, Lozk;->a:Ljava/util/Set;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    :goto_34
    const/4 v0, 0x1

    return v0

    :cond_36
    const/4 v0, 0x0

    return v0
.end method
