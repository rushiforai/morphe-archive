.class public abstract Lo93;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljjm;


# instance fields
.field public a:Z

.field public b:Lkjm;


# virtual methods
.method public final b(Lhjm;I)V
    .registers 4

    iget-boolean v0, p0, Lo93;->a:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lo93;->a:Z

    invoke-virtual {p0, p2}, Lo93;->f(I)V

    iget-object p2, p0, Lo93;->b:Lkjm;

    invoke-interface {p2, p0, p1}, Lkjm;->o(Ljjm;Lhjm;)V

    return-void
.end method

.method public d()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public e(Landroid/view/View;)Lgtj;
    .registers 5

    const v0, 0x7f1410f9

    const/16 v1, 0x1388

    invoke-static {p1, v0, v1}, Lgtj;->c(Landroid/view/View;II)Lgtj;

    move-result-object v0

    new-instance v1, Lnf;

    const/16 v2, 0x16

    invoke-direct {v1, p0, p1, v2}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const p0, 0x7f1405c5

    invoke-virtual {v0, p0, v1}, Lgtj;->f(ILandroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method public f(I)V
    .registers 2

    return-void
.end method

.method public final finish(Lhjm;)V
    .registers 3

    sget-object p1, Lhjm;->b:Lhjm;

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lo93;->b(Lhjm;I)V

    return-void
.end method

.method public final setRequestDismisser(Lkjm;)V
    .registers 2

    iput-object p1, p0, Lo93;->b:Lkjm;

    return-void
.end method
