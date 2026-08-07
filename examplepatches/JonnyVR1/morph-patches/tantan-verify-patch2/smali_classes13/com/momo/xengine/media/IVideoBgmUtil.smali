.class public interface abstract Lcom/momo/xengine/media/IVideoBgmUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;
    }
.end annotation


# virtual methods
.method public abstract init(Lcom/momo/xengine/media/VideoBgmChangerConfig;)Z
    .param p1    # Lcom/momo/xengine/media/VideoBgmChangerConfig;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract release()V
.end method

.method public abstract setProgressCallback(Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;)V
    .param p1    # Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract start()V
.end method

.method public abstract stop()V
.end method
