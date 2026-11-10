.class public final Landroidx/lifecycle/s;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public b:Lk/a;

.field public c:Landroidx/lifecycle/l;

.field public final d:Ljava/lang/ref/WeakReference;

.field public e:I

.field public f:Z

.field public g:Z

.field public final h:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroidx/lifecycle/q;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/lifecycle/s;->a:Z

    new-instance v0, Lk/a;

    invoke-direct {v0}, Lk/a;-><init>()V

    iput-object v0, p0, Landroidx/lifecycle/s;->b:Lk/a;

    sget-object v0, Landroidx/lifecycle/l;->b:Landroidx/lifecycle/l;

    iput-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/lifecycle/s;->d:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public final a(Landroidx/lifecycle/p;)V
    .locals 10

    iget-object v0, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    const-string v1, "addObserver"

    invoke-virtual {p0, v1}, Landroidx/lifecycle/s;->c(Ljava/lang/String;)V

    iget-object v1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    sget-object v2, Landroidx/lifecycle/l;->a:Landroidx/lifecycle/l;

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    sget-object v2, Landroidx/lifecycle/l;->b:Landroidx/lifecycle/l;

    :goto_0
    new-instance v1, Landroidx/lifecycle/r;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    sget-object v3, Landroidx/lifecycle/t;->a:Ljava/util/HashMap;

    instance-of v3, p1, Landroidx/lifecycle/o;

    instance-of v4, p1, Landroidx/lifecycle/d;

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    if-eqz v3, :cond_1

    if-eqz v4, :cond_1

    new-instance v3, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;

    move-object v4, p1

    check-cast v4, Landroidx/lifecycle/d;

    move-object v9, p1

    check-cast v9, Landroidx/lifecycle/o;

    invoke-direct {v3, v4, v9}, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;-><init>(Landroidx/lifecycle/d;Landroidx/lifecycle/o;)V

    goto :goto_1

    :cond_1
    if-eqz v4, :cond_2

    new-instance v3, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;

    move-object v4, p1

    check-cast v4, Landroidx/lifecycle/d;

    invoke-direct {v3, v4, v7}, Landroidx/lifecycle/DefaultLifecycleObserverAdapter;-><init>(Landroidx/lifecycle/d;Landroidx/lifecycle/o;)V

    goto :goto_1

    :cond_2
    if-eqz v3, :cond_3

    move-object v3, p1

    check-cast v3, Landroidx/lifecycle/o;

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3}, Landroidx/lifecycle/t;->c(Ljava/lang/Class;)I

    move-result v4

    if-ne v4, v5, :cond_6

    sget-object v4, Landroidx/lifecycle/t;->b:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Lb0/c;->b(Ljava/lang/Object;)V

    check-cast v3, Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-eq v4, v6, :cond_5

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    new-array v9, v4, [Landroidx/lifecycle/g;

    if-gtz v4, :cond_4

    new-instance v3, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;

    invoke-direct {v3, v9}, Landroidx/lifecycle/CompositeGeneratedAdaptersObserver;-><init>([Landroidx/lifecycle/g;)V

    goto :goto_1

    :cond_4
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    invoke-static {v0, p1}, Landroidx/lifecycle/t;->a(Ljava/lang/reflect/Constructor;Landroidx/lifecycle/p;)V

    throw v7

    :cond_5
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Constructor;

    invoke-static {v0, p1}, Landroidx/lifecycle/t;->a(Ljava/lang/reflect/Constructor;Landroidx/lifecycle/p;)V

    throw v7

    :cond_6
    new-instance v3, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;

    invoke-direct {v3, p1}, Landroidx/lifecycle/ReflectiveGenericLifecycleObserver;-><init>(Landroidx/lifecycle/p;)V

    :goto_1
    iput-object v3, v1, Landroidx/lifecycle/r;->b:Landroidx/lifecycle/o;

    iput-object v2, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    iget-object v2, p0, Landroidx/lifecycle/s;->b:Lk/a;

    invoke-virtual {v2, p1}, Lk/a;->a(Ljava/lang/Object;)Lk/c;

    move-result-object v3

    if-eqz v3, :cond_7

    iget-object v2, v3, Lk/c;->b:Ljava/lang/Object;

    goto :goto_3

    :cond_7
    iget-object v3, v2, Lk/a;->e:Ljava/util/HashMap;

    new-instance v4, Lk/c;

    invoke-direct {v4, p1, v1}, Lk/c;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget v9, v2, Lk/f;->d:I

    add-int/2addr v9, v6

    iput v9, v2, Lk/f;->d:I

    iget-object v9, v2, Lk/f;->b:Lk/c;

    if-nez v9, :cond_8

    iput-object v4, v2, Lk/f;->a:Lk/c;

    iput-object v4, v2, Lk/f;->b:Lk/c;

    goto :goto_2

    :cond_8
    iput-object v4, v9, Lk/c;->c:Lk/c;

    iput-object v9, v4, Lk/c;->d:Lk/c;

    iput-object v4, v2, Lk/f;->b:Lk/c;

    :goto_2
    invoke-virtual {v3, p1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v7

    :goto_3
    check-cast v2, Landroidx/lifecycle/r;

    if-eqz v2, :cond_9

    goto :goto_4

    :cond_9
    iget-object v2, p0, Landroidx/lifecycle/s;->d:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/lifecycle/q;

    if-nez v2, :cond_a

    :goto_4
    return-void

    :cond_a
    iget v3, p0, Landroidx/lifecycle/s;->e:I

    if-nez v3, :cond_b

    iget-boolean v3, p0, Landroidx/lifecycle/s;->f:Z

    if-eqz v3, :cond_c

    :cond_b
    move v8, v6

    :cond_c
    invoke-virtual {p0, p1}, Landroidx/lifecycle/s;->b(Landroidx/lifecycle/p;)Landroidx/lifecycle/l;

    move-result-object v3

    iget v4, p0, Landroidx/lifecycle/s;->e:I

    add-int/2addr v4, v6

    iput v4, p0, Landroidx/lifecycle/s;->e:I

    :goto_5
    iget-object v4, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v4, v3}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gez v3, :cond_11

    iget-object v3, p0, Landroidx/lifecycle/s;->b:Lk/a;

    iget-object v3, v3, Lk/a;->e:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    iget-object v3, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v3, Landroidx/lifecycle/k;->Companion:Landroidx/lifecycle/i;

    iget-object v4, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v3, "state"

    invoke-static {v4, v3}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eq v3, v6, :cond_f

    if-eq v3, v5, :cond_e

    const/4 v4, 0x3

    if-eq v3, v4, :cond_d

    move-object v3, v7

    goto :goto_6

    :cond_d
    sget-object v3, Landroidx/lifecycle/k;->ON_RESUME:Landroidx/lifecycle/k;

    goto :goto_6

    :cond_e
    sget-object v3, Landroidx/lifecycle/k;->ON_START:Landroidx/lifecycle/k;

    goto :goto_6

    :cond_f
    sget-object v3, Landroidx/lifecycle/k;->ON_CREATE:Landroidx/lifecycle/k;

    :goto_6
    if-eqz v3, :cond_10

    invoke-virtual {v1, v2, v3}, Landroidx/lifecycle/r;->a(Landroidx/lifecycle/q;Landroidx/lifecycle/k;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int/2addr v3, v6

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Landroidx/lifecycle/s;->b(Landroidx/lifecycle/p;)Landroidx/lifecycle/l;

    move-result-object v3

    goto :goto_5

    :cond_10
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "no event up from "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_11
    if-nez v8, :cond_12

    invoke-virtual {p0}, Landroidx/lifecycle/s;->g()V

    :cond_12
    iget p1, p0, Landroidx/lifecycle/s;->e:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Landroidx/lifecycle/s;->e:I

    return-void
.end method

.method public final b(Landroidx/lifecycle/p;)Landroidx/lifecycle/l;
    .locals 3

    iget-object v0, p0, Landroidx/lifecycle/s;->b:Lk/a;

    iget-object v0, v0, Lk/a;->e:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lk/c;

    iget-object p1, p1, Lk/c;->d:Lk/c;

    goto :goto_0

    :cond_0
    move-object p1, v2

    :goto_0
    if-eqz p1, :cond_1

    iget-object p1, p1, Lk/c;->b:Ljava/lang/Object;

    check-cast p1, Landroidx/lifecycle/r;

    iget-object p1, p1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    goto :goto_1

    :cond_1
    move-object p1, v2

    :goto_1
    iget-object v0, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroidx/lifecycle/l;

    :cond_2
    iget-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    const-string v1, "state1"

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p1, :cond_3

    invoke-virtual {p1, v0}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-gez v1, :cond_3

    goto :goto_2

    :cond_3
    move-object p1, v0

    :goto_2
    if-eqz v2, :cond_4

    invoke-virtual {v2, p1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v0

    if-gez v0, :cond_4

    return-object v2

    :cond_4
    return-object p1
.end method

.method public final c(Ljava/lang/String;)V
    .locals 3

    iget-boolean v0, p0, Landroidx/lifecycle/s;->a:Z

    if-eqz v0, :cond_3

    sget-object v0, Lj/a;->p:Lj/a;

    if-eqz v0, :cond_0

    sget-object v0, Lj/a;->p:Lj/a;

    goto :goto_1

    :cond_0
    const-class v0, Lj/a;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lj/a;->p:Lj/a;

    if-nez v1, :cond_1

    new-instance v1, Lj/a;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lj/a;-><init>(I)V

    sput-object v1, Lj/a;->p:Lj/a;

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v0, Lj/a;->p:Lj/a;

    :goto_1
    iget-object v0, v0, Lj/a;->o:Ljava/lang/Object;

    check-cast v0, Lj/a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    if-ne v0, v1, :cond_2

    return-void

    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Method "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " must be called on the main thread"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_3
    return-void
.end method

.method public final d(Landroidx/lifecycle/k;)V
    .locals 1

    const-string v0, "event"

    invoke-static {p1, v0}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "handleLifecycleEvent"

    invoke-virtual {p0, v0}, Landroidx/lifecycle/s;->c(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/lifecycle/k;->a()Landroidx/lifecycle/l;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/lifecycle/s;->e(Landroidx/lifecycle/l;)V

    return-void
.end method

.method public final e(Landroidx/lifecycle/l;)V
    .locals 3

    iget-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    if-ne v0, p1, :cond_0

    goto :goto_1

    :cond_0
    sget-object v1, Landroidx/lifecycle/l;->b:Landroidx/lifecycle/l;

    sget-object v2, Landroidx/lifecycle/l;->a:Landroidx/lifecycle/l;

    if-ne v0, v1, :cond_2

    if-eq p1, v2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "no event down from "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " in component "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroidx/lifecycle/s;->d:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    :goto_0
    iput-object p1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    iget-boolean p1, p0, Landroidx/lifecycle/s;->f:Z

    const/4 v0, 0x1

    if-nez p1, :cond_5

    iget p1, p0, Landroidx/lifecycle/s;->e:I

    if-eqz p1, :cond_3

    goto :goto_2

    :cond_3
    iput-boolean v0, p0, Landroidx/lifecycle/s;->f:Z

    invoke-virtual {p0}, Landroidx/lifecycle/s;->g()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroidx/lifecycle/s;->f:Z

    iget-object p1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    if-ne p1, v2, :cond_4

    new-instance p1, Lk/a;

    invoke-direct {p1}, Lk/a;-><init>()V

    iput-object p1, p0, Landroidx/lifecycle/s;->b:Lk/a;

    :cond_4
    :goto_1
    return-void

    :cond_5
    :goto_2
    iput-boolean v0, p0, Landroidx/lifecycle/s;->g:Z

    return-void
.end method

.method public final f(Landroidx/lifecycle/p;)V
    .locals 4

    const-string v0, "removeObserver"

    invoke-virtual {p0, v0}, Landroidx/lifecycle/s;->c(Ljava/lang/String;)V

    iget-object v0, p0, Landroidx/lifecycle/s;->b:Lk/a;

    invoke-virtual {v0, p1}, Lk/a;->a(Ljava/lang/Object;)Lk/c;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_3

    :cond_0
    iget v2, v0, Lk/f;->d:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Lk/f;->d:I

    iget-object v2, v0, Lk/f;->c:Ljava/util/WeakHashMap;

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lk/e;

    invoke-virtual {v3, v1}, Lk/e;->a(Lk/c;)V

    goto :goto_0

    :cond_1
    iget-object v2, v1, Lk/c;->d:Lk/c;

    if-eqz v2, :cond_2

    iget-object v3, v1, Lk/c;->c:Lk/c;

    iput-object v3, v2, Lk/c;->c:Lk/c;

    goto :goto_1

    :cond_2
    iget-object v3, v1, Lk/c;->c:Lk/c;

    iput-object v3, v0, Lk/f;->a:Lk/c;

    :goto_1
    iget-object v3, v1, Lk/c;->c:Lk/c;

    if-eqz v3, :cond_3

    iput-object v2, v3, Lk/c;->d:Lk/c;

    goto :goto_2

    :cond_3
    iput-object v2, v0, Lk/f;->b:Lk/c;

    :goto_2
    const/4 v2, 0x0

    iput-object v2, v1, Lk/c;->c:Lk/c;

    iput-object v2, v1, Lk/c;->d:Lk/c;

    :goto_3
    iget-object v0, v0, Lk/a;->e:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public final g()V
    .locals 12

    iget-object v0, p0, Landroidx/lifecycle/s;->d:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/lifecycle/q;

    if-eqz v0, :cond_e

    :cond_0
    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lk/a;

    iget v2, v1, Lk/f;->d:I

    const/4 v3, 0x0

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, v1, Lk/f;->a:Lk/c;

    invoke-static {v1}, Lb0/c;->b(Ljava/lang/Object;)V

    iget-object v1, v1, Lk/c;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/lifecycle/r;

    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    iget-object v2, p0, Landroidx/lifecycle/s;->b:Lk/a;

    iget-object v2, v2, Lk/f;->b:Lk/c;

    invoke-static {v2}, Lb0/c;->b(Ljava/lang/Object;)V

    iget-object v2, v2, Lk/c;->b:Ljava/lang/Object;

    check-cast v2, Landroidx/lifecycle/r;

    iget-object v2, v2, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    if-ne v1, v2, :cond_2

    iget-object v1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    if-ne v1, v2, :cond_2

    :goto_0
    iput-boolean v3, p0, Landroidx/lifecycle/s;->g:Z

    return-void

    :cond_2
    iput-boolean v3, p0, Landroidx/lifecycle/s;->g:Z

    iget-object v1, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    iget-object v2, p0, Landroidx/lifecycle/s;->b:Lk/a;

    iget-object v2, v2, Lk/f;->a:Lk/c;

    invoke-static {v2}, Lb0/c;->b(Ljava/lang/Object;)V

    iget-object v2, v2, Lk/c;->b:Ljava/lang/Object;

    check-cast v2, Landroidx/lifecycle/r;

    iget-object v2, v2, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v1, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x3

    const/4 v4, 0x2

    const-string v5, "state"

    const/4 v6, 0x1

    if-gez v1, :cond_8

    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lk/a;

    new-instance v7, Lk/b;

    iget-object v8, v1, Lk/f;->b:Lk/c;

    iget-object v9, v1, Lk/f;->a:Lk/c;

    const/4 v10, 0x1

    invoke-direct {v7, v8, v9, v10}, Lk/b;-><init>(Lk/c;Lk/c;I)V

    iget-object v1, v1, Lk/f;->c:Ljava/util/WeakHashMap;

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v7, v8}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3
    invoke-virtual {v7}, Lk/b;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    iget-boolean v1, p0, Landroidx/lifecycle/s;->g:Z

    if-nez v1, :cond_8

    invoke-virtual {v7}, Lk/b;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    const-string v8, "next()"

    invoke-static {v1, v8}, Lb0/c;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/lifecycle/p;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/lifecycle/r;

    :goto_1
    iget-object v9, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    iget-object v10, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    invoke-virtual {v9, v10}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v9

    if-lez v9, :cond_3

    iget-boolean v9, p0, Landroidx/lifecycle/s;->g:Z

    if-nez v9, :cond_3

    iget-object v9, p0, Landroidx/lifecycle/s;->b:Lk/a;

    iget-object v9, v9, Lk/a;->e:Ljava/util/HashMap;

    invoke-virtual {v9, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    sget-object v9, Landroidx/lifecycle/k;->Companion:Landroidx/lifecycle/i;

    iget-object v10, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10, v5}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eq v9, v4, :cond_6

    if-eq v9, v3, :cond_5

    const/4 v10, 0x4

    if-eq v9, v10, :cond_4

    move-object v9, v2

    goto :goto_2

    :cond_4
    sget-object v9, Landroidx/lifecycle/k;->ON_PAUSE:Landroidx/lifecycle/k;

    goto :goto_2

    :cond_5
    sget-object v9, Landroidx/lifecycle/k;->ON_STOP:Landroidx/lifecycle/k;

    goto :goto_2

    :cond_6
    sget-object v9, Landroidx/lifecycle/k;->ON_DESTROY:Landroidx/lifecycle/k;

    :goto_2
    if-eqz v9, :cond_7

    invoke-virtual {v9}, Landroidx/lifecycle/k;->a()Landroidx/lifecycle/l;

    move-result-object v10

    iget-object v11, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v0, v9}, Landroidx/lifecycle/r;->a(Landroidx/lifecycle/q;Landroidx/lifecycle/k;)V

    iget-object v9, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v10

    sub-int/2addr v10, v6

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    :cond_7
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "no event down from "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lk/a;

    iget-object v1, v1, Lk/f;->b:Lk/c;

    iget-boolean v7, p0, Landroidx/lifecycle/s;->g:Z

    if-nez v7, :cond_0

    if-eqz v1, :cond_0

    iget-object v7, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    iget-object v1, v1, Lk/c;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/lifecycle/r;

    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v7, v1}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Landroidx/lifecycle/s;->b:Lk/a;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v7, Lk/d;

    invoke-direct {v7, v1}, Lk/d;-><init>(Lk/f;)V

    iget-object v1, v1, Lk/f;->c:Ljava/util/WeakHashMap;

    sget-object v8, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v1, v7, v8}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_9
    invoke-virtual {v7}, Lk/d;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Landroidx/lifecycle/s;->g:Z

    if-nez v1, :cond_0

    invoke-virtual {v7}, Lk/d;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/lifecycle/p;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/lifecycle/r;

    :goto_3
    iget-object v9, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    iget-object v10, p0, Landroidx/lifecycle/s;->c:Landroidx/lifecycle/l;

    invoke-virtual {v9, v10}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v9

    if-gez v9, :cond_9

    iget-boolean v9, p0, Landroidx/lifecycle/s;->g:Z

    if-nez v9, :cond_9

    iget-object v9, p0, Landroidx/lifecycle/s;->b:Lk/a;

    iget-object v9, v9, Lk/a;->e:Ljava/util/HashMap;

    invoke-virtual {v9, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    iget-object v9, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    iget-object v10, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v9, Landroidx/lifecycle/k;->Companion:Landroidx/lifecycle/i;

    iget-object v10, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v10, v5}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/Enum;->ordinal()I

    move-result v9

    if-eq v9, v6, :cond_c

    if-eq v9, v4, :cond_b

    if-eq v9, v3, :cond_a

    move-object v9, v2

    goto :goto_4

    :cond_a
    sget-object v9, Landroidx/lifecycle/k;->ON_RESUME:Landroidx/lifecycle/k;

    goto :goto_4

    :cond_b
    sget-object v9, Landroidx/lifecycle/k;->ON_START:Landroidx/lifecycle/k;

    goto :goto_4

    :cond_c
    sget-object v9, Landroidx/lifecycle/k;->ON_CREATE:Landroidx/lifecycle/k;

    :goto_4
    if-eqz v9, :cond_d

    invoke-virtual {v1, v0, v9}, Landroidx/lifecycle/r;->a(Landroidx/lifecycle/q;Landroidx/lifecycle/k;)V

    iget-object v9, p0, Landroidx/lifecycle/s;->h:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v10

    sub-int/2addr v10, v6

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_3

    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "no event up from "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, v1, Landroidx/lifecycle/r;->a:Landroidx/lifecycle/l;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "LifecycleOwner of this LifecycleRegistry is already garbage collected. It is too late to change lifecycle state."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
