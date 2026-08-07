.class public final Ll/gml$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lokio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "b"
.end annotation


# instance fields
.field public final a:Lokio/Buffer;

.field public final b:Lokio/Buffer;

.field public final c:J

.field public d:Ll/e0l;

.field public e:Z

.field public f:Z

.field public final synthetic g:Ll/gml;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/gml;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gml$b;->g:Ll/gml;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Lokio/Buffer;

    .line 7
    .line 8
    invoke-direct {p1}, Lokio/Buffer;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/gml$b;->a:Lokio/Buffer;

    .line 12
    .line 13
    new-instance p1, Lokio/Buffer;

    .line 14
    .line 15
    invoke-direct {p1}, Lokio/Buffer;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Ll/gml$b;->b:Lokio/Buffer;

    .line 19
    .line 20
    iput-wide p2, p0, Ll/gml$b;->c:J

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic b(Ll/gml$b;Ll/e0l;)Ll/e0l;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gml$b;->d:Ll/e0l;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public close()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gml$b;->g:Ll/gml;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    const/4 v1, 0x1

    .line 5
    :try_start_0
    iput-boolean v1, p0, Ll/gml$b;->e:Z

    .line 6
    .line 7
    iget-object v1, p0, Ll/gml$b;->b:Lokio/Buffer;

    .line 8
    .line 9
    invoke-virtual {v1}, Lokio/Buffer;->size()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    iget-object v3, p0, Ll/gml$b;->b:Lokio/Buffer;

    .line 14
    .line 15
    invoke-virtual {v3}, Lokio/Buffer;->clear()V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Ll/gml$b;->g:Ll/gml;

    .line 19
    .line 20
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 21
    .line 22
    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    const-wide/16 v3, 0x0

    .line 25
    .line 26
    cmp-long v0, v1, v3

    .line 27
    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0, v1, v2}, Ll/gml$b;->h(J)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Ll/gml$b;->g:Ll/gml;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/gml;->b()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw p0
.end method

