.class public final Landroidx/activity/v;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Runnable;

.field public final b:LV/a;

.field public c:Landroidx/fragment/app/k;

.field public final d:Landroid/window/OnBackInvokedCallback;

.field public e:Landroid/window/OnBackInvokedDispatcher;

.field public f:Z

.field public g:Z


# direct methods
.method public constructor <init>(Ljava/lang/Runnable;)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/activity/v;->a:Ljava/lang/Runnable;

    new-instance p1, LV/a;

    invoke-direct {p1}, LV/a;-><init>()V

    iput-object p1, p0, Landroidx/activity/v;->b:LV/a;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x21

    if-lt p1, v0, :cond_1

    const/16 v0, 0x22

    if-lt p1, v0, :cond_0

    sget-object p1, Landroidx/activity/s;->a:Landroidx/activity/s;

    new-instance v0, Landroidx/activity/n;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroidx/activity/n;-><init>(Landroidx/activity/v;I)V

    new-instance v1, Landroidx/activity/n;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Landroidx/activity/n;-><init>(Landroidx/activity/v;I)V

    new-instance v2, Landroidx/activity/o;

    const/4 v3, 0x0

    invoke-direct {v2, v3, p0}, Landroidx/activity/o;-><init>(ILjava/lang/Object;)V

    new-instance v3, Landroidx/activity/o;

    const/4 v4, 0x1

    invoke-direct {v3, v4, p0}, Landroidx/activity/o;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p1, v0, v1, v2, v3}, Landroidx/activity/s;->a(La0/l;La0/l;La0/a;La0/a;)Landroid/window/OnBackInvokedCallback;

    move-result-object p1

    goto :goto_0

    :cond_0
    sget-object p1, Landroidx/activity/q;->a:Landroidx/activity/q;

    new-instance v0, Landroidx/activity/o;

    const/4 v1, 0x2

    invoke-direct {v0, v1, p0}, Landroidx/activity/o;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroidx/activity/q;->a(La0/a;)Landroid/window/OnBackInvokedCallback;

    move-result-object p1

    :goto_0
    iput-object p1, p0, Landroidx/activity/v;->d:Landroid/window/OnBackInvokedCallback;

    :cond_1
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 8

    iget-object v0, p0, Landroidx/activity/v;->b:LV/a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v1, v0, LV/a;->c:I

    invoke-virtual {v0, v1}, Ljava/util/AbstractList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroidx/fragment/app/k;

    iget-boolean v3, v3, Landroidx/fragment/app/k;->a:Z

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    check-cast v1, Landroidx/fragment/app/k;

    iput-object v2, p0, Landroidx/activity/v;->c:Landroidx/fragment/app/k;

    if-eqz v1, :cond_7

    iget-object v0, v1, Landroidx/fragment/app/k;->d:Landroidx/fragment/app/p;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/p;->e(Z)Z

    iget-object v3, v0, Landroidx/fragment/app/p;->g:Landroidx/fragment/app/k;

    iget-boolean v3, v3, Landroidx/fragment/app/k;->a:Z

    if-eqz v3, :cond_6

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Landroidx/fragment/app/p;->e(Z)Z

    invoke-virtual {v0, v1}, Landroidx/fragment/app/p;->d(Z)V

    iget-object v3, v0, Landroidx/fragment/app/p;->B:Ljava/util/ArrayList;

    iget-object v4, v0, Landroidx/fragment/app/p;->C:Ljava/util/ArrayList;

    iget-object v5, v0, Landroidx/fragment/app/p;->d:Ljava/util/ArrayList;

    if-eqz v5, :cond_3

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_1

    :cond_2
    iget-object v5, v0, Landroidx/fragment/app/p;->d:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v1

    goto :goto_2

    :cond_3
    :goto_1
    const/4 v5, -0x1

    :goto_2
    if-gez v5, :cond_4

    goto :goto_4

    :cond_4
    iget-object v6, v0, Landroidx/fragment/app/p;->d:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v1

    :goto_3
    if-lt v6, v5, :cond_5

    iget-object v7, v0, Landroidx/fragment/app/p;->d:Ljava/util/ArrayList;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroidx/fragment/app/a;

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, -0x1

    goto :goto_3

    :cond_5
    iput-boolean v1, v0, Landroidx/fragment/app/p;->b:Z

    :try_start_0
    iget-object v1, v0, Landroidx/fragment/app/p;->B:Ljava/util/ArrayList;

    iget-object v3, v0, Landroidx/fragment/app/p;->C:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v3}, Landroidx/fragment/app/p;->j(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Landroidx/fragment/app/p;->a()V

    :goto_4
    invoke-virtual {v0}, Landroidx/fragment/app/p;->k()V

    iget-object v0, v0, Landroidx/fragment/app/p;->c:LQ/t;

    iget-object v0, v0, LQ/t;->a:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v2}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Collection;->removeAll(Ljava/util/Collection;)Z

    return-void

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroidx/fragment/app/p;->a()V

    throw v1

    :cond_6
    iget-object v0, v0, Landroidx/fragment/app/p;->f:Landroidx/activity/v;

    invoke-virtual {v0}, Landroidx/activity/v;->a()V

    return-void

    :cond_7
    iget-object v0, p0, Landroidx/activity/v;->a:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public final b(Z)V
    .locals 5

    iget-object v0, p0, Landroidx/activity/v;->e:Landroid/window/OnBackInvokedDispatcher;

    iget-object v1, p0, Landroidx/activity/v;->d:Landroid/window/OnBackInvokedCallback;

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    sget-object v2, Landroidx/activity/q;->a:Landroidx/activity/q;

    const/4 v3, 0x0

    if-eqz p1, :cond_0

    iget-boolean v4, p0, Landroidx/activity/v;->f:Z

    if-nez v4, :cond_0

    invoke-virtual {v2, v0, v3, v1}, Landroidx/activity/q;->b(Ljava/lang/Object;ILjava/lang/Object;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroidx/activity/v;->f:Z

    return-void

    :cond_0
    if-nez p1, :cond_1

    iget-boolean p1, p0, Landroidx/activity/v;->f:Z

    if-eqz p1, :cond_1

    invoke-virtual {v2, v0, v1}, Landroidx/activity/q;->c(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-boolean v3, p0, Landroidx/activity/v;->f:Z

    :cond_1
    return-void
.end method

.method public final c()V
    .locals 4

    iget-boolean v0, p0, Landroidx/activity/v;->g:Z

    const/4 v1, 0x0

    iget-object v2, p0, Landroidx/activity/v;->b:LV/a;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, LV/a;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/util/AbstractList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/fragment/app/k;

    iget-boolean v3, v3, Landroidx/fragment/app/k;->a:Z

    if-eqz v3, :cond_1

    const/4 v1, 0x1

    :cond_2
    :goto_0
    iput-boolean v1, p0, Landroidx/activity/v;->g:Z

    if-eq v1, v0, :cond_3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    if-lt v0, v2, :cond_3

    invoke-virtual {p0, v1}, Landroidx/activity/v;->b(Z)V

    :cond_3
    return-void
.end method
