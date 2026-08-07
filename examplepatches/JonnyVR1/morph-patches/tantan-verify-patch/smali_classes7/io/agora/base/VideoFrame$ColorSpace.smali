.class public interface abstract Lio/agora/base/VideoFrame$ColorSpace;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/agora/base/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ColorSpace"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/agora/base/VideoFrame$ColorSpace$Primary;,
        Lio/agora/base/VideoFrame$ColorSpace$Transfer;,
        Lio/agora/base/VideoFrame$ColorSpace$Matrix;,
        Lio/agora/base/VideoFrame$ColorSpace$Range;
    }
.end annotation


# virtual methods
.method public abstract getHdrMetadata()Lio/agora/base/VideoFrame$HdrMetadata;
.end method

.method public abstract getMatrix()Lio/agora/base/VideoFrame$ColorSpace$Matrix;
.end method

.method public abstract getPrimary()Lio/agora/base/VideoFrame$ColorSpace$Primary;
.end method

.method public abstract getRange()Lio/agora/base/VideoFrame$ColorSpace$Range;
.end method

.method public abstract getTransfer()Lio/agora/base/VideoFrame$ColorSpace$Transfer;
.end method
