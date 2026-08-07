.class Lcom/tencent/liteav/b$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/liteav/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/liteav/b;

.field private b:I

.field private c:J


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/b;Landroid/os/Looper;IJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/b$a;->a:Lcom/tencent/liteav/b;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    iput p3, p0, Lcom/tencent/liteav/b$a;->b:I

    .line 7
    .line 8
    iput-wide p4, p0, Lcom/tencent/liteav/b$a;->c:J

    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/liteav/b;->c()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance p2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string p3, "bkgpush:init publish time delay:"

    .line 17
    .line 18
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget p3, p0, Lcom/tencent/liteav/b$a;->b:I

    .line 22
    .line 23
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p3, ", end:"

    .line 27
    .line 28
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-wide p3, p0, Lcom/tencent/liteav/b$a;->c:J

    .line 32
    .line 33
    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 5

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v0, 0x3e9

    .line 4
    .line 5
    if-ne p1, v0, :cond_3

    .line 6
    .line 7
    :try_start_0
    iget-object p1, p0, Lcom/tencent/liteav/b$a;->a:Lcom/tencent/liteav/b;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tencent/liteav/b;->a(Lcom/tencent/liteav/b;)V

    .line 10
    .line 11
    .line 12
    iget-wide v1, p0, Lcom/tencent/liteav/b$a;->c:J

    .line 13
    .line 14
    const-wide/16 v3, 0x0

    .line 15
    .line 16
    cmp-long p1, v1, v3

    .line 17
    .line 18
    if-ltz p1, :cond_2

    .line 19
    .line 20
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    iget-wide v3, p0, Lcom/tencent/liteav/b$a;->c:J

    .line 25
    .line 26
    cmp-long p1, v1, v3

    .line 27
    .line 28
    if-gez p1, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-static {}, Lcom/tencent/liteav/b;->c()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    const-string v0, "bkgpush:stop background publish when timeout"

    .line 36
    .line 37
    invoke-static {p1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Lcom/tencent/liteav/b$a;->a:Lcom/tencent/liteav/b;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/tencent/liteav/b;->b(Lcom/tencent/liteav/b;)Ljava/lang/ref/WeakReference;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    iget-object p1, p0, Lcom/tencent/liteav/b$a;->a:Lcom/tencent/liteav/b;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/tencent/liteav/b;->c(Lcom/tencent/liteav/b;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_3

    .line 55
    .line 56
    iget-object p1, p0, Lcom/tencent/liteav/b$a;->a:Lcom/tencent/liteav/b;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/tencent/liteav/b;->b(Lcom/tencent/liteav/b;)Ljava/lang/ref/WeakReference;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/tencent/liteav/b$b;

    .line 67
    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    invoke-interface {p1}, Lcom/tencent/liteav/b$b;->a()V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object p0, p0, Lcom/tencent/liteav/b$a;->a:Lcom/tencent/liteav/b;

    .line 74
    .line 75
    const/4 p1, 0x0

    .line 76
    invoke-static {p0, p1}, Lcom/tencent/liteav/b;->a(Lcom/tencent/liteav/b;Z)Z

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_2
    :goto_0
    iget p1, p0, Lcom/tencent/liteav/b$a;->b:I

    .line 81
    .line 82
    int-to-long v1, p1

    .line 83
    invoke-virtual {p0, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :catch_0
    move-exception p0

    .line 88
    invoke-static {}, Lcom/tencent/liteav/b;->c()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    .line 93
    .line 94
    const-string v1, "publish image failed."

    .line 95
    .line 96
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_3
    return-void
.end method
