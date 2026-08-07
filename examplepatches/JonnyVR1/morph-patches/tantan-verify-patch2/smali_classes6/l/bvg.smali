.class public final synthetic Ll/bvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/view/View;Landroid/widget/TextView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bvg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    iput-object p2, p0, Ll/bvg;->b:Landroid/view/View;

    iput-object p3, p0, Ll/bvg;->c:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bvg;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;

    iget-object v1, p0, Ll/bvg;->b:Landroid/view/View;

    iget-object p0, p0, Ll/bvg;->c:Landroid/widget/TextView;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;->v0(Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterVoteView;Landroid/view/View;Landroid/widget/TextView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
