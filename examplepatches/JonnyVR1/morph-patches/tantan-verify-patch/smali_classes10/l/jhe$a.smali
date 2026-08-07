.class public Ll/jhe$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/gift/GiftPlayerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jhe;->r(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

.field public final synthetic b:Ll/hre;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/jhe$a;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jhe$a;->b:Ll/hre;

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
    iget-object p1, p0, Ll/jhe$a;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    const/16 p2, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/jhe$a;->b:Ll/hre;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/hre;->e()Ll/x20;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/jhe$a;->b:Ll/hre;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/hre;->e()Ll/x20;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ll/x20;->call()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onGiftPlayFailed(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;ILjava/lang/String;)V
    .locals 0
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
    iget-object p1, p0, Ll/jhe$a;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/xeengine/gift/GiftView;->stop()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/jhe$a;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 7
    .line 8
    const/16 p2, 0x8

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ll/jhe$a;->b:Ll/hre;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/hre;->e()Ll/x20;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/jhe$a;->b:Ll/hre;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/hre;->e()Ll/x20;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ll/x20;->call()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public onGiftPlayFinished(Lcom/momo/xeengine/gift/GiftPlayer;Lcom/momo/xeengine/gift/GiftEntity;Ljava/lang/String;)V
    .locals 0
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
    iget-object p1, p0, Ll/jhe$a;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    const/16 p2, 0x8

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/jhe$a;->b:Ll/hre;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/hre;->b()Ll/x20;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Ll/jhe$a;->b:Ll/hre;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/hre;->b()Ll/x20;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ll/x20;->call()V

    .line 23
    .line 24
    .line 25
    :cond_0
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
    return-void
.end method
