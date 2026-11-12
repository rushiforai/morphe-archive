.class public Lcom/opera/android/menu/CustomMenuItemView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lrtd;


# static fields
.field public static final synthetic f:I


# instance fields
.field public a:Lcom/opera/android/custom_views/StylingImageView;

.field public b:Lcom/opera/android/custom_views/StylingTextView;

.field public c:Lcom/opera/android/custom_views/StylingTextView;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/menu/CustomMenuItemView;->e:Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/menu/CustomMenuItemView;->d:Z

    return-void
.end method

.method public final b(Landroid/graphics/drawable/Drawable;)V
    .registers 7

    const/4 v0, 0x0

    if-nez p1, :cond_9

    iget-object p0, p0, Lcom/opera/android/menu/CustomMenuItemView;->b:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v0, v0}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lf03;->q(Landroid/content/Context;)I

    move-result v1

    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object p0, p0, Lcom/opera/android/menu/CustomMenuItemView;->b:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final c(Lptd;)V
    .registers 10

    iget-object v0, p1, Lptd;->e:Ljava/lang/CharSequence;

    iget-object v1, p0, Lcom/opera/android/menu/CustomMenuItemView;->b:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lptd;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/menu/CustomMenuItemView;->a:Lcom/opera/android/custom_views/StylingImageView;

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-eqz v0, :cond_18

    iget-boolean v4, p0, Lcom/opera/android/menu/CustomMenuItemView;->d:Z

    if-eqz v4, :cond_18

    move v4, v3

    goto :goto_19

    :cond_18
    move v4, v2

    :goto_19
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    const/4 v1, 0x0

    if-nez v0, :cond_25

    iget-object v0, p0, Lcom/opera/android/menu/CustomMenuItemView;->a:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_3d

    :cond_25
    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    invoke-direct {v4, v3, v3, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v4, p0, Lcom/opera/android/menu/CustomMenuItemView;->a:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v4, v0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/opera/android/menu/CustomMenuItemView;->d()V

    :goto_3d
    invoke-virtual {p1}, Lptd;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_52

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v4, 0x7f080512

    invoke-static {v4, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/android/menu/CustomMenuItemView;->b(Landroid/graphics/drawable/Drawable;)V

    goto :goto_55

    :cond_52
    invoke-virtual {p0, v1}, Lcom/opera/android/menu/CustomMenuItemView;->b(Landroid/graphics/drawable/Drawable;)V

    :goto_55
    iget-object v0, p0, Lcom/opera/android/menu/CustomMenuItemView;->c:Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v0, :cond_a9

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->keyboard:I

    const/4 v4, 0x2

    if-ne v0, v4, :cond_99

    iget-object v0, p1, Lptd;->D:Ljwf;

    if-eqz v0, :cond_8e

    iget p1, p1, Lptd;->a:I

    invoke-static {}, Lqwf;->values()[Lqwf;

    move-result-object v0

    array-length v4, v0

    move v5, v3

    :goto_76
    if-ge v5, v4, :cond_8e

    aget-object v6, v0, v5

    iget v7, v6, Lqwf;->a:I

    if-ne v7, p1, :cond_8b

    invoke-static {v6}, Lqwf;->k(Lqwf;)Z

    move-result v7

    if-eqz v7, :cond_8b

    invoke-static {v6}, Lkwf;->r(Lqwf;)Lz16;

    move-result-object p1

    iget p1, p1, Lz16;->e:I

    goto :goto_8f

    :cond_8b
    add-int/lit8 v5, v5, 0x1

    goto :goto_76

    :cond_8e
    move p1, v3

    :goto_8f
    if-eqz p1, :cond_99

    invoke-static {}, Lc37;->r()Lc37;

    move-result-object v0

    invoke-virtual {v0, p1}, Lc37;->v(I)Ljava/lang/String;

    move-result-object v1

    :cond_99
    iget-object p1, p0, Lcom/opera/android/menu/CustomMenuItemView;->c:Lcom/opera/android/custom_views/StylingTextView;

    if-nez v1, :cond_a1

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_a1
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lcom/opera/android/menu/CustomMenuItemView;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_a9
    return-void
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/menu/CustomMenuItemView;->a:Lcom/opera/android/custom_views/StylingImageView;

    iget-boolean v1, p0, Lcom/opera/android/menu/CustomMenuItemView;->e:Z

    if-eqz v1, :cond_f

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_10

    :cond_f
    const/4 p0, 0x0

    :goto_10
    invoke-virtual {v0, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a02ab

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iput-object v0, p0, Lcom/opera/android/menu/CustomMenuItemView;->a:Lcom/opera/android/custom_views/StylingImageView;

    const v0, 0x7f0a02ae

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iput-object v0, p0, Lcom/opera/android/menu/CustomMenuItemView;->b:Lcom/opera/android/custom_views/StylingTextView;

    const v0, 0x7f0a02ac

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iput-object v0, p0, Lcom/opera/android/menu/CustomMenuItemView;->c:Lcom/opera/android/custom_views/StylingTextView;

    new-instance v0, Lpc5;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lpc5;-><init>(Ljava/lang/Object;B)V

    sget-object v2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_39

    invoke-static {v2, p0, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_39
    new-instance v0, Lw53;

    invoke-direct {v0, p0, v1}, Lw53;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    return-void
.end method
