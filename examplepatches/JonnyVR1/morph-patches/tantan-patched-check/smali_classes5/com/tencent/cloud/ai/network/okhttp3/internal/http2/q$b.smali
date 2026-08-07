.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/w;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation


# static fields
.field public static final synthetic h:Z = true


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okio/e;

.field public final b:Lcom/tencent/cloud/ai/network/okio/e;

.field public final c:J

.field public d:Lcom/tencent/cloud/ai/network/okhttp3/o;

.field public e:Z

.field public f:Z

.field public final synthetic g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

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
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 12
    .line 13
    new-instance p1, Lcom/tencent/cloud/ai/network/okio/e;

    .line 14
    .line 15
    invoke-direct {p1}, Lcom/tencent/cloud/ai/network/okio/e;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->b:Lcom/tencent/cloud/ai/network/okio/e;

    .line 19
    .line 20
    iput-wide p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->c:J

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p2, v0

    .line 4
    .line 5
    if-ltz v2, :cond_8

    .line 6
    .line 7
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 8
    .line 9
    monitor-enter v2

    .line 10
    :try_start_0
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 11
    .line 12
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 13
    .line 14
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/c;->h()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    .line 16
    .line 17
    :try_start_1
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 18
    .line 19
    iget-object v4, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 20
    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->l:Ljava/io/IOException;

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;

    .line 29
    .line 30
    invoke-direct {v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/v;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto/16 :goto_3

    .line 36
    .line 37
    :cond_1
    const/4 v3, 0x0

    .line 38
    :goto_1
    iget-boolean v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->e:Z

    .line 39
    .line 40
    if-nez v4, :cond_7

    .line 41
    .line 42
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->b:Lcom/tencent/cloud/ai/network/okio/e;

    .line 43
    .line 44
    iget-wide v5, v4, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 45
    .line 46
    cmp-long v7, v5, v0

    .line 47
    .line 48
    const-wide/16 v8, -0x1

    .line 49
    .line 50
    if-lez v7, :cond_2

    .line 51
    .line 52
    invoke-static {p2, p3, v5, v6}, Ljava/lang/Math;->min(JJ)J

    .line 53
    .line 54
    .line 55
    move-result-wide p2

    .line 56
    invoke-virtual {v4, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 57
    .line 58
    .line 59
    move-result-wide p1

    .line 60
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 61
    .line 62
    iget-wide v4, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a:J

    .line 63
    .line 64
    add-long/2addr v4, p1

    .line 65
    iput-wide v4, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a:J

    .line 66
    .line 67
    if-nez v3, :cond_4

    .line 68
    .line 69
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 70
    .line 71
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->s:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 72
    .line 73
    invoke-virtual {p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    div-int/lit8 p3, p3, 0x2

    .line 78
    .line 79
    int-to-long v6, p3

    .line 80
    cmp-long p3, v4, v6

    .line 81
    .line 82
    if-ltz p3, :cond_4

    .line 83
    .line 84
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 85
    .line 86
    iget-object v4, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 87
    .line 88
    iget v5, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->c:I

    .line 89
    .line 90
    iget-wide v6, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a:J

    .line 91
    .line 92
    invoke-virtual {v4, v5, v6, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(IJ)V

    .line 93
    .line 94
    .line 95
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 96
    .line 97
    iput-wide v0, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a:J

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_2
    iget-boolean v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->f:Z

    .line 101
    .line 102
    if-nez v4, :cond_3

    .line 103
    .line 104
    if-nez v3, :cond_3

    .line 105
    .line 106
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 107
    .line 108
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->f()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    .line 110
    .line 111
    :try_start_2
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 112
    .line 113
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 114
    .line 115
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 116
    .line 117
    .line 118
    monitor-exit v2

    .line 119
    goto :goto_0

    .line 120
    :catchall_1
    move-exception p0

    .line 121
    goto :goto_4

    .line 122
    :cond_3
    move-wide p1, v8

    .line 123
    :cond_4
    :goto_2
    iget-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 124
    .line 125
    iget-object p3, p3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 126
    .line 127
    invoke-virtual {p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 128
    .line 129
    .line 130
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 131
    cmp-long p3, p1, v8

    .line 132
    .line 133
    if-eqz p3, :cond_5

    .line 134
    .line 135
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->h(J)V

    .line 136
    .line 137
    .line 138
    return-wide p1

    .line 139
    :cond_5
    if-nez v3, :cond_6

    .line 140
    .line 141
    return-wide v8

    .line 142
    :cond_6
    throw v3

    .line 143
    :cond_7
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    .line 144
    .line 145
    const-string p2, "stream closed"

    .line 146
    .line 147
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 151
    :goto_3
    :try_start_4
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 152
    .line 153
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;->k()V

    .line 156
    .line 157
    .line 158
    throw p1

    .line 159
    :goto_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 160
    throw p0

    .line 161
    :cond_8
    const-string p0, "byteCount < 0: "

    .line 162
    .line 163
    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 164
    .line 165
    .line 166
    return-wide v0
.end method

.method public close()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->e:Z

    .line 6
    .line 7
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->b:Lcom/tencent/cloud/ai/network/okio/e;

    .line 8
    .line 9
    iget-wide v2, v1, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/e;->k()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 17
    .line 18
    .line 19
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    const-wide/16 v0, 0x0

    .line 21
    .line 22
    cmp-long v0, v2, v0

    .line 23
    .line 24
    if-lez v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->h(J)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->a()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0
.end method

.method public final h(J)V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

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
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->h(J)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$b;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q$c;

    .line 4
    .line 5
    return-object p0
.end method
