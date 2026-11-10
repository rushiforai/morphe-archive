.class public Ly/V;
.super Ly/X;
.source "SourceFile"


# instance fields
.field public final a:Landroid/view/WindowInsets$Builder;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ly/X;-><init>()V

    invoke-static {}, LN/a;->d()Landroid/view/WindowInsets$Builder;

    move-result-object v0

    iput-object v0, p0, Ly/V;->a:Landroid/view/WindowInsets$Builder;

    return-void
.end method

.method public constructor <init>(Ly/f0;)V
    .locals 0

    invoke-direct {p0, p1}, Ly/X;-><init>(Ly/f0;)V

    invoke-virtual {p1}, Ly/f0;->b()Landroid/view/WindowInsets;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {p1}, LN/a;->e(Landroid/view/WindowInsets;)Landroid/view/WindowInsets$Builder;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {}, LN/a;->d()Landroid/view/WindowInsets$Builder;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Ly/V;->a:Landroid/view/WindowInsets$Builder;

    return-void
.end method


# virtual methods
.method public b()Ly/f0;
    .locals 3

    invoke-virtual {p0}, Ly/X;->a()V

    iget-object v0, p0, Ly/V;->a:Landroid/view/WindowInsets$Builder;

    invoke-static {v0}, LN/a;->f(Landroid/view/WindowInsets$Builder;)Landroid/view/WindowInsets;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ly/f0;->c(Landroid/view/WindowInsets;Landroid/view/View;)Ly/f0;

    move-result-object v0

    iget-object v2, v0, Ly/f0;->a:Ly/d0;

    invoke-virtual {v2, v1}, Ly/d0;->o([Lr/c;)V

    return-object v0
.end method

.method public c(Lr/c;)V
    .locals 1

    iget-object v0, p0, Ly/V;->a:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Lr/c;->c()Landroid/graphics/Insets;

    move-result-object p1

    invoke-static {v0, p1}, LN/a;->p(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    return-void
.end method

.method public d(Lr/c;)V
    .locals 1

    iget-object v0, p0, Ly/V;->a:Landroid/view/WindowInsets$Builder;

    invoke-virtual {p1}, Lr/c;->c()Landroid/graphics/Insets;

    move-result-object p1

    invoke-static {v0, p1}, LN/a;->j(Landroid/view/WindowInsets$Builder;Landroid/graphics/Insets;)V

    return-void
.end method
