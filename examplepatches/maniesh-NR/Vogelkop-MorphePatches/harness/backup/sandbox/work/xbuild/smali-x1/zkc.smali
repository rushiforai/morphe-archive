.class public abstract Lzkc;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"

# interfaces
.implements Ly9n;


# instance fields
.field public b:Z


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 4

    const/16 p1, 0x63

    if-lt p2, p1, :cond_f

    iget-boolean p1, p0, Lzkc;->b:Z

    if-nez p1, :cond_f

    const/4 p1, 0x1

    iput-boolean p1, p0, Lzkc;->b:Z

    invoke-virtual {p0}, Lzkc;->V()V

    return-void

    :cond_f
    const/16 p1, 0x46

    if-ge p2, p1, :cond_1d

    iget-boolean p1, p0, Lzkc;->b:Z

    if-eqz p1, :cond_1d

    const/4 p1, 0x0

    iput-boolean p1, p0, Lzkc;->b:Z

    invoke-virtual {p0}, Lzkc;->U()V

    :cond_1d
    return-void
.end method

.method public abstract U()V
.end method

.method public abstract V()V
.end method
