.class public final Lljf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final a:Landroidx/core/widget/NestedScrollView;

.field public final b:Landroid/widget/OverScroller;

.field public c:Z

.field public d:Z

.field public e:Z

.field public final synthetic f:Lcom/opera/android/sheet/OperaBottomSheetBehavior;


# direct methods
.method public constructor <init>(Lcom/opera/android/sheet/OperaBottomSheetBehavior;Landroidx/core/widget/NestedScrollView;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lljf;->f:Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    iput-object p2, p0, Lljf;->a:Landroidx/core/widget/NestedScrollView;

    new-instance p1, Landroid/widget/OverScroller;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lljf;->b:Landroid/widget/OverScroller;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-object v0, p0, Lljf;->b:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v1

    iget-object v2, p0, Lljf;->a:Landroidx/core/widget/NestedScrollView;

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    iget-object v4, p0, Lljf;->f:Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    invoke-virtual {v4, v3}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A(I)V

    const/4 v3, 0x1

    if-eqz v1, :cond_51

    iget-boolean v1, p0, Lljf;->d:Z

    if-nez v1, :cond_3a

    const/4 v1, 0x0

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v5

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v5

    sub-int/2addr v1, v5

    sget-object v5, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v1}, Landroid/view/View;->offsetTopAndBottom(I)V

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual {v4, v1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->A(I)V

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v1

    if-nez v1, :cond_3a

    iput-boolean v3, p0, Lljf;->d:Z

    :cond_3a
    iget-boolean v1, p0, Lljf;->d:Z

    if-eqz v1, :cond_4d

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    invoke-virtual {v2, v1, v0}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    :cond_4d
    invoke-virtual {v2, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_51
    iget-boolean v0, p0, Lljf;->c:Z

    if-nez v0, :cond_5b

    const/4 v0, 0x3

    invoke-virtual {v4, v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->J(I)V

    iput-boolean v3, p0, Lljf;->e:Z

    :cond_5b
    return-void
.end method
