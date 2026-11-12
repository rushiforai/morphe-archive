.class public final Lcom/opera/android/browser/background_sync/GooglePlayServicesChecker;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static shouldDisableBackgroundSync()Z
    .registers 3

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    sget-object v1, Lt8;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_f

    move v0, v1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    const-string v2, "BackgroundSync.LaunchTask.PlayServicesAvailable"

    invoke-static {v2, v0}, Lioh;->t(Ljava/lang/String;Z)V

    xor-int/2addr v0, v1

    return v0
.end method
