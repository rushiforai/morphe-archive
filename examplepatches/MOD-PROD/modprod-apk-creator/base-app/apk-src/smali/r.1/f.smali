.class public abstract Lr/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:LD/g;

.field public static final b:Ll/f;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    new-instance v0, Lr/k;

    invoke-direct {v0}, LD/g;-><init>()V

    sput-object v0, Lr/f;->a:LD/g;

    goto :goto_0

    :cond_0
    const/16 v1, 0x1c

    if-lt v0, v1, :cond_1

    new-instance v0, Lr/j;

    invoke-direct {v0}, Lr/i;-><init>()V

    sput-object v0, Lr/f;->a:LD/g;

    goto :goto_0

    :cond_1
    const/16 v1, 0x1a

    if-lt v0, v1, :cond_2

    new-instance v0, Lr/i;

    invoke-direct {v0}, Lr/i;-><init>()V

    sput-object v0, Lr/f;->a:LD/g;

    goto :goto_0

    :cond_2
    sget-object v0, Lr/h;->q:Ljava/lang/reflect/Method;

    if-nez v0, :cond_3

    const-string v1, "TypefaceCompatApi24Impl"

    const-string v2, "Unable to collect necessary private methods.Fallback to legacy implementation."

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    if-eqz v0, :cond_4

    new-instance v0, Lr/h;

    invoke-direct {v0}, LD/g;-><init>()V

    sput-object v0, Lr/f;->a:LD/g;

    goto :goto_0

    :cond_4
    new-instance v0, Lr/g;

    invoke-direct {v0}, LD/g;-><init>()V

    sput-object v0, Lr/f;->a:LD/g;

    :goto_0
    new-instance v0, Ll/f;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ll/f;-><init>(I)V

    sput-object v0, Lr/f;->b:Ll/f;

    return-void
.end method

