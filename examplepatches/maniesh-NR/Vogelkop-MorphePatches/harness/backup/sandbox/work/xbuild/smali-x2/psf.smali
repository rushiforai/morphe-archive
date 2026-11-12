.class public final Lpsf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field public a:I

.field public b:Z

.field public final c:Landroidx/fragment/app/r;

.field public final d:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/r;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lpsf;->d:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p1, p0, Lpsf;->c:Landroidx/fragment/app/r;

    return-void
.end method


# virtual methods
.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 3

    iget-object p1, p0, Lpsf;->d:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    const/16 p1, 0xa

    iput p1, p0, Lpsf;->a:I

    return-void
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 5

    iget-object p1, p0, Lpsf;->d:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget p1, p0, Lpsf;->a:I

    if-eqz p1, :cond_26

    iget-boolean v0, p0, Lpsf;->b:Z

    if-eqz v0, :cond_26

    const/4 v0, 0x1

    sub-int/2addr p1, v0

    iput p1, p0, Lpsf;->a:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lpsf;->b:Z

    iget-object p1, p0, Lpsf;->c:Landroidx/fragment/app/r;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iput-boolean v0, p0, Lpsf;->b:Z

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/opera/android/osp/OspCollectorService;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v1, p0, v0}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    :cond_26
    return-void
.end method
