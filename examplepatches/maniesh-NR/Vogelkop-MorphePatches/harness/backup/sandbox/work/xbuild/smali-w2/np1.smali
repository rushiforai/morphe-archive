.class public final Lnp1;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public c:Z

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/widget/CompoundButton;)V
    .registers 3

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lnp1;->e:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lnp1;->a:Z

    .line 26
    iput-boolean v0, p0, Lnp1;->b:Z

    .line 27
    iput-object p1, p0, Lnp1;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 2

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnp1;->e:Ljava/lang/Object;

    .line 29
    new-instance p1, Lr4h;

    invoke-direct {p1, p0}, Lr4h;-><init>(Lnp1;)V

    iput-object p1, p0, Lnp1;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltcc;Luo3;Lorm;)V
    .registers 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lnp1;->d:Ljava/lang/Object;

    iput-object p3, p0, Lnp1;->e:Ljava/lang/Object;

    new-instance v2, Lbo3;

    const/4 p2, 0x1

    invoke-direct {v2, p0, p2}, Lbo3;-><init>(Ljava/lang/Object;B)V

    const/4 v4, 0x0

    const/16 v5, 0xd

    const/4 v1, 0x0

    const/4 v3, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-object v0, p0, Lnp1;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/CompoundButton;

    invoke-virtual {v0}, Landroid/widget/CompoundButton;->getButtonDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_39

    iget-boolean v2, p0, Lnp1;->a:Z

    if-nez v2, :cond_12

    iget-boolean v2, p0, Lnp1;->b:Z

    if-eqz v2, :cond_39

    :cond_12
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-boolean v2, p0, Lnp1;->a:Z

    if-eqz v2, :cond_1e

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setTintList(Landroid/content/res/ColorStateList;)V

    :cond_1e
    iget-boolean v2, p0, Lnp1;->b:Z

    if-eqz v2, :cond_29

    iget-object p0, p0, Lnp1;->e:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v1, p0}, Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :cond_29
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result p0

    if-eqz p0, :cond_36

    invoke-virtual {v0}, Landroid/view/View;->getDrawableState()[I

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_36
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_39
    return-void
.end method

.method public final b(Landroid/util/AttributeSet;I)V
    .registers 12

    iget-object p0, p0, Lnp1;->d:Ljava/lang/Object;

    move-object v0, p0

    check-cast v0, Landroid/widget/CompoundButton;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 v7, 0x0

    sget-object v2, Lzhh;->n:[I

    invoke-static {p2, v7, p0, p1, v2}, Lghf;->H(IILandroid/content/Context;Landroid/util/AttributeSet;[I)Lghf;

    move-result-object p0

    iget-object v1, p0, Lghf;->c:Ljava/lang/Object;

    move-object v8, v1

    check-cast v8, Landroid/content/res/TypedArray;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lghf;->c:Ljava/lang/Object;

    move-object v4, v3

    check-cast v4, Landroid/content/res/TypedArray;

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    const/4 v6, 0x0

    move-object v3, p1

    move v5, p2

    invoke-static/range {v0 .. v6}, Ln5n;->b(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    const/4 p1, 0x1

    :try_start_27
    invoke-virtual {v8, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_3f

    invoke-virtual {v8, p1, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1
    :try_end_31
    .catchall {:try_start_27 .. :try_end_31} :catchall_7c

    if-eqz p1, :cond_3f

    :try_start_33
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p1, p2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_3e
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_33 .. :try_end_3e} :catch_3f
    .catchall {:try_start_33 .. :try_end_3e} :catchall_7c

    goto :goto_56

    :catch_3f
    :cond_3f
    :try_start_3f
    invoke-virtual {v8, v7}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_56

    invoke-virtual {v8, v7, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    if-eqz p1, :cond_56

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p1, p2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/CompoundButton;->setButtonDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_56
    :goto_56
    const/4 p1, 0x2

    invoke-virtual {v8, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_64

    invoke-virtual {p0, p1}, Lghf;->s(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/CompoundButton;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    :cond_64
    const/4 p1, 0x3

    invoke-virtual {v8, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_78

    const/4 p2, -0x1

    invoke-virtual {v8, p1, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p1

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lkl7;->c(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/CompoundButton;->setButtonTintMode(Landroid/graphics/PorterDuff$Mode;)V
    :try_end_78
    .catchall {:try_start_3f .. :try_end_78} :catchall_7c

    :cond_78
    invoke-virtual {p0}, Lghf;->J()V

    return-void

    :catchall_7c
    move-exception v0

    move-object p1, v0

    invoke-virtual {p0}, Lghf;->J()V

    throw p1
.end method

.method public final c(Lvb0;)V
    .registers 11

    iget-object v0, p0, Lnp1;->d:Ljava/lang/Object;

    check-cast v0, Luo3;

    iget-object v0, v0, Luo3;->a:Lfs0;

    if-eqz v0, :cond_18

    iget-object v1, p0, Lnp1;->e:Ljava/lang/Object;

    check-cast v1, Lorm;

    iget-boolean v2, p0, Lnp1;->a:Z

    iget-boolean v3, p0, Lnp1;->b:Z

    iget-boolean p0, p0, Lnp1;->c:Z

    check-cast v1, Lx5f;

    iget-boolean v4, v1, Lx5f;->h:Z

    if-nez v4, :cond_19

    :cond_18
    return-void

    :cond_19
    iget-object v4, v1, Lx5f;->d:Lzpa;

    new-instance v5, Les0;

    const/4 v6, -0x1

    const/4 v7, 0x5

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual {v5, v6, v7, p1}, Ljf0;->q(IILjava/lang/Object;)V

    const/4 p1, 0x4

    invoke-virtual {v5, p1, v7, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v5, v7, v7, v2}, Ljf0;->r(IIZ)V

    const/4 p1, 0x2

    invoke-virtual {v5, p1, v7, v3}, Ljf0;->r(IIZ)V

    const/4 p1, 0x3

    invoke-virtual {v5, p1, v7, p0}, Ljf0;->r(IIZ)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p0

    invoke-virtual {p0, v4}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p1

    invoke-virtual {p1, v4}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object p1

    const/16 v0, 0x2c

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_5a

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5a

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_63

    :cond_5a
    invoke-static {p1, v0, v7}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p1, v0, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_63
    invoke-virtual {v3, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, p0}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final d()V
    .registers 6

    iget-object v0, p0, Lnp1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean v1, p0, Lnp1;->b:Z

    if-nez v1, :cond_46

    iget-boolean v1, p0, Lnp1;->a:Z

    if-nez v1, :cond_46

    iget-boolean v1, p0, Lnp1;->c:Z

    if-eqz v1, :cond_46

    iget-object v1, p0, Lnp1;->d:Ljava/lang/Object;

    check-cast v1, Lr4h;

    iget-boolean v2, v1, Lr4h;->g:Z

    const/4 v3, 0x1

    if-nez v2, :cond_2e

    iput-boolean v3, v1, Lr4h;->g:Z

    const/4 v2, 0x0

    iput v2, v1, Lr4h;->c:I

    iput v2, v1, Lr4h;->d:I

    iput v2, v1, Lr4h;->e:I

    iput v2, v1, Lr4h;->f:I

    iput-boolean v2, v1, Lr4h;->b:Z

    iget-object v4, v1, Lr4h;->a:Lnp1;

    invoke-virtual {v4, v2}, Lnp1;->f(I)V

    invoke-virtual {v1}, Lr4h;->b()V

    :cond_2e
    iput-boolean v3, p0, Lnp1;->a:Z

    iget-object p0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_36
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1, v0}, Liz4;->n(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_36

    :cond_46
    return-void
.end method

.method public final e()V
    .registers 3

    iget-object v0, p0, Lnp1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean v1, p0, Lnp1;->a:Z

    if-eqz v1, :cond_2c

    iget-boolean v1, p0, Lnp1;->b:Z

    if-nez v1, :cond_2c

    iget-object v1, p0, Lnp1;->d:Ljava/lang/Object;

    check-cast v1, Lr4h;

    invoke-virtual {v1}, Lr4h;->a()V

    const/4 v1, 0x0

    iput-boolean v1, p0, Lnp1;->a:Z

    iget-object p0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_1c
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1, v0}, Liz4;->p(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_1c

    :cond_2c
    return-void
.end method

.method public final f(I)V
    .registers 6

    iget-object v0, p0, Lnp1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean v1, p0, Lnp1;->b:Z

    if-nez v1, :cond_28

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_e
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    const/16 v2, 0x2710

    if-eqz v1, :cond_23

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    mul-int/lit8 v3, p1, 0x64

    div-int/2addr v3, v2

    invoke-virtual {v1, v3}, Liz4;->w(I)V

    goto :goto_e

    :cond_23
    if-ne p1, v2, :cond_28

    invoke-virtual {p0}, Lnp1;->e()V

    :cond_28
    return-void
.end method
