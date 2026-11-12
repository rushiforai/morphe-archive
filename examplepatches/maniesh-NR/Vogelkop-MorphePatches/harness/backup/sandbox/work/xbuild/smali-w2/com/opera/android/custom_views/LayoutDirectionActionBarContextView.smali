.class public Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;
.super Landroidx/appcompat/widget/ActionBarContextView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "RestrictedApi"
    }
.end annotation


# static fields
.field public static final synthetic H:I


# instance fields
.field public final B:I

.field public final C:I

.field public D:I

.field public E:I

.field public final F:Le2c;

.field public final G:Le2c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Lmbi;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lmbi;-><init>(Landroid/content/Context;B)V

    invoke-direct {p0, v0, p2, v1}, Landroidx/appcompat/widget/ActionBarContextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Le2c;

    invoke-direct {v0, p0, v1}, Le2c;-><init>(Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;B)V

    iput-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->F:Le2c;

    new-instance v0, Le2c;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Le2c;-><init>(Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;B)V

    iput-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->G:Le2c;

    sget-object v0, Lzhh;->d:[I

    const v3, 0x7f040020

    invoke-static {v3, v1, p1, p2, v0}, Lghf;->H(IILandroid/content/Context;Landroid/util/AttributeSet;[I)Lghf;

    move-result-object p2

    iget-object v0, p2, Lghf;->c:Ljava/lang/Object;

    check-cast v0, Landroid/content/res/TypedArray;

    const/4 v3, 0x5

    invoke-virtual {v0, v3, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->B:I

    const/4 v3, 0x4

    invoke-virtual {v0, v3, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->C:I

    invoke-virtual {p2}, Lghf;->J()V

    sget-object p2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p1

    invoke-virtual {p1, p0}, Lqwe;->b(Landroid/view/View;)V

    new-instance p1, Llzb;

    invoke-direct {p1, p0, v2}, Llzb;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-nez p2, :cond_57

    return-void

    :cond_57
    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final c(Lse;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->c(Lse;)V

    const p1, 0x7f0a004c

    iget-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->F:Le2c;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->l(ILr8n;)V

    const p1, 0x7f0a004b

    iget-object v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->G:Le2c;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->l(ILr8n;)V

    iget-object p1, p0, Landroidx/appcompat/widget/ActionBarContextView;->c:Lqe;

    if-nez p1, :cond_18

    return-void

    :cond_18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    iget-object v0, p0, Landroidx/appcompat/widget/ActionBarContextView;->c:Lqe;

    invoke-virtual {v0}, Lqe;->j()Litd;

    iget-object v0, v0, Lqe;->t:Lne;

    iget-object v0, v0, Lne;->g:Lme;

    if-eqz v0, :cond_30

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_31

    :cond_30
    const/4 v0, 0x0

    :goto_31
    invoke-static {v0, p1}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    iget-object p0, p0, Landroidx/appcompat/widget/ActionBarContextView;->c:Lqe;

    invoke-virtual {p0}, Lqe;->j()Litd;

    move-result-object p0

    invoke-static {p0, p1}, Lj14;->p0(Litd;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 7

    iget v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->D:I

    const/4 v1, 0x0

    if-nez v0, :cond_b

    iget v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->E:I

    if-nez v0, :cond_b

    move v0, v1

    goto :goto_c

    :cond_b
    const/4 v0, 0x1

    :goto_c
    if-eqz v0, :cond_21

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v2, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->D:I

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    iget v4, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->E:I

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {p1, v2, v1, v3, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    :cond_21
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    if-eqz v0, :cond_29

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_29
    return-void
.end method

.method public final fitSystemWindows(Landroid/graphics/Rect;)Z
    .registers 3

    const/4 v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    iput v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->D:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    iput v0, p0, Lcom/opera/android/custom_views/LayoutDirectionActionBarContextView;->E:I

    invoke-super {p0, p1}, Landroid/view/View;->fitSystemWindows(Landroid/graphics/Rect;)Z

    move-result p0

    return p0
.end method

.method public final getLayoutDirection()I
    .registers 1

    invoke-static {p0}, Lcs5;->W(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public final l(ILr8n;)V
    .registers 6

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-nez p0, :cond_9

    return-void

    :cond_9
    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_2f

    const v1, 0x7f0a0c96

    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8n;

    if-eqz v1, :cond_2f

    iget-object v2, v1, Lu8n;->b:Landroid/view/View;

    if-ne v2, p0, :cond_2f

    iget-object v2, v1, Lu8n;->a:Ldll;

    if-ne v2, p1, :cond_2f

    iget-object p1, v1, Lu8n;->f:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    :cond_2f
    if-nez v0, :cond_3e

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p1

    if-eqz p1, :cond_3e

    invoke-static {p1, p0, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_3e
    invoke-interface {p2, p0}, Lr8n;->a(Landroid/view/View;)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    return-void
.end method
