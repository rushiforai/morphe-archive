.class public interface abstract Lcom/google/firebase/remoteconfig/ConfigUpdateListener;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract onError(Lcom/google/firebase/remoteconfig/FirebaseRemoteConfigException;)V
.end method

.method public abstract onUpdate(Lcom/google/firebase/remoteconfig/ConfigUpdate;)V
    .param p1    # Lcom/google/firebase/remoteconfig/ConfigUpdate;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method
