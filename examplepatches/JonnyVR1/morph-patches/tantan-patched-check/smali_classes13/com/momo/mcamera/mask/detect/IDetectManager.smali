.class public interface abstract Lcom/momo/mcamera/mask/detect/IDetectManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;,
        Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;,
        Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;,
        Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;
    }
.end annotation


# virtual methods
.method public abstract clearAllExpressDetectListener()V
.end method

.method public abstract clearAllGestureDetectListener()V
.end method

.method public abstract clearAllObjectDetectListener()V
.end method

.method public abstract clearAllPickNoiseDetectListener()V
.end method

.method public abstract isExpressDetectOpened()Z
.end method

.method public abstract isGestureDetectOpened()Z
.end method

.method public abstract isObjectDetectOpened()Z
.end method

.method public abstract registerExpressDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;)V
.end method

.method public abstract registerGestureDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;)V
.end method

.method public abstract registerObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V
.end method

.method public abstract registerPickNoiseDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;)V
.end method

.method public abstract removeExpressDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IExpressDetectListener;)V
.end method

.method public abstract removeGestureDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IGestureDetectListener;)V
.end method

.method public abstract removeObjectDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IObjectDetectListener;)V
.end method

.method public abstract removePickNoiseDetectListener(Lcom/momo/mcamera/mask/detect/IDetectManager$IPickNoseDetectListener;)V
.end method

.method public abstract setExpressModelPath(Ljava/lang/String;)V
.end method

.method public abstract setGestureDetectInterval(I)V
.end method

.method public abstract setGestureModelPath(Ljava/lang/String;)V
.end method

.method public abstract setHandGestureType(I)V
.end method

.method public abstract setMMCVInfo(Ll/omw;)V
.end method

.method public abstract setObjectDetectInterval(I)V
.end method

.method public abstract setObjectModelPath(Ljava/lang/String;)V
.end method

.method public abstract startExpressDetect()V
.end method

.method public abstract startGestureDetect()V
.end method

.method public abstract startObjectDetect()V
.end method

.method public abstract stopExpressDetect()V
.end method

.method public abstract stopGestureDetect()V
.end method

.method public abstract stopObjectDetect()V
.end method
