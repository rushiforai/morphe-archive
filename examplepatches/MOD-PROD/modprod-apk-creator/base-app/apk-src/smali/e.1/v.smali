.class public final Le/v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/Window$Callback;


# instance fields
.field public final a:Landroid/view/Window$Callback;

.field public b:Z

.field public c:Z

.field public d:Z

.field public final synthetic e:Le/B;


# direct methods
.method public constructor <init>(Le/B;Landroid/view/Window$Callback;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/v;->e:Le/B;

    if-eqz p2, :cond_0

    iput-object p2, p0, Le/v;->a:Landroid/view/Window$Callback;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Window callback may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final a(Landroid/view/Window$Callback;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    iput-boolean v0, p0, Le/v;->b:Z

    invoke-interface {p1}, Landroid/view/Window$Callback;->onContentChanged()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean v1, p0, Le/v;->b:Z

    return-void

    :catchall_0
    move-exception p1

    iput-boolean v1, p0, Le/v;->b:Z

    throw p1
.end method

.method public final b(ILandroid/view/Menu;)Z
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuOpened(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public final c(ILandroid/view/Menu;)V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    return-void
.end method

.method public final d(Ljava/util/List;Landroid/view/Menu;I)V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-static {v0, p1, p2, p3}, Lg/l;->a(Landroid/view/Window$Callback;Ljava/util/List;Landroid/view/Menu;I)V

    return-void
.end method

.method public final dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public final dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    iget-boolean v0, p0, Le/v;->c:Z

    iget-object v1, p0, Le/v;->a:Landroid/view/Window$Callback;

    if-eqz v0, :cond_0

    invoke-interface {v1, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Le/v;->e:Le/B;

    invoke-virtual {v0, p1}, Le/B;->t(Landroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-interface {v1, p1}, Landroid/view/Window$Callback;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public final dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z
    .locals 6

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchKeyShortcutEvent(Landroid/view/KeyEvent;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_8

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    iget-object v2, p0, Le/v;->e:Le/B;

    invoke-virtual {v2}, Le/B;->z()V

    iget-object v3, v2, Le/B;->o:Le/K;

    const/4 v4, 0x0

    if-eqz v3, :cond_4

    iget-object v3, v3, Le/K;->w:Le/J;

    if-nez v3, :cond_1

    :cond_0
    move v0, v4

    goto :goto_1

    :cond_1
    iget-object v3, v3, Le/J;->d:Lh/n;

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getDeviceId()I

    move-result v5

    invoke-static {v5}, Landroid/view/KeyCharacterMap;->load(I)Landroid/view/KeyCharacterMap;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/KeyCharacterMap;->getKeyboardType()I

    move-result v5

    if-eq v5, v1, :cond_2

    move v5, v1

    goto :goto_0

    :cond_2
    move v5, v4

    :goto_0
    invoke-virtual {v3, v5}, Lh/n;->setQwertyMode(Z)V

    invoke-virtual {v3, v0, p1, v4}, Lh/n;->performShortcut(ILandroid/view/KeyEvent;I)Z

    move-result v0

    :goto_1
    if-eqz v0, :cond_4

    :cond_3
    :goto_2
    move p1, v1

    goto :goto_3

    :cond_4
    iget-object v0, v2, Le/B;->M:Le/A;

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    invoke-virtual {v2, v0, v3, p1}, Le/B;->E(Le/A;ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object p1, v2, Le/B;->M:Le/A;

    if-eqz p1, :cond_3

    iput-boolean v1, p1, Le/A;->l:Z

    goto :goto_2

    :cond_5
    iget-object v0, v2, Le/B;->M:Le/A;

    if-nez v0, :cond_6

    invoke-virtual {v2, v4}, Le/B;->y(I)Le/A;

    move-result-object v0

    invoke-virtual {v2, v0, p1}, Le/B;->F(Le/A;Landroid/view/KeyEvent;)Z

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v3

    invoke-virtual {v2, v0, v3, p1}, Le/B;->E(Le/A;ILandroid/view/KeyEvent;)Z

    move-result p1

    iput-boolean v4, v0, Le/A;->k:Z

    if-eqz p1, :cond_6

    goto :goto_2

    :cond_6
    move p1, v4

    :goto_3
    if-eqz p1, :cond_7

    goto :goto_4

    :cond_7
    return v4

    :cond_8
    :goto_4
    return v1
.end method

.method public final dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)Z

    move-result p1

    return p1
.end method

.method public final dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public final dispatchTrackballEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->dispatchTrackballEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public final onActionModeFinished(Landroid/view/ActionMode;)V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeFinished(Landroid/view/ActionMode;)V

    return-void
.end method

.method public final onActionModeStarted(Landroid/view/ActionMode;)V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onActionModeStarted(Landroid/view/ActionMode;)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onAttachedToWindow()V

    return-void
.end method

.method public final onContentChanged()V
    .locals 1

    iget-boolean v0, p0, Le/v;->b:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onContentChanged()V

    :cond_0
    return-void
.end method

.method public final onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 1

    if-nez p1, :cond_0

    instance-of v0, p2, Lh/n;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public final onCreatePanelView(I)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onCreatePanelView(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final onDetachedFromWindow()V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onDetachedFromWindow()V

    return-void
.end method

.method public final onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public final onMenuOpened(ILandroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0, p1, p2}, Le/v;->b(ILandroid/view/Menu;)Z

    const/16 p2, 0x6c

    const/4 v0, 0x1

    iget-object v1, p0, Le/v;->e:Le/B;

    if-ne p1, p2, :cond_3

    invoke-virtual {v1}, Le/B;->z()V

    iget-object p1, v1, Le/B;->o:Le/K;

    if-eqz p1, :cond_2

    iget-boolean p2, p1, Le/K;->z:Z

    if-ne v0, p2, :cond_0

    goto :goto_0

    :cond_0
    iput-boolean v0, p1, Le/K;->z:Z

    iget-object p1, p1, Le/K;->A:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-gtz p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/lang/ClassCastException;

    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    throw p1

    :cond_2
    :goto_0
    return v0

    :cond_3
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return v0
.end method

.method public final onPanelClosed(ILandroid/view/Menu;)V
    .locals 2

    iget-boolean v0, p0, Le/v;->d:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1, p2}, Landroid/view/Window$Callback;->onPanelClosed(ILandroid/view/Menu;)V

    return-void

    :cond_0
    invoke-virtual {p0, p1, p2}, Le/v;->c(ILandroid/view/Menu;)V

    const/16 p2, 0x6c

    const/4 v0, 0x0

    iget-object v1, p0, Le/v;->e:Le/B;

    if-ne p1, p2, :cond_3

    invoke-virtual {v1}, Le/B;->z()V

    iget-object p1, v1, Le/B;->o:Le/K;

    if-eqz p1, :cond_4

    iget-boolean p2, p1, Le/K;->z:Z

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    iput-boolean v0, p1, Le/K;->z:Z

    iget-object p1, p1, Le/K;->A:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-gtz p2, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Ljava/lang/ClassCastException;

    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    throw p1

    :cond_3
    if-nez p1, :cond_5

    invoke-virtual {v1, p1}, Le/B;->y(I)Le/A;

    move-result-object p1

    iget-boolean p2, p1, Le/A;->m:Z

    if-eqz p2, :cond_4

    invoke-virtual {v1, p1, v0}, Le/B;->r(Le/A;Z)V

    :cond_4
    :goto_0
    return-void

    :cond_5
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final onPointerCaptureChanged(Z)V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-static {v0, p1}, Lg/m;->a(Landroid/view/Window$Callback;Z)V

    return-void
.end method

.method public final onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 3

    instance-of v0, p3, Lh/n;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Lh/n;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    if-nez v0, :cond_1

    return v1

    :cond_1
    if-eqz v0, :cond_2

    const/4 v2, 0x1

    iput-boolean v2, v0, Lh/n;->x:Z

    :cond_2
    iget-object v2, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v2, p1, p2, p3}, Landroid/view/Window$Callback;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    move-result p1

    if-eqz v0, :cond_3

    iput-boolean v1, v0, Lh/n;->x:Z

    :cond_3
    return p1
.end method

.method public final onProvideKeyboardShortcuts(Ljava/util/List;Landroid/view/Menu;I)V
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Le/v;->e:Le/B;

    invoke-virtual {v1, v0}, Le/B;->y(I)Le/A;

    move-result-object v0

    iget-object v0, v0, Le/A;->h:Lh/n;

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, v0, p3}, Le/v;->d(Ljava/util/List;Landroid/view/Menu;I)V

    return-void

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Le/v;->d(Ljava/util/List;Landroid/view/Menu;I)V

    return-void
.end method

.method public final onSearchRequested()Z
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0}, Landroid/view/Window$Callback;->onSearchRequested()Z

    move-result v0

    return v0
.end method

.method public final onSearchRequested(Landroid/view/SearchEvent;)Z
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-static {v0, p1}, Lg/k;->a(Landroid/view/Window$Callback;Landroid/view/SearchEvent;)Z

    move-result p1

    return p1
.end method

.method public final onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowAttributesChanged(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public final onWindowFocusChanged(Z)V
    .locals 1

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-interface {v0, p1}, Landroid/view/Window$Callback;->onWindowFocusChanged(Z)V

    return-void
.end method

.method public final onWindowStartingActionMode(Landroid/view/ActionMode$Callback;)Landroid/view/ActionMode;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public final onWindowStartingActionMode(Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;
    .locals 8

    const/4 v0, 0x0

    const/4 v1, 0x1

    iget-object v2, p0, Le/v;->e:Le/B;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_0

    iget-object v0, p0, Le/v;->a:Landroid/view/Window$Callback;

    invoke-static {v0, p1, p2}, Lg/k;->b(Landroid/view/Window$Callback;Landroid/view/ActionMode$Callback;I)Landroid/view/ActionMode;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p2, LQ/t;

    iget-object v3, v2, Le/B;->k:Landroid/content/Context;

    invoke-direct {p2, v3, p1}, LQ/t;-><init>(Landroid/content/Context;Landroid/view/ActionMode$Callback;)V

    iget-object p1, v2, Le/B;->u:Lg/a;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lg/a;->a()V

    :cond_1
    new-instance p1, LG/a;

    invoke-direct {p1, v2, p2, v0}, LG/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v2}, Le/B;->z()V

    iget-object v3, v2, Le/B;->o:Le/K;

    const/4 v4, 0x0

    if-eqz v3, :cond_4

    iget-object v5, v3, Le/K;->w:Le/J;

    if-eqz v5, :cond_2

    invoke-virtual {v5}, Le/J;->a()V

    :cond_2
    iget-object v5, v3, Le/K;->q:Landroidx/appcompat/widget/ActionBarOverlayLayout;

    invoke-virtual {v5, v0}, Landroidx/appcompat/widget/ActionBarOverlayLayout;->setHideOnContentScrollEnabled(Z)V

    iget-object v5, v3, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v5}, Landroidx/appcompat/widget/ActionBarContextView;->e()V

    new-instance v5, Le/J;

    iget-object v6, v3, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v3, v6, p1}, Le/J;-><init>(Le/K;Landroid/content/Context;LG/a;)V

    iget-object v6, v5, Le/J;->d:Lh/n;

    invoke-virtual {v6}, Lh/n;->w()V

    :try_start_0
    iget-object v7, v5, Le/J;->e:LG/a;

    iget-object v7, v7, LG/a;->a:Ljava/lang/Object;

    check-cast v7, LQ/t;

    invoke-virtual {v7, v5, v6}, LQ/t;->g(Lg/a;Lh/n;)Z

    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v6}, Lh/n;->v()V

    if-eqz v7, :cond_3

    iput-object v5, v3, Le/K;->w:Le/J;

    invoke-virtual {v5}, Le/J;->i()V

    iget-object v6, v3, Le/K;->t:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v6, v5}, Landroidx/appcompat/widget/ActionBarContextView;->c(Lg/a;)V

    invoke-virtual {v3, v1}, Le/K;->V(Z)V

    goto :goto_0

    :cond_3
    move-object v5, v4

    :goto_0
    iput-object v5, v2, Le/B;->u:Lg/a;

    goto :goto_1

    :catchall_0
    move-exception p1

    invoke-virtual {v6}, Lh/n;->v()V

    throw p1

    :cond_4
    :goto_1
    iget-object v3, v2, Le/B;->u:Lg/a;

    if-nez v3, :cond_12

    iget-object v3, v2, Le/B;->y:Ly/Q;

    if-eqz v3, :cond_5

    invoke-virtual {v3}, Ly/Q;->b()V

    :cond_5
    iget-object v3, v2, Le/B;->u:Lg/a;

    if-eqz v3, :cond_6

    invoke-virtual {v3}, Lg/a;->a()V

    :cond_6
    iget-object v3, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    if-nez v3, :cond_b

    iget-boolean v3, v2, Le/B;->I:Z

    iget-object v5, v2, Le/B;->k:Landroid/content/Context;

    if-eqz v3, :cond_8

    new-instance v3, Landroid/util/TypedValue;

    invoke-direct {v3}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v7, 0x7f030009

    invoke-virtual {v6, v7, v3, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v7, v3, Landroid/util/TypedValue;->resourceId:I

    if-eqz v7, :cond_7

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->newTheme()Landroid/content/res/Resources$Theme;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    iget v6, v3, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v7, v6, v1}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    new-instance v6, Lg/c;

    invoke-direct {v6, v5, v0}, Lg/c;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v6}, Lg/c;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v5

    invoke-virtual {v5, v7}, Landroid/content/res/Resources$Theme;->setTo(Landroid/content/res/Resources$Theme;)V

    move-object v5, v6

    :cond_7
    new-instance v6, Landroidx/appcompat/widget/ActionBarContextView;

    invoke-direct {v6, v5, v4}, Landroidx/appcompat/widget/ActionBarContextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object v6, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    new-instance v6, Landroid/widget/PopupWindow;

    const v7, 0x7f030018

    invoke-direct {v6, v5, v4, v7}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v6, v2, Le/B;->w:Landroid/widget/PopupWindow;

    const/4 v7, 0x2

    invoke-static {v6, v7}, LD/o;->d(Landroid/widget/PopupWindow;I)V

    iget-object v6, v2, Le/B;->w:Landroid/widget/PopupWindow;

    iget-object v7, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v6, v7}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    iget-object v6, v2, Le/B;->w:Landroid/widget/PopupWindow;

    const/4 v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/PopupWindow;->setWidth(I)V

    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v7, 0x7f030003

    invoke-virtual {v6, v7, v3, v1}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v3, v3, Landroid/util/TypedValue;->data:I

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/TypedValue;->complexToDimensionPixelSize(ILandroid/util/DisplayMetrics;)I

    move-result v3

    iget-object v5, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v5, v3}, Landroidx/appcompat/widget/ActionBarContextView;->setContentHeight(I)V

    iget-object v3, v2, Le/B;->w:Landroid/widget/PopupWindow;

    const/4 v5, -0x2

    invoke-virtual {v3, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    new-instance v3, Le/p;

    invoke-direct {v3, v2, v1}, Le/p;-><init>(Le/B;I)V

    iput-object v3, v2, Le/B;->x:Le/p;

    goto :goto_4

    :cond_8
    iget-object v3, v2, Le/B;->A:Landroid/view/ViewGroup;

    const v6, 0x7f080036

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/ViewStubCompat;

    if-eqz v3, :cond_b

    invoke-virtual {v2}, Le/B;->z()V

    iget-object v6, v2, Le/B;->o:Le/K;

    if-eqz v6, :cond_9

    invoke-virtual {v6}, Le/K;->W()Landroid/content/Context;

    move-result-object v6

    goto :goto_2

    :cond_9
    move-object v6, v4

    :goto_2
    if-nez v6, :cond_a

    goto :goto_3

    :cond_a
    move-object v5, v6

    :goto_3
    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroidx/appcompat/widget/ViewStubCompat;->setLayoutInflater(Landroid/view/LayoutInflater;)V

    invoke-virtual {v3}, Landroidx/appcompat/widget/ViewStubCompat;->a()Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/appcompat/widget/ActionBarContextView;

    iput-object v3, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    :cond_b
    :goto_4
    iget-object v3, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    if-eqz v3, :cond_11

    iget-object v3, v2, Le/B;->y:Ly/Q;

    if-eqz v3, :cond_c

    invoke-virtual {v3}, Ly/Q;->b()V

    :cond_c
    iget-object v3, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v3}, Landroidx/appcompat/widget/ActionBarContextView;->e()V

    new-instance v3, Lg/d;

    iget-object v5, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    iget-object v6, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v5, v3, Lg/d;->c:Landroid/content/Context;

    iput-object v6, v3, Lg/d;->d:Landroidx/appcompat/widget/ActionBarContextView;

    iput-object p1, v3, Lg/d;->e:LG/a;

    new-instance v5, Lh/n;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Lh/n;-><init>(Landroid/content/Context;)V

    iput v1, v5, Lh/n;->l:I

    iput-object v5, v3, Lg/d;->h:Lh/n;

    iput-object v3, v5, Lh/n;->e:Lh/l;

    iget-object p1, p1, LG/a;->a:Ljava/lang/Object;

    check-cast p1, LQ/t;

    invoke-virtual {p1, v3, v5}, LQ/t;->g(Lg/a;Lh/n;)Z

    move-result p1

    if-eqz p1, :cond_10

    invoke-virtual {v3}, Lg/d;->i()V

    iget-object p1, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v3}, Landroidx/appcompat/widget/ActionBarContextView;->c(Lg/a;)V

    iput-object v3, v2, Le/B;->u:Lg/a;

    iget-boolean p1, v2, Le/B;->z:Z

    if-eqz p1, :cond_d

    iget-object p1, v2, Le/B;->A:Landroid/view/ViewGroup;

    if-eqz p1, :cond_d

    invoke-virtual {p1}, Landroid/view/View;->isLaidOut()Z

    move-result p1

    if-eqz p1, :cond_d

    move p1, v1

    goto :goto_5

    :cond_d
    move p1, v0

    :goto_5
    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz p1, :cond_e

    iget-object p1, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-static {p1}, Ly/K;->a(Landroid/view/View;)Ly/Q;

    move-result-object p1

    invoke-virtual {p1, v3}, Ly/Q;->a(F)V

    iput-object p1, v2, Le/B;->y:Ly/Q;

    new-instance v0, Le/r;

    invoke-direct {v0, v1, v2}, Le/r;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p1, v0}, Ly/Q;->d(Ly/S;)V

    goto :goto_6

    :cond_e
    iget-object p1, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v3}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/ActionBarContextView;->setVisibility(I)V

    iget-object p1, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    instance-of p1, p1, Landroid/view/View;

    if-eqz p1, :cond_f

    iget-object p1, v2, Le/B;->v:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    sget-object v0, Ly/K;->a:Ljava/util/WeakHashMap;

    invoke-static {p1}, Ly/y;->c(Landroid/view/View;)V

    :cond_f
    :goto_6
    iget-object p1, v2, Le/B;->w:Landroid/widget/PopupWindow;

    if-eqz p1, :cond_11

    iget-object p1, v2, Le/B;->l:Landroid/view/Window;

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    iget-object v0, v2, Le/B;->x:Le/p;

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_7

    :cond_10
    iput-object v4, v2, Le/B;->u:Lg/a;

    :cond_11
    :goto_7
    invoke-virtual {v2}, Le/B;->H()V

    iget-object p1, v2, Le/B;->u:Lg/a;

    iput-object p1, v2, Le/B;->u:Lg/a;

    :cond_12
    invoke-virtual {v2}, Le/B;->H()V

    iget-object p1, v2, Le/B;->u:Lg/a;

    if-eqz p1, :cond_13

    invoke-virtual {p2, p1}, LQ/t;->b(Lg/a;)Lg/e;

    move-result-object p1

    return-object p1

    :cond_13
    return-object v4
.end method
