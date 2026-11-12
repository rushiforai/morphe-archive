.class public final Lcom/opera/android/custom_views/OrientationFitConstraintLayout;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/custom_views/OrientationFitConstraintLayout;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public p:Landroid/view/View;

.field public q:Landroid/view/View;

.field public final r:I

.field public final s:I

.field public final t:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    if-eqz p2, :cond_35

    sget-object v1, Lkhh;->x:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_18

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->s:I

    :cond_18
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_25

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->r:I

    :cond_25
    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->t:Z

    :cond_32
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_35
    return-void
.end method


# virtual methods
.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->r(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_b

    return-void

    :cond_b
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->p:Landroid/view/View;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->r(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public final r(Landroid/content/res/Configuration;)V
    .registers 9

    new-instance v0, Lso5;

    invoke-direct {v0}, Lso5;-><init>()V

    invoke-virtual {v0, p0}, Lso5;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    invoke-static {}, Li0l;->g()Z

    move-result v1

    const/4 v2, 0x7

    const/4 v3, 0x6

    const/4 v6, 0x0

    if-nez v1, :cond_96

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lr9n;->B(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_96

    iget v1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v4, 0x1

    if-eq v1, v4, :cond_96

    iget p1, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v1, 0x258

    if-lt p1, v1, :cond_96

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->p:Landroid/view/View;

    iget-boolean v1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->t:Z

    if-eqz v1, :cond_59

    if-nez p1, :cond_2f

    move-object p1, v6

    :cond_2f
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    iget-object v1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    if-nez v1, :cond_38

    move-object v1, v6

    :cond_38
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, p1, v3, v1, v2}, Lso5;->e(IIII)V

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    if-nez p1, :cond_44

    move-object p1, v6

    :cond_44
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->p:Landroid/view/View;

    if-nez p1, :cond_4d

    move-object p1, v6

    :cond_4d
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    const/4 v4, 0x6

    iget v5, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->s:I

    const/4 v2, 0x7

    invoke-virtual/range {v0 .. v5}, Lso5;->f(IIIII)V

    goto :goto_85

    :cond_59
    if-nez p1, :cond_5c

    move-object p1, v6

    :cond_5c
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    iget-object v1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    if-nez v1, :cond_65

    move-object v1, v6

    :cond_65
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    invoke-virtual {v0, p1, v2, v1, v3}, Lso5;->e(IIII)V

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    if-nez p1, :cond_71

    move-object p1, v6

    :cond_71
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->p:Landroid/view/View;

    if-nez p1, :cond_7a

    move-object p1, v6

    :cond_7a
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v3

    const/4 v4, 0x7

    iget v5, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->s:I

    const/4 v2, 0x6

    invoke-virtual/range {v0 .. v5}, Lso5;->f(IIIII)V

    :goto_85
    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    if-eqz p1, :cond_8a

    move-object v6, p1

    :cond_8a
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v2, 0x3

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lso5;->f(IIIII)V

    goto :goto_e8

    :cond_96
    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->p:Landroid/view/View;

    if-nez p1, :cond_9b

    move-object p1, v6

    :cond_9b
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v3, v1, v3}, Lso5;->e(IIII)V

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->p:Landroid/view/View;

    if-nez p1, :cond_a8

    move-object p1, v6

    :cond_a8
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    invoke-virtual {v0, p1, v2, v1, v2}, Lso5;->e(IIII)V

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    if-nez p1, :cond_b4

    move-object p1, v6

    :cond_b4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x6

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lso5;->f(IIIII)V

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    if-nez p1, :cond_c4

    move-object p1, v6

    :cond_c4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v4, 0x7

    const/4 v5, 0x0

    const/4 v2, 0x7

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lso5;->f(IIIII)V

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->q:Landroid/view/View;

    if-nez p1, :cond_d4

    move-object p1, v6

    :cond_d4
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    iget-object p1, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->p:Landroid/view/View;

    if-eqz p1, :cond_dd

    move-object v6, p1

    :cond_dd
    invoke-virtual {v6}, Landroid/view/View;->getId()I

    move-result v3

    const/4 v4, 0x4

    iget v5, p0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;->r:I

    const/4 v2, 0x3

    invoke-virtual/range {v0 .. v5}, Lso5;->f(IIIII)V

    :goto_e8
    invoke-virtual {v0, p0}, Lso5;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    return-void
.end method
