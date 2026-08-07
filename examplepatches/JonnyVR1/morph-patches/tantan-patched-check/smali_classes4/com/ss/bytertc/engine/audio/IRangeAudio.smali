.class public interface abstract Lcom/ss/bytertc/engine/audio/IRangeAudio;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract enableRangeAudio(Z)V
.end method

.method public abstract setAttenuationModel(Lcom/ss/bytertc/engine/type/AttenuationType;F)I
.end method

.method public abstract setNoAttenuationFlags(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract updatePosition(Lcom/ss/bytertc/engine/data/Position;)I
.end method

.method public abstract updateReceiveRange(Lcom/ss/bytertc/engine/data/ReceiveRange;)I
.end method
