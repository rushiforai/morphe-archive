.class public Ll/u0j$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iye$f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/u0j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/t0j;

.field public final c:Ll/u0j$a;

.field public final d:Ljava/lang/Object;

.field public e:Landroid/os/Handler;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field public f:Landroid/os/HandlerThread;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field public g:Ll/u0j$c;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h:Ll/iye$g;

.field public i:Landroid/database/ContentObserver;

.field public j:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/t0j;Ll/u0j$a;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/t0j;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ll/u0j$a;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

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
    iput-object v0, p0, Ll/u0j$b;->d:Ljava/lang/Object;

    .line 10
    .line 11
    const-string v0, "Context cannot be null"

    .line 12
    .line 13
    invoke-static {p1, v0}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    const-string v0, "FontRequest cannot be null"

    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/u0j$b;->a:Landroid/content/Context;

    .line 26
    .line 27
    iput-object p2, p0, Ll/u0j$b;->b:Ll/t0j;

    .line 28
    .line 29
    iput-object p3, p0, Ll/u0j$b;->c:Ll/u0j$a;

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public a(Ll/iye$g;)V
    .locals 4
    .param p1    # Ll/iye$g;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x13
    .end annotation

    .line 1
    const-string v0, "LoaderCallback cannot be null"

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/yn80;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/u0j$b;->d:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v1, p0, Ll/u0j$b;->e:Landroid/os/Handler;

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    new-instance v1, Landroid/os/HandlerThread;

    .line 14
    .line 15
    const-string v2, "emojiCompat"

    .line 16
    .line 17
    const/16 v3, 0xa

    .line 18
    .line 19
    invoke-direct {v1, v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/u0j$b;->f:Landroid/os/HandlerThread;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 25
    .line 26
    .line 27
    new-instance v1, Landroid/os/Handler;

    .line 28
    .line 29
    iget-object v2, p0, Ll/u0j$b;->f:Landroid/os/HandlerThread;

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 36
    .line 37
    .line 38
    iput-object v1, p0, Ll/u0j$b;->e:Landroid/os/Handler;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    iget-object v1, p0, Ll/u0j$b;->e:Landroid/os/Handler;

    .line 44
    .line 45
    new-instance v2, Ll/u0j$b$a;

    .line 46
    .line 47
    invoke-direct {v2, p0, p1}, Ll/u0j$b$a;-><init>(Ll/u0j$b;Ll/iye$g;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 51
    .line 52
    .line 53
    monitor-exit v0

    .line 54
    return-void

    .line 55
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    throw p0
.end method

.method public final b()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/u0j$b;->h:Ll/iye$g;

    .line 3
    .line 4
    iget-object v1, p0, Ll/u0j$b;->i:Landroid/database/ContentObserver;

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v2, p0, Ll/u0j$b;->c:Ll/u0j$a;

    .line 9
    .line 10
    iget-object v3, p0, Ll/u0j$b;->a:Landroid/content/Context;

    .line 11
    .line 12
    invoke-virtual {v2, v3, v1}, Ll/u0j$a;->d(Landroid/content/Context;Landroid/database/ContentObserver;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/u0j$b;->i:Landroid/database/ContentObserver;

    .line 16
    .line 17
    :cond_0
    iget-object v1, p0, Ll/u0j$b;->d:Ljava/lang/Object;

    .line 18
    .line 19
    monitor-enter v1

    .line 20
    :try_start_0
    iget-object v2, p0, Ll/u0j$b;->e:Landroid/os/Handler;

    .line 21
    .line 22
    iget-object v3, p0, Ll/u0j$b;->j:Ljava/lang/Runnable;

    .line 23
    .line 24
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    iget-object v2, p0, Ll/u0j$b;->f:Landroid/os/HandlerThread;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-virtual {v2}, Landroid/os/HandlerThread;->quit()Z

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    iput-object v0, p0, Ll/u0j$b;->e:Landroid/os/Handler;

    .line 38
    .line 39
    iput-object v0, p0, Ll/u0j$b;->f:Landroid/os/HandlerThread;

    .line 40
    .line 41
    monitor-exit v1

    .line 42
    return-void

    .line 43
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0
.end method

.method public c()V
    .locals 8
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x13
    .end annotation

    .line 1
    const-string v0, "fetchFonts result is not OK. ("

    .line 2
    .line 3
    iget-object v1, p0, Ll/u0j$b;->h:Ll/iye$g;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Ll/u0j$b;->d()Ll/x0j$b;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ll/x0j$b;->b()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x2

    .line 17
    if-ne v2, v3, :cond_2

    .line 18
    .line 19
    iget-object v3, p0, Ll/u0j$b;->d:Ljava/lang/Object;

    .line 20
    .line 21
    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 22
    :try_start_1
    iget-object v4, p0, Ll/u0j$b;->g:Ll/u0j$c;

    .line 23
    .line 24
    if-eqz v4, :cond_1

    .line 25
    .line 26
    invoke-virtual {v4}, Ll/u0j$c;->a()J

    .line 27
    .line 28
    .line 29
    move-result-wide v4

    .line 30
    const-wide/16 v6, 0x0

    .line 31
    .line 32
    cmp-long v6, v4, v6

    .line 33
    .line 34
    if-ltz v6, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/x0j$b;->d()Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0, v4, v5}, Ll/u0j$b;->e(Landroid/net/Uri;J)V

    .line 41
    .line 42
    .line 43
    monitor-exit v3

    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    monitor-exit v3

    .line 48
    goto :goto_1

    .line 49
    :goto_0
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    :try_start_2
    throw v0

    .line 51
    :catchall_1
    move-exception v0

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    :goto_1
    if-nez v2, :cond_4

    .line 54
    .line 55
    iget-object v0, p0, Ll/u0j$b;->c:Ll/u0j$a;

    .line 56
    .line 57
    iget-object v2, p0, Ll/u0j$b;->a:Landroid/content/Context;

    .line 58
    .line 59
    invoke-virtual {v0, v2, v1}, Ll/u0j$a;->a(Landroid/content/Context;Ll/x0j$b;)Landroid/graphics/Typeface;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v2, p0, Ll/u0j$b;->a:Landroid/content/Context;

    .line 64
    .line 65
    invoke-virtual {v1}, Ll/x0j$b;->d()Landroid/net/Uri;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const/4 v3, 0x0

    .line 70
    invoke-static {v2, v3, v1}, Ll/moj0;->f(Landroid/content/Context;Landroid/os/CancellationSignal;Landroid/net/Uri;)Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    if-eqz v1, :cond_3

    .line 75
    .line 76
    iget-object v2, p0, Ll/u0j$b;->h:Ll/iye$g;

    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/ha00;->b(Landroid/graphics/Typeface;Ljava/nio/ByteBuffer;)Ll/ha00;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v2, v0}, Ll/iye$g;->b(Ll/ha00;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ll/u0j$b;->b()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    .line 90
    .line 91
    const-string v1, "Unable to open file."

    .line 92
    .line 93
    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    throw v0

    .line 97
    :cond_4
    new-instance v1, Ljava/lang/RuntimeException;

    .line 98
    .line 99
    new-instance v3, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    const-string v0, ")"

    .line 108
    .line 109
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 120
    :goto_2
    iget-object v1, p0, Ll/u0j$b;->h:Ll/iye$g;

    .line 121
    .line 122
    invoke-virtual {v1, v0}, Ll/iye$g;->a(Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ll/u0j$b;->b()V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final d()Ll/x0j$b;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/u0j$b;->c:Ll/u0j$a;

    .line 3
    .line 4
    iget-object v2, p0, Ll/u0j$b;->a:Landroid/content/Context;

    .line 5
    .line 6
    iget-object p0, p0, Ll/u0j$b;->b:Ll/t0j;

    .line 7
    .line 8
    invoke-virtual {v1, v2, p0}, Ll/u0j$a;->b(Landroid/content/Context;Ll/t0j;)Ll/x0j$a;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    invoke-virtual {p0}, Ll/x0j$a;->c()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/x0j$a;->b()[Ll/x0j$b;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    array-length v1, p0

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    aget-object p0, p0, v0

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const-string p0, "fetchFonts failed (empty result)"

    .line 32
    .line 33
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-object v0

    .line 37
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/x0j$a;->c()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string v2, "fetchFonts failed ("

    .line 46
    .line 47
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string p0, ")"

    .line 54
    .line 55
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw v0

    .line 66
    :catch_0
    move-exception p0

    .line 67
    const-string v1, "provider not found"

    .line 68
    .line 69
    invoke-static {v1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    .line 71
    .line 72
    return-object v0
.end method

.method public final e(Landroid/net/Uri;J)V
    .locals 4
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x13
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u0j$b;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/u0j$b;->i:Landroid/database/ContentObserver;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/u0j$b$b;

    .line 9
    .line 10
    iget-object v2, p0, Ll/u0j$b;->e:Landroid/os/Handler;

    .line 11
    .line 12
    invoke-direct {v1, p0, v2}, Ll/u0j$b$b;-><init>(Ll/u0j$b;Landroid/os/Handler;)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Ll/u0j$b;->i:Landroid/database/ContentObserver;

    .line 16
    .line 17
    iget-object v2, p0, Ll/u0j$b;->c:Ll/u0j$a;

    .line 18
    .line 19
    iget-object v3, p0, Ll/u0j$b;->a:Landroid/content/Context;

    .line 20
    .line 21
    invoke-virtual {v2, v3, p1, v1}, Ll/u0j$a;->c(Landroid/content/Context;Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/u0j$b;->j:Ljava/lang/Runnable;

    .line 28
    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    new-instance p1, Ll/u0j$b$c;

    .line 32
    .line 33
    invoke-direct {p1, p0}, Ll/u0j$b$c;-><init>(Ll/u0j$b;)V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Ll/u0j$b;->j:Ljava/lang/Runnable;

    .line 37
    .line 38
    :cond_1
    iget-object p1, p0, Ll/u0j$b;->e:Landroid/os/Handler;

    .line 39
    .line 40
    iget-object p0, p0, Ll/u0j$b;->j:Ljava/lang/Runnable;

    .line 41
    .line 42
    invoke-virtual {p1, p0, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 43
    .line 44
    .line 45
    monitor-exit v0

    .line 46
    return-void

    .line 47
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    throw p0
.end method
