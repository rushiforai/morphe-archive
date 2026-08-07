.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/v;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# static fields
.field public static final synthetic e:Z = true


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/e;

.field public b:Z

.field public c:Z

.field public final synthetic d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lcom/tencent/cloud/ai/network/okio/e;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 12

    .line 1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/c;->h()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 9
    .line 10
    .line 11
    :goto_0
    :try_start_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 12
    .line 13
    iget-wide v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    .line 14
    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    cmp-long v2, v2, v4

    .line 18
    .line 19
    if-gtz v2, :cond_0

    .line 20
    .line 21
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->c:Z

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->b:Z

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 30
    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->f()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    move-object p1, v0

    .line 39
    goto :goto_4

    .line 40
    :cond_0
    :try_start_2
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 51
    .line 52
    iget-wide v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 55
    .line 56
    iget-wide v4, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 57
    .line 58
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 59
    .line 60
    .line 61
    move-result-wide v10

    .line 62
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 63
    .line 64
    iget-wide v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    .line 65
    .line 66
    sub-long/2addr v2, v10

    .line 67
    iput-wide v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    .line 68
    .line 69
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 70
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/c;->h()V

    .line 73
    .line 74
    .line 75
    if-eqz p1, :cond_1

    .line 76
    .line 77
    :try_start_3
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 78
    .line 79
    iget-wide v0, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 80
    .line 81
    cmp-long p1, v10, v0

    .line 82
    .line 83
    if-nez p1, :cond_1

    .line 84
    .line 85
    const/4 p1, 0x1

    .line 86
    :goto_1
    move v8, p1

    .line 87
    goto :goto_2

    .line 88
    :catchall_1
    move-exception v0

    .line 89
    move-object p1, v0

    .line 90
    goto :goto_3

    .line 91
    :cond_1
    const/4 p1, 0x0

    .line 92
    goto :goto_1

    .line 93
    :goto_2
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 94
    .line 95
    iget-object v6, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 96
    .line 97
    iget v7, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 98
    .line 99
    iget-object v9, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 100
    .line 101
    invoke-virtual/range {v6 .. v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(IZLcom/tencent/cloud/ai/network/okio/e;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 105
    .line 106
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 107
    .line 108
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :goto_3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 113
    .line 114
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 115
    .line 116
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 117
    .line 118
    .line 119
    throw p1

    .line 120
    :catchall_2
    move-exception v0

    .line 121
    move-object p0, v0

    .line 122
    goto :goto_5

    .line 123
    :goto_4
    :try_start_4
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 124
    .line 125
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 128
    .line 129
    .line 130
    throw p1

    .line 131
    :goto_5
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 132
    throw p0
.end method

.method public close()V
    .locals 13

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 19
    .line 20
    monitor-enter v1

    .line 21
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->b:Z

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    monitor-exit v1

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    move-object p0, v0

    .line 29
    goto :goto_2

    .line 30
    :cond_2
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 32
    .line 33
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    .line 34
    .line 35
    iget-boolean v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->c:Z

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    if-nez v1, :cond_4

    .line 39
    .line 40
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 41
    .line 42
    iget-wide v3, v1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 43
    .line 44
    const-wide/16 v5, 0x0

    .line 45
    .line 46
    cmp-long v1, v3, v5

    .line 47
    .line 48
    if-lez v1, :cond_3

    .line 49
    .line 50
    :goto_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 51
    .line 52
    iget-wide v0, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 53
    .line 54
    cmp-long v0, v0, v5

    .line 55
    .line 56
    if-lez v0, :cond_4

    .line 57
    .line 58
    invoke-virtual {p0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a(Z)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    iget-object v7, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 63
    .line 64
    iget v8, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 65
    .line 66
    const/4 v10, 0x0

    .line 67
    const-wide/16 v11, 0x0

    .line 68
    .line 69
    const/4 v9, 0x1

    .line 70
    invoke-virtual/range {v7 .. v12}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(IZLcom/tencent/cloud/ai/network/okio/e;J)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 74
    .line 75
    monitor-enter v3

    .line 76
    :try_start_1
    iput-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->b:Z

    .line 77
    .line 78
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 79
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 80
    .line 81
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 82
    .line 83
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->flush()V

    .line 84
    .line 85
    .line 86
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :catchall_1
    move-exception v0

    .line 93
    move-object p0, v0

    .line 94
    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 95
    throw p0

    .line 96
    :goto_2
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 97
    throw p0
.end method

.method public flush()V
    .locals 4

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 19
    .line 20
    monitor-enter v0

    .line 21
    :try_start_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b()V

    .line 24
    .line 25
    .line 26
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    :goto_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 28
    .line 29
    iget-wide v0, v0, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 30
    .line 31
    const-wide/16 v2, 0x0

    .line 32
    .line 33
    cmp-long v0, v0, v2

    .line 34
    .line 35
    if-lez v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x0

    .line 38
    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a(Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->flush()V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    return-void

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw p0
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 4
    .line 5
    return-object p0
.end method

.method public write(Lcom/tencent/cloud/ai/network/okio/e;J)V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 19
    .line 20
    invoke-virtual {v0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->write(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 21
    .line 22
    .line 23
    :goto_1
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 24
    .line 25
    iget-wide p1, p1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 26
    .line 27
    const-wide/16 v0, 0x4000

    .line 28
    .line 29
    cmp-long p1, p1, v0

    .line 30
    .line 31
    if-ltz p1, :cond_2

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->a(Z)V

    .line 35
    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    return-void
.end method
