.class public final Lgtj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lasj;

.field public final b:Landroid/view/View;

.field public c:Z

.field public d:Lfsj;

.field public e:Z

.field public f:Z


# direct methods
.method public constructor <init>(Lasj;Landroid/view/View;Landroid/view/View;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgtj;->a:Lasj;

    iput-object p2, p0, Lgtj;->b:Landroid/view/View;

    invoke-virtual {p0}, Lgtj;->k()V

    invoke-virtual {p1, p3}, Lna3;->f(Landroid/view/View;)V

    if-nez p3, :cond_1a

    iget-object p3, p0, Lgtj;->d:Lfsj;

    if-nez p3, :cond_1a

    new-instance p3, Lfsj;

    invoke-direct {p3, p1, p2}, Lfsj;-><init>(Lasj;Landroid/view/View;)V

    iput-object p3, p0, Lgtj;->d:Lfsj;

    :cond_1a
    new-instance p2, Lpt;

    const/4 p3, 0x2

    invoke-direct {p2, p0, p3}, Lpt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lna3;->a(Lzrj;)V

    return-void
.end method

.method public static c(Landroid/view/View;II)Lgtj;
    .registers 4

    new-instance v0, Lrxh;

    invoke-direct {v0, p1}, Lrxh;-><init>(I)V

    const/4 p1, 0x0

    invoke-static {p0, v0, p2, p1}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object p0

    return-object p0
.end method

.method public static d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;
    .registers 13

    new-instance v0, Lgtj;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    sget-object v1, Lasj;->E:[I

    const/4 v1, 0x0

    move-object v2, p0

    move-object v3, v1

    :cond_f
    instance-of v4, v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    if-eqz v4, :cond_16

    check-cast v2, Landroid/view/ViewGroup;

    goto :goto_38

    :cond_16
    instance-of v4, v2, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_29

    invoke-virtual {v2}, Landroid/view/View;->getId()I

    move-result v3

    const v4, 0x1020002

    if-ne v3, v4, :cond_26

    check-cast v2, Landroid/view/ViewGroup;

    goto :goto_38

    :cond_26
    move-object v3, v2

    check-cast v3, Landroid/view/ViewGroup;

    :cond_29
    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v4, v2, Landroid/view/View;

    if-eqz v4, :cond_34

    check-cast v2, Landroid/view/View;

    goto :goto_35

    :cond_34
    move-object v2, v1

    :goto_35
    if-nez v2, :cond_f

    move-object v2, v3

    :goto_38
    if-eqz v2, :cond_7f

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    sget-object v4, Lasj;->E:[I

    invoke-virtual {v1, v4}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, -0x1

    invoke-virtual {v4, v5, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v7

    const/4 v8, 0x1

    invoke-virtual {v4, v8, v6}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v8

    invoke-virtual {v4}, Landroid/content/res/TypedArray;->recycle()V

    if-eq v7, v6, :cond_5e

    if-eq v8, v6, :cond_5e

    const v4, 0x7f0d02c1

    goto :goto_61

    :cond_5e
    const v4, 0x7f0d00fa

    :goto_61
    invoke-virtual {v3, v4, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/google/android/material/snackbar/SnackbarContentLayout;

    new-instance v4, Lasj;

    invoke-direct {v4, v1, v2, v3, v3}, Lasj;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/google/android/material/snackbar/SnackbarContentLayout;Lcom/google/android/material/snackbar/SnackbarContentLayout;)V

    iget-object v1, v4, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/snackbar/SnackbarContentLayout;

    iget-object v1, v1, Lcom/google/android/material/snackbar/SnackbarContentLayout;->a:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput p2, v4, Lna3;->k:I

    invoke-direct {v0, v4, p0, p3}, Lgtj;-><init>(Lasj;Landroid/view/View;Landroid/view/View;)V

    return-object v0

    :cond_7f
    const-string p0, "No suitable parent found from the given view. Please provide a valid view."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1
.end method

.method public static e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;
    .registers 4

    new-instance v0, Lqxh;

    invoke-direct {v0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    const/4 p1, 0x0

    invoke-static {p0, v0, p2, p1}, Lgtj;->d(Landroid/view/View;Lpxh;ILandroid/view/View;)Lgtj;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-boolean v0, p0, Lgtj;->e:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-boolean v0, p0, Lgtj;->e:Z

    iget-boolean v0, p0, Lgtj;->f:Z

    iget-object v1, p0, Lgtj;->a:Lasj;

    if-nez v0, :cond_29

    iget-object v0, v1, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    new-instance v2, Ltji;

    const/16 v3, 0x19

    invoke-direct {v2, p0, v3}, Ltji;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result p0

    if-eqz p0, :cond_21

    invoke-virtual {v2, v0}, Ltji;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_29

    :cond_21
    new-instance p0, Li7n;

    invoke-direct {p0, v0, v2}, Li7n;-><init>(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    :cond_29
    :goto_29
    const/4 p0, 0x3

    invoke-virtual {v1, p0}, Lna3;->b(I)V

    return-void
.end method

.method public final b(Landroid/view/View;)V
    .registers 3

    iget-object p0, p0, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {p1}, Landroid/view/View;->getZ()F

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getZ()F

    move-result v0

    add-float/2addr v0, p1

    invoke-virtual {p0, v0}, Landroid/view/View;->setZ(F)V

    return-void
.end method

.method public final f(ILandroid/view/View$OnClickListener;)V
    .registers 5

    iget-object v0, p0, Lgtj;->a:Lasj;

    iget-object v1, v0, Lna3;->h:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lasj;->i(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    if-eqz p2, :cond_f

    const/4 p1, 0x1

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    :goto_10
    iget-boolean p2, p0, Lgtj;->c:Z

    if-ne p2, p1, :cond_15

    return-void

    :cond_15
    iput-boolean p1, p0, Lgtj;->c:Z

    invoke-virtual {p0}, Lgtj;->k()V

    return-void
.end method

.method public final g(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V
    .registers 4

    iget-object v0, p0, Lgtj;->a:Lasj;

    invoke-virtual {v0, p1, p2}, Lasj;->i(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)V

    if-eqz p2, :cond_9

    const/4 p1, 0x1

    goto :goto_a

    :cond_9
    const/4 p1, 0x0

    :goto_a
    iget-boolean p2, p0, Lgtj;->c:Z

    if-ne p2, p1, :cond_f

    return-void

    :cond_f
    iput-boolean p1, p0, Lgtj;->c:Z

    invoke-virtual {p0}, Lgtj;->k()V

    return-void
.end method

.method public final h(I)V
    .registers 3

    iget-object p0, p0, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    const v0, 0x7f0a0a8e

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    instance-of v0, p0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v0, :cond_1f

    check-cast p0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->isIndeterminate()Z

    move-result v0

    if-eqz v0, :cond_1b

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lo83;->setIndeterminate(Z)V

    :cond_1b
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lo83;->g(IZ)V

    :cond_1f
    return-void
.end method

.method public final i()V
    .registers 2

    iget-object p0, p0, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    const v0, 0x7f0a0a8e

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/ProgressBar;

    if-eqz p0, :cond_13

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_13
    return-void
.end method

.method public final j()V
    .registers 9

    iget-boolean v0, p0, Lgtj;->e:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lgtj;->e:Z

    iget-object v1, p0, Lgtj;->a:Lasj;

    invoke-static {}, Li3j;->x()Li3j;

    move-result-object v2

    iget v3, v1, Lna3;->k:I

    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, -0x2

    if-eq v3, v6, :cond_24

    iget-boolean v6, v1, Lasj;->D:Z

    if-eqz v6, :cond_1b

    move v6, v5

    goto :goto_1c

    :cond_1b
    move v6, v4

    :goto_1c
    iget-object v7, v1, Lasj;->C:Landroid/view/accessibility/AccessibilityManager;

    or-int/lit8 v6, v6, 0x3

    invoke-virtual {v7, v3, v6}, Landroid/view/accessibility/AccessibilityManager;->getRecommendedTimeoutMillis(II)I

    move-result v6

    :cond_24
    iget-object v1, v1, Lna3;->w:Lka3;

    iget-object v3, v2, Li3j;->a:Ljava/lang/Object;

    monitor-enter v3

    :try_start_29
    invoke-virtual {v2, v1}, Li3j;->E(Lka3;)Z

    move-result v7

    if-eqz v7, :cond_45

    iget-object v1, v2, Li3j;->c:Ljava/lang/Object;

    check-cast v1, Lxsj;

    iput v6, v1, Lxsj;->b:I

    iget-object v4, v2, Li3j;->b:Ljava/lang/Object;

    check-cast v4, Landroid/os/Handler;

    invoke-virtual {v4, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iget-object v1, v2, Li3j;->c:Ljava/lang/Object;

    check-cast v1, Lxsj;

    invoke-virtual {v2, v1}, Li3j;->K(Lxsj;)V

    monitor-exit v3

    goto :goto_79

    :cond_45
    iget-object v7, v2, Li3j;->d:Ljava/lang/Object;

    check-cast v7, Lxsj;

    if-eqz v7, :cond_54

    iget-object v7, v7, Lxsj;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v7

    if-ne v7, v1, :cond_54

    move v4, v0

    :cond_54
    if-eqz v4, :cond_5d

    iget-object v1, v2, Li3j;->d:Ljava/lang/Object;

    check-cast v1, Lxsj;

    iput v6, v1, Lxsj;->b:I

    goto :goto_64

    :cond_5d
    new-instance v4, Lxsj;

    invoke-direct {v4, v6, v1}, Lxsj;-><init>(ILka3;)V

    iput-object v4, v2, Li3j;->d:Ljava/lang/Object;

    :goto_64
    iget-object v1, v2, Li3j;->c:Ljava/lang/Object;

    check-cast v1, Lxsj;

    if-eqz v1, :cond_72

    invoke-virtual {v2, v1, v5}, Li3j;->l(Lxsj;I)Z

    move-result v1

    if-eqz v1, :cond_72

    monitor-exit v3

    goto :goto_79

    :cond_72
    const/4 v1, 0x0

    iput-object v1, v2, Li3j;->c:Ljava/lang/Object;

    invoke-virtual {v2}, Li3j;->M()V

    monitor-exit v3
    :try_end_79
    .catchall {:try_start_29 .. :try_end_79} :catchall_84

    :goto_79
    new-instance v1, Letj;

    invoke-direct {v1, p0, v0}, Letj;-><init>(Lgtj;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void

    :goto_82
    :try_start_82
    monitor-exit v3
    :try_end_83
    .catchall {:try_start_82 .. :try_end_83} :catchall_84

    throw p0

    :catchall_84
    move-exception p0

    goto :goto_82
.end method

.method public final k()V
    .registers 4

    iget-object v0, p0, Lgtj;->b:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iget-boolean v1, p0, Lgtj;->c:Z

    if-eqz v1, :cond_e

    const v1, 0x7f07092a

    goto :goto_11

    :cond_e
    const v1, 0x7f070929

    :goto_11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object p0, p0, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    if-lez v0, :cond_21

    const/4 v2, -0x2

    goto :goto_22

    :cond_21
    const/4 v2, -0x1

    :goto_22
    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p0, v1}, Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setMinimumWidth(I)V

    return-void
.end method
