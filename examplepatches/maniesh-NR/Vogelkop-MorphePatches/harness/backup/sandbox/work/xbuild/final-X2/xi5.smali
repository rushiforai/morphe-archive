.class public final Lxi5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# static fields
.field public static l:Lxi5;


# instance fields
.field public final a:Lumi;

.field public final b:Lpjn;

.field public final c:Lqy4;

.field public final d:Ltr3;

.field public final e:Lqy4;

.field public final f:Lqy4;

.field public final g:Lsi5;

.field public final h:Lsi5;

.field public final i:Lh7f;

.field public final j:Lx5f;

.field public final k:Lvi5;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ltr3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object p0, v0, Ltr3;->d:Ljava/lang/Object;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, v0, Ltr3;->c:Ljava/lang/Object;

    iput-object v0, p0, Lxi5;->d:Ltr3;

    new-instance v1, Lsi5;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lsi5;-><init>(Lxi5;B)V

    iput-object v1, p0, Lxi5;->g:Lsi5;

    new-instance v3, Lsi5;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lsi5;-><init>(Lxi5;B)V

    iput-object v3, p0, Lxi5;->h:Lsi5;

    new-instance v4, Lh7f;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v4, p0, Lxi5;->i:Lh7f;

    new-instance v4, Lvi5;

    invoke-direct {v4, p0}, Lvi5;-><init>(Lxi5;)V

    iput-object v4, p0, Lxi5;->k:Lvi5;

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    iput-object v4, p0, Lxi5;->j:Lx5f;

    sget-object v4, Lvml;->d:Lumi;

    iput-object v4, p0, Lxi5;->a:Lumi;

    new-instance v5, Lk32;

    const/4 v6, 0x2

    invoke-direct {v5, p0, p1, v6}, Lk32;-><init>(Ljava/lang/Object;Landroid/content/Context;B)V

    invoke-static {v5, v4}, Lcom/opera/android/Lazy;->e(Lcom/opera/android/Lazy;Lumi;)V

    new-instance p1, Lpjn;

    const/16 v4, 0x1c

    invoke-direct {p1, v5, v4}, Lpjn;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lxi5;->b:Lpjn;

    new-instance p1, Lqy4;

    new-instance v4, Ls6h;

    const-string v6, "data_savings_"

    invoke-direct {v4, v5, v6, v2}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    const/16 v6, 0xa

    invoke-direct {p1, v4, v0, v6}, Lqy4;-><init>(Ls6h;Lua6;I)V

    iput-object p1, p0, Lxi5;->c:Lqy4;

    new-instance p1, Lqy4;

    new-instance v0, Ls6h;

    const-string v4, "ad_block_stats_"

    invoke-direct {v0, v5, v4, v2}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    const/16 v4, 0x14

    invoke-direct {p1, v0, v1, v4}, Lqy4;-><init>(Ls6h;Lua6;I)V

    iput-object p1, p0, Lxi5;->e:Lqy4;

    new-instance p1, Lqy4;

    new-instance v0, Ls6h;

    const-string v1, "tracker_block_stats_"

    invoke-direct {v0, v5, v1, v2}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    invoke-direct {p1, v0, v3, v4}, Lqy4;-><init>(Ls6h;Lua6;I)V

    iput-object p1, p0, Lxi5;->f:Lqy4;

    return-void
.end method

