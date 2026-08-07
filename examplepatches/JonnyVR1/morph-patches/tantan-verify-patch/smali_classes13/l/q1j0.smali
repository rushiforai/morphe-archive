.class public Ll/q1j0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/q1j0$b;,
        Ll/q1j0$c;
    }
.end annotation


# static fields
.field public static e:Ll/q1j0;


# instance fields
.field public final a:Ljava/lang/Object;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final b:Landroid/os/Handler;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public c:Ll/q1j0$c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ll/q1j0$c;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/q1j0;->a:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    new-instance v2, Ll/q1j0$a;

    .line 18
    .line 19
    invoke-direct {v2, p0}, Ll/q1j0$a;-><init>(Ll/q1j0;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/q1j0;->b:Landroid/os/Handler;

    .line 26
    .line 27
    return-void
.end method

.method public static b()Ll/q1j0;
    .locals 1

    .line 1
    sget-object v0, Ll/q1j0;->e:Ll/q1j0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/q1j0;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/q1j0;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/q1j0;->e:Ll/q1j0;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/q1j0;->e:Ll/q1j0;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public final a(Ll/q1j0$c;I)Z
    .locals 1
    .param p1    # Ll/q1j0$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p1, Ll/q1j0$c;->a:Ll/q1j0$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/q1j0;->b:Landroid/os/Handler;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, p2}, Ll/q1j0$b;->dismiss(I)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public c(Ll/q1j0$c;)V
    .locals 2
    .param p1    # Ll/q1j0$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/q1j0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 5
    .line 6
    if-eq v1, p1, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Ll/q1j0;->d:Ll/q1j0$c;

    .line 9
    .line 10
    if-ne v1, p1, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    const/4 v1, 0x2

    .line 16
    invoke-virtual {p0, p1, v1}, Ll/q1j0;->a(Ll/q1j0$c;I)Z

    .line 17
    .line 18
    .line 19
    :cond_1
    monitor-exit v0

    .line 20
    return-void

    .line 21
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public final d(Ll/q1j0$b;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/q1j0$c;->a(Ll/q1j0$b;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final e(Ll/q1j0$b;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q1j0;->d:Ll/q1j0$c;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/q1j0$c;->a(Ll/q1j0$b;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public f(Ll/q1j0$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q1j0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0, p1}, Ll/q1j0;->d(Ll/q1j0$b;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 12
    .line 13
    iget-object p1, p0, Ll/q1j0;->d:Ll/q1j0$c;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/q1j0;->j()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    return-void

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw p0
.end method

.method public g(Ll/q1j0$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q1j0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0, p1}, Ll/q1j0;->d(Ll/q1j0$b;)Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/q1j0;->h(Ll/q1j0$c;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit v0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method

.method public final h(Ll/q1j0$c;)V
    .locals 2
    .param p1    # Ll/q1j0$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p1, Ll/q1j0$c;->b:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, -0x1

    .line 7
    if-ne v0, v1, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x7d0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    const/16 v0, 0xdac

    .line 13
    .line 14
    :goto_0
    iget-object v1, p0, Ll/q1j0;->b:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/q1j0;->b:Landroid/os/Handler;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {p0, v1, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    int-to-long v0, v0

    .line 27
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public i(ILl/q1j0$b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q1j0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    invoke-virtual {p0, p2}, Ll/q1j0;->d(Ll/q1j0$b;)Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget-object p2, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 11
    .line 12
    iput p1, p2, Ll/q1j0$c;->b:I

    .line 13
    .line 14
    iget-object p1, p0, Ll/q1j0;->b:Landroid/os/Handler;

    .line 15
    .line 16
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/q1j0;->h(Ll/q1j0$c;)V

    .line 22
    .line 23
    .line 24
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    invoke-virtual {p0, p2}, Ll/q1j0;->e(Ll/q1j0$b;)Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object p2, p0, Ll/q1j0;->d:Ll/q1j0$c;

    .line 35
    .line 36
    iput p1, p2, Ll/q1j0$c;->b:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance v1, Ll/q1j0$c;

    .line 40
    .line 41
    invoke-direct {v1, p1, p2}, Ll/q1j0$c;-><init>(ILl/q1j0$b;)V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Ll/q1j0;->d:Ll/q1j0$c;

    .line 45
    .line 46
    :goto_0
    iget-object p1, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 47
    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    const/4 p2, 0x4

    .line 51
    invoke-virtual {p0, p1, p2}, Ll/q1j0;->a(Ll/q1j0$c;I)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_2

    .line 56
    .line 57
    monitor-exit v0

    .line 58
    return-void

    .line 59
    :cond_2
    const/4 p1, 0x0

    .line 60
    iput-object p1, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/q1j0;->j()V

    .line 63
    .line 64
    .line 65
    monitor-exit v0

    .line 66
    return-void

    .line 67
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    throw p0
.end method

.method public final j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q1j0;->d:Ll/q1j0$c;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iput-object v0, p0, Ll/q1j0;->c:Ll/q1j0$c;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Ll/q1j0;->d:Ll/q1j0$c;

    .line 9
    .line 10
    iget-object p0, v0, Ll/q1j0$c;->a:Ll/q1j0$b;

    .line 11
    .line 12
    invoke-interface {p0}, Ll/q1j0$b;->show()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
