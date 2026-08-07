.class public Lcom/ss/bytertc/engine/InternalCloudProxyInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public cloudProxyIp:Ljava/lang/String;

.field public cloudProxyPort:I


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/data/CloudProxyInfo;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/ss/bytertc/engine/data/CloudProxyInfo;->cloudProxyIp:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/InternalCloudProxyInfo;->cloudProxyIp:Ljava/lang/String;

    .line 7
    .line 8
    iget p1, p1, Lcom/ss/bytertc/engine/data/CloudProxyInfo;->cloudProxyPort:I

    .line 9
    .line 10
    iput p1, p0, Lcom/ss/bytertc/engine/InternalCloudProxyInfo;->cloudProxyPort:I

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalCloudProxyInfo;->cloudProxyIp:Ljava/lang/String;

    .line 15
    iput p2, p0, Lcom/ss/bytertc/engine/InternalCloudProxyInfo;->cloudProxyPort:I

    return-void
.end method


# virtual methods
.method public getCloudProxyIp()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalCloudProxyInfo;->cloudProxyIp:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getCloudProxyPort()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalCloudProxyInfo;->cloudProxyPort:I

    .line 2
    .line 3
    return p0
.end method
