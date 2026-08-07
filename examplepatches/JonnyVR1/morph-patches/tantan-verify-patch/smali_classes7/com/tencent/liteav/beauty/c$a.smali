.class Lcom/tencent/liteav/beauty/c$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/beauty/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/beauty/c;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/beauty/c;Landroid/os/Looper;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "EGLDrawThreadHandler"

    .line 7
    .line 8
    iput-object p1, p0, Lcom/tencent/liteav/beauty/c$a;->b:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method private a(Ljava/lang/Object;)V
    .locals 6

    .line 78
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->b:Ljava/lang/String;

    const-string v1, "come into InitEGL"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    check-cast p1, Lcom/tencent/liteav/beauty/d$b;

    .line 80
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/c$a;->a()V

    .line 81
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    new-instance v1, Lcom/tencent/liteav/beauty/a/a/a;

    invoke-direct {v1}, Lcom/tencent/liteav/beauty/a/a/a;-><init>()V

    invoke-static {v0, v1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/a/a/a;)Lcom/tencent/liteav/beauty/a/a/a;

    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    new-instance v1, Lcom/tencent/liteav/beauty/a/a/c;

    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->m(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/a/a/a;

    move-result-object v2

    iget v3, p1, Lcom/tencent/liteav/beauty/d$b;->g:I

    iget v4, p1, Lcom/tencent/liteav/beauty/d$b;->f:I

    const/4 v5, 0x0

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/tencent/liteav/beauty/a/a/c;-><init>(Lcom/tencent/liteav/beauty/a/a/a;IIZ)V

    invoke-static {v0, v1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/a/a/c;)Lcom/tencent/liteav/beauty/a/a/c;

    .line 83
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->n(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/a/a/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/a/a/b;->b()V

    .line 84
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    invoke-static {v0, p1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/d$b;)Z

    move-result p1

    .line 85
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c$a;->b:Ljava/lang/String;

    if-nez p1, :cond_0

    .line 86
    const-string p1, "initInternal failed!"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 87
    :cond_0
    const-string p1, "come out InitEGL"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->b:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "come into releaseEGL"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->o(Lcom/tencent/liteav/beauty/c;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->n(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/a/a/c;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->n(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/a/a/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/a/a/c;->c()V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/a/a/c;)Lcom/tencent/liteav/beauty/a/a/c;

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->m(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/a/a/a;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->m(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/a/a/a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/tencent/liteav/beauty/a/a/a;->a()V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 54
    .line 55
    invoke-static {v0, v1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/a/a/a;)Lcom/tencent/liteav/beauty/a/a/a;

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 59
    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-static {v0, v1}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;Z)Z

    .line 62
    .line 63
    .line 64
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->getInstance()Lcom/tencent/liteav/beauty/NativeLoad;

    .line 65
    .line 66
    .line 67
    invoke-static {}, Lcom/tencent/liteav/beauty/NativeLoad;->nativeDeleteYuv2Yuv()V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Lcom/tencent/liteav/beauty/c$a;->b:Ljava/lang/String;

    .line 71
    .line 72
    const-string v0, "come out releaseEGL"

    .line 73
    .line 74
    invoke-static {p0, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    goto :goto_0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    goto :goto_1

    .line 8
    :catch_0
    :goto_0
    :try_start_1
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget v0, p1, Landroid/os/Message;->what:I

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    if-eqz v0, :cond_6

    .line 8
    .line 9
    if-eq v0, v1, :cond_4

    .line 10
    .line 11
    const/4 v2, 0x2

    .line 12
    if-eq v0, v2, :cond_3

    .line 13
    .line 14
    const/4 v2, 0x3

    .line 15
    if-eq v0, v2, :cond_2

    .line 16
    .line 17
    const/4 v2, 0x4

    .line 18
    if-eq v0, v2, :cond_1

    .line 19
    .line 20
    const/4 v2, 0x5

    .line 21
    if-eq v0, v2, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Lcom/tencent/liteav/beauty/d$b;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 29
    .line 30
    invoke-static {v0, p1}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;Lcom/tencent/liteav/beauty/d$b;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 35
    .line 36
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 37
    .line 38
    int-to-double v2, p1

    .line 39
    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    .line 40
    .line 41
    div-double/2addr v2, v4

    .line 42
    double-to-float p1, v2

    .line 43
    invoke-static {v0, p1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;F)F

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_5

    .line 53
    .line 54
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;)Lcom/tencent/liteav/beauty/b/m;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 61
    .line 62
    invoke-static {v0}, Lcom/tencent/liteav/beauty/c;->p(Lcom/tencent/liteav/beauty/c;)F

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/beauty/b/m;->a(F)V

    .line 67
    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 71
    .line 72
    iget p1, p1, Landroid/os/Message;->arg1:I

    .line 73
    .line 74
    invoke-static {v0, p1}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;I)I

    .line 75
    .line 76
    .line 77
    :goto_0
    move p1, v1

    .line 78
    goto :goto_2

    .line 79
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 80
    .line 81
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast p1, [B

    .line 84
    .line 85
    invoke-static {v0, p1}, Lcom/tencent/liteav/beauty/c;->a(Lcom/tencent/liteav/beauty/c;[B)V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    invoke-virtual {p0}, Lcom/tencent/liteav/beauty/c$a;->a()V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 93
    .line 94
    iget-object p1, p1, Lcom/tencent/liteav/beauty/c;->d:Lcom/tencent/liteav/beauty/b/a;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/tencent/liteav/beauty/b/a;->a()V

    .line 97
    .line 98
    .line 99
    :cond_5
    :goto_1
    const/4 p1, 0x0

    .line 100
    goto :goto_2

    .line 101
    :cond_6
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 102
    .line 103
    invoke-direct {p0, p1}, Lcom/tencent/liteav/beauty/c$a;->a(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Lcom/tencent/liteav/beauty/c$a;->a:Lcom/tencent/liteav/beauty/c;

    .line 107
    .line 108
    invoke-static {p1, v1}, Lcom/tencent/liteav/beauty/c;->b(Lcom/tencent/liteav/beauty/c;Z)Z

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :goto_2
    monitor-enter p0

    .line 113
    if-ne v1, p1, :cond_7

    .line 114
    .line 115
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    .line 116
    .line 117
    .line 118
    goto :goto_3

    .line 119
    :catchall_0
    move-exception p1

    .line 120
    goto :goto_4

    .line 121
    :cond_7
    :goto_3
    monitor-exit p0

    .line 122
    return-void

    .line 123
    :goto_4
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    throw p1
.end method
