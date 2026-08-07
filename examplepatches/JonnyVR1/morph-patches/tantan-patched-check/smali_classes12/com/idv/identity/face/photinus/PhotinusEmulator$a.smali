.class Lcom/idv/identity/face/photinus/PhotinusEmulator$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/face/photinus/PhotinusEmulator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/face/photinus/PhotinusEmulator;


# direct methods
.method public constructor <init>(Lcom/idv/identity/face/photinus/PhotinusEmulator;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;->a:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;->a:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->c(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;->a:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->d(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    sget-object v2, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->COMPLETED:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 15
    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;->a:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 23
    .line 24
    sget-object v2, Lcom/idv/identity/face/photinus/PhotinusEmulator$State;->AT_FAULT:Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 25
    .line 26
    invoke-static {v1, v2}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->e(Lcom/idv/identity/face/photinus/PhotinusEmulator;Lcom/idv/identity/face/photinus/PhotinusEmulator$State;)Lcom/idv/identity/face/photinus/PhotinusEmulator$State;

    .line 27
    .line 28
    .line 29
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;->a:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->f(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Ll/y270;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;->a:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->g(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x0

    .line 45
    const/4 v2, 0x1

    .line 46
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;->a:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->f(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Ll/y270;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v1, "Timeout"

    .line 59
    .line 60
    invoke-interface {v0, v1}, Ll/y270;->b(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/idv/identity/face/photinus/PhotinusEmulator$a;->a:Lcom/idv/identity/face/photinus/PhotinusEmulator;

    .line 64
    .line 65
    invoke-static {p0}, Lcom/idv/identity/face/photinus/PhotinusEmulator;->f(Lcom/idv/identity/face/photinus/PhotinusEmulator;)Ll/y270;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const/4 v0, 0x0

    .line 70
    invoke-interface {p0, v0, v0}, Ll/y270;->a(Landroid/net/Uri;Landroid/net/Uri;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void

    .line 74
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    throw p0
.end method
