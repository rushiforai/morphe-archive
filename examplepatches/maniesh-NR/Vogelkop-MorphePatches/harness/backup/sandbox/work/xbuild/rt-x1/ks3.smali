.class public final Lks3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkm;


# static fields
.field public static final j:Ljava/lang/Object;

.field public static volatile k:Lks3;

.field public static final l:Lr16;


# instance fields
.field public a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;

.field public h:Ljava/lang/Object;

.field public i:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lks3;->j:Ljava/lang/Object;

    new-instance v0, Lr16;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lks3;->l:Lr16;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 10

    iput-object p1, p0, Lks3;->a:Ljava/lang/Object;

    iput-object p2, p0, Lks3;->b:Ljava/lang/Object;

    iput-object p3, p0, Lks3;->c:Ljava/lang/Object;

    iput-object p4, p0, Lks3;->d:Ljava/lang/Object;

    iput-object p5, p0, Lks3;->e:Ljava/lang/Object;

    iput-object p6, p0, Lks3;->f:Ljava/lang/Object;

    iput-object p7, p0, Lks3;->g:Ljava/lang/Object;

    iput-object p8, p0, Lks3;->h:Ljava/lang/Object;

    iput-object p9, p0, Lks3;->i:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static B(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    new-instance v1, Lyo8;

    invoke-direct {v1, p0, p1}, Lyo8;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1, v0}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    return-void
.end method

.method public static D(Ljava/lang/Throwable;)V
    .registers 2

    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    invoke-static {p0, v0}, Lks3;->E(Ljava/lang/Throwable;Ljava/util/Map;)V

    return-void
.end method

.method public static E(Ljava/lang/Throwable;Ljava/util/Map;)V
    .registers 7

    sget-object v0, Lks3;->j:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lks3;->k:Lks3;

    iget-object v2, v1, Lks3;->h:Ljava/lang/Object;

    check-cast v2, Lwom;

    invoke-interface {v2}, Lwom;->d()Z

    move-result v3

    if-nez v3, :cond_36

    invoke-virtual {v1}, Lks3;->h()Ljava/util/HashMap;

    move-result-object v3

    iget-object v4, v1, Lks3;->f:Ljava/lang/Object;

    check-cast v4, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-static {v4}, Lks3;->o(Ljava/util/Set;)Ljava/util/HashMap;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    const/4 p1, 0x1

    invoke-static {v3, p0, p1}, Lks3;->e(Ljava/util/HashMap;Ljava/lang/Throwable;Z)V
    :try_end_25
    .catchall {:try_start_3 .. :try_end_25} :catchall_3a

    :try_start_25
    iget-object p0, v1, Lks3;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/ExecutorService;

    new-instance p1, Lbi2;

    const/16 v4, 0xe

    invoke-direct {p1, v1, v3, v4}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p0, p1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    invoke-interface {v2}, Lwom;->c()V
    :try_end_36
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_25 .. :try_end_36} :catch_36
    .catchall {:try_start_25 .. :try_end_36} :catchall_3a

    :catch_36
    :cond_36
    :try_start_36
    monitor-exit v0

    return-void

    :goto_38
    monitor-exit v0
    :try_end_39
    .catchall {:try_start_36 .. :try_end_39} :catchall_3a

    throw p0

    :catchall_3a
    move-exception p0

    goto :goto_38
.end method

.method public static G(Ljava/lang/String;)V
    .registers 3

    sget-object v0, Ltz5;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_21

    const-string v0, "Error: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ltz5;->c()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "crash.last.upload.status"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "crash.last.upload.timestamp"

    invoke-static {p0, v0}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    :cond_21
    return-void
.end method

.method public static I(ILjava/lang/String;)V
    .registers 3

    sget-object v0, Lks3;->k:Lks3;

    iget-object v0, v0, Lks3;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/crashhandler/OperaCrashKeys;

    invoke-virtual {v0, p0, p1}, Lcom/opera/android/crashhandler/OperaCrashKeys;->a(ILjava/lang/String;)V

    return-void
.end method

