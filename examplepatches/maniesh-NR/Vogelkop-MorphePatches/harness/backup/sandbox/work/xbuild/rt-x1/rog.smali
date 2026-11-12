.class public abstract Lrog;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Lanf;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lanf;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lanf;-><init>(B)V

    sput-object v0, Lrog;->a:Lanf;

    return-void
.end method

.method public static a(Landroid/content/Context;)V
    .registers 3

    const-string v0, "power"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/PowerManager;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_17

    invoke-virtual {p0}, Landroid/os/PowerManager;->isLowPowerStandbyEnabled()Z

    move-result v0

    if-eqz v0, :cond_17

    const-string p0, "low_power_standby"

    goto :goto_22

    :cond_17
    invoke-virtual {p0}, Landroid/os/PowerManager;->isPowerSaveMode()Z

    move-result p0

    if-eqz p0, :cond_20

    const-string p0, "low_power"

    goto :goto_22

    :cond_20
    const-string p0, "normal"

    :goto_22
    const/16 v0, 0x29

    invoke-static {v0, p0}, Lks3;->I(ILjava/lang/String;)V

    return-void
.end method
