.class Ll/r5r0$e;
.super Landroid/os/HandlerThread;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r5r0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "e"
.end annotation


# instance fields
.field volatile a:I

.field volatile b:Z

.field final synthetic c:Ll/r5r0;


# direct methods
.method public constructor <init>(Ll/r5r0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r5r0$e;->c:Ll/r5r0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/r5r0$e;->a:I

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/r5r0$e;->b:Z

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public onLooperPrepared()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/os/HandlerThread;->onLooperPrepared()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/r5r0$e;->c:Ll/r5r0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/r5r0;->c(Ll/r5r0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Ll/r5r0$e;->c:Ll/r5r0;

    .line 12
    .line 13
    new-instance v2, Landroid/os/Handler;

    .line 14
    .line 15
    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    .line 16
    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/r5r0;->b(Ll/r5r0;Landroid/os/Handler;)Landroid/os/Handler;

    .line 19
    .line 20
    .line 21
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 22
    iget-object v0, p0, Ll/r5r0$e;->c:Ll/r5r0;

    .line 23
    .line 24
    invoke-static {v0}, Ll/r5r0;->h(Ll/r5r0;)Landroid/os/Handler;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/r5r0$c;

    .line 29
    .line 30
    iget-object v2, p0, Ll/r5r0$e;->c:Ll/r5r0;

    .line 31
    .line 32
    invoke-direct {v1, v2}, Ll/r5r0$c;-><init>(Ll/r5r0;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 36
    .line 37
    .line 38
    :catchall_0
    :goto_0
    :try_start_1
    invoke-static {}, Landroid/os/Looper;->loop()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_1
    move-exception v0

    .line 43
    :try_start_2
    invoke-static {}, Ll/vxq0;->e()V

    .line 44
    .line 45
    .line 46
    iget v1, p0, Ll/r5r0$e;->a:I

    .line 47
    .line 48
    const/4 v2, 0x5

    .line 49
    const/4 v3, 0x1

    .line 50
    if-ge v1, v2, :cond_0

    .line 51
    .line 52
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 53
    .line 54
    .line 55
    const-string v1, "NPTH_CATCH"

    .line 56
    .line 57
    invoke-static {v1, v0}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_0
    iget-boolean v0, p0, Ll/r5r0$e;->b:Z

    .line 62
    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    iput-boolean v3, p0, Ll/r5r0$e;->b:Z

    .line 66
    .line 67
    invoke-static {}, Ll/pwq0;->a()Ll/pwq0;

    .line 68
    .line 69
    .line 70
    const-string v0, "NPTH_ERR_MAX"

    .line 71
    .line 72
    new-instance v1, Ljava/lang/RuntimeException;

    .line 73
    .line 74
    invoke-direct {v1}, Ljava/lang/RuntimeException;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v0, v1}, Ll/pwq0;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :cond_1
    :goto_1
    iget v0, p0, Ll/r5r0$e;->a:I

    .line 81
    .line 82
    add-int/2addr v0, v3

    .line 83
    iput v0, p0, Ll/r5r0$e;->a:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :catchall_2
    move-exception p0

    .line 87
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 88
    throw p0
.end method