.method public static a(Landroid/content/Context;)Lxi5;
    .registers 3

    const-class v0, Lxi5;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lxi5;->l:Lxi5;

    if-nez v1, :cond_12

    new-instance v1, Lxi5;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lxi5;-><init>(Landroid/content/Context;)V

    sput-object v1, Lxi5;->l:Lxi5;

    :cond_12
    monitor-exit v0

    return-object v1

    :goto_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_16

    throw p0

    :catchall_16
    move-exception p0

    goto :goto_14
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lti5;

    iget-object p0, p0, Lxi5;->i:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lti5;

    iget-object p0, p0, Lxi5;->i:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()J
    .registers 4

    iget-object p0, p0, Lxi5;->b:Lpjn;

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "ad_block_count"

    const-wide/16 v1, 0x0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final c()Lui5;
    .registers 6

    new-instance v0, Lui5;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-direct {v0, v1}, Lta6;-><init>(Ljava/util/Calendar;)V

    iget-object p0, p0, Lxi5;->b:Lpjn;

    iget-object v1, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast v1, Lk32;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "turbo_compressed_bytes"

    const-wide/16 v3, 0x0

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, v0, Lui5;->d:J

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v1, "turbo_uncompressed_bytes"

    invoke-interface {p0, v1, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, v0, Lui5;->e:J

    return-object v0
.end method

.method public final e()J
    .registers 4

    iget-object p0, p0, Lxi5;->b:Lpjn;

    iget-object p0, p0, Lpjn;->b:Ljava/lang/Object;

    check-cast p0, Lk32;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "tracker_block_count"

    const-wide/16 v1, 0x0

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public final f(J)V
    .registers 5

    iget-object v0, p0, Lxi5;->b:Lpjn;

    iget-object v0, v0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lk32;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ad_block_count"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, p0, Lxi5;->i:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_1f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lti5;

    invoke-interface {p1}, Lti5;->y()V

    goto :goto_1f

    :cond_2f
    return-void
.end method

.method public final g(J)V
    .registers 5

    iget-object v0, p0, Lxi5;->b:Lpjn;

    iget-object v0, v0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lk32;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "tracker_block_count"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, p0, Lxi5;->i:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_1f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_2f

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lti5;

    invoke-interface {p1}, Lti5;->B()V

    goto :goto_1f

    :cond_2f
    return-void
.end method

.method public final h(JJ)V
    .registers 7

    iget-object v0, p0, Lxi5;->b:Lpjn;

    iget-object v0, v0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lk32;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "turbo_compressed_bytes"

    invoke-interface {v0, v1, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "turbo_uncompressed_bytes"

    invoke-interface {p1, p2, p3, p4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    new-instance p1, Llb4;

    const/16 p2, 0x17

    invoke-direct {p1, p0, p2}, Llb4;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lxi5;->a:Lumi;

    invoke-interface {p0, p1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final i(JJ)V
    .registers 11

    iget-object v0, p0, Lxi5;->d:Ltr3;

    iget-object v1, v0, Ltr3;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_5
    iput-wide p1, v0, Ltr3;->a:J

    iput-wide p3, v0, Ltr3;->b:J

    iget-object v0, v0, Ltr3;->d:Ljava/lang/Object;

    check-cast v0, Lxi5;

    iget-object v0, v0, Lxi5;->c:Lqy4;

    invoke-virtual {v0}, Lqy4;->g()V

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_5 .. :try_end_13} :catchall_88

    iget-object v0, p0, Lxi5;->b:Lpjn;

    iget-object v0, v0, Lpjn;->b:Ljava/lang/Object;

    check-cast v0, Lk32;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "turbo_compressed_bytes"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    add-long/2addr v0, p1

    iget-object v4, p0, Lxi5;->b:Lpjn;

    iget-object v4, v4, Lpjn;->b:Ljava/lang/Object;

    check-cast v4, Lk32;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/SharedPreferences;

    const-string v5, "turbo_uncompressed_bytes"

    invoke-interface {v4, v5, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    add-long/2addr v4, p3

    invoke-virtual {p0, v0, v1, v4, v5}, Lxi5;->h(JJ)V

    iget-object p0, p0, Lxi5;->k:Lvi5;

    iget-object v0, p0, Lvi5;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_43
    iget-wide v4, p0, Lvi5;->a:J

    add-long/2addr v4, p1

    iput-wide v4, p0, Lvi5;->a:J

    iget-wide p1, p0, Lvi5;->b:J

    add-long/2addr p1, p3

    iput-wide p1, p0, Lvi5;->b:J

    sub-long/2addr p1, v4

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iget-wide p3, p0, Lvi5;->c:J

    cmp-long v1, p1, p3

    if-lez v1, :cond_80

    iget-object v1, p0, Lvi5;->e:Ljava/lang/Object;

    check-cast v1, Lxi5;

    iget-object v1, v1, Lxi5;->j:Lx5f;

    sub-long p3, p1, p3

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_7e

    iget-object v2, v1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, v2, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->e()Lhi0;

    move-result-object v2

    iget-object v2, v2, Lhi0;->b:Lfi0;

    const/16 v4, 0x27

    const/4 v5, 0x1

    invoke-virtual {v2, v4, v5, p3, p4}, Ljf0;->p(IIJ)V

    invoke-virtual {v1, v3}, Lx5f;->U0(Lx56;)V

    :cond_7e
    iput-wide p1, p0, Lvi5;->c:J

    :cond_80
    monitor-exit v0

    return-void

    :goto_82
    monitor-exit v0
    :try_end_83
    .catchall {:try_start_43 .. :try_end_83} :catchall_84

    throw p0

    :catchall_84
    move-exception p0

    goto :goto_82

    :goto_86
    :try_start_86
    monitor-exit v1
    :try_end_87
    .catchall {:try_start_86 .. :try_end_87} :catchall_88

    throw p0

    :catchall_88
    move-exception p0

    goto :goto_86
.end method
