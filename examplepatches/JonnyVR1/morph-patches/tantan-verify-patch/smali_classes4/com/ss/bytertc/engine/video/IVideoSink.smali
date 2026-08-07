.class public interface abstract Lcom/ss/bytertc/engine/video/IVideoSink;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/bytertc/engine/video/IVideoSink$PixelFormat;
    }
.end annotation


# virtual methods
.method public abstract getRenderElapse()I
.end method

.method public abstract onFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)V
.end method
