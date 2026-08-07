.class public Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/utils2/internal/CommonUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaNetworkInfo"
.end annotation


# instance fields
.field dnsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field frequency:I

.field gatewayIp4:Ljava/lang/String;

.field gatewayIp6:Ljava/lang/String;

.field ifconfigs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field linkspeed:I

.field localIp4:Ljava/lang/String;

.field localIp6:Ljava/lang/String;

.field networkSubtype:I

.field networkType:I

.field rssi:I

.field signalLevel:I

.field snr:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->localIp4:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->gatewayIp4:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->localIp6:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->gatewayIp6:Ljava/lang/String;

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->networkType:I

    iput v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->networkSubtype:I

    const/4 v0, 0x0

    iput v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->signalLevel:I

    iput v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->rssi:I

    const/16 v1, -0x64

    iput v1, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->snr:I

    const/4 v1, 0x0

    iput-object v1, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->dnsList:Ljava/util/ArrayList;

    iput v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->linkspeed:I

    iput v0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->frequency:I

    iput-object v1, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->ifconfigs:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public getAsu()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->snr:I

    return p0
.end method

.method public getDnsList()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->dnsList:Ljava/util/ArrayList;

    return-object p0
.end method

.method public getFrequency()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->frequency:I

    return p0
.end method

.method public getGatewayIp4()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->gatewayIp4:Ljava/lang/String;

    return-object p0
.end method

.method public getGatewayIp6()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->gatewayIp6:Ljava/lang/String;

    return-object p0
.end method

.method public getLinkspeed()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->linkspeed:I

    return p0
.end method

.method public getLocalIp4()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->localIp4:Ljava/lang/String;

    return-object p0
.end method

.method public getLocalIp6()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->localIp6:Ljava/lang/String;

    return-object p0
.end method

.method public getNetworkSubtype()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->networkSubtype:I

    return p0
.end method

.method public getNetworkType()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->networkType:I

    return p0
.end method

.method public getRssi()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->rssi:I

    return p0
.end method

.method public getSignalLevel()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->signalLevel:I

    return p0
.end method

.method public getVpnIfconfigs()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "MediaNetworkInfo"
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;->ifconfigs:Ljava/util/ArrayList;

    return-object p0
.end method
