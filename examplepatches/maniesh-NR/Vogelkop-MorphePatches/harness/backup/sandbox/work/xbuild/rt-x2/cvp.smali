.class public final Lcvp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static i:Lcvp;


# instance fields
.field public final a:Lg40;

.field public final b:Landroid/content/IntentFilter;

.field public final c:Landroid/content/Context;

.field public final d:Ljava/util/HashSet;

.field public e:Lup1;

.field public volatile f:Z

.field public final g:Landroid/os/Handler;

.field public final h:Ljava/util/LinkedHashSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    sget-object v0, Lytp;->a:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Lg40;

    const-string v1, "SplitInstallListenerRegistry"

    invoke-direct {v0, v1}, Lg40;-><init>(Ljava/lang/String;)V

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.google.android.play.core.splitinstall.receiver.SplitInstallUpdateIntentService"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcvp;->d:Ljava/util/HashSet;

    const/4 v2, 0x0

    iput-object v2, p0, Lcvp;->e:Lup1;

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcvp;->f:Z

    iput-object v0, p0, Lcvp;->a:Lg40;

    iput-object v1, p0, Lcvp;->b:Landroid/content/IntentFilter;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_2b

    move-object p1, v0

    :cond_2b
    iput-object p1, p0, Lcvp;->c:Landroid/content/Context;

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcvp;->g:Landroid/os/Handler;

    new-instance p1, Ljava/util/LinkedHashSet;

    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p1, p0, Lcvp;->h:Ljava/util/LinkedHashSet;

    return-void
.end method

.method public static declared-synchronized b(Landroid/content/Context;)Lcvp;
    .registers 4

    const-class v0, Lcvp;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcvp;->i:Lcvp;

    if-nez v1, :cond_10

    new-instance v1, Lcvp;

    sget-object v2, Lytp;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1, p0}, Lcvp;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcvp;->i:Lcvp;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_14

    :cond_10
    monitor-exit v0

    return-object v1

    :goto_12
    :try_start_12
    monitor-exit v0
    :try_end_13
    .catchall {:try_start_12 .. :try_end_13} :catchall_14

    throw p0

    :catchall_14
    move-exception p0

    goto :goto_12
.end method


# virtual methods
.method public final a()V
    .registers 6

    iget-boolean v0, p0, Lcvp;->f:Z

    if-nez v0, :cond_c

    iget-object v0, p0, Lcvp;->d:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2b

    :cond_c
    iget-object v0, p0, Lcvp;->e:Lup1;

    if-nez v0, :cond_2b

    new-instance v0, Lup1;

    const/16 v1, 0x1b

    invoke-direct {v0, p0, v1}, Lup1;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcvp;->e:Lup1;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object v2, p0, Lcvp;->c:Landroid/content/Context;

    iget-object v3, p0, Lcvp;->b:Landroid/content/IntentFilter;

    const/16 v4, 0x21

    if-lt v1, v4, :cond_28

    const/4 v1, 0x2

    invoke-virtual {v2, v0, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    goto :goto_2b

    :cond_28
    invoke-virtual {v2, v0, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_2b
    :goto_2b
    iget-boolean v0, p0, Lcvp;->f:Z

    if-nez v0, :cond_43

    iget-object v0, p0, Lcvp;->d:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_43

    iget-object v0, p0, Lcvp;->e:Lup1;

    if-eqz v0, :cond_43

    iget-object v1, p0, Lcvp;->c:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcvp;->e:Lup1;

    :cond_43
    return-void
.end method

.method public final declared-synchronized c(Lqop;)V
    .registers 4

    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcvp;->h:Ljava/util/LinkedHashSet;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, La9e;

    invoke-virtual {v1, p1}, La9e;->a(Ljava/lang/Object;)V

    goto :goto_c

    :cond_1c
    monitor-enter p0
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_41

    :try_start_1d
    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lcvp;->d:Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_28
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_38

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzak;

    invoke-interface {v1, p1}, Lzak;->a(Ljava/lang/Object;)V
    :try_end_37
    .catchall {:try_start_1d .. :try_end_37} :catchall_3d

    goto :goto_28

    :cond_38
    :try_start_38
    monitor-exit p0
    :try_end_39
    .catchall {:try_start_38 .. :try_end_39} :catchall_41

    monitor-exit p0

    return-void

    :goto_3b
    :try_start_3b
    monitor-exit p0
    :try_end_3c
    .catchall {:try_start_3b .. :try_end_3c} :catchall_3d

    :try_start_3c
    throw p1

    :catchall_3d
    move-exception p1

    goto :goto_3b

    :goto_3f
    monitor-exit p0
    :try_end_40
    .catchall {:try_start_3c .. :try_end_40} :catchall_41

    throw p1

    :catchall_41
    move-exception p1

    goto :goto_3f
.end method
