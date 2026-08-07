.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;
    }
.end annotation


# static fields
.field public static final synthetic m:Z = true


# instance fields
.field public a:J

.field public b:J

.field public final c:I

.field public final d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

.field public final e:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/tencent/cloud/ai/network/okhttp3/o;",
            ">;"
        }
    .end annotation
.end field

.field public f:Z

.field public final g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

.field public final h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

.field public final i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

.field public final j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

.field public k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

.field public l:Ljava/io/IOException;


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;ZZLcom/tencent/cloud/ai/network/okhttp3/o;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a:J

    .line 7
    .line 8
    new-instance v0, Ljava/util/ArrayDeque;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->e:Ljava/util/Deque;

    .line 14
    .line 15
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 21
    .line 22
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;)V

    .line 25
    .line 26
    .line 27
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->j:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 28
    .line 29
    const/4 v1, 0x0

    .line 30
    if-eqz p2, :cond_5

    .line 31
    .line 32
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 33
    .line 34
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 35
    .line 36
    iget-object p1, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->t:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    int-to-long v2, p1

    .line 43
    iput-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    .line 44
    .line 45
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 46
    .line 47
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->s:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a()I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    int-to-long v2, p2

    .line 54
    invoke-direct {p1, p0, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;J)V

    .line 55
    .line 56
    .line 57
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 58
    .line 59
    new-instance p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    .line 60
    .line 61
    invoke-direct {p2, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;)V

    .line 62
    .line 63
    .line 64
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    .line 65
    .line 66
    iput-boolean p4, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->f:Z

    .line 67
    .line 68
    iput-boolean p3, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->c:Z

    .line 69
    .line 70
    if-eqz p5, :cond_0

    .line 71
    .line 72
    invoke-interface {v0, p5}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    if-nez p5, :cond_1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    const-string p0, "locally-initiated streams shouldn\'t have headers yet"

    .line 85
    .line 86
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    throw v1

    .line 90
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d()Z

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    if-nez p0, :cond_4

    .line 95
    .line 96
    if-eqz p5, :cond_3

    .line 97
    .line 98
    return-void

    .line 99
    :cond_3
    const-string p0, "remotely-initiated streams should have headers"

    .line 100
    .line 101
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    throw v1

    .line 105
    :cond_4
    return-void

    .line 106
    :cond_5
    const-string p0, "connection == null"

    .line 107
    .line 108
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    throw v1
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    monitor-enter p0

    .line 17
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 18
    .line 19
    iget-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->f:Z

    .line 20
    .line 21
    if-nez v1, :cond_3

    .line 22
    .line 23
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->e:Z

    .line 24
    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    .line 28
    .line 29
    iget-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->c:Z

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->b:Z

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :catchall_0
    move-exception v0

    .line 39
    goto :goto_3

    .line 40
    :cond_2
    :goto_1
    const/4 v0, 0x1

    .line 41
    goto :goto_2

    .line 42
    :cond_3
    const/4 v0, 0x0

    .line 43
    :goto_2
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->e()Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_4
    if-nez v1, :cond_5

    .line 58
    .line 59
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 60
    .line 61
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 62
    .line 63
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->e(I)Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 64
    .line 65
    .line 66
    :cond_5
    return-void

    .line 67
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    throw v0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    invoke-virtual {v0, p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    return-void
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)V
    .locals 0

    .line 84
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)Z

    move-result p2

    if-nez p2, :cond_0

    return-void

    .line 85
    :cond_0
    iget-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 86
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    invoke-virtual {p2, p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a(ILcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    return-void
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/o;Z)V
    .locals 2

    .line 71
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->m:Z

    if-nez v0, :cond_1

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    return-void

    .line 72
    :cond_1
    :goto_0
    monitor-enter p0

    .line 73
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->f:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    if-nez p2, :cond_2

    goto :goto_1

    .line 74
    :cond_2
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 75
    iput-object p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->d:Lcom/tencent/cloud/ai/network/okhttp3/o;

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    .line 76
    :cond_3
    :goto_1
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->f:Z

    .line 77
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->e:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    :goto_2
    if-eqz p2, :cond_4

    .line 78
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    iput-boolean v1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->f:Z

    .line 79
    :cond_4
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->e()Z

    move-result p1

    .line 80
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 81
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_5

    .line 82
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->e(I)Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    :cond_5
    return-void

    .line 83
    :goto_3
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public b()V
    .locals 2

    .line 60
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    iget-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->b:Z

    if-nez v1, :cond_3

    .line 61
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->c:Z

    if-nez v0, :cond_2

    .line 62
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    if-eqz v0, :cond_1

    .line 63
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->l:Ljava/io/IOException;

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;

    invoke-direct {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    :goto_0
    throw p0

    :cond_1
    return-void

    .line 64
    :cond_2
    const-string p0, "stream finished"

    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    return-void

    .line 65
    :cond_3
    const-string p0, "stream closed"

    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    return-void
.end method

.method public final b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)Z
    .locals 2

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->m:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    monitor-enter p0

    .line 18
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return v1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_1

    .line 27
    :cond_2
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 28
    .line 29
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->f:Z

    .line 30
    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    .line 34
    .line 35
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->c:Z

    .line 36
    .line 37
    if-eqz v0, :cond_3

    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return v1

    .line 41
    :cond_3
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 42
    .line 43
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->l:Ljava/io/IOException;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 46
    .line 47
    .line 48
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 50
    .line 51
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 52
    .line 53
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->e(I)Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 54
    .line 55
    .line 56
    const/4 p0, 0x1

    .line 57
    return p0

    .line 58
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    throw p1
.end method

.method public c()Lcom/tencent/cloud/ai/network/okio/v;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->f:Z

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 14
    .line 15
    const-string v1, "reply before requesting the sink"

    .line 16
    .line 17
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    throw v0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_1

    .line 23
    :cond_1
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    .line 25
    .line 26
    return-object p0

    .line 27
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw v0
.end method

.method public d()Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    and-int/2addr v0, v1

    .line 5
    const/4 v2, 0x0

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    move v0, v1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v0, v2

    .line 11
    :goto_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a:Z

    .line 14
    .line 15
    if-ne p0, v0, :cond_1

    .line 16
    .line 17
    return v1

    .line 18
    :cond_1
    return v2
.end method

.method public declared-synchronized e()Z
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return v1

    .line 9
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;

    .line 10
    .line 11
    iget-boolean v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->f:Z

    .line 12
    .line 13
    if-nez v2, :cond_1

    .line 14
    .line 15
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->e:Z

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;

    .line 23
    .line 24
    iget-boolean v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->c:Z

    .line 25
    .line 26
    if-nez v2, :cond_2

    .line 27
    .line 28
    iget-boolean v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$a;->b:Z

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    :cond_2
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->f:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    monitor-exit p0

    .line 37
    return v1

    .line 38
    :cond_3
    monitor-exit p0

    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 42
    throw v0
.end method

.method public f()V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/io/InterruptedIOException;

    .line 13
    .line 14
    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    .line 15
    .line 16
    .line 17
    throw p0
.end method
