.class public interface abstract Lcom/momo/xeengine/gift/VideoGiftProgressListener;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# virtual methods
.method public abstract onVideoGiftProgressUpdate(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;DD)V
    .param p1    # Lcom/momo/xeengine/gift/GiftPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract onVideoGiftStartPlaying(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V
    .param p1    # Lcom/momo/xeengine/gift/GiftPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract onVideoGiftStopPlaying(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V
    .param p1    # Lcom/momo/xeengine/gift/GiftPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
