.class public Lcom/idv/identity/platform/log/RecordBase;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public actionName:Ljava/lang/String;

.field public bizParam:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public clientId:Ljava/lang/String;

.field public clientVersion:Ljava/lang/String;

.field public deviceId:Ljava/lang/String;

.field public logIdx:Ljava/lang/String;

.field public logLevel:Ljava/lang/String;

.field public logTime:Ljava/lang/String;

.field public logVersion:Ljava/lang/String;

.field public netType:Ljava/lang/String;

.field public osVersion:Ljava/lang/String;

.field public packageName:Ljava/lang/String;

.field public phonePrint:Ljava/lang/String;

.field public screenMetrix:Ljava/lang/String;

.field public sessionId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->logTime:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->logIdx:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->clientId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->clientVersion:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->logVersion:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->deviceId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->sessionId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->actionName:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->logLevel:Ljava/lang/String;

    .line 23
    .line 24
    new-instance v1, Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/idv/identity/platform/log/RecordBase;->bizParam:Ljava/util/Map;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->phonePrint:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->osVersion:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->netType:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->screenMetrix:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->packageName:Ljava/lang/String;

    .line 40
    .line 41
    return-void
.end method


# virtual methods
.method public getActionName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->actionName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBizParam()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->bizParam:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getClientId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->clientId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getClientVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->clientVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDeviceId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->deviceId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLogIdx()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->logIdx:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLogLevel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->logLevel:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLogTime()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->logTime:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLogVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->logVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNetType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->netType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOsVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->osVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPhonePrint()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->phonePrint:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getScreenMetrix()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->screenMetrix:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSessionId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/platform/log/RecordBase;->sessionId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setActionName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->actionName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setBizParam(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->bizParam:Ljava/util/Map;

    .line 2
    .line 3
    return-void
.end method

.method public setClientId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->clientId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setClientVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->clientVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setDeviceId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->deviceId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLogIdx(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->logIdx:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLogLevel(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->logLevel:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLogTime(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->logTime:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setLogVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->logVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setNetType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->netType:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setOsVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->osVersion:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->packageName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPhonePrint(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->phonePrint:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setScreenMetrix(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->screenMetrix:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSessionId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/log/RecordBase;->sessionId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/log/RecordBase;->bizParam:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {p0}, Ll/ac00;->h(Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const-string p0, ""

    .line 18
    .line 19
    return-object p0
.end method
