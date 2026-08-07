.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->l0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView$a;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->j0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;)Ljava/lang/Runnable;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-wide/16 v0, 0x1f4

    .line 20
    .line 21
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method
