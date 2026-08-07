.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j$b;
    }
.end annotation


# static fields
.field public static final synthetic p:Z = true


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/Call;

.field public final d:Lcom/tencent/cloud/ai/network/okhttp3/m;

.field public final e:Lcom/tencent/cloud/ai/network/okio/c;

.field public f:Ljava/lang/Object;

.field public g:Lcom/tencent/cloud/ai/network/okhttp3/Request;

.field public h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

.field public i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

.field public j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

.field public k:Z

.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Call;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j$a;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e:Lcom/tencent/cloud/ai/network/okio/c;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 12
    .line 13
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->connectionPool()Lcom/tencent/cloud/ai/network/okhttp3/i;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/i;)Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 24
    .line 25
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->c:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->eventListenerFactory()Lcom/tencent/cloud/ai/network/okhttp3/m$b;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-interface {v1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/m$b;->a(Lcom/tencent/cloud/ai/network/okhttp3/Call;)Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->callTimeoutMillis()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    int-to-long p0, p0

    .line 42
    sget-object p2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/cloud/ai/network/okio/x;->a(JLjava/util/concurrent/TimeUnit;)Lcom/tencent/cloud/ai/network/okio/x;

    .line 45
    .line 46
    .line 47
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ZZLjava/io/IOException;)Ljava/io/IOException;
    .locals 3

    .line 118
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    monitor-enter v0

    .line 119
    :try_start_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    if-eq p1, v1, :cond_0

    .line 120
    monitor-exit v0

    return-object p4

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_0
    const/4 p1, 0x1

    const/4 v2, 0x0

    if-eqz p2, :cond_1

    .line 121
    iget-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->k:Z

    xor-int/2addr p2, p1

    .line 122
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->k:Z

    goto :goto_0

    :cond_1
    move p2, v2

    :goto_0
    if-eqz p3, :cond_3

    .line 123
    iget-boolean p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->l:Z

    if-nez p3, :cond_2

    move p2, p1

    .line 124
    :cond_2
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->l:Z

    .line 125
    :cond_3
    iget-boolean p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->k:Z

    if-eqz p3, :cond_4

    iget-boolean p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->l:Z

    if-eqz p3, :cond_4

    if-eqz p2, :cond_4

    .line 126
    iget-object p2, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    invoke-interface {p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    move-result-object p2

    .line 127
    iget p3, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->m:I

    add-int/2addr p3, p1

    iput p3, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->m:I

    const/4 p2, 0x0

    .line 128
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    goto :goto_1

    :cond_4
    move p1, v2

    .line 129
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_5

    .line 130
    invoke-virtual {p0, p4, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Ljava/io/IOException;Z)Ljava/io/IOException;

    move-result-object p0

    return-object p0

    :cond_5
    return-object p4

    .line 131
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public a(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 2

    .line 132
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    monitor-enter v0

    const/4 v1, 0x1

    .line 133
    :try_start_0
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->o:Z

    .line 134
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, 0x0

    .line 135
    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Ljava/io/IOException;Z)Ljava/io/IOException;

    move-result-object p0

    return-object p0

    :catchall_0
    move-exception p0

    .line 136
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public final a(Ljava/io/IOException;Z)Ljava/io/IOException;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    if-eqz p2, :cond_1

    .line 5
    .line 6
    :try_start_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 12
    .line 13
    const-string p1, "cannot release connection while it is in use"

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    throw p0

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto/16 :goto_4

    .line 21
    .line 22
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 28
    .line 29
    if-nez v3, :cond_3

    .line 30
    .line 31
    if-nez p2, :cond_2

    .line 32
    .line 33
    iget-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->o:Z

    .line 34
    .line 35
    if-eqz p2, :cond_3

    .line 36
    .line 37
    :cond_2
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e()Ljava/net/Socket;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    goto :goto_1

    .line 42
    :cond_3
    move-object p2, v2

    .line 43
    :goto_1
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 44
    .line 45
    if-eqz v3, :cond_4

    .line 46
    .line 47
    move-object v1, v2

    .line 48
    :cond_4
    iget-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->o:Z

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    const/4 v4, 0x1

    .line 52
    if-eqz v2, :cond_5

    .line 53
    .line 54
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 55
    .line 56
    if-nez v2, :cond_5

    .line 57
    .line 58
    move v2, v4

    .line 59
    goto :goto_2

    .line 60
    :cond_5
    move v2, v3

    .line 61
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    invoke-static {p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    .line 63
    .line 64
    .line 65
    if-eqz v1, :cond_6

    .line 66
    .line 67
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 68
    .line 69
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    :cond_6
    if-eqz v2, :cond_c

    .line 73
    .line 74
    if-eqz p1, :cond_7

    .line 75
    .line 76
    move v3, v4

    .line 77
    :cond_7
    iget-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->n:Z

    .line 78
    .line 79
    if-eqz p2, :cond_8

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_8
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e:Lcom/tencent/cloud/ai/network/okio/c;

    .line 83
    .line 84
    invoke-virtual {p2}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 85
    .line 86
    .line 87
    move-result p2

    .line 88
    if-nez p2, :cond_9

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_9
    new-instance p2, Ljava/io/InterruptedIOException;

    .line 92
    .line 93
    const-string v0, "timeout"

    .line 94
    .line 95
    invoke-direct {p2, v0}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    if-eqz p1, :cond_a

    .line 99
    .line 100
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 101
    .line 102
    .line 103
    :cond_a
    move-object p1, p2

    .line 104
    :goto_3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 105
    .line 106
    if-eqz v3, :cond_b

    .line 107
    .line 108
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    .line 110
    .line 111
    return-object p1

    .line 112
    :cond_b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 113
    .line 114
    .line 115
    :cond_c
    return-object p1

    .line 116
    :goto_4
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    throw p0
.end method

.method public a()V
    .locals 3

    .line 142
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    monitor-enter v0

    const/4 v1, 0x1

    .line 143
    :try_start_0
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->m:Z

    .line 144
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 145
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 146
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->a()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    move-result-object p0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 147
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 148
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 149
    iget-object p0, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->cancel()V

    return-void

    :cond_1
    if-eqz p0, :cond_2

    .line 150
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    :cond_2
    return-void

    .line 151
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;)V
    .locals 2

    .line 137
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->p:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    return-void

    .line 138
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    if-nez v0, :cond_2

    .line 139
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 140
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->p:Ljava/util/List;

    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j$b;

    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->f:Ljava/lang/Object;

    invoke-direct {v0, p0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j$b;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Ljava/lang/Object;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 141
    :cond_2
    invoke-static {}, Ll/wpg0;->a()V

    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->o:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 18
    .line 19
    .line 20
    throw p0

    .line 21
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    throw p0
.end method

.method public c()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    monitor-exit v0

    .line 12
    return p0

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    throw p0
.end method

.method public d()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->m:Z

    .line 5
    .line 6
    monitor-exit v0

    .line 7
    return p0

    .line 8
    :catchall_0
    move-exception p0

    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    throw p0
.end method

.method public e()Ljava/net/Socket;
    .locals 5

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->p:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 7
    .line 8
    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->p:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v2, 0x0

    .line 28
    :goto_1
    const/4 v3, -0x1

    .line 29
    if-ge v2, v0, :cond_3

    .line 30
    .line 31
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 32
    .line 33
    iget-object v4, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->p:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Ljava/lang/ref/Reference;

    .line 40
    .line 41
    invoke-virtual {v4}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    if-ne v4, p0, :cond_2

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    move v2, v3

    .line 52
    :goto_2
    if-eq v2, v3, :cond_9

    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 55
    .line 56
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->p:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v3, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 62
    .line 63
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->p:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_8

    .line 70
    .line 71
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 72
    .line 73
    .line 74
    move-result-wide v2

    .line 75
    iput-wide v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->q:J

    .line 76
    .line 77
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 80
    .line 81
    .line 82
    sget-boolean v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->h:Z

    .line 83
    .line 84
    if-nez v2, :cond_5

    .line 85
    .line 86
    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_4

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :cond_4
    invoke-static {}, Ll/aqg0;->a()V

    .line 94
    .line 95
    .line 96
    return-object v1

    .line 97
    :cond_5
    :goto_3
    iget-boolean v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 98
    .line 99
    if-nez v2, :cond_7

    .line 100
    .line 101
    iget v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a:I

    .line 102
    .line 103
    if-nez v2, :cond_6

    .line 104
    .line 105
    goto :goto_4

    .line 106
    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 107
    .line 108
    .line 109
    goto :goto_5

    .line 110
    :cond_7
    :goto_4
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->d:Ljava/util/Deque;

    .line 111
    .line 112
    invoke-interface {p0, v0}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    .line 116
    .line 117
    return-object p0

    .line 118
    :cond_8
    :goto_5
    return-object v1

    .line 119
    :cond_9
    invoke-static {}, Ll/wpg0;->a()V

    .line 120
    .line 121
    .line 122
    return-object v1
.end method
