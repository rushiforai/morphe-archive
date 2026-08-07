.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$b;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;
    }
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/Call;

.field public final c:Lcom/tencent/cloud/ai/network/okhttp3/m;

.field public final d:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

.field public final e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;Lcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/m;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->b:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Z)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 1

    .line 106
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    invoke-interface {v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->a(Z)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 107
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    check-cast v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    if-eqz v0, :cond_0

    .line 108
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->initExchange(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)V

    return-object p1

    :catch_0
    move-exception p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    throw p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    return-object p1

    .line 109
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 110
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    invoke-virtual {p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Ljava/io/IOException;)V

    .line 112
    throw p1
.end method

.method public a()Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;
    .locals 7

    .line 113
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 114
    iget-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->n:Z

    if-nez v1, :cond_0

    const/4 v1, 0x1

    .line 115
    iput-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->n:Z

    .line 116
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e:Lcom/tencent/cloud/ai/network/okio/c;

    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/c;->i()Z

    .line 117
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    move-result-object v2

    .line 118
    iget-object v0, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->e:Ljava/net/Socket;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 119
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b()V

    .line 120
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/d;

    iget-object v4, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->i:Lcom/tencent/cloud/ai/network/okio/g;

    iget-object v5, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->j:Lcom/tencent/cloud/ai/network/okio/f;

    const/4 v3, 0x1

    move-object v6, p0

    invoke-direct/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/d;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;ZLcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okio/f;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)V

    return-object v1

    .line 121
    :cond_0
    invoke-static {}, Ll/wpg0;->a()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)Lcom/tencent/cloud/ai/network/okio/v;
    .locals 2

    .line 122
    iput-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->f:Z

    .line 123
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    move-result-object p2

    invoke-virtual {p2}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->contentLength()J

    move-result-wide v0

    .line 124
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 125
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    invoke-interface {p2, p1, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/Request;J)Lcom/tencent/cloud/ai/network/okio/v;

    move-result-object p1

    .line 127
    new-instance p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;

    invoke-direct {p2, p0, p1, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b$a;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;Lcom/tencent/cloud/ai/network/okio/v;J)V

    return-object p2
.end method

.method public a(JZZLjava/io/IOException;)Ljava/io/IOException;
    .locals 0

    if-eqz p5, :cond_0

    .line 128
    invoke-virtual {p0, p5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(Ljava/io/IOException;)V

    :cond_0
    if-eqz p4, :cond_2

    .line 129
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    if-eqz p5, :cond_1

    .line 130
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    .line 131
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_2
    :goto_0
    if-eqz p3, :cond_4

    .line 132
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/m;

    if-eqz p5, :cond_3

    .line 133
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_1

    .line 134
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    invoke-virtual {p1, p0, p4, p3, p5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;ZZLjava/io/IOException;)Ljava/io/IOException;

    move-result-object p0

    return-object p0
.end method

.method public a(Ljava/io/IOException;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/c;->d()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->e:Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;->connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->r:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 17
    .line 18
    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 30
    .line 31
    monitor-enter v0

    .line 32
    :try_start_0
    instance-of v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    if-eqz v1, :cond_3

    .line 36
    .line 37
    check-cast p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;

    .line 38
    .line 39
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 40
    .line 41
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->f:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 42
    .line 43
    if-ne p1, v1, :cond_2

    .line 44
    .line 45
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->n:I

    .line 46
    .line 47
    add-int/2addr p1, v2

    .line 48
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->n:I

    .line 49
    .line 50
    if-le p1, v2, :cond_5

    .line 51
    .line 52
    iput-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 53
    .line 54
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->l:I

    .line 55
    .line 56
    add-int/2addr p1, v2

    .line 57
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->l:I

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_2

    .line 62
    :cond_2
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 63
    .line 64
    if-eq p1, v1, :cond_5

    .line 65
    .line 66
    iput-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 67
    .line 68
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->l:I

    .line 69
    .line 70
    add-int/2addr p1, v2

    .line 71
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->l:I

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->a()Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_4

    .line 79
    .line 80
    instance-of v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/a;

    .line 81
    .line 82
    if-eqz v1, :cond_5

    .line 83
    .line 84
    :cond_4
    iput-boolean v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->k:Z

    .line 85
    .line 86
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->m:I

    .line 87
    .line 88
    if-nez v1, :cond_5

    .line 89
    .line 90
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 91
    .line 92
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 93
    .line 94
    invoke-virtual {v1, v3, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/s;Ljava/io/IOException;)V

    .line 95
    .line 96
    .line 97
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->l:I

    .line 98
    .line 99
    add-int/2addr p1, v2

    .line 100
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->l:I

    .line 101
    .line 102
    :cond_5
    :goto_1
    monitor-exit v0

    .line 103
    return-void

    .line 104
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    throw p0
.end method
