.class public interface abstract Lcom/tantanapp/media/ttmediaeffect/anim/IAnimListener;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract loadResError(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onFinished()V
.end method

.method public abstract onLoadSuccess()V
.end method

.method public abstract onLoadSuccess(Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;)V
    .param p1    # Lcom/tantanapp/media/ttmediaeffect/anim/AnimEntity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract onPause()V
.end method

.method public abstract onRepeat()V
.end method

.method public abstract onStart()V
.end method

.method public abstract onStep(ID)V
.end method