.method public d(Lokio/BufferedSource;J)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    :cond_0
    :goto_0
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p2, v0

    .line 4
    .line 5
    if-lez v2, :cond_8

    .line 6
    .line 7
    iget-object v2, p0, Ll/gml$b;->g:Ll/gml;

    .line 8
    .line 9
    monitor-enter v2

    .line 10
    :try_start_0
    iget-boolean v3, p0, Ll/gml$b;->f:Z

    .line 11
    .line 12
    iget-object v4, p0, Ll/gml$b;->b:Lokio/Buffer;

    .line 13
    .line 14
    invoke-virtual {v4}, Lokio/Buffer;->size()J

    .line 15
    .line 16
    .line 17
    move-result-wide v4

    .line 18
    add-long/2addr v4, p2

    .line 19
    iget-wide v6, p0, Ll/gml$b;->c:J

    .line 20
    .line 21
    cmp-long v4, v4, v6

    .line 22
    .line 23
    const/4 v5, 0x0

    .line 24
    const/4 v6, 0x1

    .line 25
    if-lez v4, :cond_1

    .line 26
    .line 27
    move v4, v6

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v4, v5

    .line 30
    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 31
    if-eqz v4, :cond_2

    .line 32
    .line 33
    invoke-interface {p1, p2, p3}, Lokio/BufferedSource;->skip(J)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/gml$b;->g:Ll/gml;

    .line 37
    .line 38
    sget-object p1, Lokhttp3/internal/http2/ErrorCode;->FLOW_CONTROL_ERROR:Lokhttp3/internal/http2/ErrorCode;

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ll/gml;->f(Lokhttp3/internal/http2/ErrorCode;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    if-eqz v3, :cond_3

    .line 45
    .line 46
    invoke-interface {p1, p2, p3}, Lokio/BufferedSource;->skip(J)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    iget-object v2, p0, Ll/gml$b;->a:Lokio/Buffer;

    .line 51
    .line 52
    invoke-interface {p1, v2, p2, p3}, Lokio/Source;->read(Lokio/Buffer;J)J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    const-wide/16 v7, -0x1

    .line 57
    .line 58
    cmp-long v4, v2, v7

    .line 59
    .line 60
    if-eqz v4, :cond_7

    .line 61
    .line 62
    sub-long/2addr p2, v2

    .line 63
    iget-object v2, p0, Ll/gml$b;->g:Ll/gml;

    .line 64
    .line 65
    monitor-enter v2

    .line 66
    :try_start_1
    iget-boolean v3, p0, Ll/gml$b;->e:Z

    .line 67
    .line 68
    if-eqz v3, :cond_4

    .line 69
    .line 70
    iget-object v3, p0, Ll/gml$b;->a:Lokio/Buffer;

    .line 71
    .line 72
    invoke-virtual {v3}, Lokio/Buffer;->size()J

    .line 73
    .line 74
    .line 75
    move-result-wide v3

    .line 76
    iget-object v5, p0, Ll/gml$b;->a:Lokio/Buffer;

    .line 77
    .line 78
    invoke-virtual {v5}, Lokio/Buffer;->clear()V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :catchall_0
    move-exception p0

    .line 83
    goto :goto_3

    .line 84
    :cond_4
    iget-object v3, p0, Ll/gml$b;->b:Lokio/Buffer;

    .line 85
    .line 86
    invoke-virtual {v3}, Lokio/Buffer;->size()J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    cmp-long v3, v3, v0

    .line 91
    .line 92
    if-nez v3, :cond_5

    .line 93
    .line 94
    move v5, v6

    .line 95
    :cond_5
    iget-object v3, p0, Ll/gml$b;->b:Lokio/Buffer;

    .line 96
    .line 97
    iget-object v4, p0, Ll/gml$b;->a:Lokio/Buffer;

    .line 98
    .line 99
    invoke-virtual {v3, v4}, Lokio/Buffer;->writeAll(Lokio/Source;)J

    .line 100
    .line 101
    .line 102
    if-eqz v5, :cond_6

    .line 103
    .line 104
    iget-object v3, p0, Ll/gml$b;->g:Ll/gml;

    .line 105
    .line 106
    invoke-virtual {v3}, Ljava/lang/Object;->notifyAll()V

    .line 107
    .line 108
    .line 109
    :cond_6
    move-wide v3, v0

    .line 110
    :goto_2
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 111
    cmp-long v0, v3, v0

    .line 112
    .line 113
    if-lez v0, :cond_0

    .line 114
    .line 115
    invoke-virtual {p0, v3, v4}, Ll/gml$b;->h(J)V

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :goto_3
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    throw p0

    .line 121
    :cond_7
    invoke-static {}, Ll/vg3;->a()V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :catchall_1
    move-exception p0

    .line 126
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 127
    throw p0

    .line 128
    :cond_8
    return-void
.end method

.method public final h(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gml$b;->g:Ll/gml;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gml;->d:Ll/dml;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/dml;->i0(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public read(Lokio/Buffer;J)J
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

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
    iget-object v2, p0, Ll/gml$b;->g:Ll/gml;

    .line 8
    .line 9
    monitor-enter v2

    .line 10
    :try_start_0
    iget-object v3, p0, Ll/gml$b;->g:Ll/gml;

    .line 11
    .line 12
    iget-object v3, v3, Ll/gml;->i:Ll/gml$c;

    .line 13
    .line 14
    invoke-virtual {v3}, Lokio/AsyncTimeout;->enter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    .line 16
    .line 17
    :try_start_1
    iget-object v3, p0, Ll/gml$b;->g:Ll/gml;

    .line 18
    .line 19
    iget-object v4, v3, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 20
    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    iget-object v3, v3, Ll/gml;->l:Ljava/io/IOException;

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    new-instance v3, Lokhttp3/internal/http2/StreamResetException;

    .line 29
    .line 30
    invoke-direct {v3, v4}, Lokhttp3/internal/http2/StreamResetException;-><init>(Lokhttp3/internal/http2/ErrorCode;)V

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
    iget-boolean v4, p0, Ll/gml$b;->e:Z

    .line 39
    .line 40
    if-nez v4, :cond_7

    .line 41
    .line 42
    iget-object v4, p0, Ll/gml$b;->b:Lokio/Buffer;

    .line 43
    .line 44
    invoke-virtual {v4}, Lokio/Buffer;->size()J

    .line 45
    .line 46
    .line 47
    move-result-wide v4

    .line 48
    cmp-long v4, v4, v0

    .line 49
    .line 50
    const-wide/16 v5, -0x1

    .line 51
    .line 52
    if-lez v4, :cond_2

    .line 53
    .line 54
    iget-object v4, p0, Ll/gml$b;->b:Lokio/Buffer;

    .line 55
    .line 56
    invoke-virtual {v4}, Lokio/Buffer;->size()J

    .line 57
    .line 58
    .line 59
    move-result-wide v7

    .line 60
    invoke-static {p2, p3, v7, v8}, Ljava/lang/Math;->min(JJ)J

    .line 61
    .line 62
    .line 63
    move-result-wide p2

    .line 64
    invoke-virtual {v4, p1, p2, p3}, Lokio/Buffer;->read(Lokio/Buffer;J)J

    .line 65
    .line 66
    .line 67
    move-result-wide p1

    .line 68
    iget-object p3, p0, Ll/gml$b;->g:Ll/gml;

    .line 69
    .line 70
    iget-wide v7, p3, Ll/gml;->a:J

    .line 71
    .line 72
    add-long/2addr v7, p1

    .line 73
    iput-wide v7, p3, Ll/gml;->a:J

    .line 74
    .line 75
    if-nez v3, :cond_4

    .line 76
    .line 77
    iget-object p3, p3, Ll/gml;->d:Ll/dml;

    .line 78
    .line 79
    iget-object p3, p3, Ll/dml;->t:Ll/vve0;

    .line 80
    .line 81
    invoke-virtual {p3}, Ll/vve0;->d()I

    .line 82
    .line 83
    .line 84
    move-result p3

    .line 85
    div-int/lit8 p3, p3, 0x2

    .line 86
    .line 87
    int-to-long v9, p3

    .line 88
    cmp-long p3, v7, v9

    .line 89
    .line 90
    if-ltz p3, :cond_4

    .line 91
    .line 92
    iget-object p3, p0, Ll/gml$b;->g:Ll/gml;

    .line 93
    .line 94
    iget-object v4, p3, Ll/gml;->d:Ll/dml;

    .line 95
    .line 96
    iget v7, p3, Ll/gml;->c:I

    .line 97
    .line 98
    iget-wide v8, p3, Ll/gml;->a:J

    .line 99
    .line 100
    invoke-virtual {v4, v7, v8, v9}, Ll/dml;->o0(IJ)V

    .line 101
    .line 102
    .line 103
    iget-object p3, p0, Ll/gml$b;->g:Ll/gml;

    .line 104
    .line 105
    iput-wide v0, p3, Ll/gml;->a:J

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_2
    iget-boolean v4, p0, Ll/gml$b;->f:Z

    .line 109
    .line 110
    if-nez v4, :cond_3

    .line 111
    .line 112
    if-nez v3, :cond_3

    .line 113
    .line 114
    iget-object v3, p0, Ll/gml$b;->g:Ll/gml;

    .line 115
    .line 116
    invoke-virtual {v3}, Ll/gml;->q()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    .line 118
    .line 119
    :try_start_2
    iget-object v3, p0, Ll/gml$b;->g:Ll/gml;

    .line 120
    .line 121
    iget-object v3, v3, Ll/gml;->i:Ll/gml$c;

    .line 122
    .line 123
    invoke-virtual {v3}, Ll/gml$c;->a()V

    .line 124
    .line 125
    .line 126
    monitor-exit v2

    .line 127
    goto :goto_0

    .line 128
    :catchall_1
    move-exception p0

    .line 129
    goto :goto_4

    .line 130
    :cond_3
    move-wide p1, v5

    .line 131
    :cond_4
    :goto_2
    iget-object p3, p0, Ll/gml$b;->g:Ll/gml;

    .line 132
    .line 133
    iget-object p3, p3, Ll/gml;->i:Ll/gml$c;

    .line 134
    .line 135
    invoke-virtual {p3}, Ll/gml$c;->a()V

    .line 136
    .line 137
    .line 138
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 139
    cmp-long p3, p1, v5

    .line 140
    .line 141
    if-eqz p3, :cond_5

    .line 142
    .line 143
    invoke-virtual {p0, p1, p2}, Ll/gml$b;->h(J)V

    .line 144
    .line 145
    .line 146
    return-wide p1

    .line 147
    :cond_5
    if-nez v3, :cond_6

    .line 148
    .line 149
    return-wide v5

    .line 150
    :cond_6
    throw v3

    .line 151
    :cond_7
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    .line 152
    .line 153
    const-string p2, "stream closed"

    .line 154
    .line 155
    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 159
    :goto_3
    :try_start_4
    iget-object p0, p0, Ll/gml$b;->g:Ll/gml;

    .line 160
    .line 161
    iget-object p0, p0, Ll/gml;->i:Ll/gml$c;

    .line 162
    .line 163
    invoke-virtual {p0}, Ll/gml$c;->a()V

    .line 164
    .line 165
    .line 166
    throw p1

    .line 167
    :goto_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 168
    throw p0

    .line 169
    :cond_8
    const-string p0, "byteCount < 0: "

    .line 170
    .line 171
    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 172
    .line 173
    .line 174
    return-wide v0
.end method

.method public timeout()Lokio/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gml$b;->g:Ll/gml;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gml;->i:Ll/gml$c;

    .line 4
    .line 5
    return-object p0
.end method
