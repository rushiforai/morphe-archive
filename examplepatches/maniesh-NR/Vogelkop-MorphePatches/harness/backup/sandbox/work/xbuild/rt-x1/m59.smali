.class public final Lm59;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lx6f;
.implements Lann;


# instance fields
.field public final synthetic a:B

.field public b:I

.field public c:Z

.field public d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lm59;->a:B

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lm59;->d:Ljava/lang/Object;

    .line 47
    new-instance v0, Landroidx/collection/ArrayMap;

    const/4 v1, 0x0

    .line 48
    invoke-direct {v0, v1}, Lhkj;-><init>(I)V

    .line 49
    iput-object v0, p0, Lm59;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Lb59;Lc59;)V
    .registers 6

    const/4 v0, 0x0

    iput-byte v0, p0, Lm59;->a:B

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lm59;->f:Ljava/lang/Object;

    .line 52
    iput-object p2, p0, Lm59;->d:Ljava/lang/Object;

    .line 53
    iput-object p3, p0, Lm59;->e:Ljava/lang/Object;

    .line 54
    iput-object p4, p0, Lm59;->g:Ljava/lang/Object;

    const/4 p2, 0x5

    .line 55
    invoke-static {p2}, Lvep;->B(I)[I

    move-result-object p2

    .line 56
    const-string p3, "unfinished_task"

    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    aget p1, p2, p1

    .line 57
    iput p1, p0, Lm59;->b:I

    const/4 p2, 0x1

    if-eq p1, p2, :cond_23

    .line 58
    invoke-virtual {p0, p1}, Lm59;->m(I)V

    :cond_23
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lm59;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lm59;->d:Ljava/lang/Object;

    const/4 v0, 0x0

    iput v0, p0, Lm59;->b:I

    iput-boolean v0, p0, Lm59;->c:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lm59;->f:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lm59;->g:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lm59;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lnx5;Lx2;)V
    .registers 6

    const/4 v0, 0x5

    iput-byte v0, p0, Lm59;->a:B

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p1, p0, Lm59;->d:Ljava/lang/Object;

    .line 61
    iput-object p2, p0, Lm59;->e:Ljava/lang/Object;

    .line 62
    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lm59;->f:Ljava/lang/Object;

    .line 63
    monitor-enter p2

    .line 64
    :try_start_12
    new-instance v0, Lzhl;

    const/4 v1, 0x6

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, p0}, Lzhl;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v1, 0x3

    .line 65
    invoke-static {p1, v2, v2, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object p1

    .line 66
    iput-object p1, p0, Lm59;->g:Ljava/lang/Object;
    :try_end_20
    .catchall {:try_start_12 .. :try_end_20} :catchall_22

    .line 67
    monitor-exit p2

    return-void

    :catchall_22
    move-exception p0

    monitor-exit p2

    throw p0
.end method

.method public constructor <init>(Lqln;Ljava/lang/Integer;ZLjava/lang/String;ILcom/opera/api/Callback;)V
    .registers 8

    const/4 v0, 0x6

    iput-byte v0, p0, Lm59;->a:B

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lm59;->e:Ljava/lang/Object;

    iput-boolean p3, p0, Lm59;->c:Z

    iput-object p4, p0, Lm59;->d:Ljava/lang/Object;

    iput p5, p0, Lm59;->b:I

    iput-object p6, p0, Lm59;->f:Ljava/lang/Object;

    iput-object p1, p0, Lm59;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ltah;Lb8e;ILdee;Ldee;Z)V
    .registers 8

    const/4 v0, 0x2

    iput-byte v0, p0, Lm59;->a:B

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm59;->g:Ljava/lang/Object;

    .line 70
    iput-object p2, p0, Lm59;->d:Ljava/lang/Object;

    .line 71
    iput p3, p0, Lm59;->b:I

    .line 72
    iput-object p4, p0, Lm59;->e:Ljava/lang/Object;

    .line 73
    iput-object p5, p0, Lm59;->f:Ljava/lang/Object;

    .line 74
    iput-boolean p6, p0, Lm59;->c:Z

    return-void
.end method

