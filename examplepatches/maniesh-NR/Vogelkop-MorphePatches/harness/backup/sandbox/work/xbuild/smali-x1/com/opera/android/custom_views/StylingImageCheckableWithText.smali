.class public final Lcom/opera/android/custom_views/StylingImageCheckableWithText;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Checkable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/custom_views/StylingImageCheckableWithText;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Landroid/widget/Checkable;",
        "pjk",
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


# static fields
.field public static final x:[I


# instance fields
.field public final p:Lov0;

.field public q:Landroid/animation/ValueAnimator;

.field public r:Landroid/animation/ValueAnimator;

.field public s:I

.field public t:Z

.field public u:Z

.field public v:I

.field public w:Lpjk;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x10100a0

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->x:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d00c4

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a0203

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v3, 0x0

    if-eqz v2, :cond_89

    const v1, 0x7f0a069d

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_89

    new-instance v1, Lov0;

    const/16 v5, 0x8

    invoke-direct {v1, p0, v2, v4, v5}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->p:Lov0;

    sget-object v1, Lkhh;->M:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x3

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    if-nez p2, :cond_40

    move-object v1, v3

    :cond_40
    if-eqz v1, :cond_49

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result p2

    invoke-virtual {v2, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :cond_49
    const/4 p2, 0x2

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    if-eqz p2, :cond_55

    move-object v3, v1

    :cond_55
    if-eqz v3, :cond_5e

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result p2

    invoke-virtual {v2, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    :cond_5e
    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    if-eqz p2, :cond_68

    invoke-virtual {v2, p2}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    :cond_68
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_72

    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_72
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    if-eqz p2, :cond_7b

    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_7b
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p1, Lh4i;

    const/16 p2, 0xe

    invoke-direct {p1, p0, p2}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_89
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v3
.end method


# virtual methods
.method public final isChecked()Z
    .registers 1

    iget-boolean p0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u:Z

    return p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r()V

    return-void
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u:Z

    if-eqz v0, :cond_11

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->x:[I

    invoke-static {p0, p1}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    move-result-object p0

    return-object p0

    :cond_11
    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    return-object p0
.end method

.method public final onDetachedFromWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r()V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 8

    invoke-super {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;->onMeasure(II)V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p2

    const/high16 v0, -0x80000000

    if-ne p2, v0, :cond_6e

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f07097f

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iget-object v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->p:Lov0;

    iget-object v1, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    iget-object v2, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    instance-of v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;

    const/4 v4, 0x0

    if-eqz v3, :cond_34

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v1

    goto :goto_35

    :cond_34
    move v1, v4

    :goto_35
    add-int/2addr p2, v1

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_49

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v0}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v0

    goto :goto_4a

    :cond_49
    move v0, v4

    :goto_4a
    add-int/2addr p2, v0

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_5a

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v0}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v0

    goto :goto_5b

    :cond_5a
    move v0, v4

    :goto_5b
    add-int/2addr p2, v0

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v1, :cond_6a

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v0}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v4

    :cond_6a
    add-int/2addr p2, v4

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->v:I

    :cond_6e
    return-void
.end method

.method public final r()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->q:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->q:Landroid/animation/ValueAnimator;

    iget-object v1, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_11
    iput-object v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r:Landroid/animation/ValueAnimator;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->t:Z

    return-void
.end method

.method public final s()V
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r()V

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->p:Lov0;

    iget-object v0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lov0;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/4 v1, 0x0

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final setChecked(Z)V
    .registers 8

    iget-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u:Z

    if-eq p1, v0, :cond_65

    iput-boolean p1, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u:Z

    iget-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->t:Z

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->p:Lov0;

    if-eqz p1, :cond_4d

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->s()V

    goto :goto_52

    :cond_13
    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->r()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->t:Z

    iget v3, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->s:I

    if-nez v3, :cond_2e

    iget-object v3, v2, Lov0;->d:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, v1, v1}, Landroid/view/View;->measure(II)V

    iget-object v3, v2, Lov0;->d:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    iput v3, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->s:I

    :cond_2e
    iget-object v3, v2, Lov0;->d:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/view/View;->setVisibility(I)V

    iget v3, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->s:I

    iget v4, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->v:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    new-instance v4, Lug5;

    const/4 v5, 0x3

    invoke-direct {v4, p0, v3, v5}, Lug5;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p0, v1, v3, v4, v0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->t(IILkotlin/jvm/functions/Function0;Z)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->q:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_52

    :cond_4d
    if-eqz v0, :cond_52

    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->s()V

    :cond_52
    :goto_52
    iget-object v0, v2, Lov0;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    new-instance v2, Lojk;

    invoke-direct {v2, p0, v1}, Lojk;-><init>(Lcom/opera/android/custom_views/StylingImageCheckableWithText;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->w:Lpjk;

    if-eqz p0, :cond_65

    invoke-interface {p0, p1}, Lpjk;->c(Z)V

    :cond_65
    return-void
.end method

.method public final t(IILkotlin/jvm/functions/Function0;Z)Landroid/animation/ValueAnimator;
    .registers 8

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_2c

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    if-eqz p4, :cond_f

    sget-object p4, Llf1;->d:Landroid/view/animation/DecelerateInterpolator;

    goto :goto_11

    :cond_f
    sget-object p4, Llf1;->a:Landroid/view/animation/AccelerateDecelerateInterpolator;

    :goto_11
    invoke-virtual {v0, p4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance p4, Llxe;

    invoke-direct {p4, p1, p2, p0}, Llxe;-><init>(IILcom/opera/android/custom_views/StylingImageCheckableWithText;)V

    invoke-virtual {v0, p4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance p0, Laqj;

    const/4 p1, 0x1

    invoke-direct {p0, p3, p1}, Laqj;-><init>(Lkotlin/jvm/functions/Function0;B)V

    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-object v0

    nop

    :array_2c
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final toggle()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u:Z

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->setChecked(Z)V

    return-void
.end method

.method public final u(Z)V
    .registers 4

    iput-boolean p1, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u:Z

    iget-object p1, p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->p:Lov0;

    iget-object p1, p1, Lov0;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    new-instance v0, Lojk;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lojk;-><init>(Lcom/opera/android/custom_views/StylingImageCheckableWithText;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method
