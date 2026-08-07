.class public Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct$a;
.super Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct$a;->a:Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onSlide(Landroid/view/View;F)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onStateChanged(Landroid/view/View;I)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p1, 0x4

    .line 2
    if-ne p2, p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct$a;->a:Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->a2(Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct$a;->a:Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->finish()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
