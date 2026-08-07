.class Ll/i3f0$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/i3f0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Ll/i3f0;


# direct methods
.method public constructor <init>(Ll/i3f0;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 11
    .line 12
    iget-object p1, p1, Ll/i3f0;->e:Ljava/lang/Object;

    .line 13
    .line 14
    monitor-enter p1

    .line 15
    :try_start_0
    iget-object v0, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/i3f0;->a:Ll/uje;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/uje;->g()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput-object v1, v0, Ll/i3f0;->a:Ll/uje;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    iput-boolean v0, p0, Ll/i3f0;->f:Z

    .line 36
    .line 37
    iget-object p0, p0, Ll/i3f0;->e:Ljava/lang/Object;

    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 40
    .line 41
    .line 42
    monitor-exit p1

    .line 43
    return-void

    .line 44
    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p0

    .line 46
    :cond_2
    iget-object p1, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 47
    .line 48
    iget-object p1, p1, Ll/i3f0;->e:Ljava/lang/Object;

    .line 49
    .line 50
    monitor-enter p1

    .line 51
    :try_start_1
    iget-object v1, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 52
    .line 53
    iget-object v2, v1, Ll/i3f0;->a:Ll/uje;

    .line 54
    .line 55
    if-nez v2, :cond_3

    .line 56
    .line 57
    new-instance v2, Ll/uje;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/uje;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v2, v1, Ll/i3f0;->a:Ll/uje;

    .line 63
    .line 64
    iget-object v1, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 65
    .line 66
    iget-object v2, v1, Ll/i3f0;->a:Ll/uje;

    .line 67
    .line 68
    iget-object v1, v1, Ll/i3f0;->d:Landroid/opengl/EGLContext;

    .line 69
    .line 70
    invoke-virtual {v2, v1}, Ll/uje;->b(Landroid/opengl/EGLContext;)V

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :catchall_1
    move-exception p0

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    :goto_2
    iget-object p0, p0, Ll/i3f0$a;->a:Ll/i3f0;

    .line 77
    .line 78
    iput-boolean v0, p0, Ll/i3f0;->f:Z

    .line 79
    .line 80
    iget-object p0, p0, Ll/i3f0;->e:Ljava/lang/Object;

    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 83
    .line 84
    .line 85
    monitor-exit p1

    .line 86
    return-void

    .line 87
    :goto_3
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 88
    throw p0
.end method
