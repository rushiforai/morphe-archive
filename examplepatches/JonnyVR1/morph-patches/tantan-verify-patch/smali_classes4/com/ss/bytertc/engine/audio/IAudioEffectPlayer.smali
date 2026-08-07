.class public abstract Lcom/ss/bytertc/engine/audio/IAudioEffectPlayer;
.super Ljava/lang/Object;
.source "SourceFile"


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
.method public abstract getDuration(I)I
.end method

.method public abstract getPosition(I)I
.end method

.method public abstract getVolume(I)I
.end method

.method public abstract pause(I)I
.end method

.method public abstract pauseAll()I
.end method

.method public abstract preload(ILjava/lang/String;)I
.end method

.method public abstract resume(I)I
.end method

.method public abstract resumeAll()I
.end method

.method public abstract setEventHandler(Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;)I
.end method

.method public abstract setPosition(II)I
.end method

.method public abstract setVolume(II)I
.end method

.method public abstract setVolumeAll(I)I
.end method

.method public abstract start(ILjava/lang/String;Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;)I
.end method

.method public abstract stop(I)I
.end method

.method public abstract stopAll()I
.end method

.method public abstract unload(I)I
.end method

.method public abstract unloadAll()I
.end method
