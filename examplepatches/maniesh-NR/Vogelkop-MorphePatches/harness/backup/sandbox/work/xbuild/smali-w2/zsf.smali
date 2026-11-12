.class public final Lzsf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lb59;

.field public final d:Ll45;

.field public final e:Lssf;

.field public final f:Li16;

.field public final g:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public h:Lrsf;

.field public final i:Ljava/lang/Object;

.field public j:Loml;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Ljava/lang/String;Ljava/lang/String;Lssf;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v0, p0, Lzsf;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lzsf;->i:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lzsf;->a:Landroid/content/Context;

    iput-object p2, p0, Lzsf;->b:Lumi;

    const/4 v1, 0x0

    new-array v2, v1, [Lbg1;

    invoke-static {p1, p2, p3, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p2

    iput-object p2, p0, Lzsf;->c:Lb59;

    new-instance p3, Ll45;

    invoke-direct {p3}, Ljava/lang/Object;-><init>()V

    iput-object p2, p3, Ll45;->a:Ljava/lang/Object;

    new-instance v2, Lni6;

    invoke-direct {v2, p2}, Lni6;-><init>(Lb59;)V

    iput-object v2, p3, Ll45;->b:Ljava/lang/Object;

    new-instance p2, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p2}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object p2, p3, Ll45;->c:Ljava/lang/Object;

    iput-object p3, p0, Lzsf;->d:Ll45;

    iput-object p5, p0, Lzsf;->e:Lssf;

    new-instance p2, Li16;

    invoke-direct {p2, p1, p4, p5}, Li16;-><init>(Landroid/content/Context;Ljava/lang/String;Lssf;)V

    iput-object p2, p0, Lzsf;->f:Li16;

    const-string p1, "AvroOspCurrent"

    invoke-virtual {p2, p1}, Li16;->s(Ljava/lang/String;)Lrsf;

    move-result-object p1

    if-nez p1, :cond_4e

    invoke-virtual {p0}, Lzsf;->b()V

    goto :goto_50

    :cond_4e
    iput-object p1, p0, Lzsf;->h:Lrsf;

    :goto_50
    monitor-enter v0

    :try_start_51
    const-string p1, "AvroOspPending"

    invoke-virtual {p2, p1}, Li16;->s(Ljava/lang/String;)Lrsf;

    move-result-object p3

    if-nez p3, :cond_5b

    move p3, v1

    goto :goto_76

    :cond_5b
    iget-object p4, p0, Lzsf;->h:Lrsf;

    invoke-interface {p4, p3}, Lrsf;->e(Lrsf;)Lrsf;

    move-result-object p3

    iput-object p3, p0, Lzsf;->h:Lrsf;

    const/4 p3, 0x1

    invoke-virtual {p0, p3}, Lzsf;->d(Z)V

    iget-object p2, p2, Li16;->b:Ljava/lang/Object;

    check-cast p2, Landroid/content/SharedPreferences;

    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p2

    invoke-interface {p2, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_76
    if-nez p3, :cond_7a

    monitor-exit v0

    return-void

    :cond_7a
    iget-object p1, p0, Lzsf;->h:Lrsf;

    invoke-interface {p1}, Lrsf;->a()I

    move-result p1

    if-nez p1, :cond_84

    monitor-exit v0

    return-void

    :cond_84
    iget-object p2, p0, Lzsf;->h:Lrsf;

    const/4 p3, 0x7

    invoke-interface {p2, p3, p1, v1}, Lrsf;->g(III)V

    invoke-virtual {p0}, Lzsf;->e()V

    monitor-exit v0

    return-void

    :goto_8f
    monitor-exit v0
    :try_end_90
    .catchall {:try_start_51 .. :try_end_90} :catchall_91

    throw p0

    :catchall_91
    move-exception p0

    goto :goto_8f
.end method


# virtual methods
.method public final a([B)V
    .registers 4

    iget-object v0, p0, Lzsf;->e:Lssf;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-interface {v0, v1}, Lssf;->v(Ljava/io/ByteArrayInputStream;)Lrsf;

    move-result-object p1

    iget-object v0, p0, Lzsf;->i:Ljava/lang/Object;

    monitor-enter v0

    :try_start_e
    iget-object v1, p0, Lzsf;->h:Lrsf;

    invoke-interface {p1, v1}, Lrsf;->e(Lrsf;)Lrsf;

    move-result-object p1

    iput-object p1, p0, Lzsf;->h:Lrsf;

    invoke-virtual {p0}, Lzsf;->e()V

    monitor-exit v0

    return-void

    :goto_1b
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_e .. :try_end_1c} :catchall_1d

    throw p0

    :catchall_1d
    move-exception p0

    goto :goto_1b
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lzsf;->i:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lzsf;->e:Lssf;

    invoke-interface {v1}, Lssf;->b()Lrsf;

    move-result-object v1

    iput-object v1, p0, Lzsf;->h:Lrsf;

    invoke-interface {v1}, Lrsf;->c()V

    monitor-exit v0

    return-void

    :goto_10
    monitor-exit v0
    :try_end_11
    .catchall {:try_start_3 .. :try_end_11} :catchall_12

    throw p0

    :catchall_12
    move-exception p0

    goto :goto_10
.end method

.method public final c(Lab9;)V
    .registers 8

    iget-object v0, p0, Lzsf;->i:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget v1, p1, Lab9;->c:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_3e

    iget-object v1, p0, Lzsf;->f:Li16;

    const-string v3, "AvroOspPending"

    invoke-virtual {v1, v3}, Li16;->s(Ljava/lang/String;)Lrsf;

    move-result-object v4

    if-nez v4, :cond_14

    const/4 v1, 0x0

    goto :goto_2f

    :cond_14
    iget-object v5, p0, Lzsf;->h:Lrsf;

    invoke-interface {v5, v4}, Lrsf;->e(Lrsf;)Lrsf;

    move-result-object v4

    iput-object v4, p0, Lzsf;->h:Lrsf;

    invoke-virtual {p0, v2}, Lzsf;->d(Z)V

    iget-object v1, v1, Li16;->b:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    move v1, v2

    :goto_2f
    if-eqz v1, :cond_51

    iget v1, p1, Lab9;->c:I

    iget p1, p1, Lab9;->b:I

    iget-object v3, p0, Lzsf;->h:Lrsf;

    invoke-interface {v3, v1, v2, p1}, Lrsf;->g(III)V

    invoke-virtual {p0}, Lzsf;->e()V

    goto :goto_51

    :cond_3e
    iget-object p0, p0, Lzsf;->f:Li16;

    const-string p1, "AvroOspPending"

    iget-object p0, p0, Li16;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_51
    :goto_51
    monitor-exit v0

    return-void

    :goto_53
    monitor-exit v0
    :try_end_54
    .catchall {:try_start_3 .. :try_end_54} :catchall_55

    throw p0

    :catchall_55
    move-exception p0

    goto :goto_53
.end method

.method public final d(Z)V
    .registers 4

    if-nez p1, :cond_6

    iget-object p1, p0, Lzsf;->j:Loml;

    if-eqz p1, :cond_f

    :cond_6
    const-string p1, "AvroOspCurrent"

    iget-object v0, p0, Lzsf;->h:Lrsf;

    iget-object v1, p0, Lzsf;->f:Li16;

    invoke-virtual {v1, p1, v0}, Li16;->z(Ljava/lang/String;Lrsf;)V

    :cond_f
    iget-object p1, p0, Lzsf;->j:Loml;

    if-eqz p1, :cond_1a

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Loml;->cancel(Z)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lzsf;->j:Loml;

    :cond_1a
    return-void
.end method

.method public final e()V
    .registers 8

    iget-object v0, p0, Lzsf;->j:Loml;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Lvdf;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lzsf;->b:Lumi;

    invoke-interface {v1, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    iput-object v1, p0, Lzsf;->j:Loml;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0x1388

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    return-void
.end method

.method public final f(JZ)V
    .registers 12

    iget-object p0, p0, Lzsf;->c:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "Consents"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    if-eqz p3, :cond_15

    or-long v6, v4, p1

    goto :goto_17

    :cond_15
    not-long v6, p1

    and-long/2addr v6, v4

    :goto_17
    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/content/SharedPreferences;

    invoke-interface {p3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p3

    cmp-long v0, v4, v6

    if-eqz v0, :cond_28

    invoke-interface {p3, v1, v6, v7}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    :cond_28
    const-wide/16 v0, 0x1

    and-long/2addr p1, v0

    cmp-long p1, p1, v2

    if-eqz p1, :cond_40

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "StatsFiltered"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_40

    invoke-interface {p3, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    :cond_40
    invoke-interface {p3}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
