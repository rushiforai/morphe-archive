.class public final Ll/e0h0;
.super Ltech/sud/base/utils/SudCustomCountdownTimer;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Ll/sgg0;)V
    .locals 1

    .line 1
    const/16 v0, 0x3c

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;-><init>(I)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/e0h0;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final onFinish()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/e0h0;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/sgg0;

    .line 8
    .line 9
    if-eqz p0, :cond_3

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/sgg0;->h()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-wide v2, p0, Ll/sgg0;->r:J

    .line 22
    .line 23
    sub-long/2addr v0, v2

    .line 24
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    const-wide/32 v2, 0xea60

    .line 29
    .line 30
    .line 31
    cmp-long v0, v0, v2

    .line 32
    .line 33
    if-lez v0, :cond_1

    .line 34
    .line 35
    const-string v0, "SudDownloadTask"

    .line 36
    .line 37
    const-string v1, "download timeout"

    .line 38
    .line 39
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    sget-object v0, Ll/sgg0;->u:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/16 v0, -0x283e

    .line 48
    .line 49
    invoke-virtual {p0, v0, v1}, Ll/sgg0;->b(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/sgg0;->m:Ll/ryg0;

    .line 53
    .line 54
    if-eqz v0, :cond_0

    .line 55
    .line 56
    iget-object v0, v0, Ll/ryg0;->b:Ljava/lang/ref/WeakReference;

    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 59
    .line 60
    .line 61
    :cond_0
    iget-object p0, p0, Ll/sgg0;->a:Ll/aug0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/aug0;->n()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_1
    iget-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 68
    .line 69
    if-eqz v0, :cond_2

    .line 70
    .line 71
    iget-object v0, v0, Ll/e0h0;->a:Ljava/lang/ref/WeakReference;

    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 77
    .line 78
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->cancel()V

    .line 79
    .line 80
    .line 81
    const/4 v0, 0x0

    .line 82
    iput-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 83
    .line 84
    :cond_2
    new-instance v0, Ll/e0h0;

    .line 85
    .line 86
    invoke-direct {v0, p0}, Ll/e0h0;-><init>(Ll/sgg0;)V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Ll/sgg0;->n:Ll/e0h0;

    .line 90
    .line 91
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->start()Ltech/sud/base/utils/SudCustomCountdownTimer;

    .line 92
    .line 93
    .line 94
    :cond_3
    return-void
.end method

.method public final onTick(I)V
    .locals 0

    .line 1
    return-void
.end method
