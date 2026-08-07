.class public Ll/b2j0;
.super Ll/c30;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b2j0$d;,
        Ll/b2j0$c;,
        Ll/b2j0$e;
    }
.end annotation


# instance fields
.field public a:Ll/qid;

.field public b:Z

.field public c:Landroid/view/Window$Callback;

.field public d:Z

.field public e:Z

.field public f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/c30$b;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Ljava/lang/Runnable;

.field public final h:Landroidx/appcompat/widget/Toolbar$f;


# direct methods
.method public constructor <init>(Landroidx/appcompat/widget/Toolbar;Ljava/lang/CharSequence;Landroid/view/Window$Callback;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/c30;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/b2j0;->f:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ll/b2j0$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/b2j0$a;-><init>(Ll/b2j0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/b2j0;->g:Ljava/lang/Runnable;

    .line 17
    .line 18
    new-instance v0, Ll/b2j0$b;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Ll/b2j0$b;-><init>(Ll/b2j0;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/b2j0;->h:Landroidx/appcompat/widget/Toolbar$f;

    .line 24
    .line 25
    new-instance v1, Landroidx/appcompat/widget/c;

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-direct {v1, p1, v2}, Landroidx/appcompat/widget/c;-><init>(Landroidx/appcompat/widget/Toolbar;Z)V

    .line 29
    .line 30
    .line 31
    iput-object v1, p0, Ll/b2j0;->a:Ll/qid;

    .line 32
    .line 33
    new-instance v1, Ll/b2j0$e;

    .line 34
    .line 35
    invoke-direct {v1, p0, p3}, Ll/b2j0$e;-><init>(Ll/b2j0;Landroid/view/Window$Callback;)V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 39
    .line 40
    iget-object p3, p0, Ll/b2j0;->a:Ll/qid;

    .line 41
    .line 42
    invoke-interface {p3, v1}, Ll/qid;->setWindowCallback(Landroid/view/Window$Callback;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/Toolbar;->setOnMenuItemClickListener(Landroidx/appcompat/widget/Toolbar$f;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 49
    .line 50
    invoke-interface {p0, p2}, Ll/qid;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public A(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->t()Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0, p1}, Ll/kkl0;->q0(Landroid/view/View;F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public B(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->x(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->q(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public D(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public E(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->setTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->setWindowTitle(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ll/qid;->n(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final I()Landroid/view/Menu;
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/b2j0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/b2j0;->a:Ll/qid;

    .line 6
    .line 7
    new-instance v1, Ll/b2j0$c;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/b2j0$c;-><init>(Ll/b2j0;)V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/b2j0$d;

    .line 13
    .line 14
    invoke-direct {v2, p0}, Ll/b2j0$d;-><init>(Ll/b2j0;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, v1, v2}, Ll/qid;->y(Landroidx/appcompat/view/menu/g$a;Landroidx/appcompat/view/menu/MenuBuilder$a;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    iput-boolean v0, p0, Ll/b2j0;->d:Z

    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/qid;->r()Landroid/view/Menu;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public J()Landroid/view/Window$Callback;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 2
    .line 3
    return-object p0
.end method

.method public K()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/b2j0;->I()Landroid/view/Menu;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Landroidx/appcompat/view/menu/MenuBuilder;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    move-object v1, v0

    .line 11
    check-cast v1, Landroidx/appcompat/view/menu/MenuBuilder;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object v1, v2

    .line 15
    :goto_0
    if-eqz v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {v1}, Landroidx/appcompat/view/menu/MenuBuilder;->stopDispatchingItemsChanged()V

    .line 18
    .line 19
    .line 20
    :cond_1
    :try_start_0
    invoke-interface {v0}, Landroid/view/Menu;->clear()V

    .line 21
    .line 22
    .line 23
    iget-object v3, p0, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-interface {v3, v4, v0}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-eqz v3, :cond_2

    .line 31
    .line 32
    iget-object p0, p0, Ll/b2j0;->c:Landroid/view/Window$Callback;

    .line 33
    .line 34
    invoke-interface {p0, v4, v2, v0}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-nez p0, :cond_3

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    :goto_1
    invoke-interface {v0}, Landroid/view/Menu;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    :cond_3
    if-eqz v1, :cond_4

    .line 47
    .line 48
    invoke-virtual {v1}, Landroidx/appcompat/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 49
    .line 50
    .line 51
    :cond_4
    return-void

    .line 52
    :goto_2
    if-eqz v1, :cond_5

    .line 53
    .line 54
    invoke-virtual {v1}, Landroidx/appcompat/view/menu/MenuBuilder;->startDispatchingItemsChanged()V

    .line 55
    .line 56
    .line 57
    :cond_5
    throw p0
.end method

.method public L(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/qid;->o()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 8
    .line 9
    and-int/2addr p1, p2

    .line 10
    not-int p2, p2

    .line 11
    and-int/2addr p2, v0

    .line 12
    or-int/2addr p1, p2

    .line 13
    invoke-interface {p0, p1}, Ll/qid;->i(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public g()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/qid;->h()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/qid;->collapseActionView()V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public h(Z)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/b2j0;->e:Z

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iput-boolean p1, p0, Ll/b2j0;->e:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/b2j0;->f:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-ge v1, v0, :cond_1

    .line 16
    .line 17
    iget-object v2, p0, Ll/b2j0;->f:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    check-cast v2, Ll/c30$b;

    .line 24
    .line 25
    invoke-interface {v2, p1}, Ll/c30$b;->onMenuVisibilityChanged(Z)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v1, v1, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    :goto_1
    return-void
.end method

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->o()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public j()F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->t()Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/kkl0;->t(Landroid/view/View;)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-interface {p0, v0}, Ll/qid;->n(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public n()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/qid;->t()Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/b2j0;->g:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/b2j0;->a:Ll/qid;

    .line 13
    .line 14
    invoke-interface {v0}, Ll/qid;->t()Landroid/view/ViewGroup;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object p0, p0, Ll/b2j0;->g:Ljava/lang/Runnable;

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/kkl0;->b0(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->getVisibility()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public p(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/c30;->p(Landroid/content/res/Configuration;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/qid;->t()Landroid/view/ViewGroup;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/b2j0;->g:Ljava/lang/Runnable;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public r(ILandroid/view/KeyEvent;)Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/b2j0;->I()Landroid/view/Menu;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getDeviceId()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 v1, -0x1

    .line 16
    :goto_0
    invoke-static {v1}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Landroid/view/KeyCharacterMap;->getKeyboardType()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x1

    .line 25
    if-eq v1, v2, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    move v2, v0

    .line 29
    :goto_1
    invoke-interface {p0, v2}, Landroid/view/Menu;->setQwertyMode(Z)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0, p1, p2, v0}, Landroid/view/Menu;->performShortcut(ILandroid/view/KeyEvent;I)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    return p0

    .line 37
    :cond_2
    return v0
.end method

.method public s(Landroid/view/KeyEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/b2j0;->t()Z

    .line 9
    .line 10
    .line 11
    :cond_0
    return v0
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/qid;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public u(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/b2j0;->a:Ll/qid;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/qid;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public v(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public w(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x4

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0, p1, v0}, Ll/b2j0;->L(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public x(I)V
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/b2j0;->L(II)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public y(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    move p1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p1, 0x0

    .line 7
    :goto_0
    invoke-virtual {p0, p1, v0}, Ll/b2j0;->L(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public z(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    move p1, v0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p1, 0x0

    .line 8
    :goto_0
    invoke-virtual {p0, p1, v0}, Ll/b2j0;->L(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
