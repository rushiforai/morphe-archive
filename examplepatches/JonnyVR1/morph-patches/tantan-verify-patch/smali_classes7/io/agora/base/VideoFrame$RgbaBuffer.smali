.class public interface abstract Lio/agora/base/VideoFrame$RgbaBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lio/agora/base/VideoFrame$Buffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "RgbaBuffer"
.end annotation


# virtual methods
.method public abstract getData()Ljava/nio/ByteBuffer;
    .annotation build Lio/agora/base/internal/CalledByNative;
        value = "RgbaBuffer"
    .end annotation
.end method
