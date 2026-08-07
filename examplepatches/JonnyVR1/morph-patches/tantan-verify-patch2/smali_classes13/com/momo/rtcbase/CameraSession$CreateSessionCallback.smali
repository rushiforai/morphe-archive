.class public interface abstract Lcom/momo/rtcbase/CameraSession$CreateSessionCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/CameraSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CreateSessionCallback"
.end annotation


# virtual methods
.method public abstract onDone(Lcom/momo/rtcbase/CameraSession;)V
.end method

.method public abstract onFailure(Lcom/momo/rtcbase/CameraSession$FailureType;Ljava/lang/String;)V
.end method
