.class public final Lh7d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lvl6;

.field public final b:Lpt1;

.field public final c:Landroid/content/res/Resources;

.field public final d:Lyzb;

.field public e:Z

.field public f:B


# direct methods
.method public constructor <init>(Lvl6;Lpt1;Landroid/content/res/Resources;Lyzb;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    iput-byte v0, p0, Lh7d;->f:B

    iput-object p1, p0, Lh7d;->a:Lvl6;

    iput-object p2, p0, Lh7d;->b:Lpt1;

    iput-object p3, p0, Lh7d;->c:Landroid/content/res/Resources;

    iput-object p4, p0, Lh7d;->d:Lyzb;

    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-static {p1}, Li7d;->s0(Landroid/content/res/Configuration;)Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    iput-boolean p2, p0, Lh7d;->e:Z

    invoke-static {p1}, Li7d;->s0(Landroid/content/res/Configuration;)Z

    move-result p1

    invoke-virtual {p0, p1}, Lh7d;->a(Z)V

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 10

    iget-object v0, p0, Lh7d;->a:Lvl6;

    const/4 v1, 0x1

    iget-object v2, p0, Lh7d;->b:Lpt1;

    if-eqz p1, :cond_58

    iget-object v3, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    new-instance v4, Ln1n;

    const/high16 v5, 0x43b40000    # 360.0f

    iget-object v6, p0, Lh7d;->c:Landroid/content/res/Resources;

    invoke-static {v5, v6}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    const/high16 v7, 0x43c80000    # 400.0f

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    invoke-static {v1, v7, v6}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v6

    float-to-int v6, v6

    const v7, 0x3e99999a    # 0.3f

    invoke-direct {v4, v5, v6, v7}, Ln1n;-><init>(IIF)V

    iget-object v5, v3, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->B:Ln1n;

    invoke-static {v5, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_33

    iput-object v4, v3, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->B:Ln1n;

    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    :cond_33
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    const/4 v5, -0x2

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, v2, Lpt1;->g:Landroid/view/View;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v2, Lpt1;->b:Landroid/view/View;

    check-cast v2, Landroid/widget/FrameLayout;

    const v3, 0x106000d

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, v0, Lvl6;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    sget-object v2, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->N:Lsv2;

    iput-object v2, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    iput-boolean v4, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    goto :goto_8f

    :cond_58
    iget-object v3, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    iget-object v4, v3, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->B:Ln1n;

    const/4 v5, 0x0

    invoke-static {v4, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_6a

    iput-object v5, v3, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;->B:Ln1n;

    invoke-virtual {v3}, Landroid/view/View;->requestLayout()V

    :cond_6a
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    const/4 v5, -0x1

    iput v5, v4, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v3, v2, Lpt1;->g:Landroid/view/View;

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v2, Lpt1;->b:Landroid/view/View;

    check-cast v2, Landroid/widget/FrameLayout;

    const v3, 0x7f0600ab

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, v0, Lvl6;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    sget-object v2, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->O:Lsv2;

    iput-object v2, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->a:Lsv2;

    iput-boolean v1, v0, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->p:Z

    :goto_8f
    xor-int/2addr p1, v1

    iput-boolean p1, p0, Lh7d;->e:Z

    return-void
.end method
