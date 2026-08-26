.class public Lcom/valvesoftware/steamlink/GxrResolutionProbe;
.super Ljava/lang/Object;

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

# Stable compatibility shim used by the launcher and lifecycle hooks.
# Resolution experiments live exclusively in the OpenXR implicit layers.
.method public static shouldRequestOverlay(Landroid/content/Context;)Z
    .locals 1
    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->isEnabled(Landroid/content/Context;)Z
    move-result v0
    return v0
.end method

.method public static onOverlayPermissionReady(Landroid/content/Context;)Z
    .locals 1
    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->ensureOverlay(Landroid/content/Context;)Z
    move-result v0
    return v0
.end method

.method public static onSteamLinkCreate(Landroid/app/Activity;)Z
    .locals 1
    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->ensureOverlay(Landroid/content/Context;)Z
    move-result v0
    return v0
.end method

.method public static onSteamLinkResume(Landroid/app/Activity;)Z
    .locals 1
    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->ensureOverlay(Landroid/content/Context;)Z
    move-result v0
    return v0
.end method

.method public static beforeVrLaunch(Landroid/app/Activity;)Z
    .locals 1
    invoke-static {p0}, Lcom/valvesoftware/steamlink/GxrOverlayBridge;->ensureOverlay(Landroid/content/Context;)Z
    move-result v0
    return v0
.end method
