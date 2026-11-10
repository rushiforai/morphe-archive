.class public abstract Landroidx/activity/l;
.super Lo/h;
.source "SourceFile"

# interfaces
.implements Landroidx/lifecycle/H;
.implements LL/g;


# instance fields
.field public final b:La/a;

.field public final c:LC/h;

.field public final d:Landroidx/lifecycle/s;

.field public final e:LL/f;

.field public f:Landroidx/lifecycle/G;

.field public g:Landroidx/activity/v;

.field public final h:Landroidx/activity/k;

.field public final i:LL/f;

.field public final j:Landroidx/activity/h;

.field public final k:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public final l:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public final m:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public final n:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public final o:Ljava/util/concurrent/CopyOnWriteArrayList;

.field public p:Z

.field public q:Z


# direct methods
.method public constructor <init>()V
    .locals 7

    invoke-direct {p0}, Lo/h;-><init>()V

    new-instance v0, La/a;

    invoke-direct {v0}, La/a;-><init>()V

    iput-object v0, p0, Landroidx/activity/l;->b:La/a;

    new-instance v0, LC/h;

    new-instance v1, Landroidx/activity/d;

    move-object v2, p0

    check-cast v2, Le/i;

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2}, Landroidx/activity/d;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v1}, LC/h;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroidx/activity/l;->c:LC/h;

    new-instance v0, Landroidx/lifecycle/s;

    invoke-direct {v0, p0}, Landroidx/lifecycle/s;-><init>(Landroidx/lifecycle/q;)V

    iput-object v0, p0, Landroidx/activity/l;->d:Landroidx/lifecycle/s;

    new-instance v1, LL/f;

    invoke-direct {v1, p0}, LL/f;-><init>(LL/g;)V

    iput-object v1, p0, Landroidx/activity/l;->e:LL/f;

    const/4 v3, 0x0

    iput-object v3, p0, Landroidx/activity/l;->g:Landroidx/activity/v;

    new-instance v4, Landroidx/activity/k;

    invoke-direct {v4, v2}, Landroidx/activity/k;-><init>(Le/i;)V

    iput-object v4, p0, Landroidx/activity/l;->h:Landroidx/activity/k;

    new-instance v5, LL/f;

    new-instance v6, Landroidx/activity/e;

    invoke-direct {v6, v2}, Landroidx/activity/e;-><init>(Le/i;)V

    invoke-direct {v5, v4, v6}, LL/f;-><init>(Landroidx/activity/k;Landroidx/activity/e;)V

    iput-object v5, p0, Landroidx/activity/l;->i:LL/f;

    new-instance v4, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v4}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    new-instance v4, Landroidx/activity/h;

    invoke-direct {v4}, Landroidx/activity/h;-><init>()V

    iput-object v4, p0, Landroidx/activity/l;->j:Landroidx/activity/h;

    new-instance v4, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v4}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v4, p0, Landroidx/activity/l;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v4, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v4}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v4, p0, Landroidx/activity/l;->l:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v4, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v4}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v4, p0, Landroidx/activity/l;->m:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v4, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v4}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v4, p0, Landroidx/activity/l;->n:Ljava/util/concurrent/CopyOnWriteArrayList;

    new-instance v4, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v4}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v4, p0, Landroidx/activity/l;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    const/4 v4, 0x0

    iput-boolean v4, p0, Landroidx/activity/l;->p:Z

    iput-boolean v4, p0, Landroidx/activity/l;->q:Z

    new-instance v4, Landroidx/activity/ComponentActivity$2;

    invoke-direct {v4, v2}, Landroidx/activity/ComponentActivity$2;-><init>(Le/i;)V

    invoke-virtual {v0, v4}, Landroidx/lifecycle/s;->a(Landroidx/lifecycle/p;)V

    new-instance v4, Landroidx/activity/ComponentActivity$3;

    invoke-direct {v4, v2}, Landroidx/activity/ComponentActivity$3;-><init>(Le/i;)V

    invoke-virtual {v0, v4}, Landroidx/lifecycle/s;->a(Landroidx/lifecycle/p;)V

    new-instance v4, Landroidx/activity/ComponentActivity$4;

    invoke-direct {v4, v2}, Landroidx/activity/ComponentActivity$4;-><init>(Le/i;)V

    invoke-virtual {v0, v4}, Landroidx/lifecycle/s;->a(Landroidx/lifecycle/p;)V

    invoke-virtual {v1}, LL/f;->a()V

    iget-object v0, v0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    sget-object v4, Landroidx/lifecycle/l;->b:Landroidx/lifecycle/l;

    if-eq v0, v4, :cond_1

    sget-object v4, Landroidx/lifecycle/l;->c:Landroidx/lifecycle/l;

    if-ne v0, v4, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Failed requirement."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    iget-object v0, v1, LL/f;->c:Ljava/lang/Object;

    check-cast v0, LL/e;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, LL/e;->d:Ljava/lang/Object;

    check-cast v0, Lk/f;

    invoke-virtual {v0}, Lk/f;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    move-object v1, v0

    check-cast v1, Lk/b;

    invoke-virtual {v1}, Lk/b;->hasNext()Z

    move-result v4

    const-string v5, "androidx.lifecycle.internal.SavedStateHandlesProvider"

    if-eqz v4, :cond_3

    invoke-virtual {v1}, Lk/b;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    const-string v4, "components"

    invoke-static {v1, v4}, Lb0/c;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, LL/d;

    invoke-static {v4, v5}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    move-object v3, v1

    :cond_3
    if-nez v3, :cond_4

    new-instance v0, Landroidx/lifecycle/C;

    iget-object v1, p0, Landroidx/activity/l;->e:LL/f;

    iget-object v1, v1, LL/f;->c:Ljava/lang/Object;

    check-cast v1, LL/e;

    invoke-direct {v0, v1, p0}, Landroidx/lifecycle/C;-><init>(LL/e;Landroidx/activity/l;)V

    iget-object v1, p0, Landroidx/activity/l;->e:LL/f;

    iget-object v1, v1, LL/f;->c:Ljava/lang/Object;

    check-cast v1, LL/e;

    invoke-virtual {v1, v5, v0}, LL/e;->e(Ljava/lang/String;LL/d;)V

    iget-object v1, p0, Landroidx/activity/l;->d:Landroidx/lifecycle/s;

    new-instance v3, Landroidx/lifecycle/SavedStateHandleAttacher;

    invoke-direct {v3, v0}, Landroidx/lifecycle/SavedStateHandleAttacher;-><init>(Landroidx/lifecycle/C;)V

    invoke-virtual {v1, v3}, Landroidx/lifecycle/s;->a(Landroidx/lifecycle/p;)V

    :cond_4
    iget-object v0, p0, Landroidx/activity/l;->e:LL/f;

    iget-object v0, v0, LL/f;->c:Ljava/lang/Object;

    check-cast v0, LL/e;

    new-instance v1, Landroidx/activity/f;

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2}, Landroidx/activity/f;-><init>(ILjava/lang/Object;)V

    const-string v3, "android:support:activity-result"

    invoke-virtual {v0, v3, v1}, LL/e;->e(Ljava/lang/String;LL/d;)V

    new-instance v0, Landroidx/activity/g;

    const/4 v1, 0x0

    invoke-direct {v0, v2, v1}, Landroidx/activity/g;-><init>(Le/i;I)V

    invoke-virtual {p0, v0}, Landroidx/activity/l;->f(La/b;)V

    return-void
