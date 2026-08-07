.class public Lio/agora/meta/internal/LocalUserAvatarImpl;
.super Ljava/lang/Object;

# interfaces
.implements Lio/agora/meta/ILocalUserAvatar;


# instance fields
.field private mNativeHandle:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lio/agora/meta/internal/LocalUserAvatarImpl;->mNativeHandle:J

    return-void
.end method

.method private native nativeApplyInfo(J)I
.end method

.method private native nativeGetExtraInfo(J)[B
.end method

.method private native nativeGetModelInfo(J)Lio/agora/meta/AvatarModelInfo;
.end method

.method private native nativeGetUserInfo(J)Lio/agora/meta/MetaUserInfo;
.end method

.method private native nativeSetExtraInfo(J[B)I
.end method

.method private native nativeSetModelInfo(JLio/agora/meta/AvatarModelInfo;)I
.end method

.method private native nativeSetUserInfo(JLio/agora/meta/MetaUserInfo;)I
.end method


# virtual methods
.method public applyInfo()I
    .locals 2

    iget-wide v0, p0, Lio/agora/meta/internal/LocalUserAvatarImpl;->mNativeHandle:J

    invoke-direct {p0, v0, v1}, Lio/agora/meta/internal/LocalUserAvatarImpl;->nativeApplyInfo(J)I

    move-result p0

    return p0
.end method

.method public getExtraInfo()[B
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/meta/internal/LocalUserAvatarImpl;->mNativeHandle:J

    invoke-direct {p0, v0, v1}, Lio/agora/meta/internal/LocalUserAvatarImpl;->nativeGetExtraInfo(J)[B

    move-result-object p0

    return-object p0
.end method

.method public getModelInfo()Lio/agora/meta/AvatarModelInfo;
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/meta/internal/LocalUserAvatarImpl;->mNativeHandle:J

    invoke-direct {p0, v0, v1}, Lio/agora/meta/internal/LocalUserAvatarImpl;->nativeGetModelInfo(J)Lio/agora/meta/AvatarModelInfo;

    move-result-object p0

    return-object p0
.end method

.method public getUserInfo()Lio/agora/meta/MetaUserInfo;
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/meta/internal/LocalUserAvatarImpl;->mNativeHandle:J

    invoke-direct {p0, v0, v1}, Lio/agora/meta/internal/LocalUserAvatarImpl;->nativeGetUserInfo(J)Lio/agora/meta/MetaUserInfo;

    move-result-object p0

    return-object p0
.end method

.method public setExtraInfo([B)I
    .locals 2

    iget-wide v0, p0, Lio/agora/meta/internal/LocalUserAvatarImpl;->mNativeHandle:J

    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/LocalUserAvatarImpl;->nativeSetExtraInfo(J[B)I

    move-result p0

    return p0
.end method

.method public setModelInfo(Lio/agora/meta/AvatarModelInfo;)I
    .locals 2

    iget-wide v0, p0, Lio/agora/meta/internal/LocalUserAvatarImpl;->mNativeHandle:J

    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/LocalUserAvatarImpl;->nativeSetModelInfo(JLio/agora/meta/AvatarModelInfo;)I

    move-result p0

    return p0
.end method

.method public setUserInfo(Lio/agora/meta/MetaUserInfo;)I
    .locals 2

    iget-wide v0, p0, Lio/agora/meta/internal/LocalUserAvatarImpl;->mNativeHandle:J

    invoke-direct {p0, v0, v1, p1}, Lio/agora/meta/internal/LocalUserAvatarImpl;->nativeSetUserInfo(JLio/agora/meta/MetaUserInfo;)I

    move-result p0

    return p0
.end method
