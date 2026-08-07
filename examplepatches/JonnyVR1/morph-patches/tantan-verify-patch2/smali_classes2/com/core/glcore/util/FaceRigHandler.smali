.class public interface abstract Lcom/core/glcore/util/FaceRigHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/core/glcore/util/FaceRigHandler$FaceRigAnim;
    }
.end annotation


# virtual methods
.method public abstract onAssembleFaceRigFeature()[B
.end method

.method public abstract onFaceDetect(I)V
.end method

.method public abstract onFaceRigStatusChanged(ZLcom/core/glcore/util/FaceRigHandler$FaceRigAnim;)V
.end method

.method public abstract onLoadFaModel()[B
.end method

.method public abstract onLoadFaceRigModel()[B
.end method

.method public abstract onLoadFdModel()[B
.end method

.method public abstract onSaveFadeRigFeature([B)V
.end method

.method public abstract onStartFaceRigModel()V
.end method

.method public abstract onStopFaceRigModel()V
.end method