.method public constructor <init>(Lumi;Lmcj;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Lm59;->a:B

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lm59;->d:Ljava/lang/Object;

    const v0, 0x36ee80

    .line 42
    iput v0, p0, Lm59;->b:I

    .line 43
    iput-object p1, p0, Lm59;->f:Ljava/lang/Object;

    .line 44
    iput-object p2, p0, Lm59;->g:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(II)Z
    .registers 5

    iget-object v0, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v0, Ldee;

    iget v1, p0, Lm59;->b:I

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Ldee;->g(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, La8e;

    iget-object v0, p0, Lm59;->f:Ljava/lang/Object;

    check-cast v0, Ldee;

    iget p0, p0, Lm59;->b:I

    add-int/2addr p0, p2

    invoke-virtual {v0, p0}, Ldee;->g(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, La8e;

    invoke-static {p1, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_2a

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    if-ne p1, p0, :cond_2c

    :cond_2a
    const/4 p0, 0x1

    return p0

    :cond_2c
    const/4 p0, 0x0

    return p0
.end method

.method public final b()Lcom/google/common/util/concurrent/ListenableFuture;
    .registers 3

    iget-object p0, p0, Lm59;->e:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Lro2;

    if-eqz v0, :cond_14

    new-instance p0, Lq0b;

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lq0b;-><init>(Ljava/lang/Object;B)V

    return-object p0

    :cond_14
    invoke-static {p0}, Lk1g;->G(Ljava/lang/Object;)Lq0b;

    move-result-object p0

    return-object p0
.end method

.method public final c(Le4j;)Lo1j;
    .registers 5

    iget-object v0, p0, Lm59;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0}, Lm59;->j()I

    move-result v1

    new-instance v2, Lo1j;

    invoke-direct {v2, v1, p1}, Lo1j;-><init>(ILe4j;)V

    iget-boolean p1, p0, Lm59;->c:Z

    if-eqz p1, :cond_14

    invoke-virtual {v2}, Lo1j;->h()V

    goto :goto_1f

    :cond_14
    iget-object p0, p0, Lm59;->e:Ljava/lang/Object;

    check-cast p0, Landroidx/collection/ArrayMap;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1, v2}, Lhkj;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1f
    monitor-exit v0

    return-object v2

    :goto_21
    monitor-exit v0
    :try_end_22
    .catchall {:try_start_3 .. :try_end_22} :catchall_23

    throw p0

    :catchall_23
    move-exception p0

    goto :goto_21
.end method

.method public final d()V
    .registers 6

    iget-boolean v0, p0, Lm59;->c:Z

    iget-object v1, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v1, Lqln;

    if-eqz v0, :cond_19

    invoke-virtual {v1}, Lqln;->i()Ljava/lang/String;

    move-result-object v0

    iget v2, p0, Lm59;->b:I

    new-instance v3, Lilm;

    const/16 v4, 0xb

    invoke-direct {v3, p0, v4}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0, v2, v3}, Lqln;->l(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void

    :cond_19
    invoke-virtual {v1}, Lqln;->b()Lqjn;

    move-result-object v0

    invoke-virtual {p0, v0}, Lm59;->h(Lqjn;)V

    return-void
.end method

.method public final e()V
    .registers 6

    iget-object v0, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget v1, p0, Lm59;->b:I

    and-int/lit8 v2, v1, 0x1

    if-eqz v2, :cond_2f

    iget-object v2, v0, Lqln;->a:Landroid/content/Context;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    invoke-virtual {v2}, Lru9;->b()Lnv6;

    move-result-object v2

    iget-object v3, v2, Lnv6;->a:Ljava/lang/Object;

    check-cast v3, Landroid/content/SharedPreferences$Editor;

    const-string v4, "wallpaper.item_data.id"

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string v4, "wallpaper.item_data.content"

    invoke-interface {v3, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v2}, Lnv6;->w()V

    iget-object p0, p0, Lm59;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    and-int/lit8 v1, v1, -0x2

    invoke-virtual {v0, p0, v1}, Lqln;->a(Lcom/opera/api/Callback;I)V

    return-void

    :cond_2f
    iget-boolean v2, p0, Lm59;->c:Z

    if-eqz v2, :cond_42

    invoke-virtual {v0}, Lqln;->i()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lilm;

    const/16 v4, 0xb

    invoke-direct {v3, p0, v4}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v1, v3}, Lqln;->l(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void

    :cond_42
    invoke-virtual {v0}, Lqln;->b()Lqjn;

    move-result-object v0

    invoke-virtual {p0, v0}, Lm59;->h(Lqjn;)V

    return-void
.end method

.method public final f(Lv6f;)V
    .registers 3

    iget-object v0, p0, Lm59;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0, p1}, Lm59;->l(Lv6f;)V

    monitor-exit v0

    return-void

    :goto_8
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_a

    throw p0

    :catchall_a
    move-exception p0

    goto :goto_8
.end method

.method public final g(Ljava/util/concurrent/Executor;Lv6f;)V
    .registers 6

    iget-object v0, p0, Lm59;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-virtual {p0, p2}, Lm59;->l(Lv6f;)V

    new-instance v1, Lxak;

    iget-object v2, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1, v2, p1, p2}, Lxak;-><init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/Executor;Lv6f;)V

    iget-object p1, p0, Lm59;->f:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1, p2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lm59;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p0, v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_25

    const/4 p0, 0x0

    invoke-virtual {v1, p0}, Lxak;->a(I)V

    return-void

    :goto_23
    :try_start_23
    monitor-exit v0
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_25

    throw p0

    :catchall_25
    move-exception p0

    goto :goto_23
