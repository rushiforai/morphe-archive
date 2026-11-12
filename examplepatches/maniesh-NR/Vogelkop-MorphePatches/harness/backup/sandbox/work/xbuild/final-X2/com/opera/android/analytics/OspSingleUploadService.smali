.class public Lcom/opera/android/analytics/OspSingleUploadService;
.super Lbtf;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lbtf;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public final declared-synchronized b(Z)Z
    .registers 6

    monitor-enter p0

    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v1, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "oem.osp.retry.count"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-nez p1, :cond_2b

    const/4 p1, 0x1

    add-int/2addr v1, p1

    const/4 v2, 0x5

    if-ge v1, v2, :cond_2b

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v2, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v3, "oem.osp.retry.count"

    invoke-interface {v2, v3, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V
    :try_end_29
    .catchall {:try_start_1 .. :try_end_29} :catchall_3f

    monitor-exit p0

    return p1

    :cond_2b
    :try_start_2b
    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "oem.osp.retry.count"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V
    :try_end_3b
    .catchall {:try_start_2b .. :try_end_3b} :catchall_3f

    monitor-exit p0

    return v3

    :goto_3d
    :try_start_3d
    monitor-exit p0
    :try_end_3e
    .catchall {:try_start_3d .. :try_end_3e} :catchall_3f

    throw p1

    :catchall_3f
    move-exception p1

    goto :goto_3d
.end method
