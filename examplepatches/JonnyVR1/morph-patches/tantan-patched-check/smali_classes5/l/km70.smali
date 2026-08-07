.class public final synthetic Ll/km70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Landroid/widget/FrameLayout$LayoutParams;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/FrameLayout$LayoutParams;IILcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/km70;->a:Landroid/widget/FrameLayout$LayoutParams;

    iput p2, p0, Ll/km70;->b:I

    iput p3, p0, Ll/km70;->c:I

    iput-object p4, p0, Ll/km70;->d:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/km70;->a:Landroid/widget/FrameLayout$LayoutParams;

    iget v1, p0, Ll/km70;->b:I

    iget v2, p0, Ll/km70;->c:I

    iget-object p0, p0, Ll/km70;->d:Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselView;->c(Landroid/widget/FrameLayout$LayoutParams;IILcom/p1/mobile/putong/core/ui/vip/picks/view/PicksGuideCarouselItemView;Landroid/animation/ValueAnimator;)V

    return-void
.end method
