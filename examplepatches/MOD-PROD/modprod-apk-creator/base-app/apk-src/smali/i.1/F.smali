.class public final Li/F;
.super Landroid/widget/RadioButton;
.source "SourceFile"


# instance fields
.field public final a:LL/e;

.field public final b:Li/q;

.field public final c:Li/Z;

.field public d:Li/y;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-static {p1}, Li/T0;->a(Landroid/content/Context;)V

    const v0, 0x7f0300d7

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p0, p1}, Li/S0;->a(Landroid/view/View;Landroid/content/Context;)V

    new-instance p1, LL/e;

    invoke-direct {p1, p0}, LL/e;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Li/F;->a:LL/e;

    invoke-virtual {p1, p2, v0}, LL/e;->d(Landroid/util/AttributeSet;I)V

    new-instance p1, Li/q;

    invoke-direct {p1, p0}, Li/q;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Li/F;->b:Li/q;

    invoke-virtual {p1, p2, v0}, Li/q;->d(Landroid/util/AttributeSet;I)V

    new-instance p1, Li/Z;

    invoke-direct {p1, p0}, Li/Z;-><init>(Landroid/widget/TextView;)V

    iput-object p1, p0, Li/F;->c:Li/Z;

    invoke-virtual {p1, p2, v0}, Li/Z;->f(Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Li/F;->getEmojiTextViewHelper()Li/y;

    move-result-object p1

    invoke-virtual {p1, p2, v0}, Li/y;->a(Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private getEmojiTextViewHelper()Li/y;
    .locals 1

    iget-object v0, p0, Li/F;->d:Li/y;

    if-nez v0, :cond_0

    new-instance v0, Li/y;

    invoke-direct {v0, p0}, Li/y;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Li/F;->d:Li/y;

    :cond_0
    iget-object v0, p0, Li/F;->d:Li/y;

    return-object v0
.end method


# virtual methods
.method public final drawableStateChanged()V
    .locals 1

    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    iget-object v0, p0, Li/F;->b:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Li/q;->a()V

    :cond_0
    iget-object v0, p0, Li/F;->c:Li/Z;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Li/Z;->b()V

    :cond_1
    return-void
.end method

.method public getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .locals 1

    iget-object v0, p0, Li/F;->b:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Li/q;->b()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    iget-object v0, p0, Li/F;->b:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Li/q;->c()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportButtonTintList()Landroid/content/res/ColorStateList;
    .locals 1

    iget-object v0, p0, Li/F;->a:LL/e;

    if-eqz v0, :cond_0

    iget-object v0, v0, LL/e;->e:Landroid/os/Parcelable;

    check-cast v0, Landroid/content/res/ColorStateList;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportButtonTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    iget-object v0, p0, Li/F;->a:LL/e;

    if-eqz v0, :cond_0

    iget-object v0, v0, LL/e;->f:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/PorterDuff$Mode;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSupportCompoundDrawablesTintList()Landroid/content/res/ColorStateList;
    .locals 1

    iget-object v0, p0, Li/F;->c:Li/Z;

    invoke-virtual {v0}, Li/Z;->d()Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getSupportCompoundDrawablesTintMode()Landroid/graphics/PorterDuff$Mode;
    .locals 1

    iget-object v0, p0, Li/F;->c:Li/Z;

    invoke-virtual {v0}, Li/Z;->e()Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    return-object v0
.end method

.method public setAllCaps(Z)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/TextView;->setAllCaps(Z)V

    invoke-direct {p0}, Li/F;->getEmojiTextViewHelper()Li/y;

    move-result-object v0

    invoke-virtual {v0, p1}, Li/y;->b(Z)V

    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Li/F;->b:Li/q;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Li/q;->e()V

    :cond_0
    return-void
.end method

.method public setBackgroundResource(I)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, p0, Li/F;->b:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Li/q;->f(I)V

    :cond_0
    return-void
.end method

.method public setButtonDrawable(I)V
    .locals 1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, LD/g;->s(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Li/F;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setButtonDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Li/F;->a:LL/e;

    if-eqz p1, :cond_1

    iget-boolean v0, p1, LL/e;->c:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p1, LL/e;->c:Z

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p1, LL/e;->c:Z

    invoke-virtual {p1}, LL/e;->a()V

    :cond_1
    return-void
.end method

.method public final setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Li/F;->c:Li/Z;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Li/Z;->b()V

    :cond_0
    return-void
.end method

.method public final setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->setCompoundDrawablesRelative(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Li/F;->c:Li/Z;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Li/Z;->b()V

    :cond_0
    return-void
.end method

.method public setEmojiCompatEnabled(Z)V
    .locals 1

    invoke-direct {p0}, Li/F;->getEmojiTextViewHelper()Li/y;

    move-result-object v0

    invoke-virtual {v0, p1}, Li/y;->c(Z)V

    return-void
.end method

.method public setFilters([Landroid/text/InputFilter;)V
    .locals 1

    invoke-direct {p0}, Li/F;->getEmojiTextViewHelper()Li/y;

    move-result-object v0

    iget-object v0, v0, Li/y;->b:LC/j;

    iget-object v0, v0, LC/j;->b:Ljava/lang/Object;

    check-cast v0, LD/g;

    invoke-virtual {v0, p1}, LD/g;->u([Landroid/text/InputFilter;)[Landroid/text/InputFilter;

    move-result-object p1

    invoke-super {p0, p1}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    return-void
.end method

.method public setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Li/F;->b:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Li/q;->h(Landroid/content/res/ColorStateList;)V

    :cond_0
    return-void
.end method

.method public setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    iget-object v0, p0, Li/F;->b:Li/q;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Li/q;->i(Landroid/graphics/PorterDuff$Mode;)V

    :cond_0
    return-void
.end method

.method public setSupportButtonTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Li/F;->a:LL/e;

    if-eqz v0, :cond_0

    iput-object p1, v0, LL/e;->e:Landroid/os/Parcelable;

    const/4 p1, 0x1

    iput-boolean p1, v0, LL/e;->a:Z

    invoke-virtual {v0}, LL/e;->a()V

    :cond_0
    return-void
.end method

.method public setSupportButtonTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    iget-object v0, p0, Li/F;->a:LL/e;

    if-eqz v0, :cond_0

    iput-object p1, v0, LL/e;->f:Ljava/lang/Object;

    const/4 p1, 0x1

    iput-boolean p1, v0, LL/e;->b:Z

    invoke-virtual {v0}, LL/e;->a()V

    :cond_0
    return-void
.end method

.method public setSupportCompoundDrawablesTintList(Landroid/content/res/ColorStateList;)V
    .locals 1

    iget-object v0, p0, Li/F;->c:Li/Z;

    invoke-virtual {v0, p1}, Li/Z;->l(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0}, Li/Z;->b()V

    return-void
.end method

.method public setSupportCompoundDrawablesTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .locals 1

    iget-object v0, p0, Li/F;->c:Li/Z;

    invoke-virtual {v0, p1}, Li/Z;->m(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v0}, Li/Z;->b()V

    return-void
.end method
