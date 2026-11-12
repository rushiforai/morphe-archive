.class public final Lcom/opera/android/browser/chromium/ChromiumAdDelegate;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumAdDelegate;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumAdDelegate;->a()V

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method

.method public static onAdBlocked(Lcom/opera/android/browser/chromium/ChromiumContent;J)V
    .registers 8
    .param p0    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object v0

    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-lez v1, :cond_3e

    iget-object v1, v0, Lxi5;->g:Lsi5;

    iget-object v2, v1, Lsi5;->c:Ljava/lang/Object;

    monitor-enter v2

    :try_start_11
    iput-wide p1, v1, Lsi5;->b:J

    iget-object v1, v1, Lsi5;->d:Lxi5;

    iget-object v1, v1, Lxi5;->e:Lqy4;

    invoke-virtual {v1}, Lqy4;->g()V

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_11 .. :try_end_1b} :catchall_4e

    invoke-virtual {v0}, Lxi5;->b()J

    move-result-wide v1

    add-long/2addr v1, p1

    invoke-virtual {v0, v1, v2}, Lxi5;->f(J)V

    iget-object v0, v0, Lxi5;->j:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_3e

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v1, v2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    const/16 v3, 0x25

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, p1, p2}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    :cond_3e
    if-nez p0, :cond_41

    return-void

    :cond_41
    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->M:Lt59;

    iget-wide v0, p0, Lt59;->b:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lt59;->b:J

    invoke-virtual {p0}, Lt59;->g()V

    return-void

    :goto_4c
    :try_start_4c
    monitor-exit v2
    :try_end_4d
    .catchall {:try_start_4c .. :try_end_4d} :catchall_4e

    throw p0

    :catchall_4e
    move-exception p0

    goto :goto_4c
.end method

.method public static onTrackerBlocked(Lcom/opera/android/browser/chromium/ChromiumContent;J)V
    .registers 8
    .param p0    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    sget-object v0, Lt8;->a:Landroid/content/Context;

    invoke-static {v0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object v0

    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    if-lez v1, :cond_3e

    iget-object v1, v0, Lxi5;->h:Lsi5;

    iget-object v2, v1, Lsi5;->c:Ljava/lang/Object;

    monitor-enter v2

    :try_start_11
    iput-wide p1, v1, Lsi5;->b:J

    iget-object v1, v1, Lsi5;->d:Lxi5;

    iget-object v1, v1, Lxi5;->f:Lqy4;

    invoke-virtual {v1}, Lqy4;->g()V

    monitor-exit v2
    :try_end_1b
    .catchall {:try_start_11 .. :try_end_1b} :catchall_4d

    invoke-virtual {v0}, Lxi5;->e()J

    move-result-wide v1

    add-long/2addr v1, p1

    invoke-virtual {v0, v1, v2}, Lxi5;->g(J)V

    iget-object v0, v0, Lxi5;->j:Lx5f;

    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_3e

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    invoke-static {v1, v2}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    iget-object v1, v1, Lhi0;->b:Lfi0;

    const/16 v3, 0x26

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v4, p1, p2}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    :cond_3e
    if-eqz p0, :cond_4a

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->M:Lt59;

    iget-wide v0, p0, Lt59;->a:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lt59;->a:J

    invoke-virtual {p0}, Lt59;->h()V

    :cond_4a
    return-void

    :goto_4b
    :try_start_4b
    monitor-exit v2
    :try_end_4c
    .catchall {:try_start_4b .. :try_end_4c} :catchall_4d

    throw p0

    :catchall_4d
    move-exception p0

    goto :goto_4b
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "ad_blocking"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    const-string v0, "tracker_blocker"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_19

    const-string v0, "banner_blocker"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_19

    return-void

    :cond_19
    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumAdDelegate;->a()V

    return-void
.end method

.method public final a()V
    .registers 3

    const-string v0, "ad_blocking"

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumAdDelegate;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "tracker_blocker"

    invoke-virtual {p0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->h()Z

    move-result p0

    invoke-static {v0, v1, p0}, LJ/N;->MoCP7$WI(ZZZ)V

    return-void
.end method
