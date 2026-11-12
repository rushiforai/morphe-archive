.class public Lcom/opera/android/custom_views/StylingTextView;
.super Lyq1;
.source "SourceFile"

# interfaces
.implements Lk2c;
.implements Llgl;


# instance fields
.field public final h:Lua7;

.field public final i:Lzg;

.field public final j:Ll2c;

.field public final k:Lfr;

.field public final l:Lvr3;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 93
    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9

    invoke-direct {p0, p1, p2, p3}, Lyq1;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Lua7;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    const/4 v2, 0x4

    invoke-direct {v0, p0, v2, v1}, Lua7;-><init>(Landroid/view/View;ILandroid/graphics/PorterDuff$Mode;)V

    iput-object v0, p0, Lcom/opera/android/custom_views/StylingTextView;->h:Lua7;

    new-instance v1, Lzg;

    invoke-direct {v1, p0}, Lzg;-><init>(Landroid/widget/TextView;)V

    iput-object v1, p0, Lcom/opera/android/custom_views/StylingTextView;->i:Lzg;

    new-instance v2, Lvr3;

    invoke-direct {v2, p0}, Lvr3;-><init>(Landroid/widget/TextView;)V

    iput-object v2, p0, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    new-instance v3, Ll2c;

    invoke-direct {v3, p0, p0, p2}, Ll2c;-><init>(Landroid/view/View;Lk2c;Landroid/util/AttributeSet;)V

    iput-object v3, p0, Lcom/opera/android/custom_views/StylingTextView;->j:Ll2c;

    if-nez p2, :cond_25

    return-void

    :cond_25
    sget-object v3, Lkhh;->O:[I

    const/4 v4, 0x0

    invoke-virtual {p1, p2, v3, p3, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v3

    invoke-virtual {v0, v3, v4}, Lua7;->A(Landroid/content/res/TypedArray;I)V

    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {v2, p2, p3}, Lvr3;->g(Landroid/util/AttributeSet;I)V

    invoke-virtual {v1, p1, p2, p3}, Lzg;->u(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1, p2}, Lfr;->f(Landroid/content/Context;Landroid/util/AttributeSet;)Lfr;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/custom_views/StylingTextView;->k:Lfr;

    if-eqz p1, :cond_43

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_43
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    move-result p1

    if-nez p1, :cond_51

    new-instance p1, Lzg;

    invoke-direct {p1, p0, p2, p3}, Lzg;-><init>(Landroid/view/View;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Lxf8;->r(Lzg;)V

    :cond_51
    iget-object p1, v1, Lzg;->c:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    iget-object p2, v1, Lzg;->d:Ljava/lang/Object;

    check-cast p2, Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1, p2}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final b()Ll2c;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingTextView;->j:Ll2c;

    return-object p0
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 7

    invoke-virtual {p0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/custom_views/StylingTextView;->h:Lua7;

    iget-object v2, v1, Lua7;->b:Ljava/lang/Object;

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    const/4 v3, 0x0

    :goto_f
    array-length v4, v0

    if-ge v3, v4, :cond_1c

    aget-object v4, v0, v3

    if-eqz v4, :cond_19

    invoke-virtual {v1, v2, v3, v4}, Lua7;->X([IILandroid/graphics/drawable/Drawable;)V

    :cond_19
    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    :cond_1c
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public drawableStateChanged()V
    .registers 1

    invoke-super {p0}, Lyq1;->drawableStateChanged()V

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingTextView;->h:Lua7;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lua7;->G()V

    :cond_a
    return-void
.end method

.method public final i(I)V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/custom_views/StylingTextView;->i:Lzg;

    iget-object v1, v0, Lzg;->c:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_e

    iget-object v1, v0, Lzg;->d:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_16

    :cond_e
    iget v1, v0, Lzg;->a:I

    if-eq v1, p1, :cond_16

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lzg;->L(IZ)V

    :cond_16
    iget-object p1, p0, Lcom/opera/android/custom_views/StylingTextView;->k:Lfr;

    if-eqz p1, :cond_1d

    invoke-virtual {p1, p0}, Lfr;->e(Landroid/view/View;)V

    :cond_1d
    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    invoke-virtual {p0}, Lvr3;->c()V

    return-void
.end method

.method public final l()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingTextView;->j:Ll2c;

    if-eqz p0, :cond_c

    invoke-virtual {p0}, Ll2c;->b()Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/opera/android/custom_views/StylingTextView;->h:Lua7;

    invoke-virtual {p1}, Lua7;->F()V

    invoke-virtual {p0}, Landroid/view/View;->refreshDrawableState()V

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Lyq1;->onTextChanged(Ljava/lang/CharSequence;III)V

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingTextView;->l:Lvr3;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lvr3;->k()V

    :cond_a
    return-void
.end method

.method public final performLongClick()Z
    .registers 1

    :try_start_0
    invoke-super {p0}, Landroid/view/View;->performLongClick()Z

    move-result p0
    :try_end_4
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_4} :catch_5

    return p0

    :catch_5
    const/4 p0, 0x1

    return p0
.end method

.method public final s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .registers 5

    iget-object p0, p0, Lcom/opera/android/custom_views/StylingTextView;->i:Lzg;

    iput-object p1, p0, Lzg;->c:Ljava/lang/Object;

    iput-object p2, p0, Lzg;->d:Ljava/lang/Object;

    const/4 p2, 0x0

    if-eqz p1, :cond_14

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {p1, p2, p2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_14
    iget-object p1, p0, Lzg;->d:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_25

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-virtual {p1, p2, p2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_25
    iget-object p1, p0, Lzg;->b:Ljava/lang/Object;

    check-cast p1, Landroid/widget/TextView;

    invoke-static {p1}, Lcs5;->L(Landroid/view/View;)I

    move-result p1

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Lzg;->L(IZ)V

    return-void
.end method
