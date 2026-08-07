.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->I1(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$a;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$a;->a:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->s:Landroid/view/View;

    .line 8
    .line 9
    const/16 v0, 0x8

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->s:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$a;->a:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView$a;->b:Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/bottom/FeedPostBottomView;->s:Landroid/view/View;

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
