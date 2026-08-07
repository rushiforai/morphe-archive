.class public interface abstract Lcom/momo/xengine/media/IVideoFrameExtractor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;,
        Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;
    }
.end annotation


# virtual methods
.method public abstract extractorFrames(Ljava/util/List;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;)V
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;",
            ")V"
        }
    .end annotation
.end method

.method public abstract getFrameRGBDataAt(JLcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;)V
    .param p3    # Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract init(Ljava/lang/String;FDII)Z
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract release()V
.end method