.method public static e(Ljava/util/HashMap;Ljava/lang/Throwable;Z)V
    .registers 4

    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lveg;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p2, :cond_10

    const-string v0, "[INFO] "

    invoke-static {v0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_10
    const-string v0, "exception_info"

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "IsJavaCrash"

    const-string v0, "1"

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p2, :cond_20

    const-string v0, "0"

    :cond_20
    const-string p1, "IsInfoReport"

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public static o(Ljava/util/Set;)Ljava/util/HashMap;
    .registers 9

    sget-object v0, Lcom/opera/android/crashhandler/OperaCrashKeys;->c:[Ljava/lang/String;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_b
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lym8;

    iget-boolean v3, v2, Lym8;->b:Z

    if-eqz v3, :cond_1e

    sget-object v2, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    goto :goto_47

    :cond_1e
    iget-object v2, v2, Lym8;->a:Landroid/content/Context;

    invoke-static {v2}, Lym8;->a(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/HashMap;-><init>(I)V

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :goto_32
    if-ge v5, v4, :cond_46

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lyd2;

    iget v7, v6, Lyd2;->a:I

    aget-object v7, v0, v7

    iget-object v6, v6, Lyd2;->b:Ljava/lang/String;

    invoke-virtual {v3, v7, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_32

    :cond_46
    move-object v2, v3

    :goto_47
    invoke-virtual {v1, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    goto :goto_b

    :cond_4b
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p0

    const-string v2, "CrashTime"

    invoke-virtual {v1, v2, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Ltz5;->b:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_6e

    const/16 p0, 0x23

    aget-object p0, v0, p0

    invoke-static {}, Ltz5;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6e
    return-object v1
.end method


# virtual methods
.method public final A(Lyz;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lnn7;

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v3

    iget-boolean v4, v3, Lqk6;->e:Z

    if-nez v4, :cond_4c

    const/4 v4, 0x1

    iput-boolean v4, v3, Lqk6;->e:Z

    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v14

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lx5f;

    iget-object v7, v1, Lyz;->g:Ljava/lang/String;

    iget-object v0, v1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v8

    iget-object v0, v1, Lyz;->o:Ldl;

    iget-object v10, v0, Ldl;->b:Lq50;

    iget-object v11, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v12, v0, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v13, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v2, v14}, Lnn7;->n(I)Z

    move-result v15

    iget-object v0, v1, Lyz;->r:Lap;

    invoke-virtual {v0}, Lap;->c()F

    move-result v16

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v21

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v22

    iget-boolean v0, v5, Lx5f;->h:Z

    if-nez v0, :cond_4d

    :cond_4c
    return-void

    :cond_4d
    const-wide/16 v17, -0x1

    const-wide/16 v19, -0x1

    sget-object v6, Ld60;->h:Ld60;

    const/4 v9, 0x0

    invoke-virtual/range {v5 .. v22}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return-void
.end method

.method public final C(Ljava/lang/Throwable;)V
    .registers 5

    invoke-virtual {p0}, Lks3;->h()Ljava/util/HashMap;

    move-result-object v0

    iget-object v1, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-static {v1}, Lks3;->o(Ljava/util/Set;)Ljava/util/HashMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lks3;->e(Ljava/util/HashMap;Ljava/lang/Throwable;Z)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    :try_start_18
    const-string v1, "\n"

    invoke-static {}, Lk1g;->w()Ljava/util/List;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_25
    .catchall {:try_start_18 .. :try_end_25} :catchall_26

    goto :goto_38

    :catchall_26
    move-exception v1

    const-string v2, "[exception: "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v1, "Logs"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lks3;->g:Ljava/lang/Object;

    check-cast p0, Lqz5;

    invoke-interface {p0, v0}, Lqz5;->h(Ljava/util/HashMap;)V

    return-void
.end method

.method public final F(Ljava/lang/Throwable;)V
    .registers 5

    invoke-static {}, Landroid/os/StrictMode;->getThreadPolicy()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v0

    new-instance v1, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitAll()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    invoke-static {v1}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    invoke-static {}, Landroid/os/StrictMode;->getVmPolicy()Landroid/os/StrictMode$VmPolicy;

    move-result-object v1

    sget-object v2, Landroid/os/StrictMode$VmPolicy;->LAX:Landroid/os/StrictMode$VmPolicy;

    invoke-static {v2}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V

    :try_start_1d
    invoke-virtual {p0, p1}, Lks3;->C(Ljava/lang/Throwable;)V
    :try_end_20
    .catchall {:try_start_1d .. :try_end_20} :catchall_21

    goto :goto_25

    :catchall_21
    move-exception p1

    :try_start_22
    invoke-virtual {p0, p1}, Lks3;->H(Ljava/lang/Throwable;)V
    :try_end_25
    .catchall {:try_start_22 .. :try_end_25} :catchall_30

    :goto_25
    if-eqz v0, :cond_2a

    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    :cond_2a
    if-eqz v1, :cond_2f

    invoke-static {v1}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V

    :cond_2f
    return-void

    :catchall_30
    move-exception p0

    if-eqz v0, :cond_36

    :try_start_33
    invoke-static {v0}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V

    :cond_36
    if-eqz v1, :cond_40

    invoke-static {v1}, Landroid/os/StrictMode;->setVmPolicy(Landroid/os/StrictMode$VmPolicy;)V
    :try_end_3b
    .catchall {:try_start_33 .. :try_end_3b} :catchall_3c

    goto :goto_40

    :catchall_3c
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_40
    :goto_40
    throw p0
.end method

.method public final H(Ljava/lang/Throwable;)V
    .registers 6

    iget-object v0, p0, Lks3;->i:Ljava/lang/Object;

    check-cast v0, Lwom;

    invoke-interface {v0}, Lwom;->d()Z

    move-result v1

    if-eqz v1, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Lks3;->h()Ljava/util/HashMap;

    move-result-object v1

    iget-object v2, p0, Lks3;->e:Ljava/lang/Object;

    check-cast v2, Lv61;

    if-eqz v2, :cond_4d

    iget-object v2, v2, Lv61;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v2

    if-nez v2, :cond_20

    const-string v2, "null"

    goto :goto_44

    :cond_20
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2b

    invoke-static {v2}, Lv61;->c(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    goto :goto_44

    :cond_2b
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_42

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_42

    invoke-static {v2}, Lv61;->c(Ljava/io/File;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "../"

    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_44

    :cond_42
    const-string v2, "???"

    :goto_44
    const-string v3, "CacheDirStatus"

    invoke-static {v3, v2}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    :cond_4d
    sget-object v2, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    invoke-static {v2}, Lks3;->o(Ljava/util/Set;)Ljava/util/HashMap;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    const/4 v2, 0x0

    invoke-static {v1, p1, v2}, Lks3;->e(Ljava/util/HashMap;Ljava/lang/Throwable;Z)V

    const-string p1, "https://crashstats-collector.opera.com/collector/submit"

    new-instance v2, Lhvj;

    invoke-direct {v2, p0}, Lhvj;-><init>(Lks3;)V

    :try_start_61
    new-instance p0, Ljava/net/URL;

    invoke-direct {p0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Lhvj;->h(Ljava/net/URL;)V

    invoke-virtual {v2, v1}, Lhvj;->m(Ljava/util/HashMap;)V

    invoke-virtual {v2}, Lhvj;->l()V
    :try_end_6f
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_6f} :catch_75
    .catchall {:try_start_61 .. :try_end_6f} :catchall_70

    goto :goto_75

    :catchall_70
    move-exception p0

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_75
    :goto_75
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-interface {v0}, Lwom;->c()V

    return-void
.end method

.method public final J(Ljava/lang/String;)V
    .registers 8

    iget-object p0, p0, Lks3;->d:Ljava/lang/Object;

    check-cast p0, Lldc;

    if-nez p0, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Lldc;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_a
    iget-object v1, p0, Lldc;->c:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->size()I

    move-result v1

    const/16 v2, 0x32

    if-ne v1, v2, :cond_19

    iget-object v1, p0, Lldc;->c:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->removeLast()Ljava/lang/Object;

    :cond_19
    iget-object v1, p0, Lldc;->c:Ljava/util/ArrayDeque;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " ("

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sget-object p1, Lldc;->d:Lf30;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/text/SimpleDateFormat;

    new-instance v5, Ljava/util/Date;

    invoke-direct {v5, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p1, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->addFirst(Ljava/lang/Object;)V

    iget-object p1, p0, Lldc;->b:Ljava/lang/Object;

    monitor-enter p1
    :try_end_4f
    .catchall {:try_start_a .. :try_end_4f} :catchall_67

    :try_start_4f
    const-string v1, "\n"

    iget-object v2, p0, Lldc;->c:Ljava/util/ArrayDeque;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    monitor-exit p1
    :try_end_58
    .catchall {:try_start_4f .. :try_end_58} :catchall_63

    :try_start_58
    monitor-exit v0
    :try_end_59
    .catchall {:try_start_58 .. :try_end_59} :catchall_67

    iget-object p0, p0, Lldc;->a:Lcom/opera/android/crashhandler/OperaCrashKeys;

    const/16 p1, 0x26

    invoke-virtual {p0, p1, v1}, Lcom/opera/android/crashhandler/OperaCrashKeys;->a(ILjava/lang/String;)V

    return-void

    :goto_61
    :try_start_61
    monitor-exit p1
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_63

    :try_start_62
    throw p0

    :catchall_63
    move-exception p0

    goto :goto_61

    :goto_65
    monitor-exit v0
    :try_end_66
    .catchall {:try_start_62 .. :try_end_66} :catchall_67

    throw p0

    :catchall_67
    move-exception p0

    goto :goto_65
.end method

.method public final K(Lcxj;Ljava/lang/String;Ljava/lang/String;II)V
    .registers 13

    invoke-virtual {p1, p4, p5}, Lcxj;->c(II)Ljava/util/List;

    move-result-object v0

    iget-object v1, p1, Lcxj;->a:Ljava/lang/StringBuilder;

    new-instance v2, Ljava/util/LinkedHashSet;

    invoke-direct {v2}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_11
    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzwj;

    iget-object v3, v3, Lzwj;->a:Ljava/lang/Object;

    instance-of v4, v3, Landroid/text/style/ClickableSpan;

    if-eqz v4, :cond_11

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_27
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v0

    if-lez v0, :cond_83

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v0}, Lcxj;->c(II)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object v5, p1, Lcxj;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v5}, Ljava/util/ArrayDeque;->clear()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_50
    :goto_50
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_69

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Lzwj;

    iget-object v5, v5, Lzwj;->a:Ljava/lang/Object;

    invoke-static {v2, v5}, Lkotlin/collections/CollectionsKt;->E(Ljava/lang/Iterable;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_50

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_50

    :cond_69
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_6d
    if-ge v3, v0, :cond_83

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v3, v3, 0x1

    check-cast v2, Lzwj;

    iget-object v4, v2, Lzwj;->a:Ljava/lang/Object;

    iget v5, v2, Lzwj;->b:I

    iget v6, v2, Lzwj;->c:I

    iget v2, v2, Lzwj;->d:I

    invoke-virtual {p1, v4, v5, v6, v2}, Lcxj;->setSpan(Ljava/lang/Object;III)V

    goto :goto_6d

    :cond_83
    if-nez p2, :cond_8e

    iget-object p0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Ljgc;

    invoke-virtual {p0, p3, p3}, Ljgc;->a(Ljava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;

    move-result-object p0

    goto :goto_96

    :cond_8e
    iget-object p0, p0, Lks3;->g:Ljava/lang/Object;

    check-cast p0, Ljgc;

    invoke-virtual {p0, p2, p3}, Ljgc;->a(Ljava/lang/String;Ljava/lang/String;)Landroid/text/style/ClickableSpan;

    move-result-object p0

    :goto_96
    const/16 p2, 0x11

    invoke-virtual {p1, p0, p4, p5, p2}, Lcxj;->setSpan(Ljava/lang/Object;III)V

    return-void
.end method

.method public final L(Lpxh;)V
    .registers 10

    iget-object v0, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v0, Lx0a;

    if-eqz v0, :cond_7

    return-void

    :cond_7
    new-instance v1, Lx0a;

    iget-object v0, p0, Lks3;->a:Ljava/lang/Object;

    check-cast v0, Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lzh7;

    iget-object v0, p0, Lks3;->b:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    iget-object v0, p0, Lks3;->c:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Landroid/view/ViewGroup;

    iget-object v0, p0, Lks3;->d:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lqim;

    iget-object v0, p0, Lks3;->e:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lkze;

    new-instance v7, Ltu7;

    const/16 v0, 0x15

    invoke-direct {v7, p0, v0}, Ltu7;-><init>(Ljava/lang/Object;B)V

    invoke-direct/range {v1 .. v7}, Lx0a;-><init>(Lzh7;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/ViewGroup;Lqim;Lkze;Ltu7;)V

    iput-object v1, p0, Lks3;->f:Ljava/lang/Object;

    iget-object v0, v1, Lhi7;->e:Ligi;

    iget-object v0, v0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    check-cast v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    new-instance v1, Lyk4;

    const/16 v2, 0x1d

    invoke-direct {v1, p0, v2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p1, :cond_71

    iget-object v1, p0, Lks3;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    iget-boolean v1, v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->e0:Z

    if-eq v1, p1, :cond_67

    iget-object p1, v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->U:Lok8;

    invoke-virtual {p1}, Lok8;->n()Z

    move-result v1

    if-nez v1, :cond_67

    invoke-virtual {p1}, Lok8;->j()V

    :cond_67
    iget-object p0, p0, Lks3;->g:Ljava/lang/Object;

    check-cast p0, Lld9;

    const-wide/16 v1, 0x1388

    invoke-virtual {v0, p0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_84

    :cond_71
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-boolean p0, v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->e0:Z

    if-eqz p0, :cond_84

    iget-object p0, v0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->T:Lok8;

    invoke-virtual {p0}, Lok8;->n()Z

    move-result p1

    if-nez p1, :cond_84

    invoke-virtual {p0}, Lok8;->j()V

    :cond_84
    :goto_84
    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->Q(I)V

    return-void
.end method

.method public final a(Lyz;Ldl;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lnn7;

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v3

    iget-boolean v4, v3, Lqk6;->d:Z

    if-eqz v4, :cond_12

    const/4 v3, 0x0

    goto :goto_16

    :cond_12
    const/4 v4, 0x1

    iput-boolean v4, v3, Lqk6;->d:Z

    move v3, v4

    :goto_16
    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v13

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    move-object v4, v0

    check-cast v4, Lx5f;

    iget-object v6, v1, Lyz;->g:Ljava/lang/String;

    iget-object v0, v1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v7

    invoke-virtual {v1}, Lyz;->g()Ljava/lang/String;

    move-result-object v8

    iget-object v0, v1, Lyz;->o:Ldl;

    iget-object v9, v0, Ldl;->b:Lq50;

    iget-object v10, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v11, v0, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v12, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v2, v13}, Lnn7;->n(I)Z

    move-result v14

    iget-object v0, v1, Lyz;->r:Lap;

    invoke-virtual {v0}, Lap;->c()F

    move-result v15

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v20

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v21

    iget-boolean v0, v4, Lx5f;->h:Z

    if-eqz v0, :cond_55

    if-nez v3, :cond_56

    :cond_55
    return-void

    :cond_56
    const-wide/16 v16, -0x1

    const-wide/16 v18, -0x1

    sget-object v5, Ld60;->f:Ld60;

    invoke-virtual/range {v4 .. v21}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return-void
.end method

.method public final b(Lyz;Ldl;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lnn7;

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v3

    iget-boolean v4, v3, Lqk6;->j:Z

    if-nez v4, :cond_50

    const/4 v4, 0x1

    iput-boolean v4, v3, Lqk6;->j:Z

    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v14

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lx5f;

    iget-object v7, v1, Lyz;->g:Ljava/lang/String;

    iget-object v0, v1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v8

    invoke-virtual {v1}, Lyz;->g()Ljava/lang/String;

    move-result-object v9

    iget-object v0, v1, Lyz;->o:Ldl;

    iget-object v10, v0, Ldl;->b:Lq50;

    iget-object v11, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v12, v0, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v13, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v2, v14}, Lnn7;->n(I)Z

    move-result v15

    iget-object v0, v1, Lyz;->r:Lap;

    invoke-virtual {v0}, Lap;->c()F

    move-result v16

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v21

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v22

    iget-boolean v0, v5, Lx5f;->h:Z

    if-nez v0, :cond_51

    :cond_50
    return-void

    :cond_51
    const-wide/16 v17, -0x1

    const-wide/16 v19, -0x1

    sget-object v6, Ld60;->o:Ld60;

    invoke-virtual/range {v5 .. v22}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return-void
.end method

.method public final c(Ldl;)V
    .registers 2

    return-void
.end method

.method public final d(Lyz;)Lqk6;
    .registers 4

    new-instance v0, Lpk6;

    invoke-direct {v0, p1}, Lpk6;-><init>(Lyz;)V

    iget-object p0, p0, Lks3;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqk6;

    if-nez p1, :cond_41

    invoke-virtual {p0}, Ljava/util/HashMap;->size()I

    move-result p1

    const/16 v1, 0xfa

    if-lt p1, v1, :cond_39

    invoke-virtual {p0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_21
    :goto_21
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_39

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lpk6;

    iget-object v1, v1, Lpk6;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_21

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_21

    :cond_39
    new-instance p1, Lqk6;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_41
    return-object p1
.end method

.method public final f(Lxuh;Leka;)V
    .registers 7

    instance-of v0, p1, Ldlj;

    if-nez v0, :cond_34

    instance-of v0, p1, Ls7h;

    if-eqz v0, :cond_30

    iget-object p0, p0, Lks3;->d:Ljava/lang/Object;

    check-cast p0, Lnv6;

    check-cast p1, Ls7h;

    iget-object p1, p1, Ls7h;->a:Ljava/lang/String;

    iget-object p0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-eqz v0, :cond_34

    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v0, Lu5f;

    const/4 v3, 0x0

    invoke-direct {v0, p1, v3}, Lu5f;-><init>(Ljava/lang/String;B)V

    invoke-virtual {v2, v0}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    goto :goto_34

    :cond_30
    instance-of p0, p1, Lzuh;

    if-eqz p0, :cond_3f

    :cond_34
    :goto_34
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance p1, Lsw7;

    invoke-direct {p1, p0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2, p1}, Leka;->n(Ltw7;)V

    return-void

    :cond_3f
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public final g(Ldic;Lorg/chromium/ui/modelutil/PropertyModel;Landroid/view/View;)V
    .registers 4

    invoke-interface {p1, p2, p3}, Ldic;->d(Lorg/chromium/ui/modelutil/PropertyModel;Landroid/view/View;)V

    iget-object p0, p0, Lks3;->i:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x0

    :goto_c
    if-ge p2, p1, :cond_1a

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    add-int/lit8 p2, p2, 0x1

    check-cast p3, Ljava/lang/Runnable;

    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    goto :goto_c

    :cond_1a
    return-void
.end method

.method public final h()Ljava/util/HashMap;
    .registers 5

    iget-object p0, p0, Lks3;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/crashhandler/OperaCrashKeys;

    iget-object p0, p0, Lcom/opera/android/crashhandler/OperaCrashKeys;->a:Ljava/util/concurrent/atomic/AtomicReferenceArray;

    new-instance v0, Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->length()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const/4 v1, 0x0

    :goto_10
    const/16 v2, 0x32

    if-ge v1, v2, :cond_26

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    if-eqz v2, :cond_23

    sget-object v3, Lcom/opera/android/crashhandler/OperaCrashKeys;->c:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    :cond_26
    return-object v0
.end method

.method public final i(Lgkn;)Lrmn;
    .registers 15

    iget-object p0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrmn;

    new-instance v0, Lrmn;

    iget-object v1, p0, Lrmn;->a:Lqjn;

    iget-object v2, p0, Lrmn;->b:Llkn;

    iget-object v3, p0, Lrmn;->c:Llkn;

    iget-object p0, p1, Lgkn;->a:Likn;

    iget v4, p0, Likn;->a:I

    iget-object v5, p1, Lgkn;->b:Likn;

    move-object v6, v5

    iget v5, v6, Likn;->a:I

    iget-object v7, p1, Lgkn;->c:Likn;

    iget v7, v7, Likn;->a:I

    iget-object v8, p1, Lgkn;->d:Likn;

    move-object p1, v6

    move v6, v7

    iget v7, v8, Likn;->a:I

    invoke-static {v6}, Lp37;->u0(I)Z

    move-result v9

    xor-int/lit8 v9, v9, 0x1

    iget p0, p0, Likn;->a:I

    invoke-static {p0}, Lp37;->u0(I)Z

    move-result p0

    xor-int/lit8 v10, p0, 0x1

    iget p0, p1, Likn;->a:I

    invoke-static {p0}, Lp37;->u0(I)Z

    move-result p0

    xor-int/lit8 v11, p0, 0x1

    iget p0, v8, Likn;->a:I

    invoke-static {p0}, Lp37;->u0(I)Z

    move-result p0

    xor-int/lit8 v12, p0, 0x1

    invoke-direct/range {v0 .. v12}, Lrmn;-><init>(Lqjn;Llkn;Llkn;IIIILikn;ZZZZ)V

    return-object v0
.end method

.method public final j(Lyz;Lhl;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lnn7;

    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v12

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lx5f;

    iget-object v5, v1, Lyz;->g:Ljava/lang/String;

    iget-object v0, v1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v6

    invoke-virtual {v1}, Lyz;->g()Ljava/lang/String;

    move-result-object v7

    iget-object v0, v1, Lyz;->o:Ldl;

    iget-object v8, v0, Ldl;->b:Lq50;

    iget-object v9, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v10, v0, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v11, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v2, v12}, Lnn7;->n(I)Z

    move-result v13

    iget-object v0, v1, Lyz;->r:Lap;

    invoke-virtual {v0}, Lap;->c()F

    move-result v14

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v19

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v20

    iget-boolean v0, v3, Lx5f;->h:Z

    if-nez v0, :cond_49

    return-void

    :cond_49
    const-wide/16 v15, -0x1

    const-wide/16 v17, -0x1

    sget-object v4, Ld60;->n:Ld60;

    invoke-virtual/range {v3 .. v20}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return-void
.end method

.method public final k(Lyz;Ldl;)V
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v3, p1

    iget-object v1, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v1, Lnn7;

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v2

    iget-boolean v4, v2, Lqk6;->c:Z

    if-eqz v4, :cond_12

    const/4 v4, 0x0

    goto :goto_15

    :cond_12
    const/4 v4, 0x1

    iput-boolean v4, v2, Lqk6;->c:Z

    :goto_15
    iget-wide v5, v2, Lqk6;->b:J

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-nez v5, :cond_22

    const-wide/16 v5, -0x1

    :goto_1f
    move-wide/from16 v19, v5

    goto :goto_2a

    :cond_22
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    iget-wide v7, v2, Lqk6;->b:J

    sub-long/2addr v5, v7

    goto :goto_1f

    :goto_2a
    invoke-static {v3}, Lnn7;->j(Lyz;)I

    move-result v2

    iget-object v5, v0, Lks3;->g:Ljava/lang/Object;

    move-object v7, v5

    check-cast v7, Lx5f;

    iget-object v9, v3, Lyz;->g:Ljava/lang/String;

    iget-object v5, v3, Lyz;->i:Lyo;

    invoke-static {v5}, Lyo;->h(Lyo;)Lu50;

    move-result-object v10

    invoke-virtual {v3}, Lyz;->g()Ljava/lang/String;

    move-result-object v11

    iget-object v5, v3, Lyz;->o:Ldl;

    iget-object v12, v5, Ldl;->b:Lq50;

    iget-object v13, v5, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v3}, Lyz;->h()Ldl;

    move-result-object v5

    iget-object v14, v5, Ldl;->b:Lq50;

    invoke-virtual {v3}, Lyz;->h()Ldl;

    move-result-object v5

    iget-object v15, v5, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lnn7;->n(I)Z

    move-result v17

    iget-object v1, v3, Lyz;->r:Lap;

    invoke-virtual {v1}, Lap;->c()F

    move-result v18

    invoke-virtual {v3}, Lyz;->e()Lv50;

    move-result-object v23

    invoke-virtual {v3}, Lyz;->j()Ljava/lang/String;

    move-result-object v24

    iget-boolean v1, v7, Lx5f;->h:Z

    if-eqz v1, :cond_77

    if-eqz v4, :cond_6d

    sget-object v1, Ld60;->c:Ld60;

    :goto_6b
    move-object v8, v1

    goto :goto_70

    :cond_6d
    sget-object v1, Ld60;->d:Ld60;

    goto :goto_6b

    :goto_70
    const-wide/16 v21, -0x1

    move/from16 v16, v2

    invoke-virtual/range {v7 .. v24}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    :cond_77
    if-eqz v4, :cond_91

    iget-object v0, v0, Lks3;->d:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Li5o;

    move-object/from16 v0, p2

    iget-object v4, v0, Ldl;->c:Ljava/lang/String;

    iget-object v0, v1, Li5o;->a:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Liy;

    new-instance v0, Lky;

    const/4 v5, 0x0

    const/4 v2, 0x2

    invoke-direct/range {v0 .. v5}, Lky;-><init>(Ljava/lang/Object;ILjava/lang/Object;Ljava/io/Serializable;B)V

    invoke-virtual {v6, v0}, Liy;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_91
    return-void
.end method

.method public final l(Lyz;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lnn7;

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v3

    iget-boolean v4, v3, Lqk6;->f:Z

    if-nez v4, :cond_4c

    const/4 v4, 0x1

    iput-boolean v4, v3, Lqk6;->f:Z

    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v14

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lx5f;

    iget-object v7, v1, Lyz;->g:Ljava/lang/String;

    iget-object v0, v1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v8

    iget-object v0, v1, Lyz;->o:Ldl;

    iget-object v10, v0, Ldl;->b:Lq50;

    iget-object v11, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v12, v0, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v13, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v2, v14}, Lnn7;->n(I)Z

    move-result v15

    iget-object v0, v1, Lyz;->r:Lap;

    invoke-virtual {v0}, Lap;->c()F

    move-result v16

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v21

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v22

    iget-boolean v0, v5, Lx5f;->h:Z

    if-nez v0, :cond_4d

    :cond_4c
    return-void

    :cond_4d
    const-wide/16 v17, -0x1

    const-wide/16 v19, -0x1

    sget-object v6, Ld60;->g:Ld60;

    const/4 v9, 0x0

    invoke-virtual/range {v5 .. v22}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return-void
.end method

.method public final m()Lrmn;
    .registers 14

    new-instance v0, Lrmn;

    iget-object v1, p0, Lks3;->d:Ljava/lang/Object;

    check-cast v1, Lqjn;

    iget-object v2, p0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    const/4 v3, 0x0

    move-object v4, v2

    invoke-virtual {v1, v3, v4}, Lqjn;->a(ILandroid/content/Context;)Llkn;

    move-result-object v2

    invoke-virtual {v2, v4}, Llkn;->c(Landroid/content/Context;)V

    iget-object v5, p0, Lks3;->d:Ljava/lang/Object;

    check-cast v5, Lqjn;

    invoke-virtual {v5, v3, v4}, Lqjn;->a(ILandroid/content/Context;)Llkn;

    move-result-object v3

    invoke-virtual {v3, v4}, Llkn;->c(Landroid/content/Context;)V

    iget-object p0, p0, Lks3;->d:Ljava/lang/Object;

    check-cast p0, Lqjn;

    iget-object p0, p0, Lqjn;->a:Lxkn;

    iget v4, p0, Lxkn;->d:I

    iget v6, p0, Lxkn;->f:I

    iget v7, p0, Lxkn;->e:I

    iget-boolean v9, p0, Lxkn;->g:Z

    iget-boolean v10, p0, Lxkn;->h:Z

    iget-boolean v12, p0, Lxkn;->i:Z

    const/4 v8, 0x0

    move v5, v4

    move v11, v10

    invoke-direct/range {v0 .. v12}, Lrmn;-><init>(Lqjn;Llkn;Llkn;IIIILikn;ZZZZ)V

    return-object v0
.end method

.method public final n(Lyz;Z)V
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lnn7;

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v3

    const/4 v4, 0x1

    if-eqz p2, :cond_16

    iget-boolean v5, v3, Lqk6;->h:Z

    if-nez v5, :cond_59

    iput-boolean v4, v3, Lqk6;->h:Z

    goto :goto_1c

    :cond_16
    iget-boolean v5, v3, Lqk6;->i:Z

    if-nez v5, :cond_59

    iput-boolean v4, v3, Lqk6;->i:Z

    :goto_1c
    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v15

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Lx5f;

    iget-object v8, v1, Lyz;->g:Ljava/lang/String;

    iget-object v0, v1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v9

    invoke-virtual {v1}, Lyz;->g()Ljava/lang/String;

    move-result-object v10

    iget-object v0, v1, Lyz;->o:Ldl;

    iget-object v11, v0, Ldl;->b:Lq50;

    iget-object v12, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v13, v0, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v14, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v2, v15}, Lnn7;->n(I)Z

    move-result v16

    iget-object v0, v1, Lyz;->r:Lap;

    invoke-virtual {v0}, Lap;->c()F

    move-result v17

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v22

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v23

    iget-boolean v0, v6, Lx5f;->h:Z

    if-nez v0, :cond_5a

    :cond_59
    return-void

    :cond_5a
    if-eqz p2, :cond_60

    sget-object v0, Ld60;->l:Ld60;

    :goto_5e
    move-object v7, v0

    goto :goto_63

    :cond_60
    sget-object v0, Ld60;->m:Ld60;

    goto :goto_5e

    :goto_63
    const-wide/16 v18, -0x1

    const-wide/16 v20, -0x1

    invoke-virtual/range {v6 .. v23}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return-void
.end method

.method public final p(Lyz;Ldl;Z)V
    .registers 34

    move-object/from16 v0, p0

    move-object/from16 v4, p1

    move-object/from16 v1, p2

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    move-object v7, v2

    check-cast v7, Lnn7;

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v2

    iget-object v8, v4, Lyz;->i:Lyo;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    iput-wide v5, v2, Lqk6;->b:J

    iget-boolean v3, v2, Lqk6;->a:Z

    move v5, v3

    const/4 v3, 0x1

    if-eqz v5, :cond_1f

    const/4 v2, 0x0

    goto :goto_22

    :cond_1f
    iput-boolean v3, v2, Lqk6;->a:Z

    move v2, v3

    :goto_22
    invoke-static {v4}, Lnn7;->j(Lyz;)I

    move-result v5

    iget-object v6, v0, Lks3;->c:Ljava/lang/Object;

    check-cast v6, Ls9i;

    iget-object v10, v6, Ls9i;->d:Ljava/lang/Object;

    check-cast v10, Landroid/util/SparseArray;

    if-nez v10, :cond_37

    iget-object v10, v6, Ls9i;->b:Ljava/lang/Object;

    check-cast v10, Li32;

    invoke-virtual {v10}, Lldk;->i()V

    :cond_37
    new-instance v10, Lr59;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-direct {v10, v11, v12}, Lr59;-><init>(J)V

    iget-object v13, v6, Ls9i;->d:Ljava/lang/Object;

    check-cast v13, Landroid/util/SparseArray;

    invoke-virtual {v13, v5}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v13

    iget-object v14, v6, Ls9i;->d:Ljava/lang/Object;

    check-cast v14, Landroid/util/SparseArray;

    if-gez v13, :cond_53

    invoke-virtual {v14, v5, v10}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move v11, v3

    goto :goto_6f

    :cond_53
    invoke-virtual {v14, v13}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lr59;

    iget-wide v14, v14, Lr59;->a:J

    sub-long/2addr v11, v14

    const-wide v14, 0x9a7ec800L

    cmp-long v11, v11, v14

    if-ltz v11, :cond_67

    move v11, v3

    goto :goto_68

    :cond_67
    const/4 v11, 0x0

    :goto_68
    iget-object v12, v6, Ls9i;->d:Ljava/lang/Object;

    check-cast v12, Landroid/util/SparseArray;

    invoke-virtual {v12, v13, v10}, Landroid/util/SparseArray;->setValueAt(ILjava/lang/Object;)V

    :goto_6f
    iget-object v10, v6, Ls9i;->e:Ljava/lang/Object;

    check-cast v10, Loml;

    if-nez v10, :cond_95

    iget-object v10, v6, Ls9i;->c:Ljava/lang/Object;

    check-cast v10, Lumi;

    new-instance v12, Lbn7;

    const/16 v13, 0x1b

    invoke-direct {v12, v6, v13}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v10, v12}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v10

    new-instance v12, Loml;

    invoke-direct {v12, v10}, Loml;-><init>(Lnml;)V

    iput-object v12, v6, Ls9i;->e:Ljava/lang/Object;

    sget-object v16, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const/16 v17, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x5

    invoke-virtual/range {v12 .. v17}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_95
    if-nez v11, :cond_99

    if-eqz v2, :cond_c1

    :cond_99
    iget-object v6, v0, Lks3;->f:Ljava/lang/Object;

    check-cast v6, Lwjh;

    iget-object v10, v6, Lwjh;->f:Ljava/lang/Object;

    check-cast v10, Lo59;

    if-eqz v10, :cond_c1

    iget-wide v12, v10, Lo59;->h:J

    const-wide/16 v14, -0x1

    cmp-long v12, v12, v14

    if-gtz v12, :cond_c1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v12

    iget-object v14, v6, Lwjh;->f:Ljava/lang/Object;

    check-cast v14, Lo59;

    iget-wide v3, v14, Lo59;->b:J

    sub-long/2addr v12, v3

    iput-wide v12, v10, Lo59;->h:J

    move/from16 v3, p3

    iput-boolean v3, v14, Lo59;->l:Z

    sget-object v3, Lie0;->b:Lie0;

    invoke-virtual {v6, v3}, Lwjh;->y(Lie0;)V

    :cond_c1
    if-eqz v11, :cond_c5

    const/4 v3, 0x0

    goto :goto_ca

    :cond_c5
    if-eqz v2, :cond_c9

    const/4 v3, 0x1

    goto :goto_ca

    :cond_c9
    const/4 v3, 0x2

    :goto_ca
    if-nez v11, :cond_ce

    if-eqz v2, :cond_ff

    :cond_ce
    iget-object v4, v0, Lks3;->e:Ljava/lang/Object;

    check-cast v4, Ls9i;

    iget-object v6, v4, Ls9i;->e:Ljava/lang/Object;

    check-cast v6, Lil;

    if-nez v6, :cond_e8

    iget-object v6, v4, Ls9i;->c:Ljava/lang/Object;

    check-cast v6, Lvzk;

    iget-object v6, v6, Lvzk;->a:Ljava/lang/Object;

    check-cast v6, Lcy;

    invoke-virtual {v6}, Lcy;->c()Lml;

    move-result-object v6

    iget-object v6, v6, Lml;->h:Lil;

    iput-object v6, v4, Ls9i;->e:Ljava/lang/Object;

    :cond_e8
    if-eqz v6, :cond_ff

    iget-object v6, v6, Lil;->f:Lo1;

    if-eqz v6, :cond_ff

    iget-object v6, v6, Lo1;->b:Ljava/lang/String;

    iget-object v10, v1, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_ff

    iget-object v4, v4, Ls9i;->b:Ljava/lang/Object;

    check-cast v4, Li16;

    invoke-virtual {v4}, Li16;->y()V

    :cond_ff
    sget-object v4, Lyo;->g:Lyo;

    if-eq v8, v4, :cond_22d

    iget-object v4, v0, Lks3;->g:Ljava/lang/Object;

    move-object v10, v4

    check-cast v10, Lx5f;

    move-object/from16 v4, p1

    iget-object v12, v4, Lyz;->g:Ljava/lang/String;

    invoke-static {v8}, Lyo;->h(Lyo;)Lu50;

    move-result-object v13

    invoke-virtual {v4}, Lyz;->g()Ljava/lang/String;

    move-result-object v14

    iget-object v6, v4, Lyz;->o:Ldl;

    iget-object v15, v6, Ldl;->b:Lq50;

    iget-object v6, v6, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v4}, Lyz;->h()Ldl;

    move-result-object v11

    iget-object v11, v11, Ldl;->b:Lq50;

    invoke-virtual {v4}, Lyz;->h()Ldl;

    move-result-object v9

    iget-object v9, v9, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v7, v5}, Lnn7;->n(I)Z

    move-result v20

    move/from16 v28, v2

    iget-object v2, v4, Lyz;->r:Lap;

    invoke-virtual {v2}, Lap;->c()F

    move-result v21

    invoke-virtual {v4}, Lyz;->e()Lv50;

    move-result-object v26

    invoke-virtual {v4}, Lyz;->j()Ljava/lang/String;

    move-result-object v27

    iget-boolean v2, v10, Lx5f;->h:Z

    if-nez v2, :cond_140

    const/4 v2, 0x1

    goto :goto_169

    :cond_140
    if-nez v3, :cond_155

    const-wide/16 v22, -0x1

    const-wide/16 v24, -0x1

    move-object/from16 v17, v11

    sget-object v11, Ld60;->i:Ld60;

    move/from16 v19, v5

    move-object/from16 v16, v6

    move-object/from16 v18, v9

    invoke-virtual/range {v10 .. v27}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    const/4 v2, 0x1

    goto :goto_160

    :cond_155
    move/from16 v19, v5

    move-object/from16 v16, v6

    move-object/from16 v18, v9

    move-object/from16 v17, v11

    const/4 v2, 0x1

    if-ne v3, v2, :cond_169

    :goto_160
    const-wide/16 v22, -0x1

    const-wide/16 v24, -0x1

    sget-object v11, Ld60;->b:Ld60;

    invoke-virtual/range {v10 .. v27}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    :cond_169
    :goto_169
    if-eqz v28, :cond_22d

    iget-object v3, v0, Lks3;->d:Ljava/lang/Object;

    check-cast v3, Li5o;

    iget-object v5, v1, Ldl;->c:Ljava/lang/String;

    iget-object v1, v3, Li5o;->a:Ljava/lang/Object;

    move-object v9, v1

    check-cast v9, Liy;

    new-instance v1, Lky;

    const/4 v6, 0x0

    move-object/from16 v29, v3

    move v3, v2

    move-object/from16 v2, v29

    invoke-direct/range {v1 .. v6}, Lky;-><init>(Ljava/lang/Object;ILjava/lang/Object;Ljava/io/Serializable;B)V

    invoke-virtual {v9, v1}, Liy;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    invoke-static {v4}, Lnn7;->j(Lyz;)I

    move-result v1

    iget-object v2, v7, Lnn7;->m:Ln57;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v5, v7, Lnn7;->r:Landroid/util/SparseArray;

    if-eqz v5, :cond_19d

    iget-object v5, v7, Lnn7;->p:Ley;

    if-eqz v5, :cond_19d

    invoke-virtual {v7, v1, v2, v3}, Lnn7;->p(IJ)V

    goto :goto_1a7

    :cond_19d
    iget-object v5, v7, Lnn7;->n:Ljava/util/ArrayList;

    new-instance v6, Lln7;

    invoke-direct {v6, v1, v2, v3}, Lln7;-><init>(IJ)V

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_1a7
    iget-object v0, v0, Lks3;->i:Ljava/lang/Object;

    check-cast v0, Lua7;

    invoke-static {}, Landroid/icu/text/BreakIterator;->getWordInstance()Landroid/icu/text/BreakIterator;

    move-result-object v1

    iget-object v9, v4, Lyz;->a:Ljava/lang/String;

    iget-object v10, v4, Lyz;->b:Ljava/lang/String;

    iget-object v11, v4, Lyz;->e:Ljava/lang/String;

    iget-object v12, v4, Lyz;->h:Ljava/lang/String;

    iget-object v13, v4, Lyz;->c:Ljava/lang/String;

    iget-object v14, v4, Lyz;->d:Ljava/lang/String;

    filled-new-array/range {v9 .. v14}, [Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object v2

    new-instance v3, Ljkc;

    const/16 v5, 0xa

    invoke-direct {v3, v0, v1, v5}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lm1e;

    const/4 v5, 0x0

    invoke-direct {v1, v3, v5}, Lm1e;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-interface {v2, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Ld82;

    const/4 v3, 0x4

    invoke-direct {v2, v1, v3}, Ld82;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lbli;

    const/16 v3, 0xd

    invoke-direct {v1, v3}, Lbli;-><init>(B)V

    new-instance v3, Lv39;

    invoke-direct {v3, v2, v5, v1}, Lv39;-><init>(Lkotlin/sequences/Sequence;ZLkotlin/jvm/functions/Function1;)V

    invoke-static {v3}, Ly1j;->d(Lkotlin/sequences/Sequence;)Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Ljava/lang/String;

    if-eqz v13, :cond_22d

    iget-object v1, v0, Lua7;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashSet;

    iget-object v2, v4, Lyz;->g:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_22d

    iget-object v0, v0, Lua7;->b:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-object v10, v4, Lyz;->g:Ljava/lang/String;

    invoke-static {v8}, Lyo;->h(Lyo;)Lu50;

    move-result-object v11

    invoke-virtual {v4}, Lyz;->e()Lv50;

    move-result-object v12

    iget-object v14, v4, Lyz;->a:Ljava/lang/String;

    iget-object v15, v4, Lyz;->b:Ljava/lang/String;

    iget-object v1, v4, Lyz;->h:Ljava/lang/String;

    iget-object v2, v4, Lyz;->d:Ljava/lang/String;

    if-nez v2, :cond_215

    iget-object v2, v4, Lyz;->c:Ljava/lang/String;

    :cond_215
    move-object/from16 v17, v2

    invoke-virtual {v4}, Lyz;->f()Ljava/lang/String;

    move-result-object v18

    invoke-virtual {v4}, Lyz;->j()Ljava/lang/String;

    move-result-object v19

    invoke-virtual {v4}, Lyz;->l()Ljava/lang/String;

    move-result-object v20

    new-instance v9, Lr5f;

    move-object/from16 v16, v1

    invoke-direct/range {v9 .. v20}, Lr5f;-><init>(Ljava/lang/String;Lu50;Lv50;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_22d
    return-void
.end method

.method public final q(Ldp2;I)V
    .registers 51

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v3, v1, Ldp2;->b:[B

    iget-object v4, v0, Lks3;->d:Ljava/lang/Object;

    check-cast v4, Lx77;

    iget-object v5, v0, Lks3;->f:Ljava/lang/Object;

    check-cast v5, Lydi;

    iget-object v6, v0, Lks3;->a:Ljava/lang/Object;

    check-cast v6, Lpxd;

    iget-object v7, v1, Ldp2;->a:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lpxd;->a(Ljava/lang/String;)Lo5m;

    move-result-object v6

    :goto_18
    new-instance v7, Lzom;

    const/4 v8, 0x0

    invoke-direct {v7, v0, v1, v8}, Lzom;-><init>(Lks3;Ldp2;B)V

    invoke-virtual {v5, v7}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Boolean;

    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    const/4 v9, 0x1

    if-eqz v7, :cond_583

    new-instance v7, Lzom;

    invoke-direct {v7, v0, v1, v9}, Lzom;-><init>(Lks3;Ldp2;B)V

    invoke-virtual {v5, v7}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5ae

    const/4 v14, 0x3

    const-wide/16 v10, -0x1

    const-string v9, "Uploader"

    const/4 v13, 0x0

    if-nez v6, :cond_61

    const-string v7, "Unknown backend for %s, deleting event batch for it..."

    invoke-static {v1, v9, v7}, Lmkh;->q(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v7, Lsm2;

    invoke-direct {v7, v14, v10, v11, v13}, Lsm2;-><init>(IJLjava/lang/String;)V

    move-object/from16 v18, v3

    move-object/from16 v32, v4

    move-object/from16 v34, v5

    move-object/from16 v19, v6

    goto/16 :goto_4f4

    :cond_61
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lfo2;

    iget-object v11, v11, Lfo2;->c:Ljn2;

    iget-object v13, v11, Ljn2;->h:Ljava/lang/String;

    iget-object v11, v11, Ljn2;->l:Ljava/lang/String;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_7a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_a5

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v14, v17

    check-cast v14, Lfo2;

    iget-object v15, v14, Lfo2;->c:Ljn2;

    iget-object v8, v15, Ljn2;->h:Ljava/lang/String;

    move-object/from16 v18, v3

    iget-object v3, v15, Ljn2;->l:Ljava/lang/String;

    invoke-static {v13, v8}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a2

    invoke-static {v11, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a2

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a2
    move-object/from16 v3, v18

    goto :goto_7a

    :cond_a5
    move-object/from16 v18, v3

    const-string v3, "proto"

    if-eqz v18, :cond_11e

    iget-object v7, v0, Lks3;->i:Ljava/lang/Object;

    check-cast v7, Lydi;

    invoke-static {v7}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v8, Lyom;

    const/4 v14, 0x0

    invoke-direct {v8, v7, v14}, Lyom;-><init>(Lydi;B)V

    invoke-virtual {v5, v8}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lj45;

    new-instance v8, Lala;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    iput-object v14, v8, Lala;->f:Ljava/lang/Object;

    iget-object v14, v0, Lks3;->g:Ljava/lang/Object;

    check-cast v14, Lt55;

    invoke-interface {v14}, Lt55;->d()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    iput-object v14, v8, Lala;->d:Ljava/lang/Object;

    iget-object v14, v0, Lks3;->h:Ljava/lang/Object;

    check-cast v14, Lt55;

    invoke-interface {v14}, Lt55;->d()J

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    iput-object v14, v8, Lala;->e:Ljava/lang/Object;

    const-string v14, "GDT_CLIENT_METRICS"

    iput-object v14, v8, Lala;->a:Ljava/lang/Object;

    iput-object v13, v8, Lala;->h:Ljava/lang/Object;

    new-instance v13, Lr18;

    new-instance v14, Lp28;

    invoke-direct {v14, v3}, Lp28;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v15, Lp6h;->a:Ld7h;

    invoke-virtual {v15}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v19, v6

    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_102
    invoke-virtual {v15, v7, v6}, Ld7h;->a(Ljava/lang/Object;Ljava/io/ByteArrayOutputStream;)V
    :try_end_105
    .catch Ljava/io/IOException; {:try_start_102 .. :try_end_105} :catch_105

    :catch_105
    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    invoke-direct {v13, v14, v6}, Lr18;-><init>(Lp28;[B)V

    iput-object v13, v8, Lala;->c:Ljava/lang/Object;

    invoke-virtual {v8}, Lala;->f()Ljn2;

    move-result-object v6

    move-object/from16 v7, v19

    check-cast v7, Lvp4;

    invoke-virtual {v7, v6}, Lvp4;->a(Ljn2;)Ljn2;

    move-result-object v6

    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_120

    :cond_11e
    move-object/from16 v19, v6

    :goto_120
    move-object/from16 v6, v19

    check-cast v6, Lvp4;

    const-string v7, "CctTransportBackend"

    new-instance v8, Ljava/util/HashMap;

    invoke-direct {v8}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v13

    const/4 v14, 0x0

    :goto_130
    if-ge v14, v13, :cond_162

    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v15

    add-int/lit8 v14, v14, 0x1

    check-cast v15, Ljn2;

    move-object/from16 v20, v9

    iget-object v9, v15, Ljn2;->a:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v21

    if-nez v21, :cond_152

    move-object/from16 v21, v11

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v11, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v8, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_15d

    :cond_152
    move-object/from16 v21, v11

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    invoke-interface {v9, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_15d
    move-object/from16 v9, v20

    move-object/from16 v11, v21

    goto :goto_130

    :cond_162
    move-object/from16 v20, v9

    move-object/from16 v21, v11

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v8}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_173
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_3eb

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map$Entry;

    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    const/4 v15, 0x0

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljn2;

    sget-object v15, Lreh;->a:Lreh;

    iget-object v15, v6, Lvp4;->f:Lt55;

    invoke-interface {v15}, Lt55;->d()J

    move-result-wide v23

    iget-object v15, v6, Lvp4;->e:Lt55;

    invoke-interface {v15}, Lt55;->d()J

    move-result-wide v25

    const-string v15, "sdk-version"

    invoke-virtual {v14, v15}, Ljn2;->b(Ljava/lang/String;)I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    const-string v15, "model"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    const-string v15, "hardware"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    const-string v15, "device"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    const-string v15, "product"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    const-string v15, "os-uild"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v33

    const-string v15, "manufacturer"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    const-string v15, "fingerprint"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v35

    const-string v15, "country"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    const-string v15, "locale"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v36

    const-string v15, "mcc_mnc"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    const-string v15, "application_build"

    invoke-virtual {v14, v15}, Ljn2;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    new-instance v27, Lpm2;

    invoke-direct/range {v27 .. v39}, Lpm2;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v14, v27

    new-instance v15, Lym2;

    invoke-direct {v15, v14}, Lym2;-><init>(Lpm2;)V

    :try_start_1f2
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14
    :try_end_200
    .catch Ljava/lang/NumberFormatException; {:try_start_1f2 .. :try_end_200} :catch_205

    move-object/from16 v28, v14

    const/16 v29, 0x0

    goto :goto_20f

    :catch_205
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    move-object/from16 v29, v14

    const/16 v28, 0x0

    :goto_20f
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_21e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_3d9

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v13, v22

    check-cast v13, Ljn2;

    move-object/from16 v31, v8

    iget-object v8, v13, Ljn2;->c:Lr18;

    move-object/from16 v22, v11

    iget-object v11, v13, Ljn2;->k:Ljava/util/ArrayList;

    move-object/from16 v30, v15

    iget-object v15, v13, Ljn2;->j:[B

    iget-object v2, v8, Lr18;->a:Lp28;

    iget-object v8, v8, Lr18;->b:[B

    move-object/from16 v32, v4

    new-instance v4, Lp28;

    invoke-direct {v4, v3}, Lp28;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lp28;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_253

    new-instance v2, Lks3;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v8, v2, Lks3;->e:Ljava/lang/Object;

    move-object/from16 v33, v3

    goto :goto_275

    :cond_253
    new-instance v4, Lp28;

    move-object/from16 v33, v3

    const-string v3, "json"

    invoke-direct {v4, v3}, Lp28;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v4}, Lp28;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3ca

    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-direct {v2, v8, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    new-instance v3, Lks3;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v2, v3, Lks3;->f:Ljava/lang/Object;

    move-object v2, v3

    :goto_275
    iget-wide v3, v13, Ljn2;->d:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lks3;->a:Ljava/lang/Object;

    iget-wide v3, v13, Ljn2;->e:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lks3;->d:Ljava/lang/Object;

    const-string v3, "tz-offset"

    iget-object v4, v13, Ljn2;->f:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-nez v3, :cond_294

    const-wide/16 v3, 0x0

    goto :goto_29c

    :cond_294
    invoke-static {v3}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    :goto_29c
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    iput-object v3, v2, Lks3;->g:Ljava/lang/Object;

    const-string v3, "net-type"

    invoke-virtual {v13, v3}, Ljn2;->b(Ljava/lang/String;)I

    move-result v3

    sget-object v4, Lvle;->a:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvle;

    const-string v4, "mobile-subtype"

    invoke-virtual {v13, v4}, Ljn2;->b(Ljava/lang/String;)I

    move-result v4

    sget-object v8, Lule;->a:Landroid/util/SparseArray;

    invoke-virtual {v8, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lule;

    new-instance v8, Lbo2;

    invoke-direct {v8, v3, v4}, Lbo2;-><init>(Lvle;Lule;)V

    iput-object v8, v2, Lks3;->h:Ljava/lang/Object;

    iget-object v3, v13, Ljn2;->b:Ljava/lang/Integer;

    if-eqz v3, :cond_2cb

    iput-object v3, v2, Lks3;->b:Ljava/lang/Object;

    :cond_2cb
    iget-object v3, v13, Ljn2;->g:Ljava/lang/Integer;

    if-eqz v3, :cond_2e2

    new-instance v4, Lmn2;

    invoke-direct {v4, v3}, Lmn2;-><init>(Ljava/lang/Integer;)V

    new-instance v3, Lnn2;

    invoke-direct {v3, v4}, Lnn2;-><init>(Lmn2;)V

    sget-object v4, Lgd5;->a:Lgd5;

    new-instance v4, Lzm2;

    invoke-direct {v4, v3}, Lzm2;-><init>(Lnn2;)V

    iput-object v4, v2, Lks3;->c:Ljava/lang/Object;

    :cond_2e2
    iget-object v3, v13, Ljn2;->i:[B

    if-nez v3, :cond_2ed

    if-nez v15, :cond_2ed

    if-nez v11, :cond_2ed

    move-object/from16 v34, v5

    goto :goto_343

    :cond_2ed
    if-nez v3, :cond_2f0

    const/4 v3, 0x0

    :cond_2f0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    if-eqz v11, :cond_329

    new-instance v8, Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v13

    invoke-direct {v8, v13}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v13

    move-object/from16 v34, v5

    const/4 v5, 0x0

    :goto_307
    if-ge v5, v13, :cond_324

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v35

    add-int/lit8 v5, v5, 0x1

    move/from16 v36, v5

    move-object/from16 v5, v35

    check-cast v5, [B

    move-object/from16 v35, v11

    const/4 v11, 0x2

    invoke-static {v5, v11}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v11, v35

    move/from16 v5, v36

    goto :goto_307

    :cond_324
    const/4 v11, 0x2

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_32c

    :cond_329
    move-object/from16 v34, v5

    const/4 v11, 0x2

    :goto_32c
    if-eqz v15, :cond_335

    invoke-static {v15, v11}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_335
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_33c

    const/4 v4, 0x0

    :cond_33c
    new-instance v5, Lln2;

    invoke-direct {v5, v3, v4}, Lln2;-><init>([BLjava/util/ArrayList;)V

    iput-object v5, v2, Lks3;->i:Ljava/lang/Object;

    :goto_343
    iget-object v3, v2, Lks3;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    if-nez v3, :cond_34c

    const-string v3, " eventTimeMs"

    goto :goto_34e

    :cond_34c
    const-string v3, ""

    :goto_34e
    iget-object v4, v2, Lks3;->d:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Long;

    if-nez v4, :cond_35a

    const-string v4, " eventUptimeMs"

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_35a
    iget-object v4, v2, Lks3;->g:Ljava/lang/Object;

    check-cast v4, Ljava/lang/Long;

    if-nez v4, :cond_366

    const-string v4, " timezoneOffsetSeconds"

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_366
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3c0

    new-instance v35, Lyn2;

    iget-object v3, v2, Lks3;->a:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v36

    iget-object v3, v2, Lks3;->b:Ljava/lang/Object;

    move-object/from16 v38, v3

    check-cast v38, Ljava/lang/Integer;

    iget-object v3, v2, Lks3;->c:Ljava/lang/Object;

    move-object/from16 v39, v3

    check-cast v39, Lzm2;

    iget-object v3, v2, Lks3;->d:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v40

    iget-object v3, v2, Lks3;->e:Ljava/lang/Object;

    move-object/from16 v42, v3

    check-cast v42, [B

    iget-object v3, v2, Lks3;->f:Ljava/lang/Object;

    move-object/from16 v43, v3

    check-cast v43, Ljava/lang/String;

    iget-object v3, v2, Lks3;->g:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v44

    iget-object v3, v2, Lks3;->h:Ljava/lang/Object;

    move-object/from16 v46, v3

    check-cast v46, Lbo2;

    iget-object v2, v2, Lks3;->i:Ljava/lang/Object;

    move-object/from16 v47, v2

    check-cast v47, Lln2;

    invoke-direct/range {v35 .. v47}, Lyn2;-><init>(JLjava/lang/Integer;Lzm2;J[BLjava/lang/String;JLbo2;Lln2;)V

    move-object/from16 v2, v35

    invoke-virtual {v14, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3b2
    :goto_3b2
    move-object/from16 v11, v22

    move-object/from16 v15, v30

    move-object/from16 v8, v31

    move-object/from16 v4, v32

    move-object/from16 v3, v33

    move-object/from16 v5, v34

    goto/16 :goto_21e

    :cond_3c0
    const-string v0, "Missing required properties:"

    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lqp2;->n(Ljava/lang/String;)V

    return-void

    :cond_3ca
    move-object/from16 v34, v5

    const-string v3, "TRuntime.CctTransportBackend"

    const/4 v4, 0x5

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3b2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    goto :goto_3b2

    :cond_3d9
    move-object/from16 v30, v15

    new-instance v22, Lzn2;

    move-object/from16 v27, v30

    move-object/from16 v30, v14

    invoke-direct/range {v22 .. v30}, Lzn2;-><init>(JJLym2;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/ArrayList;)V

    move-object/from16 v2, v22

    invoke-virtual {v9, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_173

    :cond_3eb
    move-object/from16 v32, v4

    move-object/from16 v34, v5

    const/4 v4, 0x5

    new-instance v2, Ltm2;

    invoke-direct {v2, v9}, Ltm2;-><init>(Ljava/util/ArrayList;)V

    iget-object v3, v6, Lvp4;->d:Ljava/net/URL;

    if-eqz v18, :cond_415

    :try_start_3f9
    invoke-static/range {v18 .. v18}, Lz54;->a([B)Lz54;

    move-result-object v3

    iget-object v5, v3, Lz54;->b:Ljava/lang/String;

    if-nez v5, :cond_402

    const/4 v5, 0x0

    :cond_402
    iget-object v3, v3, Lz54;->a:Ljava/lang/String;

    invoke-static {v3}, Lvp4;->b(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v3
    :try_end_408
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3f9 .. :try_end_408} :catch_409

    goto :goto_416

    :catch_409
    new-instance v2, Lsm2;

    const/4 v3, 0x3

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    invoke-direct {v2, v3, v4, v5, v6}, Lsm2;-><init>(IJLjava/lang/String;)V

    :goto_412
    move-object v7, v2

    goto/16 :goto_4c1

    :cond_415
    const/4 v5, 0x0

    :goto_416
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_43f

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljn2;

    iget-object v8, v8, Ljn2;->h:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v14, 0x0

    :cond_42d
    if-ge v14, v9, :cond_440

    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v14, v14, 0x1

    check-cast v11, Ljn2;

    iget-object v11, v11, Ljn2;->h:Ljava/lang/String;

    invoke-static {v8, v11}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_42d

    :cond_43f
    const/4 v8, 0x0

    :cond_440
    :try_start_440
    new-instance v9, Lvzk;

    invoke-direct {v9, v3, v2, v5, v8}, Lvzk;-><init>(Ljava/net/URL;Ltm2;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Ljl4;

    const/4 v3, 0x7

    invoke-direct {v2, v6, v3}, Ljl4;-><init>(Ljava/lang/Object;B)V

    move v13, v4

    :cond_44c
    invoke-virtual {v2, v9}, Ljl4;->c(Lvzk;)Lup4;

    move-result-object v3

    iget-object v4, v3, Lup4;->b:Ljava/net/URL;

    if-eqz v4, :cond_46c

    const-string v5, "Following redirect to: %s"

    invoke-static {v4, v7, v5}, Lmkh;->q(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v5, Lvzk;

    iget-object v6, v9, Lvzk;->b:Ljava/lang/Object;

    check-cast v6, Ltm2;

    iget-object v8, v9, Lvzk;->d:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object v9, v9, Lvzk;->c:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    invoke-direct {v5, v4, v6, v8, v9}, Lvzk;-><init>(Ljava/net/URL;Ltm2;Ljava/lang/String;Ljava/lang/String;)V

    move-object v9, v5

    goto :goto_46d

    :cond_46c
    const/4 v9, 0x0

    :goto_46d
    if-eqz v9, :cond_474

    add-int/lit8 v13, v13, -0x1

    const/4 v4, 0x1

    if-ge v13, v4, :cond_44c

    :cond_474
    iget v2, v3, Lup4;->a:I

    const/16 v4, 0xc8

    if-ne v2, v4, :cond_486

    iget-wide v4, v3, Lup4;->c:J

    iget-object v2, v3, Lup4;->d:Ljava/lang/String;

    new-instance v3, Lsm2;

    const/4 v6, 0x1

    invoke-direct {v3, v6, v4, v5, v2}, Lsm2;-><init>(IJLjava/lang/String;)V

    move-object v7, v3

    goto :goto_4c1

    :cond_486
    const/16 v3, 0x1f4

    if-ge v2, v3, :cond_4a8

    const/16 v3, 0x194

    if-eq v2, v3, :cond_4a8

    const/16 v3, 0x190

    if-ne v2, v3, :cond_49d

    new-instance v2, Lsm2;

    const/4 v3, 0x4

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    invoke-direct {v2, v3, v4, v5, v6}, Lsm2;-><init>(IJLjava/lang/String;)V

    goto/16 :goto_412

    :cond_49d
    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    new-instance v2, Lsm2;

    const/4 v3, 0x3

    invoke-direct {v2, v3, v4, v5, v6}, Lsm2;-><init>(IJLjava/lang/String;)V

    goto/16 :goto_412

    :cond_4a8
    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    new-instance v2, Lsm2;

    const/4 v11, 0x2

    invoke-direct {v2, v11, v4, v5, v6}, Lsm2;-><init>(IJLjava/lang/String;)V
    :try_end_4b1
    .catch Ljava/io/IOException; {:try_start_440 .. :try_end_4b1} :catch_4b3

    goto/16 :goto_412

    :catch_4b3
    invoke-static {v7}, Lmkh;->v(Ljava/lang/String;)Ljava/lang/String;

    new-instance v2, Lsm2;

    const-wide/16 v4, -0x1

    const/4 v6, 0x0

    const/4 v11, 0x2

    invoke-direct {v2, v11, v4, v5, v6}, Lsm2;-><init>(IJLjava/lang/String;)V

    goto/16 :goto_412

    :goto_4c1
    if-eqz v21, :cond_4f4

    iget-object v2, v7, Lsm2;->c:Ljava/lang/String;

    if-eqz v2, :cond_4f4

    :try_start_4c7
    invoke-static/range {v21 .. v21}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lv8h;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_4f4

    const-class v3, Landroid/content/Context;

    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2

    iget-object v3, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v3, Landroid/content/Context;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4f4

    new-instance v2, Ljava/lang/ClassCastException;

    invoke-direct {v2}, Ljava/lang/ClassCastException;-><init>()V

    throw v2
    :try_end_4f1
    .catch Ljava/lang/Exception; {:try_start_4c7 .. :try_end_4f1} :catch_4f1

    :catch_4f1
    invoke-static/range {v20 .. v20}, Lmkh;->v(Ljava/lang/String;)Ljava/lang/String;

    :cond_4f4
    :goto_4f4
    iget v2, v7, Lsm2;->a:I

    const/4 v11, 0x2

    if-ne v2, v11, :cond_50e

    new-instance v2, Lvdi;

    const/16 v3, 0xb

    invoke-direct {v2, v0, v12, v1, v3}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object/from16 v5, v34

    invoke-virtual {v5, v2}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    const/4 v4, 0x1

    add-int/lit8 v0, p2, 0x1

    move-object/from16 v3, v32

    invoke-virtual {v3, v1, v0, v4}, Lx77;->n(Ldp2;IZ)V

    return-void

    :cond_50e
    move-object/from16 v3, v32

    move-object/from16 v5, v34

    const/4 v4, 0x1

    new-instance v6, Lroj;

    const/4 v8, 0x7

    invoke-direct {v6, v0, v12, v8}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v6}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    if-ne v2, v4, :cond_533

    iget-wide v6, v7, Lsm2;->b:J

    const-wide/16 v8, 0x0

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    if-eqz v18, :cond_587

    new-instance v2, Lcrk;

    const/16 v4, 0x19

    invoke-direct {v2, v0, v4}, Lcrk;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v5, v2}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    goto :goto_587

    :cond_533
    const/4 v4, 0x4

    if-ne v2, v4, :cond_57c

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v8, 0x0

    :goto_540
    if-ge v8, v4, :cond_572

    invoke-virtual {v12, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v8, v8, 0x1

    check-cast v6, Lfo2;

    iget-object v6, v6, Lfo2;->c:Ljn2;

    iget-object v6, v6, Ljn2;->a:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    const/16 v16, 0x1

    if-nez v7, :cond_55e

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_540

    :cond_55e
    invoke-virtual {v2, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    add-int/lit8 v7, v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v2, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_540

    :cond_572
    new-instance v4, Lroj;

    const/16 v6, 0x8

    invoke-direct {v4, v0, v2, v6}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v4}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    :cond_57c
    move-object v4, v3

    move-object/from16 v3, v18

    move-object/from16 v6, v19

    goto/16 :goto_18

    :cond_583
    move-object v3, v4

    const-wide/16 v8, 0x0

    move-wide v10, v8

    :cond_587
    :goto_587
    new-instance v2, Lzx;

    invoke-direct {v2, v10, v11, v0, v1}, Lzx;-><init>(JLjava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v5, v2}, Lydi;->o(Lyyk;)Ljava/lang/Object;

    iget-object v0, v0, Lks3;->c:Ljava/lang/Object;

    check-cast v0, Lydi;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ludi;

    const/4 v14, 0x0

    invoke-direct {v2, v0, v1, v14}, Ludi;-><init>(Lydi;Ldp2;B)V

    invoke-virtual {v0, v2}, Lydi;->l(Lwdi;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_5ae

    move/from16 v2, p2

    const/4 v4, 0x1

    invoke-virtual {v3, v1, v2, v4}, Lx77;->n(Ldp2;IZ)V

    :cond_5ae
    return-void
.end method

.method public final r()V
    .registers 14

    iget-object v0, p0, Lks3;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lks3;->h:Ljava/lang/Object;

    check-cast v1, Lkze;

    iget-object v2, p0, Lks3;->i:Ljava/lang/Object;

    check-cast v2, Llh4;

    const/4 v3, 0x0

    if-eqz v2, :cond_11

    iput-object v3, v2, Llh4;->b:Lcom/opera/api/Callback;

    :cond_11
    iget-object v2, p0, Lks3;->e:Ljava/lang/Object;

    move-object v5, v2

    check-cast v5, Ljava/lang/String;

    if-eqz v5, :cond_36

    iget-object v2, p0, Lks3;->g:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_36

    iget-object v2, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_36

    iget-object v2, p0, Lks3;->d:Ljava/lang/Object;

    check-cast v2, Lqjn;

    invoke-virtual {v2}, Lqjn;->b()Z

    move-result v2

    if-nez v2, :cond_37

    :cond_36
    return-void

    :cond_37
    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lrmn;

    iget-object v2, v2, Lrmn;->c:Llkn;

    iget-object v4, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v4, Landroid/graphics/Rect;

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v4, p0, Lks3;->g:Ljava/lang/Object;

    check-cast v4, Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    iget-object v6, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v6, Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v4, v6

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v4, v6, v7}, Ldjh;->b(FFF)F

    move-result v4

    sget-object v8, La7k;->m:Ljava/util/List;

    iget-object v8, p0, Lks3;->c:Ljava/lang/Object;

    check-cast v8, Ltsd;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkl5;

    invoke-static {v0, v8}, Lddh;->r(Landroid/content/Context;Lkl5;)I

    move-result v8

    int-to-float v8, v8

    iget-object v9, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v9, Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v9

    int-to-float v9, v9

    div-float v12, v8, v9

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v8, 0x7f070965

    invoke-virtual {v0, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    iget-object v8, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v8, Landroid/graphics/Rect;

    invoke-virtual {v8}, Landroid/graphics/Rect;->height()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v0, v8

    invoke-static {v0, v6, v7}, Ldjh;->b(FFF)F

    move-result v8

    iget-object v0, p0, Lks3;->a:Ljava/lang/Object;

    check-cast v0, Lekn;

    iget-object v6, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v6, Landroid/graphics/Rect;

    iget-object v7, v2, Llkn;->i:Lzjn;

    iget v9, v7, Lzjn;->a:F

    iget v10, v7, Lzjn;->b:F

    iget v11, v7, Lzjn;->c:F

    iget-object v7, v0, Lekn;->b:Ldkn;

    invoke-virtual {v7}, Lldk;->i()V

    iget-object v0, v0, Lekn;->a:Lyp9;

    move v7, v4

    new-instance v4, Lckn;

    invoke-direct/range {v4 .. v11}, Lckn;-><init>(Ljava/lang/String;Landroid/graphics/Rect;FFFFF)V

    invoke-virtual {v0, v4}, Lyp9;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgkn;

    if-eqz v0, :cond_c3

    invoke-virtual {p0, v0}, Lks3;->i(Lgkn;)Lrmn;

    move-result-object p0

    invoke-static {v1, p0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    return-void

    :cond_c3
    new-instance v0, Llh4;

    new-instance v4, Lsmn;

    move-object v9, v2

    move-object v6, v5

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lsmn;-><init>(Lks3;Ljava/lang/String;FFLlkn;)V

    const/4 p0, 0x0

    invoke-direct {v0, v4, p0}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    iput-object v0, v5, Lks3;->i:Ljava/lang/Object;

    sget-object p0, Lvml;->d:Lumi;

    new-instance v0, Lilm;

    const/16 v1, 0xf

    invoke-direct {v0, v5, v1}, Lilm;-><init>(Ljava/lang/Object;B)V

    const/16 v1, 0x3d

    sget-object v2, Ljkn;->b:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v1, v2}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_ea

    invoke-virtual {v0, v3}, Lilm;->run(Ljava/lang/Object;)V

    return-void

    :cond_ea
    invoke-virtual {v9}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x42740000    # 61.0f

    div-float v4, v5, v4

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->scale(FF)V

    iget v4, v2, Landroid/graphics/Rect;->left:I

    neg-int v4, v4

    int-to-float v4, v4

    iget v2, v2, Landroid/graphics/Rect;->top:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v3, v4, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v9, v3}, Llkn;->draw(Landroid/graphics/Canvas;)V

    new-instance v2, Lfkn;

    invoke-direct {v2, v7, v12, v8}, Lfkn;-><init>(FFF)V

    invoke-virtual {p0, v2}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v2

    new-instance v3, Lroj;

    const/16 v4, 0xc

    invoke-direct {v3, v1, v0, v4}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v2, p0}, Lnml;->b(Lnml;)V

    invoke-virtual {v2, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final s(Lyz;)V
    .registers 25

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lnn7;

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v3

    iget-boolean v4, v3, Lqk6;->g:Z

    if-nez v4, :cond_50

    const/4 v4, 0x1

    iput-boolean v4, v3, Lqk6;->g:Z

    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v14

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lx5f;

    iget-object v7, v1, Lyz;->g:Ljava/lang/String;

    iget-object v0, v1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v8

    invoke-virtual {v1}, Lyz;->g()Ljava/lang/String;

    move-result-object v9

    iget-object v0, v1, Lyz;->o:Ldl;

    iget-object v10, v0, Ldl;->b:Lq50;

    iget-object v11, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v12, v0, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v13, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v2, v14}, Lnn7;->n(I)Z

    move-result v15

    iget-object v0, v1, Lyz;->r:Lap;

    invoke-virtual {v0}, Lap;->c()F

    move-result v16

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v21

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v22

    iget-boolean v0, v5, Lx5f;->h:Z

    if-nez v0, :cond_51

    :cond_50
    return-void

    :cond_51
    const-wide/16 v17, -0x1

    const-wide/16 v19, -0x1

    sget-object v6, Ld60;->k:Ld60;

    invoke-virtual/range {v5 .. v22}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return-void
.end method

.method public final t(Ldl;)V
    .registers 2

    return-void
.end method

.method public final u(Ljava/lang/String;Lyma;)Lk73;
    .registers 7

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1b

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-eq v2, v3, :cond_18

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_1b

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1b
    iget-object v2, p0, Lks3;->d:Ljava/lang/Object;

    check-cast v2, Lx77;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p1, v1, v3}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lx77;->j(Ljava/lang/String;)Lzc7;

    move-result-object v2

    invoke-virtual {p0, v2}, Lks3;->z(Lzc7;)V

    iget-object p0, v2, Lk73;->c:Ljava/lang/Object;

    check-cast p0, Lk73;

    instance-of v2, p0, Lszf;

    if-eqz v2, :cond_47

    move-object v2, p0

    check-cast v2, Lszf;

    iget-object v3, v2, Lk73;->f:Ljava/lang/Object;

    check-cast v3, Lk73;

    if-nez v3, :cond_47

    iget-object p0, v2, Lk73;->c:Ljava/lang/Object;

    check-cast p0, Lk73;

    :cond_47
    if-lez v1, :cond_5d

    new-instance v2, Lnel;

    invoke-direct {v2}, Lk73;-><init>()V

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v2, Lnel;->g:Ljava/lang/String;

    invoke-virtual {p2, v2}, Lk73;->l(Lk73;)V

    :goto_5b
    move-object p2, p0

    goto :goto_5f

    :cond_5d
    :goto_5d
    move-object v2, p2

    goto :goto_5b

    :goto_5f
    if-eqz p2, :cond_69

    iget-object p0, p2, Lk73;->f:Ljava/lang/Object;

    check-cast p0, Lk73;

    invoke-virtual {v2, p2}, Lk73;->l(Lk73;)V

    goto :goto_5d

    :cond_69
    return-object v2
.end method

.method public final v(Lxz;Lyz;Ldl;)V
    .registers 20

    move-object/from16 v0, p2

    move-object/from16 v1, p1

    iget-object v2, v1, Lxz;->a:Lwz;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_20

    if-eq v2, v5, :cond_1d

    if-eq v2, v4, :cond_1a

    if-eq v2, v3, :cond_17

    const/4 v2, 0x0

    goto :goto_22

    :cond_17
    sget-object v2, Lo50;->e:Lo50;

    goto :goto_22

    :cond_1a
    sget-object v2, Lo50;->d:Lo50;

    goto :goto_22

    :cond_1d
    sget-object v2, Lo50;->c:Lo50;

    goto :goto_22

    :cond_20
    sget-object v2, Lo50;->b:Lo50;

    :goto_22
    if-nez v2, :cond_25

    return-void

    :cond_25
    invoke-virtual {v1}, Lxz;->a()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Lxz;->b()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v7, p0

    iget-object v7, v7, Lks3;->h:Ljava/lang/Object;

    check-cast v7, Lx5f;

    iget-object v8, v0, Lyz;->i:Lyo;

    invoke-static {v8}, Lyo;->h(Lyo;)Lu50;

    move-result-object v8

    iget-object v9, v0, Lyz;->g:Ljava/lang/String;

    iget-object v10, v0, Lyz;->a:Ljava/lang/String;

    iget-object v0, v0, Lyz;->b:Ljava/lang/String;

    iget-object v11, v7, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    new-instance v13, Lp50;

    const/4 v14, -0x1

    const/4 v15, 0x7

    const/16 v3, 0x98b

    invoke-direct {v13, v3, v14, v15}, Ljf0;-><init>(III)V

    const/4 v3, 0x0

    invoke-virtual {v13, v3, v5, v2}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v13, v5, v5, v8}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v13, v4, v9}, Lp50;->x(ILjava/lang/String;)V

    if-eqz v6, :cond_5e

    const/4 v2, 0x3

    invoke-virtual {v13, v2, v5, v6}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5e
    if-eqz v1, :cond_64

    const/4 v2, 0x4

    invoke-virtual {v13, v2, v1}, Lp50;->x(ILjava/lang/String;)V

    :cond_64
    const/4 v1, 0x5

    invoke-virtual {v13, v1, v10}, Lp50;->x(ILjava/lang/String;)V

    const/4 v1, 0x6

    invoke-virtual {v13, v1, v0}, Lp50;->x(ILjava/lang/String;)V

    invoke-virtual {v12, v11}, Lx56;->C(Lzpa;)Lde0;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz v1, :cond_84

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_84

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, v5, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_91

    :cond_84
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v5, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    new-instance v2, Lhf0;

    invoke-direct {v2, v0, v5, v1}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_91
    invoke-virtual {v2, v13}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7, v12}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final w()Lk6g;
    .registers 11

    new-instance v0, Lk6g;

    iget-object v1, p0, Lks3;->a:Ljava/lang/Object;

    check-cast v1, Ldw3;

    iget-object v1, v1, Ldw3;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    iget-object v2, p0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/Lazy;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/autofill/PasswordManager;

    iget-object v3, p0, Lks3;->i:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/Lazy;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lx5g;

    iget-object v4, p0, Lks3;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/Lazy;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lyu2;

    iget-object v5, p0, Lks3;->d:Ljava/lang/Object;

    check-cast v5, Lji;

    iget-object v5, v5, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v5

    iget-object v6, p0, Lks3;->e:Ljava/lang/Object;

    check-cast v6, Lji;

    iget-object v6, v6, Lji;->b:Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v6

    iget-object v7, p0, Lks3;->f:Ljava/lang/Object;

    check-cast v7, Lyv3;

    iget-object v8, p0, Lks3;->g:Ljava/lang/Object;

    check-cast v8, Lji;

    invoke-virtual {v8}, Lji;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ln6g;

    iget-object p0, p0, Lks3;->h:Ljava/lang/Object;

    check-cast p0, Ldw3;

    invoke-virtual {p0}, Ldw3;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v9, p0

    check-cast v9, Lcq5;

    invoke-direct/range {v0 .. v9}, Lk6g;-><init>(Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/autofill/PasswordManager;Lx5g;Lyu2;Lzwk;Ldb;Lyv3;Ln6g;Lcq5;)V

    return-object v0
.end method

.method public final x(Lyz;Ldl;)V
    .registers 28

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lks3;->b:Ljava/lang/Object;

    check-cast v2, Lnn7;

    iget-object v3, v1, Lyz;->j:Lrm;

    sget-object v4, Lrm;->f:Lrm;

    const-wide/16 v5, -0x1

    if-ne v3, v4, :cond_24

    invoke-virtual/range {p0 .. p1}, Lks3;->d(Lyz;)Lqk6;

    move-result-object v3

    iget-wide v7, v3, Lqk6;->b:J

    const-wide/16 v9, 0x0

    cmp-long v4, v7, v9

    if-eqz v4, :cond_24

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, v3, Lqk6;->b:J

    sub-long v5, v4, v6

    :cond_24
    move-wide/from16 v21, v5

    invoke-static {v1}, Lnn7;->j(Lyz;)I

    move-result v3

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lx5f;

    iget-object v9, v1, Lyz;->g:Ljava/lang/String;

    iget-object v0, v1, Lyz;->i:Lyo;

    invoke-static {v0}, Lyo;->h(Lyo;)Lu50;

    move-result-object v10

    invoke-virtual {v1}, Lyz;->g()Ljava/lang/String;

    move-result-object v11

    iget-object v0, v1, Lyz;->o:Ldl;

    iget-object v12, v0, Ldl;->b:Lq50;

    iget-object v13, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v14, v0, Ldl;->b:Lq50;

    invoke-virtual {v1}, Lyz;->h()Ldl;

    move-result-object v0

    iget-object v15, v0, Ldl;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lnn7;->n(I)Z

    move-result v17

    iget-object v0, v1, Lyz;->r:Lap;

    invoke-virtual {v0}, Lap;->c()F

    move-result v18

    invoke-virtual {v1}, Lyz;->e()Lv50;

    move-result-object v23

    invoke-virtual {v1}, Lyz;->j()Ljava/lang/String;

    move-result-object v24

    iget-boolean v0, v7, Lx5f;->h:Z

    if-nez v0, :cond_64

    return-void

    :cond_64
    sget-object v8, Ld60;->j:Ld60;

    const-wide/16 v19, -0x1

    move/from16 v16, v3

    invoke-virtual/range {v7 .. v24}, Lx5f;->q(Ld60;Ljava/lang/String;Lu50;Ljava/lang/String;Lq50;Ljava/lang/String;Lq50;Ljava/lang/String;IZFJJLv50;Ljava/lang/String;)V

    return-void
.end method

.method public final y(Lmma;Lkotlin/ranges/IntRange;Lkotlin/ranges/IntRange;)V
    .registers 9

    iget-object v0, p1, Lmma;->g:Ljava/lang/String;

    new-instance v1, Lnel;

    invoke-direct {v1}, Lk73;-><init>()V

    const/4 v2, 0x0

    iget v3, p2, Lkotlin/ranges/a;->a:I

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lnel;->g:Ljava/lang/String;

    new-instance v2, Lyma;

    invoke-direct {v2}, Lk73;-><init>()V

    invoke-static {v0, p2}, Lkotlin/text/StringsKt;->d0(Ljava/lang/CharSequence;Lkotlin/ranges/IntRange;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lyma;->g:Ljava/lang/String;

    invoke-virtual {p3}, Lkotlin/ranges/IntRange;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_27

    const/4 v3, 0x0

    goto :goto_32

    :cond_27
    new-instance v3, Lyma;

    invoke-direct {v3}, Lk73;-><init>()V

    invoke-static {v0, p3}, Lkotlin/text/StringsKt;->d0(Ljava/lang/CharSequence;Lkotlin/ranges/IntRange;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lyma;->g:Ljava/lang/String;

    :goto_32
    iget-object v4, v1, Lnel;->g:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_3e

    invoke-virtual {p1, v2}, Lk73;->m(Lk73;)V

    goto :goto_44

    :cond_3e
    invoke-virtual {p1, v1}, Lk73;->m(Lk73;)V

    invoke-virtual {v1, v2}, Lk73;->l(Lk73;)V

    :goto_44
    invoke-virtual {p3}, Lkotlin/ranges/IntRange;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    goto :goto_51

    :cond_4f
    iget v1, p3, Lkotlin/ranges/a;->a:I

    :goto_51
    iget p2, p2, Lkotlin/ranges/a;->b:I

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {v0, p2, v1}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2, v2}, Lks3;->u(Ljava/lang/String;Lyma;)Lk73;

    move-result-object p2

    if-eqz v3, :cond_66

    invoke-virtual {p2, v3}, Lk73;->l(Lk73;)V

    :cond_66
    invoke-virtual {p1}, Lk73;->C()V

    if-eqz v3, :cond_7e

    iget p1, p3, Lkotlin/ranges/a;->b:I

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p2

    invoke-virtual {v0, p1, p2}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v3}, Lks3;->u(Ljava/lang/String;Lyma;)Lk73;

    :cond_7e
    return-void
.end method

.method public final z(Lzc7;)V
    .registers 3

    new-instance v0, Leq6;

    invoke-direct {v0, p0}, Leq6;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p1}, Leq6;->A(Lzc7;)V

    return-void
.end method
