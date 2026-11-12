.class public final Ln0k;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Ljava/util/concurrent/atomic/AtomicReference;


# instance fields
.field public final a:Lqq8;

.field public final b:Lmqp;

.field public final c:Ljava/util/HashSet;

.field public final d:Ldcl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Ln0k;->e:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Ln0k;->c:Ljava/util/HashSet;

    :try_start_a
    new-instance v0, Lqq8;

    invoke-direct {v0, p1}, Lqq8;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Ln0k;->a:Lqq8;
    :try_end_11
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_a .. :try_end_11} :catch_20

    new-instance v1, Ldcl;

    invoke-direct {v1, v0}, Ldcl;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Ln0k;->d:Ldcl;

    new-instance v0, Lmqp;

    invoke-direct {v0, p1}, Lmqp;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Ln0k;->b:Lmqp;

    return-void

    :catch_20
    move-exception p0

    new-instance p1, Le22;

    const-string v0, "Failed to initialize FileStorage"

    invoke-direct {p1, v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static a(Landroid/content/Context;)V
    .registers 9

    sget-object v0, Ln0k;->e:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ln0k;

    if-nez v0, :cond_1c

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, v1}, Ln0k;->d(Landroid/content/Context;Z)Z

    :cond_18
    invoke-static {p0, v1}, Ln0k;->d(Landroid/content/Context;Z)Z

    return-void

    :cond_1c
    iget-object v1, v0, Ln0k;->d:Ldcl;

    iget-object v2, v0, Ln0k;->c:Ljava/util/HashSet;

    monitor-enter v2

    :try_start_21
    new-instance v3, Ljava/util/HashSet;

    iget-object v0, v0, Ln0k;->c:Ljava/util/HashSet;

    invoke-direct {v3, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    monitor-exit v2
    :try_end_29
    .catchall {:try_start_21 .. :try_end_29} :catchall_8a

    monitor-enter v1

    :try_start_2a
    invoke-static {}, Landroid/os/StrictMode;->getThreadPolicy()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0
    :try_end_2e
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2e} :catch_35
    .catchall {:try_start_2a .. :try_end_2e} :catchall_84

    :try_start_2e
    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskReads()Landroid/os/StrictMode$ThreadPolicy;

    invoke-static {}, Landroid/os/StrictMode;->allowThreadDiskWrites()Landroid/os/StrictMode$ThreadPolicy;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_34} :catch_36
    .catchall {:try_start_2e .. :try_end_34} :catchall_84

    goto :goto_36

    :catch_35
    const/4 v0, 0x0

    :catch_36
    :goto_36
    :try_start_36
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_3f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6f

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v5, v1, Ldcl;->a:Ljava/lang/Object;

    check-cast v5, Lqq8;

    new-instance v6, Ljava/io/File;

    invoke-virtual {v5}, Lqq8;->x()Ljava/io/File;

    move-result-object v5

    const-string v7, "verified-splits"

    invoke-direct {v6, v5, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v6}, Lqq8;->v(Ljava/io/File;)V

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, ".apk"

    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v6, v4}, Lqq8;->u(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_3f

    :cond_6f
    invoke-virtual {v1, p0, v2}, Ldcl;->j(Landroid/content/Context;Ljava/util/HashSet;)V
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_72} :catch_7c
    .catchall {:try_start_36 .. :try_end_72} :catchall_75

    if-eqz v0, :cond_86

    goto :goto_7e

    :catchall_75
    move-exception p0

    if-eqz v0, :cond_7b

    :try_start_78
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    :cond_7b
    throw p0

    :catch_7c
    if-eqz v0, :cond_86

    :goto_7e
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    goto :goto_86

    :goto_82
    monitor-exit v1
    :try_end_83
    .catchall {:try_start_78 .. :try_end_83} :catchall_84

    throw p0

    :catchall_84
    move-exception p0

    goto :goto_82

    :cond_86
    :goto_86
    monitor-exit v1

    return-void

    :goto_88
    :try_start_88
    monitor-exit v2
    :try_end_89
    .catchall {:try_start_88 .. :try_end_89} :catchall_8a

    throw p0

    :catchall_8a
    move-exception p0

    goto :goto_88
