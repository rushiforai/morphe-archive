.class public interface abstract Lcom/ss/bytertc/engine/AudioFocusManager$Callback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/AudioFocusManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Callback"
.end annotation


# virtual methods
.method public abstract higherVolume()V
.end method

.method public abstract lowerVolume()V
.end method

.method public abstract startMicrophone()V
.end method

.method public abstract startSpeakerphone()V
.end method

.method public abstract stopMicrophone()V
.end method

.method public abstract stopSpeakerphone()V
.end method
