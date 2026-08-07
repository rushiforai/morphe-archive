.class public interface abstract Lcom/momo/xeengine/event/IXEventDispatcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/event/ITouchEventHandler;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# virtual methods
.method public abstract dispatchBodyInfo(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVBodyInfo;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchBodyInfo(Ljava/util/List;Z)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVBodyInfo;",
            ">;Z)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchCartoonFaceInfo(Lcom/momo/xeengine/cv/bean/XECartoonFaceInfo;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchExpressInfo(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVExpressInfo;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchFaceInfo(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEFaceInfo;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchFaceSegmentInfo(Lcom/momo/xeengine/cv/bean/XEFaceSegmentInfo;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchHandInfo(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEHandInfo;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchMutableInfo(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/XEMutableInfo;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchObjectInfo(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/momo/xeengine/cv/bean/CVObjectInfo;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchSegmentInfo(Lcom/momo/xeengine/cv/bean/CVSegmentInfo;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract dispatchTTHeartInfo(Lcom/momo/xeengine/cv/bean/XETTHeartInfo;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
