.class final Lnicoid/core108/RotaryFling108$Target;
.super Ljava/lang/Object;
.source "RotaryFling108.java"

# interfaces
.implements Landroidx/core/view/DifferentialMotionFlingTarget;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/core108/RotaryFling108;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Target"
.end annotation


# instance fields
.field private final view:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/recyclerview/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnicoid/core108/RotaryFling108$Target;->view:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public getScaledScrollFactor()F
    .registers 4

    .line 35
    iget-object v0, p0, Lnicoid/core108/RotaryFling108$Target;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 36
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    if-eqz v2, :cond_2

    iget-boolean v2, v0, Landroidx/recyclerview/widget/RecyclerView;->x:Z

    if-nez v2, :cond_2

    .line 37
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$n;->b()Z

    move-result v2

    if-eqz v2, :cond_0

    iget v0, v0, Landroidx/recyclerview/widget/RecyclerView;->b0:F

    neg-float v1, v0

    goto :goto_0

    :cond_0
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$n;->a()Z

    move-result v2

    if-eqz v2, :cond_1

    iget v1, v0, Landroidx/recyclerview/widget/RecyclerView;->a0:F

    :cond_1
    :goto_0
    return v1

    .line 36
    :cond_2
    return v1
.end method

.method public startDifferentialMotionFling(F)Z
    .registers 5

    .line 40
    iget-object v0, p0, Lnicoid/core108/RotaryFling108$Target;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 41
    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    if-eqz v2, :cond_2

    iget-boolean v2, v0, Landroidx/recyclerview/widget/RecyclerView;->x:Z

    if-nez v2, :cond_2

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->isAttachedToWindow()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 42
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    .line 43
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$n;->b()Z

    move-result v2

    if-eqz v2, :cond_0

    float-to-int p1, p1

    invoke-virtual {v0, v1, p1}, Landroidx/recyclerview/widget/RecyclerView;->e(II)Z

    move-result v1

    goto :goto_0

    :cond_0
    iget-object v2, v0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/RecyclerView$n;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView$n;->a()Z

    move-result v2

    if-eqz v2, :cond_1

    float-to-int p1, p1

    invoke-virtual {v0, p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->e(II)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    :goto_0
    return v1

    .line 41
    :cond_2
    return v1
.end method

.method public stopDifferentialMotionFling()V
    .registers 2

    .line 45
    iget-object v0, p0, Lnicoid/core108/RotaryFling108$Target;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->stopScroll()V

    :cond_0
    return-void
.end method
