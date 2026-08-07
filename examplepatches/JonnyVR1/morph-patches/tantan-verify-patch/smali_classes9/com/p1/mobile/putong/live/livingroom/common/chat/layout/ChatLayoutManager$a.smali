.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->G(Landroidx/recyclerview/widget/RecyclerView$v;Landroidx/recyclerview/widget/RecyclerView$a0;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->e(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->e(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;Z)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->c(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 19
    .line 20
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;->f(Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/chat/layout/ChatLayoutManager;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->requestLayout()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
