.class public interface abstract Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller$SDKInitStatusListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/media/ttmediautils/dl/MediaSoDynamicInstaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SDKInitStatusListener"
.end annotation


# virtual methods
.method public abstract onDownloading(I)V
.end method

.method public abstract onEvent(ILjava/lang/Exception;)V
    .param p2    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public abstract onFailure(ILjava/lang/Exception;)V
.end method

.method public abstract onSuccess()V
.end method
