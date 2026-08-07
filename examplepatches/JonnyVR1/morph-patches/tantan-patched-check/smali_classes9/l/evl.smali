.class public interface abstract Ll/evl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0008f\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H&\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\u0007H&\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\r\u001a\u00020\u000cH&\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u001d\u0010\u0012\u001a\u00020\t2\u000c\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000fH&\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u0017\u0010\u0016\u001a\u00020\t2\u0006\u0010\u0015\u001a\u00020\u0014H&\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u0017\u0010\u0019\u001a\u00020\t2\u0006\u0010\u0018\u001a\u00020\u0010H&\u00a2\u0006\u0004\u0008\u0019\u0010\u001aJ\u000f\u0010\u001b\u001a\u00020\tH&\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u000f\u0010\u001d\u001a\u00020\tH&\u00a2\u0006\u0004\u0008\u001d\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\tH&\u00a2\u0006\u0004\u0008\u001e\u0010\u001cJ\u0017\u0010!\u001a\u00020\t2\u0006\u0010 \u001a\u00020\u001fH&\u00a2\u0006\u0004\u0008!\u0010\"J\u000f\u0010#\u001a\u00020\tH&\u00a2\u0006\u0004\u0008#\u0010\u001cJ\u000f\u0010$\u001a\u00020\u000cH&\u00a2\u0006\u0004\u0008$\u0010\u000e\u00a8\u0006%\u00c0\u0006\u0003"
    }
    d2 = {
        "Ll/evl;",
        "",
        "Landroid/content/Context;",
        "context",
        "Landroid/view/View;",
        "g",
        "(Landroid/content/Context;)Landroid/view/View;",
        "Ll/uhl;",
        "actionListener",
        "",
        "K",
        "(Ll/uhl;)V",
        "",
        "getDialogViewHeight",
        "()I",
        "",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
        "allLeaderboards",
        "l",
        "(Ljava/util/List;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;",
        "leaderBoard",
        "H",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V",
        "hourLeaderBoard",
        "Y",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V",
        "G",
        "()V",
        "i",
        "onDestroy",
        "",
        "show",
        "I",
        "(Z)V",
        "b",
        "getContentHeight",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public abstract G()V
.end method

.method public abstract H(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract I(Z)V
.end method

.method public abstract K(Ll/uhl;)V
    .param p1    # Ll/uhl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract Y(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract b()V
.end method

.method public abstract g(Landroid/content/Context;)Landroid/view/View;
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public abstract getContentHeight()I
.end method

.method public abstract getDialogViewHeight()I
.end method

.method public abstract i()V
.end method

.method public abstract l(Ljava/util/List;)V
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onDestroy()V
.end method
