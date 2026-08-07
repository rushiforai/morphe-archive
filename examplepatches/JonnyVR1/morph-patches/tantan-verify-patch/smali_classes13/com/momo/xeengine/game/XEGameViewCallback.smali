.class public interface abstract Lcom/momo/xeengine/game/XEGameViewCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# virtual methods
.method public abstract onEngineDynamicLinkLibraryDownloadProcess(ID)V
.end method

.method public abstract onRenderSizeChanged(II)V
.end method

.method public abstract onRenderViewCreate(Landroid/view/View;)V
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract onStart(Lcom/momo/xeengine/IXEngine;)V
    .param p1    # Lcom/momo/xeengine/IXEngine;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract onStartFailed(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
