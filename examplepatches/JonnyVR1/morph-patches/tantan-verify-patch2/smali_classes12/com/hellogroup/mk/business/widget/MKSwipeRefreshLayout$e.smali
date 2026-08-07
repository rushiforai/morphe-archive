.class Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->g(F)V
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
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$e;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$e;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 2
    .line 3
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->s:Z

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t(Landroid/view/animation/Animation$AnimationListener;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
