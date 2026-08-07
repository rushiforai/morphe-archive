.class public final Ll/crg0;
.super Ltech/sud/base/utils/SudCustomCountdownTimer;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Ll/tng0;)V
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
    iput-object v0, p0, Ll/crg0;->a:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final onFinish()V
    .locals 4

    .line 1
    iget-object p0, p0, Ll/crg0;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/tng0;

    .line 8
    .line 9
    if-eqz p0, :cond_4

    .line 10
    .line 11
    iget-object v0, p0, Ll/tng0;->d:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 12
    .line 13
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_STARTED:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_DOWNLOADING:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 18
    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    sget-object v1, Ltech/sud/gip/core/PkgDownloadStatus;->PKG_DOWNLOAD_CHECK_FILE:Ltech/sud/gip/core/PkgDownloadStatus;

    .line 22
    .line 23
    if-ne v0, v1, :cond_4

    .line 24
    .line 25
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    iget-wide v2, p0, Ll/tng0;->k:J

    .line 30
    .line 31
    sub-long/2addr v0, v2

    .line 32
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    const-wide/32 v2, 0xea60

    .line 37
    .line 38
    .line 39
    cmp-long v0, v0, v2

    .line 40
    .line 41
    if-lez v0, :cond_2

    .line 42
    .line 43
    const-string v0, "DownloadFileTask"

    .line 44
    .line 45
    const-string v1, "download timeout"

    .line 46
    .line 47
    invoke-static {v0, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    sget-object v0, Ll/tng0;->m:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0, v1}, Ltech/sud/gip/logger/SudLogger;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    const/16 v0, -0x283e

    .line 56
    .line 57
    invoke-virtual {p0, v0, v1}, Ll/tng0;->a(ILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/tng0;->f:Ll/rjg0;

    .line 61
    .line 62
    if-eqz v0, :cond_1

    .line 63
    .line 64
    iget-object v0, v0, Ll/rjg0;->b:Ljava/lang/ref/WeakReference;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 67
    .line 68
    .line 69
    :cond_1
    iget-object p0, p0, Ll/tng0;->a:Ll/aug0;

    .line 70
    .line 71
    invoke-virtual {p0}, Ll/aug0;->n()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    iget-object v0, p0, Ll/tng0;->g:Ll/crg0;

    .line 76
    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    iget-object v0, v0, Ll/crg0;->a:Ljava/lang/ref/WeakReference;

    .line 80
    .line 81
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Ll/tng0;->g:Ll/crg0;

    .line 85
    .line 86
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->cancel()V

    .line 87
    .line 88
    .line 89
    const/4 v0, 0x0

    .line 90
    iput-object v0, p0, Ll/tng0;->g:Ll/crg0;

    .line 91
    .line 92
    :cond_3
    new-instance v0, Ll/crg0;

    .line 93
    .line 94
    invoke-direct {v0, p0}, Ll/crg0;-><init>(Ll/tng0;)V

    .line 95
    .line 96
    .line 97
    iput-object v0, p0, Ll/tng0;->g:Ll/crg0;

    .line 98
    .line 99
    invoke-virtual {v0}, Ltech/sud/base/utils/SudCustomCountdownTimer;->start()Ltech/sud/base/utils/SudCustomCountdownTimer;

    .line 100
    .line 101
    .line 102
    :cond_4
    return-void
.end method

.method public final onTick(I)V
    .locals 0

    .line 1
    return-void
.end method
