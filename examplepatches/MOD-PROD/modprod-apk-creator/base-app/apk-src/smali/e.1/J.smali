.class public final Le/J;
.super Lg/a;
.source "SourceFile"

# interfaces
.implements Lh/l;


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Lh/n;

.field public e:LG/a;

.field public f:Ljava/lang/ref/WeakReference;

.field public final synthetic g:Le/K;


# direct methods
.method public constructor <init>(Le/K;Landroid/content/Context;LG/a;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/J;->g:Le/K;

    iput-object p2, p0, Le/J;->c:Landroid/content/Context;

    iput-object p3, p0, Le/J;->e:LG/a;

    new-instance p1, Lh/n;

    invoke-direct {p1, p2}, Lh/n;-><init>(Landroid/content/Context;)V

    const/4 p2, 0x1

    iput p2, p1, Lh/n;->l:I

    iput-object p1, p0, Le/J;->d:Lh/n;

    iput-object p0, p1, Lh/n;->e:Lh/l;

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v1, v0, Le/K;->w:Le/J;

    if-eq v1, p0, :cond_0

    return-void

    :cond_0
    iget-boolean v1, v0, Le/K;->D:Z

    if-eqz v1, :cond_1

    iput-object p0, v0, Le/K;->x:Le/J;

    iget-object v1, p0, Le/J;->e:LG/a;

    iput-object v1, v0, Le/K;->y:LG/a;

    goto :goto_0

    :cond_1
    iget-object v1, p0, Le/J;->e:LG/a;

    invoke-virtual {v1, p0}, LG/a;->b(Lg/a;)V

    :goto_0
    const/4 v1, 0x0

    iput-object v1, p0, Le/J;->e:LG/a;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Le/K;->V(Z)V

    iget-object v2, v0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    iget-object v3, v2, Landroidx/appcompat/widget/ActionBarContextView;->k:Landroid/view/View;

    if-nez v3, :cond_2

    invoke-virtual {v2}, Landroidx/appcompat/widget/ActionBarContextView;->e()V

    :cond_2
    iget-object v2, v0, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    iget-boolean v3, v0, Le/K;->I:Z

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    iput-object v1, v0, Le/K;->w:Le/J;

    return-void
.end method

.method public final b()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Le/J;->f:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final c()Lh/n;
    .locals 1

    iget-object v0, p0, Le/J;->d:Lh/n;

    return-object v0
.end method

.method public final d()Landroid/view/MenuInflater;
    .locals 2

    new-instance v0, Lg/h;

    iget-object v1, p0, Le/J;->c:Landroid/content/Context;

    invoke-direct {v0, v1}, Lg/h;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public final e()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarContextView;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public final f()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarContextView;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public final g(Lh/n;)V
    .locals 0

    iget-object p1, p0, Le/J;->e:LG/a;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Le/J;->i()V

    iget-object p1, p0, Le/J;->g:Le/K;

    iget-object p1, p1, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    iget-object p1, p1, Landroidx/appcompat/widget/ActionBarContextView;->d:Li/l;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Li/l;->l()Z

    :cond_1
    :goto_0
    return-void
.end method

.method public final h(Lh/n;Landroid/view/MenuItem;)Z
    .locals 0

    iget-object p1, p0, Le/J;->e:LG/a;

    if-eqz p1, :cond_0

    iget-object p1, p1, LG/a;->a:Ljava/lang/Object;

    check-cast p1, LQ/t;

    invoke-virtual {p1, p0, p2}, LQ/t;->f(Lg/a;Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final i()V
    .locals 2

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->w:Le/J;

    if-eq v0, p0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Le/J;->d:Lh/n;

    invoke-virtual {v0}, Lh/n;->w()V

    :try_start_0
    iget-object v1, p0, Le/J;->e:LG/a;

    invoke-virtual {v1, p0, v0}, LG/a;->d(Lg/a;Lh/n;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Lh/n;->v()V

    return-void

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lh/n;->v()V

    throw v1
.end method

.method public final j()Z
    .locals 1

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    iget-boolean v0, v0, Landroidx/appcompat/widget/ActionBarContextView;->s:Z

    return v0
.end method

.method public final k(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setCustomView(Landroid/view/View;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/J;->f:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public final l(I)V
    .locals 1

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->o:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/J;->m(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final m(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setSubtitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final n(I)V
    .locals 1

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->o:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/J;->o(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final o(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final p(Z)V
    .locals 1

    iput-boolean p1, p0, Lg/a;->b:Z

    iget-object v0, p0, Le/J;->g:Le/K;

    iget-object v0, v0, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setTitleOptional(Z)V

    return-void
.end method
