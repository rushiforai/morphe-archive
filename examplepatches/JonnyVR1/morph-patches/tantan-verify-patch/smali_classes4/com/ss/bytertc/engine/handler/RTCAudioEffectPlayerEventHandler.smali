.class public Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mAudioEffectHandler:Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public declared-synchronized onAudioEffectPlayerStateChanged(ILcom/ss/bytertc/engine/data/PlayerState;Lcom/ss/bytertc/engine/data/PlayerError;)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;->mAudioEffectHandler:Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {v0, p1, p2, p3}, Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;->onAudioEffectPlayerStateChanged(ILcom/ss/bytertc/engine/data/PlayerState;Lcom/ss/bytertc/engine/data/PlayerError;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    :goto_0
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public declared-synchronized setAudioEffectPlayerEventHandler(Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;->mAudioEffectHandler:Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method
