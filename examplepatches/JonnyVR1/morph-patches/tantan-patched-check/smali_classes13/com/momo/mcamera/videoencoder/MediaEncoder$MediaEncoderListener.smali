.class public interface abstract Lcom/momo/mcamera/videoencoder/MediaEncoder$MediaEncoderListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/videoencoder/MediaEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MediaEncoderListener"
.end annotation


# virtual methods
.method public abstract onFail(Ljava/lang/Exception;)V
.end method

.method public abstract onPrepared(Lcom/momo/mcamera/videoencoder/MediaEncoder;)V
.end method

.method public abstract onStopped(Lcom/momo/mcamera/videoencoder/MediaEncoder;)V
.end method
