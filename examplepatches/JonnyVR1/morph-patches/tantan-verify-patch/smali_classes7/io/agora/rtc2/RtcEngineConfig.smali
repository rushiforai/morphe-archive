.class public Lio/agora/rtc2/RtcEngineConfig;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/rtc2/RtcEngineConfig$LogConfig;,
        Lio/agora/rtc2/RtcEngineConfig$AreaCode;
    }
.end annotation


# instance fields
.field public mAppId:Ljava/lang/String;

.field public mAreaCode:I

.field public mAudioScenario:I

.field public mAutoRegisterAgoraExtensions:Z

.field public mChannelProfile:I

.field public mContext:Landroid/content/Context;

.field public mDomainLimit:Z

.field public mEventHandler:Lio/agora/rtc2/IRtcEngineEventHandler;

.field public mExtensionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public mExtensionObserver:Lio/agora/rtc2/IMediaExtensionObserver;

.field public mLicense:Ljava/lang/String;

.field public mLogConfig:Lio/agora/rtc2/RtcEngineConfig$LogConfig;

.field public mNativeLibPath:Ljava/lang/String;

.field public mThreadPriority:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/rtc2/RtcEngineConfig;->mEventHandler:Lio/agora/rtc2/IRtcEngineEventHandler;

    iput-object v0, p0, Lio/agora/rtc2/RtcEngineConfig;->mContext:Landroid/content/Context;

    const-string v1, ""

    iput-object v1, p0, Lio/agora/rtc2/RtcEngineConfig;->mAppId:Ljava/lang/String;

    const/4 v2, 0x1

    iput v2, p0, Lio/agora/rtc2/RtcEngineConfig;->mChannelProfile:I

    iput-object v1, p0, Lio/agora/rtc2/RtcEngineConfig;->mLicense:Ljava/lang/String;

    const/4 v1, 0x0

    iput v1, p0, Lio/agora/rtc2/RtcEngineConfig;->mAudioScenario:I

    const/4 v3, -0x1

    iput v3, p0, Lio/agora/rtc2/RtcEngineConfig;->mAreaCode:I

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lio/agora/rtc2/RtcEngineConfig;->mExtensionList:Ljava/util/List;

    iput-object v0, p0, Lio/agora/rtc2/RtcEngineConfig;->mExtensionObserver:Lio/agora/rtc2/IMediaExtensionObserver;

    new-instance v3, Lio/agora/rtc2/RtcEngineConfig$LogConfig;

    invoke-direct {v3}, Lio/agora/rtc2/RtcEngineConfig$LogConfig;-><init>()V

    iput-object v3, p0, Lio/agora/rtc2/RtcEngineConfig;->mLogConfig:Lio/agora/rtc2/RtcEngineConfig$LogConfig;

    iput-object v0, p0, Lio/agora/rtc2/RtcEngineConfig;->mThreadPriority:Ljava/lang/Integer;

    iput-boolean v1, p0, Lio/agora/rtc2/RtcEngineConfig;->mDomainLimit:Z

    iput-boolean v2, p0, Lio/agora/rtc2/RtcEngineConfig;->mAutoRegisterAgoraExtensions:Z

    return-void
.end method


# virtual methods
.method public addExtension(Ljava/lang/String;)V
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mExtensionList:Ljava/util/List;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public getAppId()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mAppId:Ljava/lang/String;

    return-object p0
.end method

.method public getAreaCode()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mAreaCode:I

    return p0
.end method

.method public getAudioScenario()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mAudioScenario:I

    return p0
.end method

.method public getAutoRegisterAgoraExtensions()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mAutoRegisterAgoraExtensions:Z

    return p0
.end method

.method public getChannelProfile()I
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mChannelProfile:I

    return p0
.end method

.method public getContext()Landroid/content/Context;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method public getDomainLimit()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mDomainLimit:Z

    return p0
.end method

.method public getExtensionObserver()Lio/agora/rtc2/IMediaExtensionObserver;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mExtensionObserver:Lio/agora/rtc2/IMediaExtensionObserver;

    return-object p0
.end method

.method public getLicense()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mLicense:Ljava/lang/String;

    return-object p0
.end method

.method public getLogConfig()Lio/agora/rtc2/RtcEngineConfig$LogConfig;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mLogConfig:Lio/agora/rtc2/RtcEngineConfig$LogConfig;

    return-object p0
.end method

.method public getThreadPriority()Ljava/lang/Integer;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/rtc2/RtcEngineConfig;->mThreadPriority:Ljava/lang/Integer;

    return-object p0
.end method
