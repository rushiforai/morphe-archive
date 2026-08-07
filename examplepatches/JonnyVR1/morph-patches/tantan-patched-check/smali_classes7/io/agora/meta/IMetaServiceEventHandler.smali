.class public interface abstract Lio/agora/meta/IMetaServiceEventHandler;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/meta/IMetaServiceEventHandler$SceneDownloadState;,
        Lio/agora/meta/IMetaServiceEventHandler$ConnectionChangedReason;,
        Lio/agora/meta/IMetaServiceEventHandler$ConnectionState;
    }
.end annotation


# virtual methods
.method public abstract onConnectionStateChanged(Ljava/lang/String;II)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onCreateSceneResult(Lio/agora/meta/IMetaScene;I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onDownloadSceneAssetsProgress(JII)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onGetSceneAssetsInfoResult([Lio/agora/meta/MetaSceneAssetsInfo;I)V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method

.method public abstract onTokenWillExpire()V
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation
.end method
