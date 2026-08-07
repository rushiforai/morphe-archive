.class public interface abstract Lcom/idv/identity/base/algorithm/IIdentityDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract handleCaptureCompleted(ILjava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract handleEventStated(I)V
.end method

.method public abstract handleInfoReady(Lcom/idv/identity/base/algorithm/IDFrame;)V
.end method

.method public abstract handleStateUpdated(ILcom/idv/identity/base/algorithm/IdentityFaceAttr;)V
.end method

.method public abstract reset()V
.end method
