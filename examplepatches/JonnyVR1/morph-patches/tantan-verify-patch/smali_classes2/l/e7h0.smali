.class public Ll/e7h0;
.super Landroid/view/ActionMode;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/e7h0$a;
    }
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/o30;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/o30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/view/ActionMode;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/e7h0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/e7h0;->b:Ll/o30;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCustomView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->b()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getMenu()Landroid/view/Menu;
    .locals 2

    .line 1
    new-instance v0, Ll/qqy;

    .line 2
    .line 3
    iget-object v1, p0, Ll/e7h0;->a:Landroid/content/Context;

    .line 4
    .line 5
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/o30;->c()Landroid/view/Menu;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/f7h0;

    .line 12
    .line 13
    invoke-direct {v0, v1, p0}, Ll/qqy;-><init>(Landroid/content/Context;Ll/f7h0;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public getMenuInflater()Landroid/view/MenuInflater;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->d()Landroid/view/MenuInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->e()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTag()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->f()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->g()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTitleOptionalHint()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->h()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public invalidate()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->i()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public isTitleOptional()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/o30;->j()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setCustomView(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o30;->k(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setSubtitle(I)V
    .locals 0

    .line 7
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    invoke-virtual {p0, p1}, Ll/o30;->l(I)V

    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o30;->m(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTag(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o30;->n(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitle(I)V
    .locals 0

    .line 7
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    invoke-virtual {p0, p1}, Ll/o30;->o(I)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o30;->p(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTitleOptionalHint(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/e7h0;->b:Ll/o30;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/o30;->q(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
