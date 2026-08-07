.class Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->c(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:I

.field final synthetic c:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;ZI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->a:Z

    .line 4
    .line 5
    iput p3, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->b:I

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->a:Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 7
    .line 8
    iget v1, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 9
    .line 10
    invoke-static {p1, v1, v0}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->b(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;IF)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 14
    .line 15
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->b:I

    .line 16
    .line 17
    const/high16 v2, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-static {p1, v1, v2}, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->b(Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;IF)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->c:Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;

    .line 28
    .line 29
    iget v1, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 30
    .line 31
    iput v1, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->d:I

    .line 32
    .line 33
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip$b;->b:I

    .line 34
    .line 35
    iput p0, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->e:I

    .line 36
    .line 37
    iput v0, p1, Lcom/hellogroup/mk/business/widget/MKTabLayout$SlidingTabStrip;->f:F

    .line 38
    .line 39
    return-void
.end method
