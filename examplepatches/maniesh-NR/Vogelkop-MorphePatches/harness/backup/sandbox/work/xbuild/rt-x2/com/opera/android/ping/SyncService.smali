.class public Lcom/opera/android/ping/SyncService;
.super Landroid/app/Service;
.source "SourceFile"


# static fields
.field public static a:Lkwk;

.field public static final b:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/opera/android/ping/SyncService;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public final onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    sget-object p0, Lcom/opera/android/ping/SyncService;->a:Lkwk;

    invoke-virtual {p0}, Landroid/content/AbstractThreadedSyncAdapter;->getSyncAdapterBinder()Landroid/os/IBinder;

    move-result-object p0

    return-object p0
.end method

.method public final onCreate()V
    .registers 3

    sget-object v0, Lcom/opera/android/ping/SyncService;->b:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Lcom/opera/android/ping/SyncService;->a:Lkwk;

    if-nez v1, :cond_12

    new-instance v1, Lkwk;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lkwk;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/opera/android/ping/SyncService;->a:Lkwk;

    :cond_12
    monitor-exit v0

    return-void

    :goto_14
    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_16

    throw p0

    :catchall_16
    move-exception p0

    goto :goto_14
.end method
