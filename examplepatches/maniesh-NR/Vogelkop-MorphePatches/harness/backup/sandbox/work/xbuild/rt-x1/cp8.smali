.class public final Lcp8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr0k;


# instance fields
.field public final a:Landroid/os/Handler;

.field public final b:Landroid/content/Context;

.field public final c:Lpup;

.field public final d:Larp;

.field public final e:Lq1p;

.field public final f:Lz4k;

.field public final g:Lz4k;

.field public final h:Ljava/util/concurrent/ThreadPoolExecutor;

.field public final i:Ljava/io/File;

.field public final j:Ljava/util/concurrent/atomic/AtomicReference;

.field public final k:Ljava/util/Set;

.field public final l:Ljava/util/Set;

.field public final m:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/io/File;Lpup;Larp;)V
    .registers 9

    invoke-static {}, Locp;->r()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    new-instance v1, Lq1p;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object p1, v1, Lq1p;->a:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Lcp8;->a:Landroid/os/Handler;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v2, p0, Lcp8;->j:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-static {v2}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Lcp8;->k:Ljava/util/Set;

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-static {v2}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    iput-object v2, p0, Lcp8;->l:Ljava/util/Set;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v2, p0, Lcp8;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p1, p0, Lcp8;->b:Landroid/content/Context;

    iput-object p2, p0, Lcp8;->i:Ljava/io/File;

    iput-object p3, p0, Lcp8;->c:Lpup;

    iput-object p4, p0, Lcp8;->d:Larp;

    iput-object v0, p0, Lcp8;->h:Ljava/util/concurrent/ThreadPoolExecutor;

    iput-object v1, p0, Lcp8;->e:Lq1p;

    new-instance p1, Lz4k;

    const/16 p2, 0x1a

    invoke-direct {p1, p2}, Lz4k;-><init>(B)V

    iput-object p1, p0, Lcp8;->g:Lz4k;

    new-instance p1, Lz4k;

    invoke-direct {p1, p2}, Lz4k;-><init>(B)V

    iput-object p1, p0, Lcp8;->f:Lz4k;

    sget-object p0, Lytp;->a:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)Lcom/google/android/gms/tasks/Task;
    .registers 2

    new-instance p0, Lp0k;

    const/4 p1, -0x5

    invoke-direct {p0, p1}, Lp0k;-><init>(I)V

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final b(I)Lcom/google/android/gms/tasks/Task;
    .registers 6

    :try_start_0
    monitor-enter p0
    :try_end_1
    .catch Lzqp; {:try_start_0 .. :try_end_1} :catch_3f

    :try_start_1
    invoke-virtual {p0}, Lcp8;->n()Lqop;

    move-result-object v0

    new-instance v1, Laup;

    invoke-direct {v1, v0, p1}, Laup;-><init>(Lqop;I)V

    invoke-static {v1}, Lzqp;->h(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqop;

    iget-object v1, p0, Lcp8;->j:Ljava/util/concurrent/atomic/AtomicReference;

    :cond_12
    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2
    :try_end_16
    .catchall {:try_start_1 .. :try_end_16} :catchall_3d

    const/4 v3, 0x0

    if-eqz v2, :cond_1b

    :try_start_19
    monitor-exit p0
    :try_end_1a
    .catch Lzqp; {:try_start_19 .. :try_end_1a} :catch_3f

    goto :goto_29

    :cond_1b
    :try_start_1b
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v0, :cond_12

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2
    :try_end_25
    .catchall {:try_start_1b .. :try_end_25} :catchall_3d

    if-eq v2, v0, :cond_12

    :try_start_27
    monitor-exit p0

    move-object p1, v3

    :goto_29
    if-eqz p1, :cond_36

    iget-object v0, p0, Lcp8;->a:Landroid/os/Handler;

    new-instance v1, Liqp;

    const/4 v2, 0x3

    invoke-direct {v1, p0, p1, v2}, Liqp;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_36
    invoke-static {v3}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0
    :try_end_3a
    .catch Lzqp; {:try_start_27 .. :try_end_3a} :catch_3f

    return-object p0

    :goto_3b
    :try_start_3b
    monitor-exit p0
    :try_end_3c
    .catchall {:try_start_3b .. :try_end_3c} :catchall_3d

    :try_start_3c
    throw p1
    :try_end_3d
    .catch Lzqp; {:try_start_3c .. :try_end_3d} :catch_3f

    :catchall_3d
    move-exception p1

    goto :goto_3b

    :catch_3f
    move-exception p0

    invoke-virtual {p0}, Lzqp;->g()Ljava/lang/Exception;

    move-result-object p0

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final c()Lcom/google/android/gms/tasks/Task;
    .registers 1

    invoke-virtual {p0}, Lcp8;->n()Lqop;

    move-result-object p0

    if-eqz p0, :cond_b

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    goto :goto_d

    :cond_b
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_d
    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final d(Lqop;Lgdb;I)Z
    .registers 4

    const/4 p0, 0x0

    return p0
.end method

.method public final e(La9e;)V
    .registers 3

    iget-object p0, p0, Lcp8;->g:Lz4k;

    monitor-enter p0

    :try_start_3
    iget-object v0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_e

    monitor-exit p0

    return-void

    :goto_c
    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_e

    throw p1

    :catchall_e
    move-exception p1

    goto :goto_c
.end method

.method public final f(La9e;)V
    .registers 3

    iget-object p0, p0, Lcp8;->g:Lz4k;

    monitor-enter p0

    :try_start_3
    iget-object v0, p0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_e

    monitor-exit p0

    return-void

    :goto_c
    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_e

    throw p1

    :catchall_e
    move-exception p1

    goto :goto_c
.end method

.method public final g(I)Lcom/google/android/gms/tasks/Task;
    .registers 3

    invoke-virtual {p0}, Lcp8;->n()Lqop;

    move-result-object p0

    if-eqz p0, :cond_f

    iget v0, p0, Lqop;->a:I

    if-ne v0, p1, :cond_f

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    :cond_f
    new-instance p0, Lp0k;

    const/4 p1, -0x4

    invoke-direct {p0, p1}, Lp0k;-><init>(I)V

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final h()Ljava/util/Set;
    .registers 3

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lcp8;->c:Lpup;

    invoke-virtual {v1}, Lpup;->b()Ljava/util/HashSet;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object p0, p0, Lcp8;->k:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public final i(Ln9h;)Lcom/google/android/gms/tasks/Task;
    .registers 25

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    :try_start_4
    monitor-enter p0
    :try_end_5
    .catch Lzqp; {:try_start_4 .. :try_end_5} :catch_295

    :try_start_5
    invoke-virtual {v1}, Lcp8;->n()Lqop;

    move-result-object v2

    new-instance v3, Lsxd;

    const/4 v4, 0x6

    invoke-direct {v3, v2, v0, v4}, Lsxd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v3}, Lzqp;->h(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqop;

    iget-object v4, v1, Lcp8;->j:Ljava/util/concurrent/atomic/AtomicReference;

    :cond_17
    invoke-virtual {v4, v2, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5
    :try_end_1b
    .catchall {:try_start_5 .. :try_end_1b} :catchall_293

    if-eqz v5, :cond_1f

    :try_start_1d
    monitor-exit p0
    :try_end_1e
    .catch Lzqp; {:try_start_1d .. :try_end_1e} :catch_295

    goto :goto_2d

    :cond_1f
    :try_start_1f
    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    if-eq v5, v2, :cond_17

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5
    :try_end_29
    .catchall {:try_start_1f .. :try_end_29} :catchall_293

    if-eq v5, v2, :cond_17

    :try_start_2b
    monitor-exit p0

    const/4 v3, 0x0

    :goto_2d
    if-eqz v3, :cond_28a

    iget v2, v3, Lqop;->a:I
    :try_end_31
    .catch Lzqp; {:try_start_2b .. :try_end_31} :catch_295

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, v0, Ln9h;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    move v7, v6

    :goto_40
    if-ge v7, v5, :cond_52

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Ljava/util/Locale;

    invoke-virtual {v8}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_40

    :cond_52
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    iget-object v5, v1, Lcp8;->i:Ljava/io/File;

    sget-object v7, Lltp;->b:Lltp;

    invoke-virtual {v5, v7}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object v5

    if-eqz v5, :cond_284

    move v10, v6

    const-wide/16 v11, 0x0

    :goto_69
    array-length v13, v5

    if-ge v10, v13, :cond_1f7

    aget-object v13, v5, v10

    invoke-static {v13}, Lw0h;->q(Ljava/io/File;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "\\.config\\."

    const/4 v7, 0x2

    invoke-virtual {v14, v15, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v6

    invoke-virtual {v4, v14}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v15, v0, Ln9h;->b:Ljava/lang/Object;

    check-cast v15, Ljava/util/ArrayList;

    invoke-virtual {v15, v8}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_193

    const-string v8, "\\.config\\."

    invoke-virtual {v14, v8, v7}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    aget-object v7, v7, v6

    new-instance v8, Ljava/util/HashSet;

    iget-object v15, v1, Lcp8;->e:Lq1p;

    iget-object v15, v15, Lq1p;->a:Landroid/content/Context;

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/res/Configuration;->getLocales()Landroid/os/LocaleList;

    move-result-object v15

    move/from16 v18, v6

    new-instance v6, Ljava/util/ArrayList;

    move/from16 v19, v2

    invoke-virtual {v15}, Landroid/os/LocaleList;->size()I

    move-result v2

    invoke-direct {v6, v2}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v20, v5

    move/from16 v2, v18

    :goto_b3
    invoke-virtual {v15}, Landroid/os/LocaleList;->size()I

    move-result v5

    if-ge v2, v5, :cond_ee

    invoke-virtual {v15, v2}, Landroid/os/LocaleList;->get(I)Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v5}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/String;->isEmpty()Z

    move-result v22

    if-eqz v22, :cond_d0

    const-string v5, ""

    move/from16 v22, v2

    goto :goto_e0

    :cond_d0
    invoke-virtual {v5}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    move/from16 v22, v2

    const-string v2, "_"

    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :goto_e0
    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v22, 0x1

    goto :goto_b3

    :cond_ee
    invoke-direct {v8, v6}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1}, Lcp8;->m()Lppp;

    move-result-object v2

    filled-new-array {v7}, [Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v2, v5}, Lppp;->a(Ljava/util/Collection;)Ljava/util/HashMap;

    move-result-object v2

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_10e
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_11e

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Set;

    invoke-interface {v5, v7}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_10e

    :cond_11e
    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v8}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_127
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_14f

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    const-string v15, "_"

    invoke-virtual {v8, v15}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v15

    if-eqz v15, :cond_147

    const-string v15, "_"

    move-object/from16 v21, v2

    const/4 v2, -0x1

    invoke-virtual {v8, v15, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    aget-object v8, v2, v18

    goto :goto_149

    :cond_147
    move-object/from16 v21, v2

    :goto_149
    invoke-virtual {v6, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-object/from16 v2, v21

    goto :goto_127

    :cond_14f
    move-object/from16 v21, v2

    iget-object v2, v1, Lcp8;->l:Ljava/util/Set;

    invoke-interface {v6, v2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v6, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-virtual/range {v21 .. v21}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_166
    :goto_166
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_186

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v6, v15}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_166

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Collection;

    invoke-interface {v2, v8}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_166

    :cond_186
    invoke-virtual {v5, v14}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1e5

    invoke-virtual {v2, v14}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_199

    goto :goto_1e5

    :cond_193
    move/from16 v19, v2

    move-object/from16 v20, v5

    move/from16 v18, v6

    :cond_199
    iget-object v2, v0, Ln9h;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    new-instance v5, Ljava/util/ArrayList;

    iget-object v6, v1, Lcp8;->k:Ljava/util/Set;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v6, ""

    const-string v7, "base"

    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v1}, Lcp8;->m()Lppp;

    move-result-object v6

    invoke-virtual {v6, v5}, Lppp;->a(Ljava/util/Collection;)Ljava/util/HashMap;

    move-result-object v5

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    move/from16 v7, v18

    :cond_1c1
    if-ge v7, v6, :cond_1ed

    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Ljava/util/Locale;

    invoke-virtual {v8}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v5, v15}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1c1

    invoke-virtual {v8}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Set;

    invoke-interface {v8, v14}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1c1

    :cond_1e5
    :goto_1e5
    invoke-virtual {v13}, Ljava/io/File;->length()J

    move-result-wide v5

    add-long/2addr v11, v5

    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1ed
    add-int/lit8 v10, v10, 0x1

    move/from16 v6, v18

    move/from16 v2, v19

    move-object/from16 v5, v20

    goto/16 :goto_69

    :cond_1f7
    move/from16 v19, v2

    move/from16 v18, v6

    const-wide/16 v16, 0x0

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    iget-object v2, v0, Ln9h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v2, v0, Ln9h;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v5, 0x1

    if-ne v2, v5, :cond_22e

    iget-object v2, v1, Lcp8;->d:Larp;

    invoke-virtual {v2}, Larp;->zza()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lirp;

    iget-object v2, v2, Lirp;->b:Ljava/util/Map;

    iget-object v5, v0, Ln9h;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    move/from16 v6, v18

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-nez v2, :cond_238

    :cond_22e
    iget-object v2, v1, Lcp8;->d:Larp;

    invoke-virtual {v2}, Larp;->zza()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lirp;

    iget-object v2, v2, Lirp;->a:Ljava/lang/Integer;

    :cond_238
    if-eqz v2, :cond_243

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lcp8;->l(I)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0

    :cond_243
    new-instance v2, Ljava/util/HashSet;

    iget-object v5, v0, Ln9h;->b:Ljava/lang/Object;

    check-cast v5, Ljava/util/ArrayList;

    invoke-direct {v2, v5}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {v4, v2}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_258

    const/4 v0, -0x2

    invoke-virtual {v1, v0}, Lcp8;->l(I)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0

    :cond_258
    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    iget-object v0, v0, Ln9h;->b:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ljava/util/ArrayList;

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v2, 0x1

    move-object v8, v3

    const/4 v3, 0x0

    invoke-virtual/range {v1 .. v8}, Lcp8;->p(IILjava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z

    move-object v6, v4

    iget-object v7, v1, Lcp8;->h:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v0, Liv;

    const/16 v5, 0x14

    const/4 v4, 0x0

    move-object v3, v8

    move-object v2, v9

    invoke-direct/range {v0 .. v5}, Liv;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    invoke-interface {v7, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    invoke-static {v6}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0

    :cond_284
    const/4 v0, -0x5

    invoke-virtual {v1, v0}, Lcp8;->l(I)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0

    :cond_28a
    const/16 v0, -0x64

    :try_start_28c
    invoke-virtual {v1, v0}, Lcp8;->l(I)Lcom/google/android/gms/tasks/Task;

    move-result-object v0
    :try_end_290
    .catch Lzqp; {:try_start_28c .. :try_end_290} :catch_295

    return-object v0

    :goto_291
    :try_start_291
    monitor-exit p0
    :try_end_292
    .catchall {:try_start_291 .. :try_end_292} :catchall_293

    :try_start_292
    throw v0
    :try_end_293
    .catch Lzqp; {:try_start_292 .. :try_end_293} :catch_295

    :catchall_293
    move-exception v0

    goto :goto_291

    :catch_295
    move-exception v0

    invoke-virtual {v0}, Lzqp;->g()Ljava/lang/Exception;

    move-result-object v0

    check-cast v0, Lp0k;

    invoke-virtual {v0}, Lp0k;->d()I

    move-result v0

    invoke-virtual {v1, v0}, Lcp8;->l(I)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public final j()Ljava/util/Set;
    .registers 4

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lcp8;->c:Lpup;

    invoke-virtual {v1}, Lpup;->c()Ljava/util/HashSet;

    move-result-object v2

    if-eqz v2, :cond_14

    invoke-virtual {v1}, Lpup;->c()Ljava/util/HashSet;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_14
    iget-object p0, p0, Lcp8;->l:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public final k(Ljava/util/ArrayList;)Lcom/google/android/gms/tasks/Task;
    .registers 2

    new-instance p0, Lp0k;

    const/4 p1, -0x5

    invoke-direct {p0, p1}, Lp0k;-><init>(I)V

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final l(I)Lcom/google/android/gms/tasks/Task;
    .registers 5

    new-instance v0, Lsa2;

    const/16 v1, 0x17

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2}, Lsa2;-><init>(BIZ)V

    invoke-virtual {p0, v0}, Lcp8;->o(Lnup;)Lqop;

    new-instance p0, Lp0k;

    invoke-direct {p0, p1}, Lp0k;-><init>(I)V

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final m()Lppp;
    .registers 5

    iget-object v0, p0, Lcp8;->b:Landroid/content/Context;

    const/4 v1, 0x0

    :try_start_3
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    const/16 v3, 0x80

    invoke-virtual {v2, v0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0
    :try_end_11
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_3 .. :try_end_11} :catch_24

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    iget-object p0, p0, Lcp8;->c:Lpup;

    invoke-virtual {p0, v0}, Lpup;->a(Landroid/os/Bundle;)Lppp;

    move-result-object p0

    if-eqz p0, :cond_1e

    return-object p0

    :cond_1e
    const-string p0, "Language information could not be found. Make sure you are using the target application context, not the tests context, and the app is built as a bundle."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v1

    :catch_24
    move-exception p0

    const-string v0, "App is not found in PackageManager"

    invoke-static {v0, p0}, Lh9o;->m(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v1
.end method

.method public final n()Lqop;
    .registers 1

    iget-object p0, p0, Lcp8;->j:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqop;

    return-object p0
.end method

.method public final declared-synchronized o(Lnup;)Lqop;
    .registers 5

    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Lcp8;->n()Lqop;

    move-result-object v0

    invoke-interface {p1, v0}, Lnup;->d(Lqop;)Lqop;

    move-result-object p1

    iget-object v1, p0, Lcp8;->j:Ljava/util/concurrent/atomic/AtomicReference;

    :cond_b
    invoke-virtual {v1, v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_24

    if-eqz v2, :cond_13

    monitor-exit p0

    return-object p1

    :cond_13
    :try_start_13
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eq v2, v0, :cond_b

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2
    :try_end_1d
    .catchall {:try_start_13 .. :try_end_1d} :catchall_24

    if-eq v2, v0, :cond_b

    monitor-exit p0

    const/4 p0, 0x0

    return-object p0

    :goto_22
    :try_start_22
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_22 .. :try_end_23} :catchall_24

    throw p1

    :catchall_24
    move-exception p1

    goto :goto_22
.end method

.method public final p(IILjava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .registers 16

    new-instance v0, Lusp;

    move v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    move-object v7, p7

    invoke-direct/range {v0 .. v7}, Lusp;-><init>(IILjava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {p0, v0}, Lcp8;->o(Lnup;)Lqop;

    move-result-object p1

    if-eqz p1, :cond_1f

    new-instance p2, Liqp;

    const/4 p3, 0x3

    invoke-direct {p2, p0, p1, p3}, Liqp;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lcp8;->a:Landroid/os/Handler;

    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/4 p0, 0x1

    return p0

    :cond_1f
    const/4 p0, 0x0

    return p0
.end method
