.class public Lio/agora/utils2/internal/RtcSystemEventListener;
.super Ljava/lang/Object;

# interfaces
.implements Lio/agora/utils2/internal/CommonUtility$SystemEventListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "RtcSystemEventListener"


# instance fields
.field private mNativeHandle:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lio/agora/utils2/internal/RtcSystemEventListener;->mNativeHandle:J

    return-void
.end method

.method private native nativeAudioRoutingPhoneChanged(ZII)V
.end method

.method private native nativeNotifyAddressBound(Ljava/lang/String;)V
.end method

.method private native nativeNotifyForegroundChanged(Z)V
.end method

.method private native nativeNotifyGravityOriChange(I)V
.end method

.method private native nativeNotifyNetworkChange(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V
.end method


# virtual methods
.method public getNativeHandle()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/utils2/internal/RtcSystemEventListener;->mNativeHandle:J

    return-wide v0
.end method

.method public onAddressBound(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/utils2/internal/RtcSystemEventListener;->nativeNotifyAddressBound(Ljava/lang/String;)V

    return-void
.end method

.method public onAudioRoutingPhoneChanged(ZII)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lio/agora/utils2/internal/RtcSystemEventListener;->nativeAudioRoutingPhoneChanged(ZII)V

    return-void
.end method

.method public onForegroundChanged(Z)V
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/utils2/internal/RtcSystemEventListener;->nativeNotifyForegroundChanged(Z)V

    return-void
.end method

.method public onGravityOriChange(I)V
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/utils2/internal/RtcSystemEventListener;->nativeNotifyGravityOriChange(I)V

    return-void
.end method

.method public onNetworkChange(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lio/agora/utils2/internal/RtcSystemEventListener;->nativeNotifyNetworkChange(Lio/agora/utils2/internal/CommonUtility$MediaNetworkInfo;)V

    return-void
.end method
