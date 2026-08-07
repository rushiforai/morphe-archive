.class public Lcom/momo/xeengine/L/L;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static M(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/momo/xeengine/L/SDKLicenseManager;->getInstance()Lcom/momo/xeengine/L/SDKLicenseManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/momo/xeengine/L/SDKLicenseManager;->isLicenseValid()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static N(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xeengine/L/SDKLicenseManager;->getInstance()Lcom/momo/xeengine/L/SDKLicenseManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/momo/xeengine/L/SDKLicenseManager;->setAppID(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
