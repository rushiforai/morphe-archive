.class public Lcom/valvesoftware/steamlink/GxrOverlayBridge;
.super Ljava/lang/Object;

.field private static sOverlay:Landroid/view/View;

.field private static sWindowManager:Landroid/view/WindowManager;

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isEnabled(Landroid/content/Context;)Z
    .locals 5

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x1000

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    if-eqz v0, :disabled

    array-length v1, v0

    const/4 v2, 0x0

    :loop
    if-ge v2, v1, :disabled

    aget-object v3, v0, v2

    const-string v4, "android.permission.SYSTEM_ALERT_WINDOW"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :enabled

    add-int/lit8 v2, v2, 0x1

    goto :loop

    :enabled

    const/4 v0, 0x1

    return v0

    :disabled
    const/4 v0, 0x0

    return v0
.end method

.method public static ensureOverlay(Landroid/content/Context;)Z
    .locals 8

    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->isEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :failed

    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :failed

    sget-object v0, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->sOverlay:Landroid/view/View;

    if-eqz v0, :create

    const/4 v0, 0x1

    return v0

    :create
    new-instance v1, Landroid/view/View;

    invoke-direct {v1, p0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/high16 v0, 0x1000000

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    const-string v0, "window"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v2, Landroid/view/WindowManager$LayoutParams;

    const/4 v3, 0x2

    const/4 v4, 0x2

    const/16 v5, 0x7f6

    const v6, 0x1000318

    const/4 v7, -0x3

    invoke-direct/range {v2 .. v7}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    const/16 v3, 0x33

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v3, 0x0

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    const-string v3, "SteamLinkOverlay"

    invoke-virtual {v2, v3}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    :try_start
    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    sput-object v0, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->sWindowManager:Landroid/view/WindowManager;

    sput-object v1, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->sOverlay:Landroid/view/View;

    const-string v0, "SteamLinkGXR"

    const-string v1, "Installed compositor overlay (TYPE_APPLICATION_OVERLAY 0x7f6)"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end
    .catch Ljava/lang/RuntimeException; {:try_start .. :try_end} :catch_error

    const/4 v0, 0x1

    return v0

    :catch_error
    move-exception v0

    const-string v1, "SteamLinkGXR"
    
    const-string v2, "Failed to create overlay"
    
    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-string v2, "Failed to install compositor overlay"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :failed
    const/4 v0, 0x0

    return v0
.end method

.method public static requestPermission(Landroid/app/Activity;)V
    .locals 4

    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->isEnabled(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :done

    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :done

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "package:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const/16 v3, 0x4759

    invoke-virtual {p0, v0, v3}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    :done
    return-void
.end method
