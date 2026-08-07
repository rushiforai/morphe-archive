.class public Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;
    }
.end annotation


# instance fields
.field public localProxyIp:Ljava/lang/String;

.field public localProxyPassword:Ljava/lang/String;

.field public localProxyPort:I

.field public localProxyType:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

.field public localProxyUsername:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyType:Lcom/ss/bytertc/engine/type/LocalProxyType;

    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->ConvertEnumValue(Lcom/ss/bytertc/engine/type/LocalProxyType;)Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyType:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 11
    .line 12
    iget-object v0, p1, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyIp:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyIp:Ljava/lang/String;

    .line 15
    .line 16
    iget v0, p1, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyPort:I

    .line 17
    .line 18
    iput v0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyPort:I

    .line 19
    .line 20
    iget-object v0, p1, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyUsername:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyUsername:Ljava/lang/String;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/ss/bytertc/engine/type/LocalProxyConfiguration;->localProxyPassword:Ljava/lang/String;

    .line 25
    .line 26
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyPassword:Ljava/lang/String;

    .line 27
    .line 28
    return-void
.end method

.method private ConvertEnumValue(Lcom/ss/bytertc/engine/type/LocalProxyType;)Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;
    .locals 1

    .line 1
    sget-object p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->SOCKS5:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 2
    .line 3
    sget-object v0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$1;->$SwitchMap$com$ss$bytertc$engine$type$LocalProxyType:[I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    aget p1, v0, p1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p1, v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eq p1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;->HTTP_TUNNEL:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 19
    .line 20
    :cond_1
    :goto_0
    return-object p0
.end method


# virtual methods
.method public getLocalProxyIp()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyIp:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalProxyPassword()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyPassword:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalProxyPort()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyPort:I

    .line 2
    .line 3
    return p0
.end method

.method public getLocalProxyType()Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyType:Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration$InternalLocalProxyType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalProxyUsername()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/InternalLocalProxyConfiguration;->localProxyUsername:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
