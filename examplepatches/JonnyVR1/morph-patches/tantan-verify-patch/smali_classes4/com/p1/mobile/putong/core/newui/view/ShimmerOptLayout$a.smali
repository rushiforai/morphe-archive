.class public Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->b()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$a;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$a;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 12
    .line 13
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;->a(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;F)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$a;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 19
    .line 20
    .line 21
    return-void
.end method
