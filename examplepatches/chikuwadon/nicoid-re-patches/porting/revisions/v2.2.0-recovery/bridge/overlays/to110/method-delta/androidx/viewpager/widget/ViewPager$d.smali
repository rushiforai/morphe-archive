.class public Landroidx/viewpager/widget/ViewPager$d;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ld/h/l/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/viewpager/widget/ViewPager;->c()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final a:Landroid/graphics/Rect;

.field public final synthetic b:Landroidx/viewpager/widget/ViewPager;


# virtual methods
.method public a(Landroid/view/View;Ld/h/l/y;)Ld/h/l/y;
    .registers 8

    invoke-static {p1, p2}, Ld/h/l/p;->a(Landroid/view/View;Ld/h/l/y;)Ld/h/l/y;

    move-result-object p1

    invoke-virtual {p1}, Ld/h/l/y;->e()Z

    move-result p2

    if-eqz p2, :cond_0

    return-object p1

    :cond_0
    iget-object p2, p0, Landroidx/viewpager/widget/ViewPager$d;->a:Landroid/graphics/Rect;

    invoke-virtual {p1}, Ld/h/l/y;->b()I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Ld/h/l/y;->d()I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Ld/h/l/y;->c()I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1}, Ld/h/l/y;->a()I

    move-result v0

    iput v0, p2, Landroid/graphics/Rect;->bottom:I

    const/4 v0, 0x0

    iget-object v1, p0, Landroidx/viewpager/widget/ViewPager$d;->b:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_3

    iget-object v2, p0, Landroidx/viewpager/widget/ViewPager$d;->b:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 1
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x15

    if-lt v3, v4, :cond_2

    invoke-static {p1}, Ld/h/l/y;->a(Ld/h/l/y;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/WindowInsets;

    invoke-virtual {v2, v3}, Landroid/view/View;->dispatchApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/WindowInsets;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    new-instance v3, Landroid/view/WindowInsets;

    invoke-direct {v3, v2}, Landroid/view/WindowInsets;-><init>(Landroid/view/WindowInsets;)V

    :cond_1
    invoke-static {v3}, Ld/h/l/y;->a(Ljava/lang/Object;)Ld/h/l/y;

    move-result-object v2

    goto :goto_1

    :cond_2
    move-object v2, p1

    .line 2
    :goto_1
    invoke-virtual {v2}, Ld/h/l/y;->b()I

    move-result v3

    iget v4, p2, Landroid/graphics/Rect;->left:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p2, Landroid/graphics/Rect;->left:I

    invoke-virtual {v2}, Ld/h/l/y;->d()I

    move-result v3

    iget v4, p2, Landroid/graphics/Rect;->top:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2}, Ld/h/l/y;->c()I

    move-result v3

    iget v4, p2, Landroid/graphics/Rect;->right:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p2, Landroid/graphics/Rect;->right:I

    invoke-virtual {v2}, Ld/h/l/y;->a()I

    move-result v2

    iget v3, p2, Landroid/graphics/Rect;->bottom:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iput v2, p2, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_4

    invoke-static {p1}, Ld/h/l/y;->a(Ld/h/l/y;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowInsets;

    if-eqz v0, :cond_4

    invoke-static {v0}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsetsCompat(Landroid/view/WindowInsets;)Landroidx/core/view/WindowInsetsCompat;

    move-result-object v0

    new-instance v1, Landroidx/core/view/WindowInsetsCompat$Builder;

    invoke-direct {v1, v0}, Landroidx/core/view/WindowInsetsCompat$Builder;-><init>(Landroidx/core/view/WindowInsetsCompat;)V

    invoke-static {p2}, Landroidx/core/graphics/Insets;->of(Landroid/graphics/Rect;)Landroidx/core/graphics/Insets;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/core/view/WindowInsetsCompat$Builder;->setSystemWindowInsets(Landroidx/core/graphics/Insets;)Landroidx/core/view/WindowInsetsCompat$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/core/view/WindowInsetsCompat$Builder;->build()Landroidx/core/view/WindowInsetsCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/core/view/WindowInsetsCompat;->toWindowInsets()Landroid/view/WindowInsets;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-static {v1}, Ld/h/l/y;->a(Ljava/lang/Object;)Ld/h/l/y;

    move-result-object v1

    return-object v1

    :cond_4
    iget v0, p2, Landroid/graphics/Rect;->left:I

    iget v1, p2, Landroid/graphics/Rect;->top:I

    iget v2, p2, Landroid/graphics/Rect;->right:I

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v0, v1, v2, p2}, Ld/h/l/y;->a(IIII)Ld/h/l/y;

    move-result-object p1

    return-object p1
.end method
