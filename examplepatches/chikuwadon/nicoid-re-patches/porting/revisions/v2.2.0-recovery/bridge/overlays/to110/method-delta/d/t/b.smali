.class public final Ld/t/b;
.super Ljava/lang/Object;
.source ""


# instance fields
.field public final a:Ld/t/c;

.field public final b:Ld/t/a;


# virtual methods
.method public a(Landroid/os/Bundle;)V
    .registers 5

    iget-object v0, p0, Ld/t/b;->a:Ld/t/c;

    invoke-interface {v0}, Ld/m/h;->b()Ld/m/e;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ld/m/i;

    .line 1
    iget-object v1, v1, Ld/m/i;->b:Ld/m/e$b;

    .line 2
    sget-object v2, Ld/m/e$b;->b:Ld/m/e$b;

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Ld/t/b;->b:Ld/t/a;

    iget-boolean v2, v1, Ld/t/a;->c:Z

    if-nez v2, :cond_1

    new-instance v1, Landroidx/savedstate/Recreator;

    iget-object v2, p0, Ld/t/b;->a:Ld/t/c;

    invoke-direct {v1, v2}, Landroidx/savedstate/Recreator;-><init>(Ld/t/c;)V

    invoke-virtual {v0, v1}, Ld/m/e;->a(Ld/m/g;)V

    iget-object v1, p0, Ld/t/b;->b:Ld/t/a;

    if-eqz p1, :cond_0

    const-string v2, "androidx.lifecycle.BundlableSavedStateRegistry.key"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    iput-object p1, v1, Ld/t/a;->b:Landroid/os/Bundle;

    :cond_0
    new-instance p1, Landroidx/savedstate/SavedStateRegistry$1;

    invoke-direct {p1, v1}, Landroidx/savedstate/SavedStateRegistry$1;-><init>(Ld/t/a;)V

    invoke-virtual {v0, p1}, Ld/m/e;->a(Ld/m/g;)V

    const/4 p1, 0x1

    iput-boolean p1, v1, Ld/t/a;->c:Z

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "SavedStateRegistry was already restored."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 4
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Restarter must be created only during owner\'s initialization stage"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