.end method

.method public final h(Lqjn;)V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p1, Lqjn;->i:Z

    iget-object v0, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v0, v0, Lqln;->h:Lkze;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lm59;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final i()V
    .registers 11

    iget-object v0, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v0, Loml;

    if-nez v0, :cond_14

    iget-boolean v0, p0, Lm59;->c:Z

    if-eqz v0, :cond_14

    iget-object v0, p0, Lm59;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_15

    :cond_14
    return-void

    :cond_15
    iget-object v0, p0, Lm59;->f:Ljava/lang/Object;

    check-cast v0, Lumi;

    new-instance v1, Lmni;

    const/16 v2, 0x1d

    invoke-direct {v1, p0, v2}, Lmni;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    iput-object v1, p0, Lm59;->e:Ljava/lang/Object;

    iget-object v0, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v0, Lmcj;

    iget-object v0, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "last_response"

    const-wide/16 v4, -0x1

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    const-wide/16 v6, 0x0

    cmp-long v8, v2, v6

    if-ltz v8, :cond_55

    iget v8, p0, Lm59;->b:I

    int-to-long v8, v8

    add-long/2addr v2, v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v2, v8

    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    goto :goto_56

    :cond_55
    move-wide v2, v6

    :goto_56
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v8, "last_request"

    invoke-interface {v0, v8, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    cmp-long v0, v4, v6

    if-ltz v0, :cond_73

    const-wide/32 v8, 0xdbba0

    add-long/2addr v4, v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v4, v8

    invoke-static {v6, v7, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    :cond_73
    invoke-static {v6, v7, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iget p0, p0, Lm59;->b:I

    int-to-long v4, p0

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x0

    const/4 v2, 0x0

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void
.end method

.method public final j()I
    .registers 4

    iget-object v0, p0, Lm59;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget v1, p0, Lm59;->b:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lm59;->b:I

    monitor-exit v0

    return v1

    :goto_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_d

    throw p0

    :catchall_d
    move-exception p0

    goto :goto_b
.end method

.method public final k()V
    .registers 6

    iget-byte v0, p0, Lm59;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_7c

    iget-object v0, p0, Lm59;->f:Ljava/lang/Object;

    monitor-enter v0

    :try_start_a
    iget-boolean v3, p0, Lm59;->c:Z
    :try_end_c
    .catchall {:try_start_a .. :try_end_c} :catchall_2e

    if-eqz v3, :cond_10

    monitor-exit v0

    goto :goto_2d

    :cond_10
    :try_start_10
    iput-boolean v2, p0, Lm59;->c:Z

    iget-object v2, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v2, Ld3k;

    if-eqz v2, :cond_1b

    invoke-virtual {v2, v1}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_1b
    iput-object v1, p0, Lm59;->g:Ljava/lang/Object;
    :try_end_1d
    .catchall {:try_start_10 .. :try_end_1d} :catchall_2e

    monitor-exit v0

    iget-object v0, p0, Lm59;->d:Ljava/lang/Object;

    check-cast v0, Lnx5;

    new-instance v2, Lu6k;

    const/16 v3, 0x8

    invoke-direct {v2, v3, v1, p0}, Lu6k;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {v0, v1, v1, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :goto_2d
    return-void

    :catchall_2e
    move-exception p0

    monitor-exit v0

    throw p0

    :pswitch_31
    iget-object v0, p0, Lm59;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_34
    iput-boolean v2, p0, Lm59;->c:Z

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v3, Landroidx/collection/ArrayMap;

    invoke-virtual {v3}, Landroidx/collection/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v3, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v3, Landroidx/collection/ArrayMap;

    invoke-virtual {v3}, Lhkj;->clear()V

    iget-object v3, p0, Lm59;->f:Ljava/lang/Object;

    check-cast v3, Lohd;

    if-eqz v3, :cond_62

    iget-object v3, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v3, Landroid/os/Handler;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v4, p0, Lm59;->f:Ljava/lang/Object;

    check-cast v4, Lohd;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iput-object v1, p0, Lm59;->f:Ljava/lang/Object;

    iput-object v1, p0, Lm59;->g:Ljava/lang/Object;

    :cond_62
    monitor-exit v0
    :try_end_63
    .catchall {:try_start_34 .. :try_end_63} :catchall_79

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p0

    const/4 v0, 0x0

    :goto_68
    if-ge v0, p0, :cond_76

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Lo1j;

    invoke-virtual {v1}, Lo1j;->h()V

    goto :goto_68

    :cond_76
    return-void

    :goto_77
    :try_start_77
    monitor-exit v0
    :try_end_78
    .catchall {:try_start_77 .. :try_end_78} :catchall_79

    throw p0

    :catchall_79
    move-exception p0

    goto :goto_77

    nop

    :pswitch_data_7c
    .packed-switch 0x3
        :pswitch_31
    .end packed-switch
.end method

.method public final l(Lv6f;)V
    .registers 4

    iget-object v0, p0, Lm59;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lxak;

    if-eqz p1, :cond_19

    iget-object v0, p1, Lxak;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object p0, p0, Lm59;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    :cond_19
    return-void
.end method

.method public final m(I)V
    .registers 8

    iget-object v0, p0, Lm59;->f:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences;

    iget v1, p0, Lm59;->b:I

    if-ne v1, p1, :cond_c

    iget-boolean v2, p0, Lm59;->c:Z

    if-nez v2, :cond_6e

    :cond_c
    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x5

    if-ne v1, v2, :cond_17

    if-ne p1, v2, :cond_17

    move p1, v3

    :cond_17
    const/4 v1, 0x4

    const/4 v4, 0x0

    const-string v5, "last_fcm_token"

    if-eq p1, v1, :cond_1f

    if-ne p1, v3, :cond_30

    :cond_1f
    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_30

    iget v1, p0, Lm59;->b:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    if-eqz v1, :cond_2f

    if-ne v1, v2, :cond_30

    :cond_2f
    return-void

    :cond_30
    const/4 v1, 0x3

    const/4 v2, 0x1

    if-ne p1, v1, :cond_3e

    invoke-interface {v0, v5, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3e

    iget v1, p0, Lm59;->b:I

    if-eq v1, v2, :cond_6e

    :cond_3e
    iget v1, p0, Lm59;->b:I

    if-eq p1, v1, :cond_55

    iput p1, p0, Lm59;->b:I

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "unfinished_task"

    invoke-static {p1}, Lvep;->A(I)I

    move-result v3

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_55
    iget-boolean v0, p0, Lm59;->c:Z

    if-nez v0, :cond_6e

    iput-boolean v2, p0, Lm59;->c:Z

    new-instance v0, Ll59;

    iget-object v1, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v1, Lb59;

    new-instance v2, Lga6;

    const/16 v3, 0xc

    invoke-direct {v2, p0, v3}, Lga6;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, p1, v1, v2}, Ll59;-><init>(ILb59;Lga6;)V

    invoke-virtual {v0}, Ll59;->run()V

    :cond_6e
    return-void
.end method

.method public final n(ILjava/lang/Object;)V
    .registers 7

    const-string v0, "Type mismatch, expected "

    iget-object v1, p0, Lm59;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    iget-object v2, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v2, Landroidx/collection/ArrayMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v2, p1}, Lhkj;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lo1j;

    if-eqz p1, :cond_46

    iget-object v2, p1, Lo1j;->b:Le4j;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_25

    invoke-virtual {p1, p2}, Lm4;->set(Ljava/lang/Object;)Z

    goto :goto_46

    :cond_25
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lo1j;->b:Le4j;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", but was "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lw7d;->K(Ljava/lang/String;)V

    :cond_46
    :goto_46
    iget-object p1, p0, Lm59;->f:Ljava/lang/Object;

    check-cast p1, Lohd;

    if-eqz p1, :cond_59

    iget-object p1, p0, Lm59;->e:Ljava/lang/Object;

    check-cast p1, Landroidx/collection/ArrayMap;

    invoke-virtual {p1}, Lhkj;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_59

    invoke-virtual {p0}, Lm59;->k()V

    :cond_59
    monitor-exit v1

    return-void

    :goto_5b
    monitor-exit v1
    :try_end_5c
    .catchall {:try_start_5 .. :try_end_5c} :catchall_5d

    throw p0

    :catchall_5d
    move-exception p0

    goto :goto_5b
.end method

.method public final o(Ljava/lang/Object;)V
    .registers 5

    iget-object v0, p0, Lm59;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_13

    monitor-exit v0

    return-void

    :cond_13
    iget p1, p0, Lm59;->b:I

    const/4 v1, 0x1

    add-int/2addr p1, v1

    iput p1, p0, Lm59;->b:I

    iget-boolean v2, p0, Lm59;->c:Z

    if-eqz v2, :cond_1f

    monitor-exit v0

    return-void

    :cond_1f
    iput-boolean v1, p0, Lm59;->c:Z

    iget-object v1, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_3 .. :try_end_2a} :catchall_5a

    :goto_2a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxak;

    invoke-virtual {v0, p1}, Lxak;->a(I)V

    goto :goto_2a

    :cond_3a
    iget-object v1, p0, Lm59;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_3d
    iget v0, p0, Lm59;->b:I

    if-ne v0, p1, :cond_46

    const/4 p1, 0x0

    iput-boolean p1, p0, Lm59;->c:Z

    monitor-exit v1

    return-void

    :cond_46
    iget-object p1, p0, Lm59;->g:Ljava/lang/Object;

    check-cast p1, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iget v0, p0, Lm59;->b:I

    monitor-exit v1

    move-object v1, p1

    move p1, v0

    goto :goto_2a

    :goto_54
    monitor-exit v1
    :try_end_55
    .catchall {:try_start_3d .. :try_end_55} :catchall_56

    throw p0

    :catchall_56
    move-exception p0

    goto :goto_54

    :goto_58
    :try_start_58
    monitor-exit v0
    :try_end_59
    .catchall {:try_start_58 .. :try_end_59} :catchall_5a

    throw p0

    :catchall_5a
    move-exception p0

    goto :goto_58
.end method

.method public final u(Lbnn;)V
    .registers 6

    iget-boolean v0, p0, Lm59;->c:Z

    if-eqz v0, :cond_19

    iget-object p1, p0, Lm59;->g:Ljava/lang/Object;

    check-cast p1, Lqln;

    invoke-virtual {p1}, Lqln;->i()Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lm59;->b:I

    new-instance v2, Lilm;

    const/16 v3, 0xb

    invoke-direct {v2, p0, v3}, Lilm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0, v1, v2}, Lqln;->l(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void

    :cond_19
    iget-object p1, p1, Lbnn;->a:Lqjn;

    invoke-virtual {p0, p1}, Lm59;->h(Lqjn;)V

    return-void
.end method

.method public final z(Lcnn;)V
    .registers 7

    iget-object p1, p1, Lcnn;->a:Lqjn;

    iget-object v0, p0, Lm59;->g:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v1, p0, Lm59;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    if-eqz v1, :cond_1b

    iget-object v2, v0, Lqln;->d:Lonn;

    iget-object v3, p1, Lqjn;->a:Lxkn;

    iget-object v3, v3, Lxkn;->b:Laln;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget-object v4, Liu0;->b:Liu0;

    invoke-virtual {v2, v3, v1, v4}, Lonn;->c(Laln;ILiu0;)V

    :cond_1b
    iget-boolean v1, p0, Lm59;->c:Z

    if-eqz v1, :cond_2a

    iget-object v1, p0, Lm59;->d:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lqln;->e:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "wallpaper_current"

    invoke-virtual {v0, v2, v1}, Lcom/opera/android/settings/SettingsManager;->Y(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2a
    invoke-virtual {p0, p1}, Lm59;->h(Lqjn;)V

    return-void
.end method
