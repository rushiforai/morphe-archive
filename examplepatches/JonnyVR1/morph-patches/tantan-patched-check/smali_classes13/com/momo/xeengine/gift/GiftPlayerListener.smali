.class public interface abstract Lcom/momo/xeengine/gift/GiftPlayerListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# virtual methods
.method public abstract onGiftPlayCanceled(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V
    .param p1    # Lcom/momo/xeengine/gift/GiftPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract onGiftPlayFailed(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;ILjava/lang/String;)V
    .param p1    # Lcom/momo/xeengine/gift/GiftPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract onGiftPlayFinished(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;)V
    .param p1    # Lcom/momo/xeengine/gift/GiftPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
.end method

.method public onGiftPrepared(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/gift/GiftPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    return-void
.end method
