.class public Lio/agora/meta/MetaServiceConfig;
.super Ljava/lang/Object;


# instance fields
.field public mAppId:Ljava/lang/String;

.field public mEventHandler:Lio/agora/meta/IMetaServiceEventHandler;

.field public mLocalDownloadPath:Ljava/lang/String;

.field public mRtcEngine:Lio/agora/rtc2/RtcEngine;

.field public mRtcToken:Ljava/lang/String;

.field public mRtmToken:Ljava/lang/String;

.field public mUserId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/meta/MetaServiceConfig;->mRtcEngine:Lio/agora/rtc2/RtcEngine;

    const-string v1, ""

    iput-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mAppId:Ljava/lang/String;

    iput-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mRtmToken:Ljava/lang/String;

    iput-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mRtcToken:Ljava/lang/String;

    iput-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mLocalDownloadPath:Ljava/lang/String;

    iput-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mUserId:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/meta/MetaServiceConfig;->mEventHandler:Lio/agora/meta/IMetaServiceEventHandler;

    return-void
.end method


# virtual methods
.method public getAppId()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaServiceConfig;->mAppId:Ljava/lang/String;

    return-object p0
.end method

.method public getEventHandler()Lio/agora/meta/IMetaServiceEventHandler;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaServiceConfig;->mEventHandler:Lio/agora/meta/IMetaServiceEventHandler;

    return-object p0
.end method

.method public getLocalDownloadPath()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaServiceConfig;->mLocalDownloadPath:Ljava/lang/String;

    return-object p0
.end method

.method public getRtcToken()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaServiceConfig;->mRtcToken:Ljava/lang/String;

    return-object p0
.end method

.method public getRtmToken()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaServiceConfig;->mRtmToken:Ljava/lang/String;

    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/meta/MetaServiceConfig;->mUserId:Ljava/lang/String;

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MetaServiceConfig{mRtcEngine="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mRtcEngine:Lio/agora/rtc2/RtcEngine;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mAppId=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mAppId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mRtmToken=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mRtmToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mRtcToken=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mRtcToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mLocalDownloadPath=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mLocalDownloadPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mUserId=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/meta/MetaServiceConfig;->mUserId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', mEventHandler="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lio/agora/meta/MetaServiceConfig;->mEventHandler:Lio/agora/meta/IMetaServiceEventHandler;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
