.class public interface abstract Lcom/momo/mcamera/mask/StickerBlendFilter$StickerStateChangeListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/StickerBlendFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "StickerStateChangeListener"
.end annotation


# virtual methods
.method public abstract distortionStateChanged(ZFFFF)V
.end method

.method public abstract faceDetected(Z)V
.end method

.method public abstract playStateChanged(IZ)V
.end method

.method public abstract stickerGestureTypeChanged(Ljava/lang/String;Z)V
.end method

.method public abstract stickerStateChanged(II)V
.end method
