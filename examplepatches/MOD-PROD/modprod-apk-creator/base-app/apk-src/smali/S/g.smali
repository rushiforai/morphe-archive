.class public final synthetic LS/g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly/p;


# virtual methods
.method public a(Landroid/view/View;Ly/f0;)Ly/f0;
    .locals 5

    sget-boolean v0, Lstart/MainActivity;->H:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object v1, p2, Ly/f0;->a:Ly/d0;

    const/16 v2, 0x1d

    if-lt v0, v2, :cond_0

    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Ly/d0;->f(I)Lr/c;

    move-result-object v3

    invoke-virtual {v3}, Lr/c;->c()Landroid/graphics/Insets;

    move-result-object v3

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    if-lt v0, v2, :cond_1

    const/4 v4, 0x7

    invoke-virtual {v1, v4}, Ly/d0;->f(I)Lr/c;

    move-result-object v1

    invoke-virtual {v1}, Lr/c;->c()Landroid/graphics/Insets;

    :cond_1
    if-lt v0, v2, :cond_2

    invoke-static {v3}, LN/a;->t(Landroid/graphics/Insets;)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v1, v1, v0}, Landroid/view/View;->setPadding(IIII)V

    :cond_2
    return-object p2
.end method