.end method

.method public static d(Landroid/content/Context;Z)Z
    .registers 10

    new-instance v0, Ln0k;

    invoke-direct {v0, p0}, Ln0k;-><init>(Landroid/content/Context;)V

    :cond_5
    sget-object v1, Ln0k;->e:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_12

    move v0, v5

    goto :goto_1f

    :cond_12
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_5

    move v0, v4

    :goto_1f
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ln0k;

    if-eqz v0, :cond_66

    sget-object v0, Lytp;->a:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lipp;

    invoke-static {}, Locp;->r()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v3

    new-instance v6, Lwjj;

    iget-object v7, v1, Ln0k;->a:Lqq8;

    invoke-direct {v6, p0, v7}, Lwjj;-><init>(Landroid/content/Context;Lqq8;)V

    iget-object v7, v1, Ln0k;->a:Lqq8;

    invoke-direct {v0, p0, v3, v6, v7}, Lipp;-><init>(Landroid/content/Context;Ljava/util/concurrent/ThreadPoolExecutor;Lwjj;Lqq8;)V

    sget-object v3, Lytp;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    new-instance v0, Lfup;

    invoke-direct {v0, v1}, Lfup;-><init>(Ln0k;)V

    sget-object v3, Lmup;->a:Ljava/util/concurrent/atomic/AtomicReference;

    :cond_47
    invoke-virtual {v3, v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_59

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_47

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_47

    :cond_59
    invoke-static {}, Locp;->r()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    new-instance v2, Lc9d;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lc9d;-><init>(Landroid/content/Context;B)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_66
    :try_start_66
    invoke-virtual {v1, p0, p1}, Ln0k;->c(Landroid/content/Context;Z)V
    :try_end_69
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_69} :catch_6a

    return v5

    :catch_6a
    return v4
.end method