.method public static a(Landroid/content/Context;Lq/e;Landroid/content/res/Resources;ILjava/lang/String;IILi/U;)Landroid/graphics/Typeface;
    .locals 11

    move/from16 v4, p6

    move-object/from16 v0, p7

    const/4 v1, 0x4

    const/4 v6, 0x1

    const/4 v2, 0x2

    const/4 v3, 0x0

    instance-of v5, p1, Lq/h;

    if-eqz v5, :cond_a

    check-cast p1, Lq/h;

    iget-object v5, p1, Lq/h;->d:Ljava/lang/String;

    const/4 v7, 0x0

    if-eqz v5, :cond_1

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {v5, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v5

    sget-object v8, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    invoke-static {v8, v3}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v8

    if-eqz v5, :cond_1

    invoke-virtual {v5, v8}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    move-object v5, v7

    :goto_1
    if-eqz v5, :cond_2

    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance p1, LK/h;

    invoke-direct {p1, v0, v2, v5}, LK/h;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-object v5

    :cond_2
    iget v2, p1, Lq/h;->c:I

    if-nez v2, :cond_3

    move v2, v6

    goto :goto_2

    :cond_3
    move v2, v3

    :goto_2
    iget v8, p1, Lq/h;->b:I

    new-instance v5, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v9

    invoke-direct {v5, v9}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v9, LC/j;

    const/16 v10, 0x13

    invoke-direct {v9, v10}, LC/j;-><init>(I)V

    iput-object v0, v9, LC/j;->b:Ljava/lang/Object;

    iget-object p1, p1, Lq/h;->a:LT/d;

    new-instance v10, LG/a;

    invoke-direct {v10, v9, v5}, LG/a;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz v2, :cond_6

    sget-object v0, Lv/f;->a:Ll/f;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, LT/d;->f:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lv/f;->a:Ll/f;

    invoke-virtual {v2, v0}, Ll/f;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Typeface;

    if-eqz v2, :cond_4

    new-instance p0, LQ/c;

    invoke-direct {p0, v9, v1, v2}, LQ/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v5, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_3
    move-object v7, v2

    goto/16 :goto_8

    :cond_4
    const/4 v1, -0x1

    if-ne v8, v1, :cond_5

    invoke-static {v0, p0, p1, v4}, Lv/f;->a(Ljava/lang/String;Landroid/content/Context;LT/d;I)Lv/e;

    move-result-object p0

    invoke-virtual {v10, p0}, LG/a;->e(Lv/e;)V

    iget-object v7, p0, Lv/e;->a:Landroid/graphics/Typeface;

    goto/16 :goto_8

    :cond_5
    move-object v1, v0

    new-instance v0, Lv/c;

    const/4 v5, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lv/c;-><init>(Ljava/lang/String;Landroid/content/Context;LT/d;II)V

    :try_start_0
    sget-object p0, Lv/f;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-interface {p0, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3

    int-to-long v0, v8

    :try_start_1
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p0, v0, v1, p1}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_2

    :try_start_2
    check-cast p0, Lv/e;

    invoke-virtual {v10, p0}, LG/a;->e(Lv/e;)V

    iget-object v7, p0, Lv/e;->a:Landroid/graphics/Typeface;

    goto/16 :goto_8

    :catch_0
    move-exception v0

    move-object p0, v0

    goto :goto_4

    :catch_1
    move-exception v0

    move-object p0, v0

    goto :goto_5

    :catch_2
    new-instance p0, Ljava/lang/InterruptedException;

    const-string p1, "timeout"

    invoke-direct {p0, p1}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_4
    throw p0

    :goto_5
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_3

    :catch_3
    new-instance p0, LD/b;

    iget-object p1, v10, LG/a;->a:Ljava/lang/Object;

    check-cast p1, LC/j;

    const/4 v0, -0x3

    invoke-direct {p0, p1, v0}, LD/b;-><init>(LC/j;I)V

    iget-object p1, v10, LG/a;->b:Ljava/lang/Object;

    check-cast p1, Landroid/os/Handler;

    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_8

    :cond_6
    sget-object v0, Lv/f;->a:Ll/f;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, LT/d;->f:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "-"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lv/f;->a:Ll/f;

    invoke-virtual {v2, v0}, Ll/f;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Typeface;

    if-eqz v2, :cond_7

    new-instance p0, LQ/c;

    invoke-direct {p0, v9, v1, v2}, LQ/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {v5, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_3

    :cond_7
    new-instance v1, Lv/d;

    invoke-direct {v1, v3, v10}, Lv/d;-><init>(ILjava/lang/Object;)V

    sget-object v3, Lv/f;->c:Ljava/lang/Object;

    monitor-enter v3

    :try_start_3
    sget-object v2, Lv/f;->d:Ll/k;

    invoke-virtual {v2, v0, v7}, Ll/k;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/ArrayList;

    if-eqz v5, :cond_8

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v3

    goto :goto_8

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_7

    :cond_8
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v0, v5}, Ll/k;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v1, v0

    new-instance v0, Lv/c;

    const/4 v5, 0x1

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lv/c;-><init>(Ljava/lang/String;Landroid/content/Context;LT/d;II)V

    sget-object p0, Lv/f;->b:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance p1, Lv/d;

    invoke-direct {p1, v6, v1}, Lv/d;-><init>(ILjava/lang/Object;)V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-nez v1, :cond_9

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    goto :goto_6

    :cond_9
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    :goto_6
    new-instance v2, LQ/h;

    invoke-direct {v2}, LQ/h;-><init>()V

    iput-object v0, v2, LQ/h;->b:Ljava/lang/Object;

    iput-object p1, v2, LQ/h;->c:Ljava/lang/Object;

    iput-object v1, v2, LQ/h;->d:Ljava/lang/Object;

    invoke-virtual {p0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    goto :goto_8

    :goto_7
    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p0

    :cond_a
    sget-object v3, Lr/f;->a:LD/g;

    check-cast p1, Lq/f;

    invoke-virtual {v3, p0, p1, p2, v4}, LD/g;->j(Landroid/content/Context;Lq/f;Landroid/content/res/Resources;I)Landroid/graphics/Typeface;

    move-result-object v7

    if-eqz v7, :cond_b

    new-instance p0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance p1, LK/h;

    invoke-direct {p1, v0, v2, v7}, LK/h;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    invoke-virtual {p0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_8

    :cond_b
    invoke-virtual {v0}, Li/U;->a()V

    :goto_8
    if-eqz v7, :cond_c

    sget-object p0, Lr/f;->b:Ll/f;

    invoke-static/range {p2 .. p6}, Lr/f;->b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v7}, Ll/f;->b(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_c
    return-object v7
.end method

.method public static b(Landroid/content/res/Resources;ILjava/lang/String;II)Ljava/lang/String;
    .locals 1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 p0, 0x2d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
