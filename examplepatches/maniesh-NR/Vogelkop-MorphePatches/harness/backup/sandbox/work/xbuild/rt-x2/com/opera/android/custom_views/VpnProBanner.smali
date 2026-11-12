.class public final Lcom/opera/android/custom_views/VpnProBanner;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/custom_views/VpnProBanner;",
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


# static fields
.field public static final synthetic q:I


# instance fields
.field public final p:Lpt1;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 14
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0468

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a0102

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v5, v2

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    const/4 v2, 0x0

    if-eqz v5, :cond_f4

    const v1, 0x7f0a0231

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v6, :cond_f4

    const v1, 0x7f0a056f

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v7, :cond_f4

    const v3, 0x7f0a06b5

    invoke-static {v3, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_f1

    const v3, 0x7f0a06c5

    invoke-static {v3, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_f1

    new-instance v3, Lpt1;

    const/16 v10, 0x1c

    move-object v4, p0

    invoke-direct/range {v3 .. v10}, Lpt1;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/lang/Object;Landroid/view/View;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;B)V

    iput-object v3, v4, Lcom/opera/android/custom_views/VpnProBanner;->p:Lpt1;

    const/high16 p0, 0x60000

    invoke-virtual {v4, p0}, Landroid/view/ViewGroup;->setDescendantFocusability(I)V

    new-instance p0, Le73;

    const/16 v3, 0xf

    invoke-direct {p0, v4, p1, v3}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v4}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_6a

    invoke-static {p1, v4, p0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_6a
    invoke-virtual {p0, v4}, Le73;->a(Landroid/view/View;)V

    if-eqz p2, :cond_f0

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    sget-object p1, Lkhh;->W:[I

    invoke-virtual {p0, p2, p1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_86

    invoke-virtual {p0, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_86
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_9e

    invoke-virtual {p0, p1, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    if-eqz p2, :cond_9b

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {p2, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :cond_9b
    invoke-virtual {v7, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_9e
    const/4 p2, 0x2

    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_b5

    invoke-virtual {p0, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Ljo5;

    invoke-virtual {v2, p2, p2, p2, p2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    invoke-virtual {v7, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_b5
    const/4 p2, 0x3

    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_d1

    invoke-virtual {p0, p2, p1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    new-instance v2, Lso5;

    invoke-direct {v2}, Lso5;-><init>()V

    invoke-virtual {v2, v4}, Lso5;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    if-nez p1, :cond_cb

    const/4 v0, -0x1

    :cond_cb
    invoke-virtual {v2, v1, p2, v0, p2}, Lso5;->e(IIII)V

    invoke-virtual {v2, v4}, Lso5;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    :cond_d1
    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_df

    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v8, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_df
    const/4 p1, 0x5

    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_ed

    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Lcom/opera/android/custom_views/VpnProBanner;->r(Ljava/lang/String;)V

    :cond_ed
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    :cond_f0
    return-void

    :cond_f1
    move-object v4, p0

    move v1, v3

    goto :goto_f5

    :cond_f4
    move-object v4, p0

    :goto_f5
    invoke-virtual {v4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v2
.end method


# virtual methods
.method public final r(Ljava/lang/String;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/custom_views/VpnProBanner;->p:Lpt1;

    iget-object p0, p0, Lpt1;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {p0, p1}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    return-void
.end method
