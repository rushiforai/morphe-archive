.class public Ll/ofq0$d;
.super Ll/o30;
.source "SourceFile"

# interfaces
.implements Landroidx/appcompat/view/menu/MenuBuilder$a;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP_PREFIX:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ofq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Landroidx/appcompat/view/menu/MenuBuilder;

.field public e:Ll/o30$a;

.field public f:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic g:Ll/ofq0;


# direct methods
.method public constructor <init>(Ll/ofq0;Landroid/content/Context;Ll/o30$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/o30;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/ofq0$d;->c:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/ofq0$d;->e:Ll/o30$a;

    .line 9
    .line 10
    new-instance p1, Landroidx/appcompat/view/menu/MenuBuilder;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Landroidx/appcompat/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    .line 13
    .line 14
    .line 15
    const/4 p2, 0x1

    .line 16
    invoke-virtual {p1, p2}, Landroidx/appcompat/view/menu/MenuBuilder;->setDefaultShowAsAction(I)Landroidx/appcompat/view/menu/MenuBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Landroidx/appcompat/view/menu/MenuBuilder;->setCallback(Landroidx/appcompat/view/menu/MenuBuilder$a;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/ofq0;->n:Ll/ofq0$d;

    .line 4
    .line 5
    if-eq v1, p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-boolean v1, v0, Ll/ofq0;->v:Z

    .line 9
    .line 10
    iget-boolean v0, v0, Ll/ofq0;->w:Z

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-static {v1, v0, v2}, Ll/ofq0;->J(ZZZ)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 20
    .line 21
    iput-object p0, v0, Ll/ofq0;->o:Ll/o30;

    .line 22
    .line 23
    iget-object v1, p0, Ll/ofq0$d;->e:Ll/o30$a;

    .line 24
    .line 25
    iput-object v1, v0, Ll/ofq0;->p:Ll/o30$a;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v0, p0, Ll/ofq0$d;->e:Ll/o30$a;

    .line 29
    .line 30
    invoke-interface {v0, p0}, Ll/o30$a;->d(Ll/o30;)V

    .line 31
    .line 32
    .line 33
    :goto_0
    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Ll/ofq0$d;->e:Ll/o30$a;

    .line 35
    .line 36
    iget-object v1, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ll/ofq0;->I(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 42
    .line 43
    iget-object v1, v1, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroidx/appcompat/widget/ActionBarContextView;->g()V

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 49
    .line 50
    iget-object v1, v1, Ll/ofq0;->g:Ll/qid;

    .line 51
    .line 52
    invoke-interface {v1}, Ll/qid;->t()Landroid/view/ViewGroup;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/16 v2, 0x20

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 62
    .line 63
    iget-object v2, v1, Ll/ofq0;->e:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    .line 64
    .line 65
    iget-boolean v1, v1, Ll/ofq0;->B:Z

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 71
    .line 72
    iput-object v0, p0, Ll/ofq0;->n:Ll/ofq0$d;

    .line 73
    .line 74
    return-void
.end method

.method public b()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$d;->f:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/view/View;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public c()Landroid/view/Menu;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Landroid/view/MenuInflater;
    .locals 1

    .line 1
    new-instance v0, Ll/g7h0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ofq0$d;->c:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/g7h0;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public e()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarContextView;->getSubtitle()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public g()Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarContextView;->getTitle()Ljava/lang/CharSequence;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ofq0;->n:Ll/ofq0$d;

    .line 4
    .line 5
    if-eq v0, p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-object v0, p0, Ll/ofq0$d;->e:Ll/o30$a;

    .line 14
    .line 15
    iget-object v1, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 16
    .line 17
    invoke-interface {v0, p0, v1}, Ll/o30$a;->c(Ll/o30;Landroid/view/Menu;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    iget-object p0, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 30
    .line 31
    .line 32
    throw v0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarContextView;->j()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public k(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setCustomView(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/ofq0$d;->f:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    return-void
.end method

.method public l(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ofq0;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/ofq0$d;->m(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public m(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setSubtitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/ofq0;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Ll/ofq0$d;->p(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onMenuItemSelected(Landroidx/appcompat/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ofq0$d;->e:Ll/o30$a;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, p0, p2}, Ll/o30$a;->a(Ll/o30;Landroid/view/MenuItem;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public onMenuModeChange(Landroidx/appcompat/view/menu/MenuBuilder;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ofq0$d;->e:Ll/o30$a;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/ofq0$d;->i()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/appcompat/widget/ActionBarContextView;->l()Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public p(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/o30;->q(Z)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/ofq0$d;->g:Ll/ofq0;

    .line 5
    .line 6
    iget-object p0, p0, Ll/ofq0;->h:Landroidx/appcompat/widget/ActionBarContextView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setTitleOptional(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public r()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, Ll/ofq0$d;->e:Ll/o30$a;

    .line 7
    .line 8
    iget-object v1, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 9
    .line 10
    invoke-interface {v0, p0, v1}, Ll/o30$a;->b(Ll/o30;Landroid/view/Menu;)Z

    .line 11
    .line 12
    .line 13
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    iget-object p0, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 17
    .line 18
    .line 19
    return v0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    iget-object p0, p0, Ll/ofq0$d;->d:Landroidx/appcompat/view/menu/MenuBuilder;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 24
    .line 25
    .line 26
    throw v0
.end method
