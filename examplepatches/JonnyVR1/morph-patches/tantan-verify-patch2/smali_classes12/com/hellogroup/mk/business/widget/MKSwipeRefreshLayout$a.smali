.class Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;
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
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$a;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$a;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object p1, p1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 8
    .line 9
    const/16 v0, 0xff

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/c55;->setAlpha(I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$a;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/c55;->start()V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$a;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 22
    .line 23
    iget-boolean v0, p1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->I:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p1, p1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    invoke-interface {p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;->p()V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$a;->a:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;

    .line 35
    .line 36
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-virtual {p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m()V

    .line 46
    .line 47
    .line 48
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
