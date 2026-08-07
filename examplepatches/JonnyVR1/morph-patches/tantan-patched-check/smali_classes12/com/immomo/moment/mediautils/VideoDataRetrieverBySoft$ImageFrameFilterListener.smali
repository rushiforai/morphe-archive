.class public interface abstract Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft$ImageFrameFilterListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ImageFrameFilterListener"
.end annotation


# virtual methods
.method public abstract doFilterComplete()V
.end method

.method public abstract doFilterError(Ljava/lang/Exception;)V
.end method

.method public abstract doFilterFrame(Landroid/graphics/Bitmap;)V
.end method
