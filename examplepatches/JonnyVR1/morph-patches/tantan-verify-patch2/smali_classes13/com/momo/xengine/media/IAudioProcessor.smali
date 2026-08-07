.class public interface abstract Lcom/momo/xengine/media/IAudioProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract apply()Z
.end method

.method public abstract getTracks()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/momo/xengine/media/AudioTrack;",
            ">;"
        }
    .end annotation
.end method

.method public abstract init(Lcom/momo/xengine/media/types/AudioFormat;)V
.end method

.method public abstract next([B)J
.end method

.method public abstract release()V
.end method

.method public abstract seek(J)V
.end method