.end method

.method public static synthetic e(Landroidx/activity/l;)V
    .locals 0

    invoke-super {p0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method


# virtual methods
.method public final a()LL/e;
    .locals 1

    iget-object v0, p0, Landroidx/activity/l;->e:LL/f;

    iget-object v0, v0, LL/f;->c:Ljava/lang/Object;

    check-cast v0, LL/e;

    return-object v0
.end method

.method public final b()Landroidx/lifecycle/G;
    .locals 2

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroid/app/Activity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/activity/j;

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroidx/activity/j;->a:Landroidx/lifecycle/G;

    iput-object v0, p0, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    :cond_0
    iget-object v0, p0, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    if-nez v0, :cond_1

    new-instance v0, Landroidx/lifecycle/G;

    invoke-direct {v0}, Landroidx/lifecycle/G;-><init>()V

    iput-object v0, p0, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    :cond_1
    iget-object v0, p0, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    return-object v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Your activity is not yet attached to the Application instance. You can\'t request ViewModel before onCreate call."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final c()Landroidx/lifecycle/s;
    .locals 1

    iget-object v0, p0, Landroidx/activity/l;->d:Landroidx/lifecycle/s;

    return-object v0
.end method

.method public final f(La/b;)V
    .locals 2

    iget-object v0, p0, Landroidx/activity/l;->b:La/a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, La/a;->b:Landroidx/activity/l;

    if-eqz v1, :cond_0

    invoke-interface {p1}, La/b;->a()V

    :cond_0
    iget-object v0, v0, La/a;->a:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final g()Landroidx/activity/v;
    .locals 3

    iget-object v0, p0, Landroidx/activity/l;->g:Landroidx/activity/v;

    if-nez v0, :cond_0

    new-instance v0, Landroidx/activity/v;

    new-instance v1, LD/b;

    const/4 v2, 0x2

    invoke-direct {v1, v2, p0}, LD/b;-><init>(ILjava/lang/Object;)V

    invoke-direct {v0, v1}, Landroidx/activity/v;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Landroidx/activity/l;->g:Landroidx/activity/v;

    new-instance v0, Landroidx/activity/ComponentActivity$6;

    invoke-direct {v0, p0}, Landroidx/activity/ComponentActivity$6;-><init>(Landroidx/activity/l;)V

    iget-object v1, p0, Landroidx/activity/l;->d:Landroidx/lifecycle/s;

    invoke-virtual {v1, v0}, Landroidx/lifecycle/s;->a(Landroidx/lifecycle/p;)V

    :cond_0
    iget-object v0, p0, Landroidx/activity/l;->g:Landroidx/activity/v;

    return-object v0
.end method

.method public final h()V
    .locals 3

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const v2, 0x7f0800bb

    invoke-virtual {v0, v2, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const v2, 0x7f0800be

    invoke-virtual {v0, v2, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const v2, 0x7f0800bd

    invoke-virtual {v0, v2, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const v2, 0x7f0800bc

    invoke-virtual {v0, v2, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const v1, 0x7f080081

    invoke-virtual {v0, v1, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Landroidx/activity/l;->j:Landroidx/activity/h;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/activity/h;->a(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public final onBackPressed()V
    .locals 1

    invoke-virtual {p0}, Landroidx/activity/l;->g()Landroidx/activity/v;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/activity/v;->a()V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Landroidx/activity/l;->k:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx/a;

    invoke-interface {v1, p1}, Lx/a;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroidx/activity/l;->e:LL/f;

    invoke-virtual {v0, p1}, LL/f;->b(Landroid/os/Bundle;)V

    iget-object v0, p0, Landroidx/activity/l;->b:La/a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p0, v0, La/a;->b:Landroidx/activity/l;

    iget-object v0, v0, La/a;->a:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La/b;

    invoke-interface {v1}, La/b;->a()V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Lo/h;->onCreate(Landroid/os/Bundle;)V

    sget p1, Landroidx/lifecycle/A;->b:I

    invoke-static {p0}, Landroidx/lifecycle/y;->b(Landroid/app/Activity;)V

    return-void
.end method

.method public final onCreatePanelMenu(ILandroid/view/Menu;)Z
    .locals 0

    if-nez p1, :cond_0

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onCreatePanelMenu(ILandroid/view/Menu;)Z

    invoke-virtual {p0}, Landroid/app/Activity;->getMenuInflater()Landroid/view/MenuInflater;

    iget-object p1, p0, Landroidx/activity/l;->c:LC/h;

    invoke-virtual {p1}, LC/h;->n()V

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onMenuItemSelected(ILandroid/view/MenuItem;)Z
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onMenuItemSelected(ILandroid/view/MenuItem;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p2, 0x0

    if-nez p1, :cond_1

    iget-object p1, p0, Landroidx/activity/l;->c:LC/h;

    invoke-virtual {p1}, LC/h;->o()V

    :cond_1
    return p2
.end method

.method public final onMultiWindowModeChanged(Z)V
    .locals 3

    iget-boolean v0, p0, Landroidx/activity/l;->p:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Landroidx/activity/l;->n:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx/a;

    new-instance v2, Lo/i;

    invoke-direct {v2, p1}, Lo/i;-><init>(Z)V

    invoke-interface {v1, v2}, Lx/a;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public final onMultiWindowModeChanged(ZLandroid/content/res/Configuration;)V
    .locals 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/activity/l;->p:Z

    const/4 v0, 0x0

    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onMultiWindowModeChanged(ZLandroid/content/res/Configuration;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean v0, p0, Landroidx/activity/l;->p:Z

    iget-object v0, p0, Landroidx/activity/l;->n:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx/a;

    new-instance v2, Lo/i;

    const-string v3, "newConfig"

    invoke-static {p2, v3}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v2, p1}, Lo/i;-><init>(Z)V

    invoke-interface {v1, v2}, Lx/a;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    iput-boolean v0, p0, Landroidx/activity/l;->p:Z

    throw p1
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    iget-object v0, p0, Landroidx/activity/l;->m:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx/a;

    invoke-interface {v1, p1}, Lx/a;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onPanelClosed(ILandroid/view/Menu;)V
    .locals 4

    iget-object v0, p0, Landroidx/activity/l;->c:LC/h;

    iget-object v0, v0, LC/h;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/l;

    iget-object v1, v1, Landroidx/fragment/app/l;->a:Landroidx/fragment/app/p;

    iget v2, v1, Landroidx/fragment/app/p;->q:I

    const/4 v3, 0x1

    if-ge v2, v3, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, v1, Landroidx/fragment/app/p;->c:LQ/t;

    invoke-virtual {v1}, LQ/t;->d()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_1

    :cond_2
    new-instance p1, Ljava/lang/ClassCastException;

    invoke-direct {p1}, Ljava/lang/ClassCastException;-><init>()V

    throw p1

    :cond_3
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onPanelClosed(ILandroid/view/Menu;)V

    return-void
.end method

.method public final onPictureInPictureModeChanged(Z)V
    .locals 3

    iget-boolean v0, p0, Landroidx/activity/l;->q:Z

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Landroidx/activity/l;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx/a;

    new-instance v2, Lo/r;

    invoke-direct {v2, p1}, Lo/r;-><init>(Z)V

    invoke-interface {v1, v2}, Lx/a;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public final onPictureInPictureModeChanged(ZLandroid/content/res/Configuration;)V
    .locals 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/activity/l;->q:Z

    const/4 v0, 0x0

    :try_start_0
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onPictureInPictureModeChanged(ZLandroid/content/res/Configuration;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iput-boolean v0, p0, Landroidx/activity/l;->q:Z

    iget-object v0, p0, Landroidx/activity/l;->o:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx/a;

    new-instance v2, Lo/r;

    const-string v3, "newConfig"

    invoke-static {p2, v3}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v2, p1}, Lo/r;-><init>(Z)V

    invoke-interface {v1, v2}, Lx/a;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void

    :catchall_0
    move-exception p1

    iput-boolean v0, p0, Landroidx/activity/l;->q:Z

    throw p1
.end method

.method public final onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z
    .locals 0

    if-nez p1, :cond_0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onPreparePanel(ILandroid/view/View;Landroid/view/Menu;)Z

    iget-object p1, p0, Landroidx/activity/l;->c:LC/h;

    invoke-virtual {p1}, LC/h;->p()V

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "androidx.activity.result.contract.extra.PERMISSIONS"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "androidx.activity.result.contract.extra.PERMISSION_GRANT_RESULTS"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    move-result-object v0

    const/4 v1, -0x1

    iget-object v2, p0, Landroidx/activity/l;->j:Landroidx/activity/h;

    invoke-virtual {v2, p1, v1, v0}, Landroidx/activity/h;->a(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    :cond_0
    return-void
.end method

.method public final onRetainNonConfigurationInstance()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Landroidx/activity/l;->f:Landroidx/lifecycle/G;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/app/Activity;->getLastNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/activity/j;

    if-eqz v1, :cond_0

    iget-object v0, v1, Landroidx/activity/j;->a:Landroidx/lifecycle/G;

    :cond_0
    if-nez v0, :cond_1

    const/4 v0, 0x0

    return-object v0

    :cond_1
    new-instance v1, Landroidx/activity/j;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Landroidx/activity/j;->a:Landroidx/lifecycle/G;

    return-object v1
.end method

.method public final onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3

    iget-object v0, p0, Landroidx/activity/l;->d:Landroidx/lifecycle/s;

    if-eqz v0, :cond_0

    sget-object v1, Landroidx/lifecycle/l;->c:Landroidx/lifecycle/l;

    const-string v2, "setCurrentState"

    invoke-virtual {v0, v2}, Landroidx/lifecycle/s;->c(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/l;)V

    :cond_0
    invoke-super {p0, p1}, Lo/h;->onSaveInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Landroidx/activity/l;->e:LL/f;

    invoke-virtual {v0, p1}, LL/f;->c(Landroid/os/Bundle;)V

    return-void
.end method

.method public final onTrimMemory(I)V
    .locals 3

    invoke-super {p0, p1}, Landroid/app/Activity;->onTrimMemory(I)V

    iget-object v0, p0, Landroidx/activity/l;->l:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lx/a;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v2}, Lx/a;->a(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final reportFullyDrawn()V
    .locals 6

    :try_start_0
    invoke-static {}, LD/g;->A()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "reportFullyDrawn() for ComponentActivity"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_3

    :cond_0
    :goto_0
    invoke-super {p0}, Landroid/app/Activity;->reportFullyDrawn()V

    iget-object v0, p0, Landroidx/activity/l;->i:LL/f;

    iget-object v1, v0, LL/f;->a:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v2, 0x1

    :try_start_1
    iput-boolean v2, v0, LL/f;->b:Z

    iget-object v2, v0, LL/f;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_1
    if-ge v4, v3, :cond_1

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, La0/a;

    invoke-interface {v5}, La0/a;->a()Ljava/lang/Object;

    goto :goto_1

    :catchall_1
    move-exception v0

    goto :goto_2

    :cond_1
    iget-object v0, v0, LL/f;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {}, Landroid/os/Trace;->endSection()V

    return-void

    :goto_2
    :try_start_3
    monitor-exit v1

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_3
    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw v0
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p0}, Landroidx/activity/l;->h()V

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Landroidx/activity/l;->h:Landroidx/activity/k;

    iget-boolean v2, v1, Landroidx/activity/k;->c:Z

    if-nez v2, :cond_0

    const/4 v2, 0x1

    iput-boolean v2, v1, Landroidx/activity/k;->c:Z

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    return-void
.end method
