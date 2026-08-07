.class public final synthetic Ll/ft70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

.field public final synthetic b:Landroid/animation/ValueAnimator;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ft70;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

    iput-object p2, p0, Ll/ft70;->b:Landroid/animation/ValueAnimator;

    return-void
.end method


# virtual methods
.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ft70;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;

    iget-object p0, p0, Ll/ft70;->b:Landroid/animation/ValueAnimator;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;->d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyIndicatorView;Landroid/animation/ValueAnimator;Landroid/animation/ValueAnimator;)V

    return-void
.end method
