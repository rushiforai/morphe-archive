.class public Lcom/opera/android/custom_views/EmptyListView;
.super Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic e:I


# instance fields
.field public c:I

.field public d:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 8

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0120

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a0417

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/FadingScrollView;

    const v3, 0x7f0a0a5f

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/SideMarginContainer;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Luk6;

    const/16 v4, 0x14

    invoke-direct {v3, v2, v4}, Luk6;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v1, Lcom/opera/android/custom_views/SideMarginContainer;->a:Luk6;

    sget-object v1, Lkhh;->k:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x2

    :try_start_34
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/opera/android/custom_views/EmptyListView;->g(I)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/opera/android/custom_views/EmptyListView;->e(I)V

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    if-nez p2, :cond_51

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/opera/android/custom_views/EmptyListView;->f(Landroid/content/res/ColorStateList;)V
    :try_end_51
    .catchall {:try_start_34 .. :try_end_51} :catchall_55

    :cond_51
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_55
    move-exception p0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    throw p0
.end method

.method public static d(ILandroid/content/Context;I)Lcom/opera/android/custom_views/EmptyListView;
    .registers 5

    new-instance v0, Lcom/opera/android/custom_views/EmptyListView;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/opera/android/custom_views/EmptyListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/EmptyListView;->g(I)V

    invoke-virtual {v0, p2}, Lcom/opera/android/custom_views/EmptyListView;->e(I)V

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/EmptyListView;->f(Landroid/content/res/ColorStateList;)V

    return-object v0
.end method


# virtual methods
.method public final e(I)V
    .registers 3

    iget v0, p0, Lcom/opera/android/custom_views/EmptyListView;->c:I

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lcom/opera/android/custom_views/EmptyListView;->c:I

    if-eqz p1, :cond_12

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_13

    :cond_12
    const/4 p1, 0x0

    :goto_13
    const v0, 0x7f0a0608

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final f(Landroid/content/res/ColorStateList;)V
    .registers 4

    const v0, 0x7f0a0608

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    if-nez p1, :cond_1c

    iget-boolean p1, p0, Lcom/opera/android/custom_views/EmptyListView;->d:Z

    if-eqz p1, :cond_10

    return-void

    :cond_10
    new-instance p1, Lp73;

    const/4 v1, 0x1

    invoke-direct {p1, v0, v1}, Lp73;-><init>(Lcom/opera/android/custom_views/StylingImageView;B)V

    invoke-static {v0, p1}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iput-boolean v1, p0, Lcom/opera/android/custom_views/EmptyListView;->d:Z

    return-void

    :cond_1c
    invoke-virtual {v0, p1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final g(I)V
    .registers 3

    const v0, 0x7f0a0609

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p1, :cond_f

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void

    :cond_f
    const-string p1, ""

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
