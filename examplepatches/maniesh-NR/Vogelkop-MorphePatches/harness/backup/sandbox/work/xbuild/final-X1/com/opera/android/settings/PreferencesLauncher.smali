.class public final Lcom/opera/android/settings/PreferencesLauncher;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static showAddressSettings()V
    .registers 3

    sget-object v0, Lt8;->a:Landroid/content/Context;

    const-string v1, "com.opera.android.settings.AUTOFILL_ADDRESS_SETTING"

    invoke-static {v0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showCardSettings()V
    .registers 3

    sget-object v0, Lt8;->a:Landroid/content/Context;

    const-string v1, "com.opera.android.settings.AUTOFILL_CARD_SETTING"

    invoke-static {v0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public static showPasswordSettings()V
    .registers 3

    sget-object v0, Lt8;->a:Landroid/content/Context;

    const-string v1, "com.opera.android.settings.PASSWORD_SETTING"

    invoke-static {v0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
