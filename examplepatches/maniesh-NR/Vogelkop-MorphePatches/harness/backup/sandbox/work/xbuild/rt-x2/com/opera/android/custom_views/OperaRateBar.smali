.class public final Lcom/opera/android/custom_views/OperaRateBar;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Lcom/opera/android/custom_views/OperaRateBar;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Landroid/view/View$OnClickListener;",
        "kjh",
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
.field public static final synthetic u:I


# instance fields
.field public final p:I

.field public q:I

.field public final r:I

.field public final s:Ljava/util/ArrayList;

.field public final t:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 13
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 v1, 0x5

    iput v1, p0, Lcom/opera/android/custom_views/OperaRateBar;->p:I

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/opera/android/custom_views/OperaRateBar;->s:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/opera/android/custom_views/OperaRateBar;->t:Ljava/util/ArrayList;

    sget-object v2, Lkhh;->w:[I

    invoke-virtual {p1, p2, v2, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_27

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Lcom/opera/android/custom_views/OperaRateBar;->p:I

    :cond_27
    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_34

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lcom/opera/android/custom_views/OperaRateBar;->r:I

    :cond_34
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    move v2, v0

    :goto_3d
    if-ge v2, v1, :cond_ae

    new-instance v3, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setId(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f080977

    invoke-virtual {v4, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3}, Landroid/view/View;->getId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v4, p0, Lcom/opera/android/custom_views/OperaRateBar;->s:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Ljo5;

    invoke-direct {v4, v0, v0}, Ljo5;-><init>(II)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const/high16 v6, 0x42200000    # 40.0f

    invoke-static {v6, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v6, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v5

    iput v5, v4, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance v4, Lhz0;

    const/4 v5, 0x4

    invoke-direct {v4, p0, v5}, Lhz0;-><init>(Landroid/view/View$OnClickListener;B)V

    invoke-static {v3}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v5

    if-eqz v5, :cond_a8

    invoke-static {v5, v3, v4}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_a8
    invoke-virtual {v4, v3}, Lhz0;->a(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_3d

    :cond_ae
    new-instance v3, Lso5;

    invoke-direct {v3}, Lso5;-><init>()V

    invoke-virtual {v3, p0}, Lso5;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->j0(Ljava/util/ArrayList;)[I

    move-result-object p1

    array-length v1, p1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_fd

    aget v1, p1, v0

    invoke-virtual {v3, v1}, Lso5;->i(I)Lno5;

    move-result-object v1

    iget-object v1, v1, Lno5;->d:Loo5;

    iput v0, v1, Loo5;->V:I

    aget v4, p1, v0

    const/4 v8, -0x1

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v7, 0x6

    invoke-virtual/range {v3 .. v8}, Lso5;->f(IIIII)V

    move v0, p2

    :goto_d2
    array-length v1, p1

    const/4 v7, 0x7

    if-ge v0, v1, :cond_ee

    aget v4, p1, v0

    add-int/lit8 v1, v0, -0x1

    aget v6, p1, v1

    const/4 v8, -0x1

    invoke-virtual/range {v3 .. v8}, Lso5;->f(IIIII)V

    aget v4, p1, v1

    aget v6, p1, v0

    move v9, v7

    move v7, v5

    move v5, v9

    invoke-virtual/range {v3 .. v8}, Lso5;->f(IIIII)V

    move v5, v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_d2

    :cond_ee
    array-length v0, p1

    sub-int/2addr v0, p2

    aget v4, p1, v0

    const/4 v8, -0x1

    const/4 v6, 0x0

    move v5, v7

    const/4 v7, 0x7

    invoke-virtual/range {v3 .. v8}, Lso5;->f(IIIII)V

    invoke-virtual {v3, p0}, Lso5;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    return-void

    :cond_fd
    const-string p0, "must have 2 or more widgets in a chain"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/OperaRateBar;->s:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/OperaRateBar;->r(I)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    iget v0, p0, Lcom/opera/android/custom_views/OperaRateBar;->r:I

    if-lez v0, :cond_a

    invoke-virtual {p0, v0}, Lcom/opera/android/custom_views/OperaRateBar;->r(I)V

    :cond_a
    return-void
.end method

.method public final r(I)V
    .registers 11

    iget v0, p0, Lcom/opera/android/custom_views/OperaRateBar;->q:I

    if-eq p1, v0, :cond_8b

    iput p1, p0, Lcom/opera/android/custom_views/OperaRateBar;->q:I

    iget-object v0, p0, Lcom/opera/android/custom_views/OperaRateBar;->s:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    :goto_f
    const/4 v5, 0x1

    if-ge v4, v1, :cond_2d

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v7, v3, 0x1

    if-ltz v3, :cond_28

    check-cast v6, Landroid/view/View;

    iget v8, p0, Lcom/opera/android/custom_views/OperaRateBar;->q:I

    if-lt v3, v8, :cond_23

    move v5, v2

    :cond_23
    invoke-virtual {v6, v5}, Landroid/view/View;->setSelected(Z)V

    move v3, v7

    goto :goto_f

    :cond_28
    invoke-static {}, Lj95;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_2d
    iget-object p0, p0, Lcom/opera/android/custom_views/OperaRateBar;->t:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v1, v2

    :goto_34
    if-ge v1, v0, :cond_8b

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Lkjh;

    iget-byte v4, v3, Lkjh;->a:B

    packed-switch v4, :pswitch_data_8c

    iget-object v3, v3, Lkjh;->b:Lwjh;

    iget-object v4, v3, Lwjh;->f:Ljava/lang/Object;

    check-cast v4, Lvjh;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v4, v4, Lvjh;->a:Lujh;

    new-instance v7, Lvjh;

    invoke-direct {v7, v4, v6}, Lvjh;-><init>(Lujh;Ljava/lang/Integer;)V

    iput-object v7, v3, Lwjh;->f:Ljava/lang/Object;

    iget-object v3, v3, Lwjh;->c:Ljava/lang/Object;

    check-cast v3, Lpde;

    if-lez p1, :cond_5e

    move v4, v5

    goto :goto_5f

    :cond_5e
    move v4, v2

    :goto_5f
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    goto :goto_34

    :pswitch_67
    iget-object v3, v3, Lkjh;->b:Lwjh;

    iget-object v4, v3, Lwjh;->f:Ljava/lang/Object;

    check-cast v4, Lvjh;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget-object v4, v4, Lvjh;->a:Lujh;

    new-instance v7, Lvjh;

    invoke-direct {v7, v4, v6}, Lvjh;-><init>(Lujh;Ljava/lang/Integer;)V

    iput-object v7, v3, Lwjh;->f:Ljava/lang/Object;

    iget-object v3, v3, Lwjh;->c:Ljava/lang/Object;

    check-cast v3, Lpde;

    if-lez p1, :cond_82

    move v4, v5

    goto :goto_83

    :cond_82
    move v4, v2

    :goto_83
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v3, v4}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    goto :goto_34

    :cond_8b
    return-void

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_67
    .end packed-switch
.end method
