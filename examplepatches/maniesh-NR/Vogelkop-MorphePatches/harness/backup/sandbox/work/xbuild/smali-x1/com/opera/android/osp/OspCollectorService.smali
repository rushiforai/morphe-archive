.class public Lcom/opera/android/osp/OspCollectorService;
.super Lilf;
.source "SourceFile"


# static fields
.field public static final g:Ljava/util/HashMap;

.field public static final h:Ljava/util/HashMap;


# instance fields
.field public f:Lghf;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/opera/android/osp/OspCollectorService;->g:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/opera/android/osp/OspCollectorService;->h:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Landroid/content/Intent;)V
    .registers 7

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_bd

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lsfe;->k0(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_bd

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.opera.android.osp.action.OSP_MSG"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_bd

    const-string v0, "com.opera.android.osp.extra.MSG_DATA"

    const-class v1, Landroid/os/Message;

    invoke-static {p1, v0, v1}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Message;

    if-eqz p1, :cond_bd

    iget-object p0, p0, Lcom/opera/android/osp/OspCollectorService;->f:Lghf;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p1, Landroid/os/Message;->arg1:I

    if-ltz v0, :cond_bd

    iget-object v1, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v1, [Lzsf;

    array-length v1, v1

    if-ge v0, v1, :cond_bd

    iget v1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_85

    const/4 v3, 0x2

    const-string v4, "com.opera.android.browser.DATA_VALUE"

    if-eq v1, v3, :cond_75

    const/4 v3, 0x3

    if-eq v1, v3, :cond_60

    const/4 p0, 0x4

    if-ne v1, p0, :cond_bd

    invoke-static {v0}, Llkk;->d(I)Llkk;

    move-result-object p0

    if-eqz p0, :cond_bd

    sget-object p1, Lcom/opera/android/osp/OspCollectorService;->h:Ljava/util/HashMap;

    invoke-virtual {p1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/api/Callback;

    if-eqz p1, :cond_bd

    invoke-interface {p1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_60
    invoke-virtual {p0, v0}, Lghf;->z(I)Lzsf;

    move-result-object p0

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iget p1, p1, Landroid/os/Message;->arg2:I

    if-nez p1, :cond_71

    const/4 v2, 0x0

    :cond_71
    invoke-virtual {p0, v0, v1, v2}, Lzsf;->f(JZ)V

    return-void

    :cond_75
    invoke-virtual {p0, v0}, Lghf;->z(I)Lzsf;

    move-result-object p0

    :try_start_79
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lzsf;->a([B)V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_79 .. :try_end_84} :catch_bd
    .catch Ljava/lang/IllegalArgumentException; {:try_start_79 .. :try_end_84} :catch_bd

    return-void

    :cond_85
    invoke-virtual {p0, v0}, Lghf;->z(I)Lzsf;

    move-result-object p0

    iget-object p0, p0, Lzsf;->d:Ll45;

    iget-object p1, p0, Ll45;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Ll45;->b:Ljava/lang/Object;

    check-cast v2, Lni6;

    invoke-virtual {v2, v0, v1}, Lni6;->b(J)V

    iget-object p0, p0, Ll45;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v2, "LastActiveTimeStamp"

    invoke-interface {p0, v2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_b4
    .catchall {:try_start_92 .. :try_end_b4} :catchall_b8

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void

    :catchall_b8
    move-exception p0

    invoke-virtual {p1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw p0

    :catch_bd
    :cond_bd
    return-void
.end method

.method public final onCreate()V
    .registers 8

    invoke-super {p0}, Lilf;->onCreate()V

    new-instance v0, Lghf;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Llkk;->e:Llkk;

    sget-object v3, Llkk;->f:Llkk;

    sget-object v4, Llkk;->b:Llkk;

    sget-object v5, Llkk;->c:Llkk;

    sget-object v6, Llkk;->d:Llkk;

    filled-new-array {v4, v5, v6, v2, v3}, [Llkk;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lghf;-><init>(Landroid/content/Context;[Llkk;)V

    iput-object v0, p0, Lcom/opera/android/osp/OspCollectorService;->f:Lghf;

    return-void
.end method

.method public final onDestroy()V
    .registers 6

    invoke-super {p0}, Lilf;->onDestroy()V

    iget-object p0, p0, Lcom/opera/android/osp/OspCollectorService;->f:Lghf;

    iget-object p0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast p0, [Lzsf;

    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_c
    if-ge v2, v0, :cond_20

    aget-object v3, p0, v2

    if-eqz v3, :cond_19

    iget-object v4, v3, Lzsf;->i:Ljava/lang/Object;

    monitor-enter v4

    :try_start_15
    invoke-virtual {v3, v1}, Lzsf;->d(Z)V

    monitor-exit v4

    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    :goto_1c
    monitor-exit v4
    :try_end_1d
    .catchall {:try_start_15 .. :try_end_1d} :catchall_1e

    throw p0

    :catchall_1e
    move-exception p0

    goto :goto_1c

    :cond_20
    return-void
.end method
