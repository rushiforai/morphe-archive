.class Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->c(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Landroid/view/View;

.field final synthetic c:I

.field final synthetic d:Z

.field final synthetic e:I

.field final synthetic f:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;ILandroid/view/View;IZI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    iput p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->b:Landroid/view/View;

    .line 6
    .line 7
    iput p4, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->c:I

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->d:Z

    .line 10
    .line 11
    iput p6, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->e:I

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 6
    .line 7
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->a:I

    .line 8
    .line 9
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->b:Landroid/view/View;

    .line 10
    .line 11
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-static {v1, v2, p1}, Ll/or0;->a(IIF)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget v2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->c:I

    .line 20
    .line 21
    iget-object v3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->b:Landroid/view/View;

    .line 22
    .line 23
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-static {v2, v3, p1}, Ll/or0;->a(IIF)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f(II)V

    .line 32
    .line 33
    .line 34
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->d:Z

    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 39
    .line 40
    iget v1, v0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 41
    .line 42
    const/high16 v2, 0x3f800000    # 1.0f

    .line 43
    .line 44
    sub-float/2addr v2, p1

    .line 45
    invoke-static {v0, v1, v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->b(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;IF)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 49
    .line 50
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->e:I

    .line 51
    .line 52
    invoke-static {v0, v1, p1}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->b(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;IF)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$a;->f:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 56
    .line 57
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    .line 58
    .line 59
    .line 60
    return-void
.end method