# virtual methods
.method public final b(Ljava/util/HashSet;)V
    .registers 6

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_35

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Ln0k;->a:Lqq8;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/io/File;

    invoke-virtual {v1}, Lqq8;->x()Ljava/io/File;

    move-result-object v1

    const-string v3, "verified-splits"

    invoke-direct {v2, v1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lqq8;->v(Ljava/io/File;)V

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".apk"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lqq8;->u(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lqq8;->s(Ljava/io/File;)V

    goto :goto_4

    :cond_35
    iget-object p0, p0, Ln0k;->b:Lmqp;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class p1, Lmqp;

    monitor-enter p1

    :try_start_3d
    iget-object p0, p0, Lmqp;->a:Landroid/content/Context;

    const-string v0, "playcore_split_install_internal"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "modules_to_uninstall_if_emulated"

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    monitor-exit p1

    return-void

    :goto_5a
    monitor-exit p1
    :try_end_5b
    .catchall {:try_start_3d .. :try_end_5b} :catchall_5c

    throw p0

    :catchall_5c
    move-exception p0

    goto :goto_5a
.end method

.method public final declared-synchronized c(Landroid/content/Context;Z)V
    .registers 19

    move-object/from16 v1, p0

    const-string v2, "Cannot load data for application \'"

    monitor-enter p0

    if-eqz p2, :cond_d

    :try_start_7
    iget-object v0, v1, Ln0k;->a:Lqq8;

    invoke-virtual {v0}, Lqq8;->r()V

    goto :goto_1a

    :cond_d
    invoke-static {}, Locp;->r()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v0

    new-instance v3, Luqp;

    const/4 v4, 0x3

    invoke-direct {v3, v1, v4}, Luqp;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    :goto_1a
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3
    :try_end_1e
    .catchall {:try_start_7 .. :try_end_1e} :catchall_413

    :try_start_1e
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->splitNames:[Ljava/lang/String;

    if-nez v0, :cond_31

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    goto :goto_35

    :cond_31
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0
    :try_end_35
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1e .. :try_end_35} :catch_3f9
    .catchall {:try_start_1e .. :try_end_35} :catchall_413

    :goto_35
    :try_start_35
    iget-object v2, v1, Ln0k;->a:Lqq8;

    invoke-virtual {v2}, Lqq8;->o()Ljava/util/HashSet;

    move-result-object v2

    iget-object v3, v1, Ln0k;->b:Lmqp;

    invoke-virtual {v3}, Lmqp;->a()Ljava/util/Set;

    move-result-object v3

    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_4a
    :goto_4a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x2

    if-eqz v7, :cond_81

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Leqp;

    iget-object v7, v7, Leqp;->b:Ljava/lang/String;

    invoke-interface {v0, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_7a

    sget-object v9, Lpup;->c:Lg40;

    const-string v9, "config."

    invoke-virtual {v7, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6c

    const-string v8, ""

    goto :goto_74

    :cond_6c
    const-string v9, "\\.config\\."

    invoke-virtual {v7, v9, v8}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v4

    :goto_74
    invoke-interface {v3, v8}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4a

    :cond_7a
    invoke-virtual {v5, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto :goto_4a

    :cond_81
    if-eqz p2, :cond_87

    invoke-virtual {v1, v5}, Ln0k;->b(Ljava/util/HashSet;)V

    goto :goto_99

    :cond_87
    invoke-virtual {v5}, Ljava/util/HashSet;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_99

    invoke-static {}, Locp;->r()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v3

    new-instance v6, Liqp;

    invoke-direct {v6, v1, v5}, Liqp;-><init>(Ln0k;Ljava/util/HashSet;)V

    invoke-virtual {v3, v6}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_99
    :goto_99
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_a2
    :goto_a2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_ba

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Leqp;

    iget-object v6, v6, Leqp;->b:Ljava/lang/String;

    invoke-static {v6}, Lpup;->d(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_a2

    invoke-virtual {v3, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_a2

    :cond_ba
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_be
    :goto_be
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_d4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Lpup;->d(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_be

    invoke-virtual {v3, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_be

    :cond_d4
    new-instance v0, Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    move-result v5

    invoke-direct {v0, v5}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_e1
    :goto_e1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_118

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Leqp;

    iget-object v6, v5, Leqp;->b:Ljava/lang/String;

    sget-object v7, Lpup;->c:Lg40;

    const-string v7, "config."

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_114

    iget-object v6, v5, Leqp;->b:Ljava/lang/String;

    const-string v7, "config."

    invoke-virtual {v6, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_106

    const-string v6, ""

    goto :goto_10e

    :cond_106
    const-string v7, "\\.config\\."

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v4

    :goto_10e
    invoke-virtual {v3, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_e1

    :cond_114
    invoke-virtual {v0, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_e1

    :cond_118
    new-instance v2, Lutp;

    iget-object v3, v1, Ln0k;->a:Lqq8;

    invoke-direct {v2, v3}, Lutp;-><init>(Lqq8;)V

    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v5

    const/16 v3, 0xc

    const/4 v12, 0x0

    if-eqz p2, :cond_216

    invoke-virtual {v2}, Lutp;->a()Ljava/util/HashSet;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_330

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_13b
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_14f

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_13b

    :cond_14f
    const-string v2, "pathList"

    const-class v7, Ljava/lang/Object;

    invoke-static {v5, v2}, Lu0h;->v(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2
    :try_end_157
    .catchall {:try_start_35 .. :try_end_157} :catchall_413

    :try_start_157
    invoke-virtual {v2, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2
    :try_end_15f
    .catch Ljava/lang/Exception; {:try_start_157 .. :try_end_15f} :catch_1e1
    .catchall {:try_start_157 .. :try_end_15f} :catchall_413

    :try_start_15f
    const-string v8, "nativeLibraryDirectories"

    const-class v9, Ljava/util/List;

    new-instance v10, Lagm;

    invoke-static {v2, v8}, Lu0h;->v(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    invoke-direct {v10, v2, v8, v9, v3}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const-class v3, Lvtp;

    monitor-enter v3
    :try_end_16f
    .catchall {:try_start_15f .. :try_end_16f} :catchall_413

    :try_start_16f
    new-instance v8, Ljava/util/ArrayList;

    invoke-virtual {v10}, Lagm;->v()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Collection;

    invoke-direct {v8, v11}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v6, v8}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v10, v8}, Lagm;->w(Ljava/lang/Object;)V

    monitor-exit v3
    :try_end_184
    .catchall {:try_start_16f .. :try_end_184} :catchall_1df

    :try_start_184
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v6, "makePathElements"

    const-class v11, [Ljava/lang/Object;

    invoke-static {v2, v6, v11, v9, v10}, Lu0h;->u(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/io/Serializable;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_1c8

    new-instance v0, Le22;

    const-string v2, "Error in makePathElements"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_1a9
    if-ge v4, v2, :cond_1c7

    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/IOException;
    :try_end_1b1
    .catchall {:try_start_184 .. :try_end_1b1} :catchall_413

    :try_start_1b1
    const-class v5, Ljava/lang/Throwable;

    const-string v6, "addSuppressed"

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c4
    .catch Ljava/lang/Exception; {:try_start_1b1 .. :try_end_1c4} :catch_1c4
    .catchall {:try_start_1b1 .. :try_end_1c4} :catchall_413

    :catch_1c4
    add-int/lit8 v4, v4, 0x1

    goto :goto_1a9

    :cond_1c7
    :try_start_1c7
    throw v0

    :cond_1c8
    monitor-enter v3
    :try_end_1c9
    .catchall {:try_start_1c7 .. :try_end_1c9} :catchall_413

    :try_start_1c9
    const-string v4, "nativeLibraryPathElements"

    invoke-static {v2, v7, v4}, Lu0h;->t(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Lpqp;

    move-result-object v2

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v2, v4}, Lpqp;->y(Ljava/util/Collection;)V

    monitor-exit v3

    goto/16 :goto_330

    :goto_1d9
    monitor-exit v3
    :try_end_1da
    .catchall {:try_start_1c9 .. :try_end_1da} :catchall_1db

    :try_start_1da
    throw v0
    :try_end_1db
    .catchall {:try_start_1da .. :try_end_1db} :catchall_413

    :catchall_1db
    move-exception v0

    goto :goto_1d9

    :goto_1dd
    :try_start_1dd
    monitor-exit v3
    :try_end_1de
    .catchall {:try_start_1dd .. :try_end_1de} :catchall_1df

    :try_start_1de
    throw v0

    :catchall_1df
    move-exception v0

    goto :goto_1dd

    :catch_1e1
    move-exception v0

    new-instance v3, Le22;

    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Failed to get value of field "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " of type "

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " on object of type "

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    :cond_216
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_21a
    :goto_21a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_330

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Leqp;

    new-instance v8, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v9, 0x1

    invoke-direct {v8, v9}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    new-instance v9, Ljava/util/HashSet;

    invoke-direct {v9}, Ljava/util/HashSet;-><init>()V

    new-instance v10, Lwjj;

    invoke-direct {v10, v2, v7, v9, v8}, Lwjj;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v7, v10}, Lutp;->b(Leqp;Lhtp;)V

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v7

    if-nez v7, :cond_240

    move-object v9, v12

    :cond_240
    if-nez v9, :cond_246

    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto :goto_21a

    :cond_246
    invoke-interface {v9}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_21a

    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_255
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_269

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_255

    :cond_269
    const-string v8, "pathList"

    const-class v9, Ljava/lang/Object;

    invoke-static {v5, v8}, Lu0h;->v(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8
    :try_end_271
    .catchall {:try_start_1de .. :try_end_271} :catchall_413

    :try_start_271
    invoke-virtual {v8, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8
    :try_end_279
    .catch Ljava/lang/Exception; {:try_start_271 .. :try_end_279} :catch_2fb
    .catchall {:try_start_271 .. :try_end_279} :catchall_413

    :try_start_279
    const-string v10, "nativeLibraryDirectories"

    const-class v11, Ljava/util/List;

    new-instance v13, Lagm;

    invoke-static {v8, v10}, Lu0h;->v(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    invoke-direct {v13, v8, v10, v11, v3}, Lagm;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const-class v10, Lvtp;

    monitor-enter v10
    :try_end_289
    .catchall {:try_start_279 .. :try_end_289} :catchall_413

    :try_start_289
    new-instance v14, Ljava/util/ArrayList;

    invoke-virtual {v13}, Lagm;->v()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/Collection;

    invoke-direct {v14, v15}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v7, v14}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {v14, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v13, v14}, Lagm;->w(Ljava/lang/Object;)V

    monitor-exit v10
    :try_end_29e
    .catchall {:try_start_289 .. :try_end_29e} :catchall_2f9

    :try_start_29e
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14, v7}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string v7, "makePathElements"

    const-class v15, [Ljava/lang/Object;

    invoke-static {v8, v7, v15, v11, v14}, Lu0h;->u(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Ljava/io/Serializable;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Object;

    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_2e2

    new-instance v0, Le22;

    const-string v2, "Error in makePathElements"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_2c3
    if-ge v4, v2, :cond_2e1

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/IOException;
    :try_end_2cb
    .catchall {:try_start_29e .. :try_end_2cb} :catchall_413

    :try_start_2cb
    const-class v5, Ljava/lang/Throwable;

    const-string v6, "addSuppressed"

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v5, v0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2de
    .catch Ljava/lang/Exception; {:try_start_2cb .. :try_end_2de} :catch_2de
    .catchall {:try_start_2cb .. :try_end_2de} :catchall_413

    :catch_2de
    add-int/lit8 v4, v4, 0x1

    goto :goto_2c3

    :cond_2e1
    :try_start_2e1
    throw v0

    :cond_2e2
    monitor-enter v10
    :try_end_2e3
    .catchall {:try_start_2e1 .. :try_end_2e3} :catchall_413

    :try_start_2e3
    const-string v11, "nativeLibraryPathElements"

    invoke-static {v8, v9, v11}, Lu0h;->t(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;)Lpqp;

    move-result-object v8

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v8, v7}, Lpqp;->y(Ljava/util/Collection;)V

    monitor-exit v10

    goto/16 :goto_21a

    :goto_2f3
    monitor-exit v10
    :try_end_2f4
    .catchall {:try_start_2e3 .. :try_end_2f4} :catchall_2f5

    :try_start_2f4
    throw v0
    :try_end_2f5
    .catchall {:try_start_2f4 .. :try_end_2f5} :catchall_413

    :catchall_2f5
    move-exception v0

    goto :goto_2f3

    :goto_2f7
    :try_start_2f7
    monitor-exit v10
    :try_end_2f8
    .catchall {:try_start_2f7 .. :try_end_2f8} :catchall_2f9

    :try_start_2f8
    throw v0

    :catchall_2f9
    move-exception v0

    goto :goto_2f7

    :catch_2fb
    move-exception v0

    new-instance v2, Le22;

    invoke-virtual {v8}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v9}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Failed to get value of field "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " of type "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " on object of type "

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :cond_330
    :goto_330
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_339
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3c0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Leqp;
    :try_end_345
    .catchall {:try_start_2f8 .. :try_end_345} :catchall_413

    :try_start_345
    new-instance v6, Ljava/util/zip/ZipFile;

    iget-object v7, v4, Leqp;->a:Ljava/io/File;

    invoke-direct {v6, v7}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;)V
    :try_end_34c
    .catch Ljava/io/IOException; {:try_start_345 .. :try_end_34c} :catch_3a1
    .catchall {:try_start_345 .. :try_end_34c} :catchall_413

    :try_start_34c
    const-string v7, "classes.dex"

    invoke-virtual {v6, v7}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object v7

    invoke-virtual {v6}, Ljava/util/zip/ZipFile;->close()V
    :try_end_355
    .catch Ljava/io/IOException; {:try_start_34c .. :try_end_355} :catch_39d
    .catchall {:try_start_34c .. :try_end_355} :catchall_413

    if-eqz v7, :cond_397

    :try_start_357
    iget-object v6, v1, Ln0k;->a:Lqq8;

    iget-object v7, v4, Leqp;->b:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v8, Ljava/io/File;

    invoke-virtual {v6}, Lqq8;->x()Ljava/io/File;

    move-result-object v6

    const-string v9, "dex"

    invoke-direct {v8, v6, v9}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v8}, Lqq8;->v(Ljava/io/File;)V

    invoke-static {v8, v7}, Lqq8;->u(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    invoke-static {v6}, Lqq8;->v(Ljava/io/File;)V

    iget-object v7, v4, Leqp;->a:Ljava/io/File;

    new-instance v9, Lftj;

    const/16 v8, 0x11

    invoke-direct {v9, v8}, Lftj;-><init>(B)V

    new-instance v11, Ldvj;

    invoke-direct {v11, v8}, Ldvj;-><init>(B)V

    const-string v10, "path"

    move/from16 v8, p2

    invoke-static/range {v5 .. v11}, Lmzg;->r(Ljava/lang/ClassLoader;Ljava/io/File;Ljava/io/File;ZLftj;Ljava/lang/String;Ldvj;)Z

    move-result v6

    if-nez v6, :cond_397

    iget-object v4, v4, Leqp;->a:Ljava/io/File;

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v6, "split was not installed "

    invoke-virtual {v6, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    goto :goto_339

    :cond_397
    iget-object v4, v4, Leqp;->a:Ljava/io/File;

    invoke-virtual {v2, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_39c
    .catchall {:try_start_357 .. :try_end_39c} :catchall_413

    goto :goto_339

    :catch_39d
    move-exception v0

    move-object v12, v6

    :goto_39f
    move-object v2, v0

    goto :goto_3a3

    :catch_3a1
    move-exception v0

    goto :goto_39f

    :goto_3a3
    if-eqz v12, :cond_3bf

    :try_start_3a5
    invoke-virtual {v12}, Ljava/util/zip/ZipFile;->close()V
    :try_end_3a8
    .catch Ljava/io/IOException; {:try_start_3a5 .. :try_end_3a8} :catch_3a9
    .catchall {:try_start_3a5 .. :try_end_3a8} :catchall_413

    goto :goto_3bf

    :catch_3a9
    move-exception v0

    :try_start_3aa
    const-class v3, Ljava/lang/Throwable;

    const-string v4, "addSuppressed"

    const-class v5, Ljava/lang/Throwable;

    filled-new-array {v5}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3bf
    .catch Ljava/lang/Exception; {:try_start_3aa .. :try_end_3bf} :catch_3bf
    .catchall {:try_start_3aa .. :try_end_3bf} :catchall_413

    :catch_3bf
    :cond_3bf
    :goto_3bf
    :try_start_3bf
    throw v2

    :cond_3c0
    iget-object v3, v1, Ln0k;->d:Ldcl;

    move-object/from16 v4, p1

    invoke-virtual {v3, v4, v2}, Ldcl;->j(Landroid/content/Context;Ljava/util/HashSet;)V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3d0
    :goto_3d0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3ea

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Leqp;

    iget-object v5, v4, Leqp;->a:Ljava/io/File;

    invoke-virtual {v2, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3d0

    iget-object v4, v4, Leqp;->b:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_3d0

    :cond_3ea
    iget-object v2, v1, Ln0k;->c:Ljava/util/HashSet;

    monitor-enter v2
    :try_end_3ed
    .catchall {:try_start_3bf .. :try_end_3ed} :catchall_413

    :try_start_3ed
    iget-object v0, v1, Ln0k;->c:Ljava/util/HashSet;

    invoke-interface {v0, v3}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    monitor-exit v2
    :try_end_3f3
    .catchall {:try_start_3ed .. :try_end_3f3} :catchall_3f7

    monitor-exit p0

    return-void

    :goto_3f5
    :try_start_3f5
    monitor-exit v2
    :try_end_3f6
    .catchall {:try_start_3f5 .. :try_end_3f6} :catchall_3f7

    :try_start_3f6
    throw v0

    :catchall_3f7
    move-exception v0

    goto :goto_3f5

    :catch_3f9
    move-exception v0

    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v4, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4

    :goto_411
    monitor-exit p0
    :try_end_412
    .catchall {:try_start_3f6 .. :try_end_412} :catchall_413

    throw v0

    :catchall_413
    move-exception v0

    goto :goto_411
.end method
