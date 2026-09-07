.class public final Lcom/valvesoftware/steamlink/GxrBatterySettings;
.super Ljava/lang/Object;

.method public static request(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 4

    if-nez p1, :done

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z
    move-result v0
    if-nez v0, :done

    const-string v0, "power"
    invoke-virtual {p0, v0}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, Landroid/os/PowerManager;
    if-eqz v0, :done

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z
    move-result v0
    if-nez v0, :done

    new-instance v0, Landroid/content/Intent;
    const-string v2, "android.settings.VIEW_ADVANCED_POWER_USAGE_DETAIL"
    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V
    const-string v2, "package"
    const/4 v3, 0x0
    invoke-static {v2, v1, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;
    move-result-object v1
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v2
    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;
    move-result-object v3
    if-nez v3, :open

    const-string v3, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;
    move-result-object v3
    if-nez v3, :open

    const-string v3, "android.settings.APPLICATION_DETAILS_SETTINGS"
    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;
    move-result-object v3
    if-eqz v3, :done

    :open
    :try_start
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end
    .catch Landroid/content/ActivityNotFoundException; {:try_start .. :try_end} :unavailable
    .catch Ljava/lang/SecurityException; {:try_start .. :try_end} :unavailable
    goto :done

    :unavailable
    move-exception v0

    :done
    return-void
.end method
