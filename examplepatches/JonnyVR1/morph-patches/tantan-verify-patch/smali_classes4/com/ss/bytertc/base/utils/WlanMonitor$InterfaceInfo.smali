.class public Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/base/utils/WlanMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InterfaceInfo"
.end annotation


# instance fields
.field private channelWidth:I

.field private channleNum:I

.field private frequency:I

.field private ifName:Ljava/lang/String;

.field private phyMode:I

.field private state:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;ZIIII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->ifName:Ljava/lang/String;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->state:Z

    .line 7
    .line 8
    iput p3, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->frequency:I

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->phyMode:I

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->channleNum:I

    .line 13
    .line 14
    iput p6, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->channelWidth:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getChannelWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "InterfaceInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->channelWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getChannleNum()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "InterfaceInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->channleNum:I

    .line 2
    .line 3
    return p0
.end method

.method public getFrequency()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "InterfaceInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->frequency:I

    .line 2
    .line 3
    return p0
.end method

.method public getIfName()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "InterfaceInfo"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->ifName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPhyMode()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "InterfaceInfo"
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->phyMode:I

    .line 2
    .line 3
    return p0
.end method

.method public getState()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
        value = "InterfaceInfo"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/ss/bytertc/base/utils/WlanMonitor$InterfaceInfo;->state:Z

    .line 2
    .line 3
    return p0
.end method
