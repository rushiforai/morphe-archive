.class public final Lcom/waze/gw/ModSettingsMenuClick;
.super Ljava/lang/Object;
.source "WazeSource"

# Click handler of the "Cài đặt Mod" row injected into Waze's main menu (ui/n/ad.c, after the Settings row).
# Waze's Function0 (g.h.a.a) is an obfuscated interface, so this is written in smali instead of Java.
.implements Lg/h/a/a;

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public invoke()Ljava/lang/Object;
    .locals 1
    const/4 v0, 0x0
    invoke-static {v0}, Lcom/waze/gw/Gateway;->openModSettings(Landroid/content/Context;)V
    sget-object v0, Lg/ab;->a:Lg/ab;
    return-object v0
.end method
