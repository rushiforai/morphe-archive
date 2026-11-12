.class public final Lcom/opera/android/browser/autofill/AutofillClientProviderUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static shouldUseAndroidAutofillFramework()Z
    .registers 4

    const/4 v0, 0x0

    :try_start_1
    invoke-static {}, LJ/N;->MaxktGXn()Z

    move-result v1

    if-eqz v1, :cond_8

    return v0

    :cond_8
    new-instance v1, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v1}, Lcom/opera/android/autofill/AutofillManager;-><init>()V

    invoke-static {}, LJ/N;->MMr_2O4r()Z

    move-result v1

    if-eqz v1, :cond_14

    return v0

    :cond_14
    sget-object v1, Lt8;->a:Landroid/content/Context;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    const-string v3, "automatic_card_save_ask"

    invoke-virtual {v2, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2b

    return v0

    :cond_2b
    const-class v2, Landroid/view/autofill/AutofillManager;

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/autofill/AutofillManager;

    if-nez v2, :cond_36

    return v0

    :cond_36
    invoke-virtual {v2}, Landroid/view/autofill/AutofillManager;->isAutofillSupported()Z

    move-result v3

    if-nez v3, :cond_3d

    return v0

    :cond_3d
    invoke-virtual {v2}, Landroid/view/autofill/AutofillManager;->getAutofillServiceComponentName()Landroid/content/ComponentName;

    move-result-object v2

    if-nez v2, :cond_44

    return v0

    :cond_44
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_50} :catch_54

    if-eqz v1, :cond_53

    return v0

    :cond_53
    const/4 v0, 0x1

    :catch_54
    return v0
.end method
