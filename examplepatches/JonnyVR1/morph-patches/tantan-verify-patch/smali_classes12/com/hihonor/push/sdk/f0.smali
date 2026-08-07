.class public Lcom/hihonor/push/sdk/f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hihonor/push/sdk/f0$a;
    }
.end annotation


# static fields
.field public static final e:Ljava/lang/Object;


# instance fields
.field public final a:Lcom/hihonor/push/sdk/bean/RemoteServiceBean;

.field public b:Lcom/hihonor/push/sdk/f0$a;

.field public c:Landroid/os/Handler;

.field public d:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hihonor/push/sdk/f0;->e:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/hihonor/push/sdk/bean/RemoteServiceBean;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/hihonor/push/sdk/f0;->c:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/hihonor/push/sdk/f0;->d:Z

    .line 9
    .line 10
    iput-object p1, p0, Lcom/hihonor/push/sdk/f0;->a:Lcom/hihonor/push/sdk/bean/RemoteServiceBean;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 3

    .line 34
    sget-object v0, Lcom/hihonor/push/sdk/f0;->e:Ljava/lang/Object;

    monitor-enter v0

    .line 35
    :try_start_0
    iget-object v1, p0, Lcom/hihonor/push/sdk/f0;->c:Landroid/os/Handler;

    if-eqz v1, :cond_0

    const/16 v2, 0x3e9

    .line 36
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v1, 0x0

    .line 37
    iput-object v1, p0, Lcom/hihonor/push/sdk/f0;->c:Landroid/os/Handler;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 38
    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public final a(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/hihonor/push/sdk/f0;->b:Lcom/hihonor/push/sdk/f0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    check-cast p0, Lcom/hihonor/push/sdk/c0;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/hihonor/push/sdk/d0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    sget-object v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->ERROR_SERVICE_TIME_OUT:Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;

    .line 12
    .line 13
    iget v1, v1, Lcom/hihonor/push/sdk/internal/HonorPushErrorEnum;->statusCode:I

    .line 14
    .line 15
    if-ne p1, v1, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v1, 0x1

    .line 20
    :goto_0
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Lcom/hihonor/push/sdk/d0;->a(I)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    iput-object p1, p0, Lcom/hihonor/push/sdk/d0;->b:Lcom/hihonor/push/framework/aidl/IPushInvoke;

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/hihonor/push/sdk/l;->e:Lcom/hihonor/push/sdk/l;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/hihonor/push/sdk/l;->a()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onNullBinding(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/hihonor/push/sdk/f0;->d:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/hihonor/push/sdk/f0;->d:Z

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/f0;->b()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/f0;->a()V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/hihonor/push/sdk/f0;->b:Lcom/hihonor/push/sdk/f0$a;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    check-cast p0, Lcom/hihonor/push/sdk/c0;

    .line 20
    .line 21
    iget-object p1, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/hihonor/push/sdk/d0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 30
    .line 31
    const v0, 0x7a19d5

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/hihonor/push/sdk/d0;->a(I)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 38
    .line 39
    const/4 p1, 0x0

    .line 40
    iput-object p1, p0, Lcom/hihonor/push/sdk/d0;->b:Lcom/hihonor/push/framework/aidl/IPushInvoke;

    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/f0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hihonor/push/sdk/f0;->b:Lcom/hihonor/push/sdk/f0$a;

    .line 5
    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    check-cast p0, Lcom/hihonor/push/sdk/c0;

    .line 9
    .line 10
    iget-object p1, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 11
    .line 12
    invoke-static {p2}, Lcom/hihonor/push/framework/aidl/IPushInvoke$Stub;->asInterface(Landroid/os/IBinder;)Lcom/hihonor/push/framework/aidl/IPushInvoke;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p1, Lcom/hihonor/push/sdk/d0;->b:Lcom/hihonor/push/framework/aidl/IPushInvoke;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/hihonor/push/sdk/d0;->b:Lcom/hihonor/push/framework/aidl/IPushInvoke;

    .line 21
    .line 22
    iget-object p2, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    iget-object p1, p2, Lcom/hihonor/push/sdk/d0;->d:Lcom/hihonor/push/sdk/f0;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/hihonor/push/sdk/f0;->b()V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/hihonor/push/sdk/d0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 34
    .line 35
    const/4 p2, 0x1

    .line 36
    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 40
    .line 41
    const p1, 0x7a19d1

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lcom/hihonor/push/sdk/d0;->a(I)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_0
    iget-object p1, p2, Lcom/hihonor/push/sdk/d0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 49
    .line 50
    const/4 p2, 0x3

    .line 51
    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/hihonor/push/sdk/d0;->c:Lcom/hihonor/push/sdk/b0$a;

    .line 57
    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    check-cast p0, Lcom/hihonor/push/sdk/z$a;

    .line 61
    .line 62
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object p2, p0, Lcom/hihonor/push/sdk/z$a;->f:Lcom/hihonor/push/sdk/z;

    .line 67
    .line 68
    iget-object p2, p2, Lcom/hihonor/push/sdk/z;->a:Landroid/os/Handler;

    .line 69
    .line 70
    invoke-virtual {p2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    if-ne p1, p2, :cond_1

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/hihonor/push/sdk/z$a;->b()V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    iget-object p1, p0, Lcom/hihonor/push/sdk/z$a;->f:Lcom/hihonor/push/sdk/z;

    .line 81
    .line 82
    iget-object p1, p1, Lcom/hihonor/push/sdk/z;->a:Landroid/os/Handler;

    .line 83
    .line 84
    new-instance p2, Lcom/hihonor/push/sdk/x;

    .line 85
    .line 86
    invoke-direct {p2, p0}, Lcom/hihonor/push/sdk/x;-><init>(Lcom/hihonor/push/sdk/z$a;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 90
    .line 91
    .line 92
    :cond_2
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/hihonor/push/sdk/f0;->b:Lcom/hihonor/push/sdk/f0$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/hihonor/push/sdk/c0;

    .line 6
    .line 7
    iget-object p1, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/hihonor/push/sdk/d0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 16
    .line 17
    const v0, 0x7a19d2

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lcom/hihonor/push/sdk/d0;->a(I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/hihonor/push/sdk/c0;->a:Lcom/hihonor/push/sdk/d0;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    iput-object p1, p0, Lcom/hihonor/push/sdk/d0;->b:Lcom/hihonor/push/framework/aidl/IPushInvoke;

    .line 27
    .line 28
    :cond_0
    return-void
.end method
