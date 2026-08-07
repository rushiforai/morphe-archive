.class Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$b;
.super Landroid/view/animation/Animation;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v(Landroid/view/animation/Animation$AnimationListener;)V
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
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$b;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$b;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setAnimationProgress(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
