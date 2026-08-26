.class public Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;
.super Landroid/app/Activity;
.source "GalaxyXRPermissionActivity.java"

.field private mBatteryRequestLaunched:Z

.field private mOverlayRequestLaunched:Z

.field private mSettingsPauseObserved:Z

.field private mSettingsRequestWaiting:Z

.field private mSteamLinkLaunched:Z

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private continueAfterPermissions()V
    .locals 4

    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrResolutionProbe;->shouldRequestOverlay(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :battery

    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->isEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :battery

    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :ensure

    iget-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mOverlayRequestLaunched:Z

    if-nez v0, :battery

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mOverlayRequestLaunched:Z

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsRequestWaiting:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsPauseObserved:Z

    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->requestPermission(Landroid/app/Activity;)V

    return-void

    :ensure
    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrResolutionProbe;->onOverlayPermissionReady(Landroid/content/Context;)Z

    move-result v0

    :battery
    const-string v0, "android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    invoke-virtual {p0, v0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :launch

    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/PowerManager;->isIgnoringBatteryOptimizations(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :launch

    iget-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mBatteryRequestLaunched:Z

    if-nez v0, :launch

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mBatteryRequestLaunched:Z

    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.settings.VIEW_ADVANCED_POWER_USAGE_DETAIL"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "package"

    const/4 v3, 0x0

    invoke-static {v2, v1, v3}, Landroid/net/Uri;->fromParts(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v3

    if-nez v3, :request_battery

    const-string v3, "android.settings.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v3

    if-nez v3, :request_battery

    const-string v3, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-virtual {v0, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :launch

    :request_battery
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsRequestWaiting:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsPauseObserved:Z

    const/16 v1, 0x475a

    invoke-virtual {p0, v0, v1}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :launch
    invoke-direct {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->launchSteamLink()V

    :done
    return-void
.end method

.method private launchSteamLink()V
    .locals 2

    iget-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSteamLinkLaunched:Z

    if-eqz v0, :launch

    return-void

    :launch
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSteamLinkLaunched:Z

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/valvesoftware/steamlink/SteamLink;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->finish()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    const/16 v0, 0x4759

    if-ne p1, v0, :battery

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsRequestWaiting:Z

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsPauseObserved:Z

    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrResolutionProbe;->onOverlayPermissionReady(Landroid/content/Context;)Z

    move-result v0

    invoke-direct {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->continueAfterPermissions()V

    return-void

    :battery
    const/16 v0, 0x475a

    if-ne p1, v0, :done

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsRequestWaiting:Z

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsPauseObserved:Z

    invoke-direct {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->continueAfterPermissions()V

    :done
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    new-instance v0, Landroid/widget/TextView;
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v1, "Launching Steam Link..."
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v1, 0x11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v1, 0x41a00000    # 20.0f
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    const-string v0, "android.permission.HAND_TRACKING"

    invoke-virtual {p0, v0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :request_permissions

    const-string v0, "android.permission.EYE_TRACKING_FINE"

    invoke-virtual {p0, v0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :request_permissions

    const-string v0, "android.permission.FACE_TRACKING"

    invoke-virtual {p0, v0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :request_permissions

    const-string v0, "android.permission.RECORD_AUDIO"

    invoke-virtual {p0, v0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :request_permissions

    const-string v0, "android.permission.BLUETOOTH_CONNECT"

    invoke-virtual {p0, v0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->checkSelfPermission(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :request_permissions

    invoke-direct {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->continueAfterPermissions()V

    return-void

    :request_permissions
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.HAND_TRACKING"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "android.permission.EYE_TRACKING_FINE"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "android.permission.FACE_TRACKING"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "android.permission.RECORD_AUDIO"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "android.permission.BLUETOOTH_CONNECT"

    aput-object v2, v0, v1

    const/16 v1, 0x4758

    invoke-virtual {p0, v0, v1}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->requestPermissions([Ljava/lang/String;I)V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    iget-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsRequestWaiting:Z

    if-eqz v0, :done

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsPauseObserved:Z

    :done
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    invoke-direct {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->continueAfterPermissions()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    iget-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSteamLinkLaunched:Z

    if-nez v0, :done

    iget-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsRequestWaiting:Z

    if-eqz v0, :done

    iget-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsPauseObserved:Z

    if-eqz v0, :done

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsRequestWaiting:Z

    iput-boolean v0, p0, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->mSettingsPauseObserved:Z

    invoke-direct {p0}, Lcom/valvesoftware/steamlink/GalaxyXRPermissionActivity;->continueAfterPermissions()V

    :done
    return-void
.end method
