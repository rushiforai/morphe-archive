.class Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$h;
.super Landroid/view/animation/Animation;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->u(ILandroid/view/animation/Animation$AnimationListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$h;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$h;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 2
    .line 3
    iget v0, p2, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->y:F

    .line 4
    .line 5
    neg-float v1, v0

    .line 6
    mul-float/2addr v1, p1

    .line 7
    add-float/2addr v0, v1

    .line 8
    invoke-virtual {p2, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setAnimationProgress(F)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$h;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->k(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
