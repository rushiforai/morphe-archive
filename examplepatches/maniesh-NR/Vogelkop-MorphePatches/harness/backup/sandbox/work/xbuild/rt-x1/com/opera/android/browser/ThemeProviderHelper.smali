.class public final Lcom/opera/android/browser/ThemeProviderHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/opera/android/settings/SettingsManager;)Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_d

    iget-object p0, p0, Lg7j;->d:Ljava/lang/String;

    goto :goto_f

    :cond_d
    const-string p0, "baseline"

    :goto_f
    const-string v0, "ofa-"

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getCssThemeClassNoIncognito()Ljava/lang/String;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lt8;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/ThemeProviderHelper;->a(Lcom/opera/android/settings/SettingsManager;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
