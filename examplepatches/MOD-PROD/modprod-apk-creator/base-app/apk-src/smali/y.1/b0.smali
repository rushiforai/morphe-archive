.class public Ly/b0;
.super Ly/a0;
.source "SourceFile"


# instance fields
.field public n:Lr/c;

.field public o:Lr/c;

.field public p:Lr/c;


# direct methods
.method public constructor <init>(Ly/f0;Landroid/view/WindowInsets;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ly/a0;-><init>(Ly/f0;Landroid/view/WindowInsets;)V

    const/4 p1, 0x0

    iput-object p1, p0, Ly/b0;->n:Lr/c;

    iput-object p1, p0, Ly/b0;->o:Lr/c;

    iput-object p1, p0, Ly/b0;->p:Lr/c;

    return-void
.end method


# virtual methods
.method public g()Lr/c;
    .locals 1

    iget-object v0, p0, Ly/b0;->o:Lr/c;

    if-nez v0, :cond_0

    iget-object v0, p0, Ly/Y;->c:Landroid/view/WindowInsets;

    invoke-static {v0}, LN/a;->n(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, Lr/c;->b(Landroid/graphics/Insets;)Lr/c;

    move-result-object v0

    iput-object v0, p0, Ly/b0;->o:Lr/c;

    :cond_0
    iget-object v0, p0, Ly/b0;->o:Lr/c;

    return-object v0
.end method

.method public i()Lr/c;
    .locals 1

    iget-object v0, p0, Ly/b0;->n:Lr/c;

    if-nez v0, :cond_0

    iget-object v0, p0, Ly/Y;->c:Landroid/view/WindowInsets;

    invoke-static {v0}, LN/a;->r(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, Lr/c;->b(Landroid/graphics/Insets;)Lr/c;

    move-result-object v0

    iput-object v0, p0, Ly/b0;->n:Lr/c;

    :cond_0
    iget-object v0, p0, Ly/b0;->n:Lr/c;

    return-object v0
.end method

.method public k()Lr/c;
    .locals 1

    iget-object v0, p0, Ly/b0;->p:Lr/c;

    if-nez v0, :cond_0

    iget-object v0, p0, Ly/Y;->c:Landroid/view/WindowInsets;

    invoke-static {v0}, LN/a;->b(Landroid/view/WindowInsets;)Landroid/graphics/Insets;

    move-result-object v0

    invoke-static {v0}, Lr/c;->b(Landroid/graphics/Insets;)Lr/c;

    move-result-object v0

    iput-object v0, p0, Ly/b0;->p:Lr/c;

    :cond_0
    iget-object v0, p0, Ly/b0;->p:Lr/c;

    return-object v0
.end method

.method public l(IIII)Ly/f0;
    .locals 1

    iget-object v0, p0, Ly/Y;->c:Landroid/view/WindowInsets;

    invoke-static {v0, p1, p2, p3, p4}, LN/a;->g(Landroid/view/WindowInsets;IIII)Landroid/view/WindowInsets;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p1, p2}, Ly/f0;->c(Landroid/view/WindowInsets;Landroid/view/View;)Ly/f0;

    move-result-object p1

    return-object p1
.end method

.method public q(Lr/c;)V
    .locals 0

    return-void
.end method
