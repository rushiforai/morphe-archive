.class public Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/GiftPlayerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/base/view/XEGiftView;->setListener(Lcom/momo/xeengine/gift/GiftPlayerListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/gift/GiftPlayerListener;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/view/XEGiftView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Lcom/momo/xeengine/gift/GiftPlayerListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->b:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->a:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onGiftPlayCanceled(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V
    .locals 2
    .param p1    # Lcom/momo/xeengine/gift/GiftPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xeengine/gift/GiftEntity;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->b:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->d(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->a:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Lcom/momo/xeengine/gift/GiftPlayerListener;->onGiftPlayCanceled(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onGiftPlayFailed(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;ILjava/lang/String;)V
    .locals 2
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

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->b:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->d(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->a:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/momo/xeengine/gift/GiftPlayerListener;->onGiftPlayFailed(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;ILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onGiftPlayFinished(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;)V
    .locals 2
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

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->b:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->d(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ljava/lang/String;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->a:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2, p3}, Lcom/momo/xeengine/gift/GiftPlayerListener;->onGiftPlayFinished(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
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

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/XEGiftView$a;->a:Lcom/momo/xeengine/gift/GiftPlayerListener;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Lcom/momo/xeengine/gift/GiftPlayerListener;->onGiftPrepared(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
