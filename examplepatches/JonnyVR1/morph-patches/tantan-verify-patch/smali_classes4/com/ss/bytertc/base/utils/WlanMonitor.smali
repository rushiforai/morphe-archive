.class public final Lcom/ss/bytertc/base/utils/WlanMonitor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;,
        Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;,
        Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;
    }
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

.method public static getConnectionInfos()[Lcom/ss/bytertc/base/utils/WlanMonitor$ConnectionInfo;
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1d
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getFrequency()I
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method

.method public static getInterfaceInfos()[Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1e
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getScanResultInfos()[Lcom/ss/bytertc/base/utils/WlanMonitor$ScanResultInfo;
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x1f
    .end annotation

    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public static getSignalQuality()I
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    const/4 v0, 0x0

    return v0
.end method
