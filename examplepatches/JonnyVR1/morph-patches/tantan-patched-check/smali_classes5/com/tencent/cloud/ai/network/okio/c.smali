.class public Lcom/tencent/cloud/ai/network/okio/c;
.super Lcom/tencent/cloud/ai/network/okio/x;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okio/c$a;
    }
.end annotation


# static fields
.field public static final h:J

.field public static final i:J

.field public static j:Lcom/tencent/cloud/ai/network/okio/c;


# instance fields
.field public e:Z

.field public f:Lcom/tencent/cloud/ai/network/okio/c;

.field public g:J


# direct methods
.method public static constructor <clinit>()V
    .locals 3

    .line 1
    const-wide/32 v0, 0xea60

    .line 2
    .line 3
    .line 4
    sput-wide v0, Lcom/tencent/cloud/ai/network/okio/c;->h:J

    .line 5
    .line 6
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 7
    .line 8
    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    sput-wide v0, Lcom/tencent/cloud/ai/network/okio/c;->i:J

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okio/x;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g()Lcom/tencent/cloud/ai/network/okio/c;
    .locals 9

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 4
    .line 5
    const-class v1, Lcom/tencent/cloud/ai/network/okio/c;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    sget-wide v5, Lcom/tencent/cloud/ai/network/okio/c;->h:J

    .line 15
    .line 16
    invoke-virtual {v1, v5, v6}, Ljava/lang/Object;->wait(J)V

    .line 17
    .line 18
    .line 19
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 22
    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    sub-long/2addr v0, v3

    .line 30
    sget-wide v3, Lcom/tencent/cloud/ai/network/okio/c;->i:J

    .line 31
    .line 32
    cmp-long v0, v0, v3

    .line 33
    .line 34
    if-ltz v0, :cond_0

    .line 35
    .line 36
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_0
    return-object v2

    .line 40
    :cond_1
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    iget-wide v5, v0, Lcom/tencent/cloud/ai/network/okio/c;->g:J

    .line 45
    .line 46
    sub-long/2addr v5, v3

    .line 47
    const-wide/16 v3, 0x0

    .line 48
    .line 49
    cmp-long v3, v5, v3

    .line 50
    .line 51
    if-lez v3, :cond_2

    .line 52
    .line 53
    const-wide/32 v3, 0xf4240

    .line 54
    .line 55
    .line 56
    div-long v7, v5, v3

    .line 57
    .line 58
    mul-long/2addr v3, v7

    .line 59
    sub-long/2addr v5, v3

    .line 60
    long-to-int v0, v5

    .line 61
    invoke-virtual {v1, v7, v8, v0}, Ljava/lang/Object;->wait(JI)V

    .line 62
    .line 63
    .line 64
    return-object v2

    .line 65
    :cond_2
    sget-object v1, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 66
    .line 67
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 68
    .line 69
    iput-object v3, v1, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 70
    .line 71
    iput-object v2, v0, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 72
    .line 73
    return-object v0
.end method


