.class public final synthetic LS/f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnApplyWindowInsetsListener;


# Android 15+ (bord à bord) : fond de la barre d'état = couleur des barres (Cfg.c),
# marge du haut = hauteur de la barre d'état, sauf en plein écran (Cfg.F).
# virtual methods
.method public final onApplyWindowInsets(Landroid/view/View;Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lstart/Cfg;->c(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    const/4 v1, 0x0

    sget-boolean v2, Lstart/Cfg;->F:Z

    if-nez v2, :cond_full

    invoke-static {}, LS/e;->a()I

    move-result v0

    invoke-static {p2, v0}, LS/e;->b(Landroid/view/WindowInsets;I)Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, LN/a;->m(Landroid/graphics/Insets;)I

    move-result v0

    goto :goto_pad

    :cond_full
    const/4 v0, 0x0

    :goto_pad
    invoke-virtual {p1, v1, v0, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    return-object p2
.end method
