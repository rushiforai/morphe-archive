.class public Lcom/opera/android/settings/SettingsStatisticView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/drawable/Drawable;

.field public final b:Landroid/graphics/drawable/Drawable;

.field public final c:Ljava/lang/String;

.field public final d:Lx9j;

.field public final e:Lw9j;

.field public final f:Lq5g;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d0392

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a01c8

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const/4 v3, 0x0

    if-eqz v2, :cond_96

    const v1, 0x7f0a0563

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_96

    new-instance v1, Lq5g;

    const/4 v5, 0x5

    invoke-direct {v1, p0, v2, v4, v5}, Lq5g;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    const/high16 v2, 0x41800000    # 16.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v2, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    const/high16 v4, 0x41400000    # 12.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-static {v4, v5}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v4

    invoke-virtual {p0, v2, v4, v2, v4}, Landroid/view/View;->setPadding(IIII)V

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/16 v4, 0x10

    invoke-virtual {p0, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    sget-object v5, Lkhh;->F:[I

    invoke-virtual {p1, p2, v5, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 v5, 0x2

    invoke-virtual {p2, v5, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v5

    if-nez v5, :cond_65

    move-object v5, v3

    goto :goto_69

    :cond_65
    invoke-static {v5, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    :goto_69
    iput-object v5, p0, Lcom/opera/android/settings/SettingsStatisticView;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-eqz v2, :cond_75

    invoke-static {v2, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_75
    iput-object v3, p0, Lcom/opera/android/settings/SettingsStatisticView;->b:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/settings/SettingsStatisticView;->c:Ljava/lang/String;

    const/4 p1, 0x3

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p2, Lx9j;

    invoke-direct {p2, v1, v4}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput p1, p2, Lx9j;->c:I

    iput-object p2, p0, Lcom/opera/android/settings/SettingsStatisticView;->d:Lx9j;

    new-instance p1, Lw9j;

    invoke-direct {p1, v1, v4}, Ln1;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/settings/SettingsStatisticView;->e:Lw9j;

    return-void

    :cond_96
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
.method public final a(Landroid/content/Context;)V
    .registers 9

    invoke-virtual {p0}, Landroid/view/View;->isActivated()Z

    move-result v0

    if-eqz v0, :cond_9

    iget-object p0, p0, Lcom/opera/android/settings/SettingsStatisticView;->d:Lx9j;

    goto :goto_b

    :cond_9
    iget-object p0, p0, Lcom/opera/android/settings/SettingsStatisticView;->e:Lw9j;

    :goto_b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const v0, 0x7f040852

    invoke-static {v0, p1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, p1}, Ln1;->N(Landroid/content/Context;)I

    move-result v2

    invoke-static {v1, v2}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    iget-object v2, p0, Ln1;->b:Ljava/lang/Object;

    check-cast v2, Lq5g;

    iget-object v3, v2, Lq5g;->b:Landroid/view/ViewGroup;

    check-cast v3, Lcom/opera/android/settings/SettingsStatisticView;

    iget-object v4, v2, Lq5g;->d:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    const v5, 0x7f0406a7

    const v6, 0x7f060f8d

    invoke-static {v5, p1, v6}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v5

    new-instance v6, Landroid/graphics/drawable/RippleDrawable;

    invoke-direct {v6, v5, v1, v0}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v6}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, p1}, Ln1;->E0(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, v4, Lcom/opera/android/custom_views/StylingTextView;->i:Lzg;

    iget-object v0, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_63

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Ln1;->s0(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    :cond_63
    iget-object v0, v2, Lq5g;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Ln1;->E0(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    iget-object v0, p0, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    iget-object v1, v0, Lq5g;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/opera/android/settings/SettingsStatisticView;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/view/View;->isActivated()Z

    move-result v1

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_1b

    iget-object v1, p0, Lcom/opera/android/settings/SettingsStatisticView;->a:Landroid/graphics/drawable/Drawable;

    goto :goto_1d

    :cond_1b
    iget-object v1, p0, Lcom/opera/android/settings/SettingsStatisticView;->b:Landroid/graphics/drawable/Drawable;

    :goto_1d
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsStatisticView;->a(Landroid/content/Context;)V

    return-void
.end method

.method public final setActivated(Z)V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->isActivated()Z

    move-result v0

    invoke-super {p0, p1}, Landroid/view/View;->setActivated(Z)V

    if-eq p1, v0, :cond_21

    iget-object v0, p0, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz p1, :cond_14

    iget-object p1, p0, Lcom/opera/android/settings/SettingsStatisticView;->a:Landroid/graphics/drawable/Drawable;

    goto :goto_16

    :cond_14
    iget-object p1, p0, Lcom/opera/android/settings/SettingsStatisticView;->b:Landroid/graphics/drawable/Drawable;

    :goto_16
    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsStatisticView;->a(Landroid/content/Context;)V

    :cond_21
    return-void
.end method
