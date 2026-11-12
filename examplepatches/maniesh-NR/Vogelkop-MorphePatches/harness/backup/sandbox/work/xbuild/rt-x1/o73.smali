.class public abstract Lo73;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldog;
.implements Landroid/widget/PopupWindow$OnDismissListener;


# instance fields
.field public a:Ldkf;

.field public b:Ldkf;

.field public c:Lr9i;

.field public d:Ldll;

.field public final e:Ln73;

.field public f:Lqim;

.field public g:Leq6;

.field public h:Lqhc;

.field public i:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ln73;

    invoke-direct {v0, p0}, Ln73;-><init>(Lo73;)V

    iput-object v0, p0, Lo73;->e:Ln73;

    const/4 v0, -0x1

    iput v0, p0, Lo73;->i:I

    return-void
.end method

.method public static i(Landroid/view/View;)Landroid/graphics/Rect;
    .registers 7

    const/4 v0, 0x2

    new-array v0, v0, [I

    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationInWindow([I)V

    new-instance v1, Landroid/graphics/Rect;

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v4, v0, v3

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v5, v2

    aget v0, v0, v3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    add-int/2addr p0, v0

    invoke-direct {v1, v2, v4, v5, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1
.end method


# virtual methods
.method public final b()Z
    .registers 2

    iget-object v0, p0, Lo73;->c:Lr9i;

    if-eqz v0, :cond_21

    iget-object v0, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lo66;

    invoke-virtual {v0}, Lo66;->j()Z

    move-result v0

    if-eqz v0, :cond_21

    iget-object p0, p0, Lo73;->c:Lr9i;

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    invoke-virtual {p0}, Lo66;->j()Z

    move-result v0

    if-eqz v0, :cond_1f

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    :cond_1f
    const/4 p0, 0x1

    return p0

    :cond_21
    const/4 p0, 0x0

    return p0
.end method

.method public c()Ljwf;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public d(Landroid/view/View;)I
    .registers 2

    invoke-virtual {p0, p1}, Lo73;->l(Landroid/view/View;)Z

    move-result p0

    if-eqz p0, :cond_8

    const/4 p0, 0x5

    return p0

    :cond_8
    const/4 p0, 0x3

    return p0
.end method

.method public e(Landroid/view/View;)I
    .registers 4

    invoke-static {p1}, Lq9n;->n(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    iget-object p0, p0, Lo73;->a:Ldkf;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f07084b

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    invoke-virtual {v0, p0, p0}, Landroid/graphics/Rect;->inset(II)V

    invoke-static {p1}, Lo73;->i(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    iget p1, p0, Landroid/graphics/Rect;->left:I

    iget v1, v0, Landroid/graphics/Rect;->left:I

    if-ge p1, v1, :cond_20

    sub-int/2addr v1, p1

    return v1

    :cond_20
    iget p0, p0, Landroid/graphics/Rect;->right:I

    iget p1, v0, Landroid/graphics/Rect;->right:I

    if-le p0, p1, :cond_28

    sub-int/2addr p1, p0

    return p1

    :cond_28
    const/4 p0, 0x0

    return p0
.end method

.method public final f()Lr9i;
    .registers 2

    iget-object v0, p0, Lo73;->c:Lr9i;

    if-eqz v0, :cond_11

    iget-object v0, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast v0, Lo66;

    invoke-virtual {v0}, Lo66;->j()Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object p0, p0, Lo73;->c:Lr9i;

    return-object p0

    :cond_11
    const/4 p0, 0x0

    return-object p0
.end method

.method public g()I
    .registers 1

    const p0, 0x7f040024

    return p0
.end method

.method public h(Landroid/view/View;)I
    .registers 4

    invoke-static {p1}, Lq9n;->n(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    iget-object p0, p0, Lo73;->a:Ldkf;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f07084b

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    invoke-virtual {v0, p0, p0}, Landroid/graphics/Rect;->inset(II)V

    invoke-static {p1}, Lo73;->i(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    iget p1, p0, Landroid/graphics/Rect;->top:I

    iget v1, v0, Landroid/graphics/Rect;->top:I

    if-ge p1, v1, :cond_20

    sub-int/2addr v1, p1

    return v1

    :cond_20
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    iget p1, v0, Landroid/graphics/Rect;->bottom:I

    if-le p0, p1, :cond_28

    sub-int/2addr p0, p1

    return p0

    :cond_28
    const/4 p0, 0x0

    return p0
.end method

.method public j(Landroid/view/View;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p0

    const/4 v0, 0x4

    if-eq p0, v0, :cond_12

    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p0

    if-eqz p0, :cond_2a

    :cond_12
    invoke-static {p1}, Lo73;->i(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lo73;->i(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result p1

    if-le p0, p1, :cond_2a

    const/4 p0, 0x1

    return p0

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method public final k()Z
    .registers 1

    iget-object p0, p0, Lo73;->c:Lr9i;

    if-eqz p0, :cond_10

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    invoke-virtual {p0}, Lo66;->j()Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public l(Landroid/view/View;)Z
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p0

    const/4 v0, 0x4

    if-eq p0, v0, :cond_12

    new-instance p0, Landroid/graphics/Rect;

    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1, p0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p0

    if-eqz p0, :cond_2a

    :cond_12
    invoke-static {p1}, Lo73;->i(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerX()I

    move-result p0

    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lo73;->i(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result p1

    if-le p0, p1, :cond_2a

    const/4 p0, 0x1

    return p0

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method public m(Lr9i;Landroid/view/View;)V
    .registers 3

    const p0, 0x7f100004

    invoke-virtual {p1, p0}, Lr9i;->L(I)V

    iget-object p0, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lo66;->B:Z

    iput-boolean p1, p0, Lo66;->y:Z

    return-void
.end method

.method public n(Lr9i;)V
    .registers 2

    return-void
.end method

.method public o(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p0}, Lo73;->k()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-virtual {p0, p1}, Lo73;->p(Landroid/view/View;)V

    return-void
.end method

.method public onDismiss()V
    .registers 4

    iget-object v0, p0, Lo73;->g:Leq6;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Leq6;->K()V

    iput-object v1, p0, Lo73;->g:Leq6;

    :cond_a
    iget-object v0, p0, Lo73;->d:Ldll;

    if-eqz v0, :cond_15

    iget-object v2, p0, Lo73;->e:Ln73;

    invoke-virtual {v0, v2}, Ldll;->b(Lcll;)V

    iput-object v1, p0, Lo73;->d:Ldll;

    :cond_15
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .registers 13

    invoke-virtual {p0}, Lo73;->k()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object p0, p0, Lo73;->c:Lr9i;

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    invoke-virtual {p0}, Lo66;->j()Z

    move-result p1

    if-eqz p1, :cond_17

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    :cond_17
    return-void

    :cond_18
    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    iput-object v0, p0, Lo73;->d:Ldll;

    if-eqz v0, :cond_25

    iget-object v1, p0, Lo73;->e:Ln73;

    invoke-virtual {v0, v1}, Ldll;->a(Lcll;)V

    :cond_25
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x7f0406f1

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v1, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v1, v1, Landroid/util/TypedValue;->resourceId:I

    new-instance v6, Ldkf;

    invoke-direct {v6, v0, v1}, Ldkf;-><init>(Landroid/content/Context;I)V

    iput-object v6, p0, Lo73;->b:Ldkf;

    iput-object v6, p0, Lo73;->a:Ldkf;

    invoke-virtual {p0, p1}, Lo73;->d(Landroid/view/View;)I

    move-result v8

    invoke-virtual {p0}, Lo73;->g()I

    move-result v9

    invoke-virtual {p0}, Lo73;->c()Ljwf;

    move-result-object v10

    new-instance v5, Lr9i;

    move-object v7, p1

    invoke-direct/range {v5 .. v10}, Lr9i;-><init>(Ldkf;Landroid/view/View;IILjwf;)V

    iput-object v5, p0, Lo73;->c:Lr9i;

    iget-object p1, v5, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lo66;

    iput-object p0, p1, Lo66;->w:Lo73;

    const/4 p1, 0x0

    invoke-virtual {v5, p1}, Lr9i;->S(Z)V

    iget-object p1, p0, Lo73;->c:Lr9i;

    invoke-virtual {p0, p1, v7}, Lo73;->m(Lr9i;Landroid/view/View;)V

    iget-object p1, p0, Lo73;->c:Lr9i;

    invoke-virtual {p0, v7}, Lo73;->h(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p0, v7}, Lo73;->j(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_79

    neg-int v0, v0

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v0, v1

    :cond_79
    iget-object p1, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lo66;

    iput v0, p1, Lo66;->n:I

    iput-boolean v4, p1, Lo66;->o:Z

    iget-object p1, p0, Lo73;->c:Lr9i;

    invoke-virtual {p0, v7}, Lo73;->e(Landroid/view/View;)I

    move-result v0

    iget-object p1, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lo66;

    iput v0, p1, Lo66;->p:I

    iput-boolean v4, p1, Lo66;->q:Z

    iget-object p1, p0, Lo73;->c:Lr9i;

    iput-object p0, p1, Lr9i;->e:Ljava/lang/Object;

    iget-object p1, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lo66;

    iget-object v0, p1, Lo66;->c:Lm56;

    iput-boolean v4, v0, Lm56;->c:Z

    invoke-virtual {p1}, Lo66;->m()Z

    move-result p1

    if-eqz p1, :cond_ee

    iget-object p1, p0, Lo73;->c:Lr9i;

    iget-object p1, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p1, Lo66;

    iget-object p1, p1, Lo66;->f:Ll56;

    const/4 v0, 0x0

    if-nez p1, :cond_ae

    move-object p1, v0

    goto :goto_b0

    :cond_ae
    iget-object p1, p1, Landroidx/appcompat/widget/ListPopupWindow;->c:Lim7;

    :goto_b0
    invoke-static {p1}, Lq9n;->m(Lim7;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_ca

    iget-object v2, p0, Lo73;->a:Ldkf;

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v2

    invoke-virtual {v2, v1}, Lqwe;->b(Landroid/view/View;)V

    invoke-virtual {v1, v4}, Landroid/view/View;->setClipToOutline(Z)V

    :cond_ca
    iget-object v1, p0, Lo73;->f:Lqim;

    if-eqz v1, :cond_d4

    invoke-virtual {v1, v0}, Lqim;->f(Lfm8;)Leq6;

    move-result-object v0

    iput-object v0, p0, Lo73;->g:Leq6;

    :cond_d4
    iget v0, p0, Lo73;->i:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_e8

    if-eqz p1, :cond_e6

    new-instance v0, Lxj;

    const/16 v1, 0x11

    invoke-direct {v0, p0, p1, v1}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, p1}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    goto :goto_e8

    :cond_e6
    iput v1, p0, Lo73;->i:I

    :cond_e8
    :goto_e8
    iget-object p1, p0, Lo73;->c:Lr9i;

    invoke-virtual {p0, p1}, Lo73;->n(Lr9i;)V

    return-void

    :cond_ee
    const-string p0, "CustomMenuPopupHelper cannot be used without an anchor"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
