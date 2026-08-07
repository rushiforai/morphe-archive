.class public final synthetic Ll/jm70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselView;

.field public final synthetic b:Landroid/widget/FrameLayout$LayoutParams;

.field public final synthetic c:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselView;Landroid/widget/FrameLayout$LayoutParams;Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jm70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselView;

    iput-object p2, p0, Ll/jm70;->b:Landroid/widget/FrameLayout$LayoutParams;

    iput-object p3, p0, Ll/jm70;->c:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jm70;->a:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselView;

    iget-object v1, p0, Ll/jm70;->b:Landroid/widget/FrameLayout$LayoutParams;

    iget-object p0, p0, Ll/jm70;->c:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselView;->d(Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselView;Landroid/widget/FrameLayout$LayoutParams;Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
