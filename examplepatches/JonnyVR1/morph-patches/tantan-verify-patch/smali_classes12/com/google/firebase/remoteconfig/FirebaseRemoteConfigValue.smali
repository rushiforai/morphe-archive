.class public interface abstract Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigValue;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract asBoolean()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract asByteArray()[B
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public abstract asDouble()D
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract asLong()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract asString()Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public abstract getSource()I
.end method