# virtual methods
.method public a(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 1

    .line 17
    new-instance p0, Ljava/io/InterruptedIOException;

    const-string v0, "timeout"

    invoke-direct {p0, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    :cond_0
    return-object p0
.end method

.method public final a(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okio/c;->a(Ljava/io/IOException;)Ljava/io/IOException;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    throw p0

    .line 16
    :cond_1
    :goto_0
    return-void
.end method

.method public final h()V
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/c;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_8

    .line 4
    .line 5
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/x;->c:J

    .line 6
    .line 7
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okio/x;->a:Z

    .line 8
    .line 9
    const-wide/16 v3, 0x0

    .line 10
    .line 11
    cmp-long v3, v0, v3

    .line 12
    .line 13
    if-nez v3, :cond_0

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    const/4 v4, 0x1

    .line 19
    iput-boolean v4, p0, Lcom/tencent/cloud/ai/network/okio/c;->e:Z

    .line 20
    .line 21
    const-class v4, Lcom/tencent/cloud/ai/network/okio/c;

    .line 22
    .line 23
    monitor-enter v4

    .line 24
    :try_start_0
    sget-object v5, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 25
    .line 26
    if-nez v5, :cond_1

    .line 27
    .line 28
    new-instance v5, Lcom/tencent/cloud/ai/network/okio/c;

    .line 29
    .line 30
    invoke-direct {v5}, Lcom/tencent/cloud/ai/network/okio/c;-><init>()V

    .line 31
    .line 32
    .line 33
    sput-object v5, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 34
    .line 35
    new-instance v5, Lcom/tencent/cloud/ai/network/okio/c$a;

    .line 36
    .line 37
    invoke-direct {v5}, Lcom/tencent/cloud/ai/network/okio/c$a;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_4

    .line 46
    :cond_1
    :goto_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v5

    .line 50
    if-eqz v3, :cond_2

    .line 51
    .line 52
    if-eqz v2, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->c()J

    .line 55
    .line 56
    .line 57
    move-result-wide v2

    .line 58
    sub-long/2addr v2, v5

    .line 59
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 60
    .line 61
    .line 62
    move-result-wide v0

    .line 63
    add-long/2addr v0, v5

    .line 64
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/c;->g:J

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_2
    if-eqz v3, :cond_3

    .line 68
    .line 69
    add-long/2addr v0, v5

    .line 70
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/c;->g:J

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    if-eqz v2, :cond_7

    .line 74
    .line 75
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->c()J

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/c;->g:J

    .line 80
    .line 81
    :goto_1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okio/c;->g:J

    .line 82
    .line 83
    sub-long/2addr v0, v5

    .line 84
    sget-object v2, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 85
    .line 86
    :goto_2
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 87
    .line 88
    if-eqz v3, :cond_5

    .line 89
    .line 90
    iget-wide v7, v3, Lcom/tencent/cloud/ai/network/okio/c;->g:J

    .line 91
    .line 92
    sub-long/2addr v7, v5

    .line 93
    cmp-long v7, v0, v7

    .line 94
    .line 95
    if-gez v7, :cond_4

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_4
    move-object v2, v3

    .line 99
    goto :goto_2

    .line 100
    :cond_5
    :goto_3
    iput-object v3, p0, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 101
    .line 102
    iput-object p0, v2, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 103
    .line 104
    sget-object p0, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 105
    .line 106
    if-ne v2, p0, :cond_6

    .line 107
    .line 108
    const-class p0, Lcom/tencent/cloud/ai/network/okio/c;

    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 111
    .line 112
    .line 113
    :cond_6
    monitor-exit v4

    .line 114
    return-void

    .line 115
    :cond_7
    :try_start_1
    new-instance p0, Ljava/lang/AssertionError;

    .line 116
    .line 117
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 118
    .line 119
    .line 120
    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    :goto_4
    monitor-exit v4

    .line 122
    throw p0

    .line 123
    :cond_8
    const-string p0, "Unbalanced enter/exit"

    .line 124
    .line 125
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public final i()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/c;->e:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okio/c;->e:Z

    .line 8
    .line 9
    const-class v0, Lcom/tencent/cloud/ai/network/okio/c;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    sget-object v2, Lcom/tencent/cloud/ai/network/okio/c;->j:Lcom/tencent/cloud/ai/network/okio/c;

    .line 13
    .line 14
    :goto_0
    if-eqz v2, :cond_2

    .line 15
    .line 16
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 17
    .line 18
    if-ne v3, p0, :cond_1

    .line 19
    .line 20
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 21
    .line 22
    iput-object v3, v2, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    iput-object v2, p0, Lcom/tencent/cloud/ai/network/okio/c;->f:Lcom/tencent/cloud/ai/network/okio/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return v1

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move-object v2, v3

    .line 32
    goto :goto_0

    .line 33
    :cond_2
    monitor-exit v0

    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :goto_1
    monitor-exit v0

    .line 37
    throw p0
.end method

.method public j()V
    .locals 0

    return-void
.end method
