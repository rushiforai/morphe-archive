.class public final Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;",
        "Landroid/widget/LinearLayout;",
        "xkf",
        "catalog"
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
.field public final a:Lei;

.field public b:I

.field public c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 15
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const v0, 0x7f04076d

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d030d

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a01ae

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Landroid/widget/LinearLayout;

    if-eqz v5, :cond_93

    const v1, 0x7f0a026e

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_93

    const v1, 0x7f0a0322

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Landroid/widget/ImageView;

    if-eqz v7, :cond_93

    const v1, 0x7f0a06b5

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Landroid/widget/TextView;

    if-eqz v8, :cond_93

    const v1, 0x7f0a074b

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/google/android/material/button/MaterialButton;

    if-eqz v9, :cond_93

    const v1, 0x7f0a084d

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/google/android/material/button/MaterialButton;

    if-eqz v10, :cond_93

    const v1, 0x7f0a06c5

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroid/widget/TextView;

    if-eqz v11, :cond_93

    new-instance v3, Lei;

    move-object v4, p0

    invoke-direct/range {v3 .. v11}, Lei;-><init>(Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Landroid/widget/TextView;)V

    iput-object v3, v4, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    const/4 p0, 0x0

    invoke-virtual {v4, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    const v1, 0x7f0809a6

    invoke-virtual {v4, v1}, Landroid/view/View;->setBackgroundResource(I)V

    new-instance v1, Lixh;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-direct {v1, v2}, Lixh;-><init>(F)V

    invoke-virtual {v1, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v4, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    sget-object v1, Lxkf;->b:Lj06;

    sget-object v2, Lohh;->a:[I

    invoke-virtual {p1, p2, v2, v0, p0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v4, p0}, Lj06;->h(Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;Landroid/content/res/TypedArray;)V

    return-void

    :cond_93
    move-object v4, p0

    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p0, p0, Lei;->i:Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final b(Landroid/view/View$OnClickListener;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p0, p0, Lei;->g:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final c()V
    .registers 7

    iget-object p0, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object v0, p0, Lei;->f:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    iget-object v1, p0, Lei;->g:Landroid/view/View;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v2, p0, Lei;->f:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-nez v0, :cond_1d

    move v5, v4

    goto :goto_1e

    :cond_1d
    move v5, v3

    :goto_1e
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2d

    move v5, v4

    goto :goto_2e

    :cond_2d
    move v5, v3

    :goto_2e
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lei;->c:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_39

    if-nez v2, :cond_3a

    :cond_39
    move v3, v4

    :cond_3a
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object p2, p1, Lei;->e:Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    if-nez p2, :cond_35

    iget-object p2, p1, Lei;->e:Landroid/view/View;

    check-cast p2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p3

    iget p4, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b:I

    add-int/2addr p3, p4

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p4

    sub-int/2addr p3, p4

    invoke-virtual {p2, p3}, Landroid/view/View;->offsetTopAndBottom(I)V

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    iget p0, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->c:I

    add-int/2addr p2, p0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p0

    sub-int/2addr p2, p0

    invoke-virtual {p1, p2}, Landroid/view/View;->offsetTopAndBottom(I)V

    :cond_35
    return-void
.end method

.method public final onMeasure(II)V
    .registers 8

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b:I

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->c:I

    iget-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object v1, v0, Lei;->e:Landroid/view/View;

    check-cast v1, Landroid/widget/ImageView;

    iget-object v2, v0, Lei;->e:Landroid/view/View;

    check-cast v2, Landroid/widget/ImageView;

    iget-object v3, v0, Lei;->h:Landroid/view/View;

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_80

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_27

    iget-object v1, v0, Lei;->i:Landroid/view/View;

    move-object v3, v1

    check-cast v3, Landroid/widget/TextView;

    :cond_27
    invoke-virtual {v3}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v1

    if-eqz v1, :cond_80

    invoke-virtual {v1, p1}, Landroid/text/Layout;->getLineTop(I)I

    move-result v3

    invoke-virtual {v1, p1}, Landroid/text/Layout;->getLineBottom(I)I

    move-result v1

    add-int/2addr v1, v3

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    sub-int v4, v1, v3

    invoke-static {p1, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    iput v4, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b:I

    sub-int/2addr v3, v1

    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->c:I

    iget p1, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->b:I

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v1, p1

    iget p1, p0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->c:I

    iget-object v0, v0, Lei;->d:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    add-int/2addr v0, p1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    add-int/2addr v0, p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result p1

    add-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getSuggestedMinimumHeight()I

    move-result v1

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {p1, p2}, Landroid/view/View;->resolveSize(II)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    :cond_80
    return-void
.end method
