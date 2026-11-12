.class public final Lcom/opera/android/browser/DateTimeHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static openDateAndTimeSettings()V
    .registers 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.DATE_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x10000000

    :try_start_9
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    sget-object v1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_11
    .catch Landroid/content/ActivityNotFoundException; {:try_start_9 .. :try_end_11} :catch_11

    :catch_11
    return-void
.end method
