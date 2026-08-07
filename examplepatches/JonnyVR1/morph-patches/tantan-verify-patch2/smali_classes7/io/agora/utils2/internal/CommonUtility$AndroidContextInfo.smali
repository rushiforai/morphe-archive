.class public Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/utils2/internal/CommonUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AndroidContextInfo"
.end annotation


# instance fields
.field public configDir:Ljava/lang/String;

.field public dataDir:Ljava/lang/String;

.field public device:Ljava/lang/String;

.field public deviceInfo:Ljava/lang/String;

.field public manufacturer:Ljava/lang/String;

.field public pkgName:Ljava/lang/String;

.field public pluginDir:Ljava/lang/String;

.field public systemInfo:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getConfigDir()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AndroidContextInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->configDir:Ljava/lang/String;

    return-object p0
.end method

.method public getDataDir()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AndroidContextInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->dataDir:Ljava/lang/String;

    return-object p0
.end method

.method public getDevice()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AndroidContextInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->device:Ljava/lang/String;

    return-object p0
.end method

.method public getDeviceInfo()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AndroidContextInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->deviceInfo:Ljava/lang/String;

    return-object p0
.end method

.method public getManufacturer()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AndroidContextInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->manufacturer:Ljava/lang/String;

    return-object p0
.end method

.method public getPkgName()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AndroidContextInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->pkgName:Ljava/lang/String;

    return-object p0
.end method

.method public getPluginDir()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AndroidContextInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->pluginDir:Ljava/lang/String;

    return-object p0
.end method

.method public getSystemInfo()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "AndroidContextInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$AndroidContextInfo;->systemInfo:Ljava/lang/String;

    return-object p0
.end method
