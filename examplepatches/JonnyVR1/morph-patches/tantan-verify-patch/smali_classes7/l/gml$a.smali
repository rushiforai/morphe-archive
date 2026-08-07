.class public final Ll/gml$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lokio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final a:Lokio/Buffer;

.field public b:Ll/e0l;

.field public c:Z

.field public d:Z

.field public final synthetic e:Ll/gml;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/gml;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gml$a;->e:Ll/gml;

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
    iput-object p1, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final b(Z)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v1, p0, Ll/gml$a;->e:Ll/gml;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 5
    .line 6
    iget-object v0, v0, Ll/gml;->j:Ll/gml$c;

    .line 7
    .line 8
    invoke-virtual {v0}, Lokio/AsyncTimeout;->enter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 9
    .line 10
    .line 11
    :goto_0
    :try_start_1
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 12
    .line 13
    iget-wide v2, v0, Ll/gml;->b:J

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
    iget-boolean v2, p0, Ll/gml$a;->d:Z

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    iget-boolean v2, p0, Ll/gml$a;->c:Z

    .line 26
    .line 27
    if-nez v2, :cond_0

    .line 28
    .line 29
    iget-object v2, v0, Ll/gml;->k:Lokhttp3/internal/http2/ErrorCode;

    .line 30
    .line 31
    if-nez v2, :cond_0

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/gml;->q()V
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
    iget-object v0, v0, Ll/gml;->j:Ll/gml$c;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/gml$c;->a()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/gml;->c()V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 51
    .line 52
    iget-wide v2, v0, Ll/gml;->b:J

    .line 53
    .line 54
    iget-object v0, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 55
    .line 56
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    .line 61
    .line 62
    .line 63
    move-result-wide v10

    .line 64
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 65
    .line 66
    iget-wide v2, v0, Ll/gml;->b:J

    .line 67
    .line 68
    sub-long/2addr v2, v10

    .line 69
    iput-wide v2, v0, Ll/gml;->b:J

    .line 70
    .line 71
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 72
    iget-object v0, v0, Ll/gml;->j:Ll/gml$c;

    .line 73
    .line 74
    invoke-virtual {v0}, Lokio/AsyncTimeout;->enter()V

    .line 75
    .line 76
    .line 77
    if-eqz p1, :cond_1

    .line 78
    .line 79
    :try_start_3
    iget-object p1, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 80
    .line 81
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    .line 82
    .line 83
    .line 84
    move-result-wide v0

    .line 85
    cmp-long p1, v10, v0

    .line 86
    .line 87
    if-nez p1, :cond_1

    .line 88
    .line 89
    const/4 p1, 0x1

    .line 90
    :goto_1
    move v8, p1

    .line 91
    goto :goto_2

    .line 92
    :catchall_1
    move-exception v0

    .line 93
    move-object p1, v0

    .line 94
    goto :goto_3

    .line 95
    :cond_1
    const/4 p1, 0x0

    .line 96
    goto :goto_1

    .line 97
    :goto_2
    iget-object p1, p0, Ll/gml$a;->e:Ll/gml;

    .line 98
    .line 99
    iget-object v6, p1, Ll/gml;->d:Ll/dml;

    .line 100
    .line 101
    iget v7, p1, Ll/gml;->c:I

    .line 102
    .line 103
    iget-object v9, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 104
    .line 105
    invoke-virtual/range {v6 .. v11}, Ll/dml;->j0(IZLokio/Buffer;J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Ll/gml$a;->e:Ll/gml;

    .line 109
    .line 110
    iget-object p0, p0, Ll/gml;->j:Ll/gml$c;

    .line 111
    .line 112
    invoke-virtual {p0}, Ll/gml$c;->a()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :goto_3
    iget-object p0, p0, Ll/gml$a;->e:Ll/gml;

    .line 117
    .line 118
    iget-object p0, p0, Ll/gml;->j:Ll/gml$c;

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/gml$c;->a()V

    .line 121
    .line 122
    .line 123
    throw p1

    .line 124
    :catchall_2
    move-exception v0

    .line 125
    move-object p0, v0

    .line 126
    goto :goto_5

    .line 127
    :goto_4
    :try_start_4
    iget-object p0, p0, Ll/gml$a;->e:Ll/gml;

    .line 128
    .line 129
    iget-object p0, p0, Ll/gml;->j:Ll/gml$c;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/gml$c;->a()V

    .line 132
    .line 133
    .line 134
    throw p1

    .line 135
    :goto_5
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 136
    throw p0
.end method

.method public close()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v1, p0, Ll/gml$a;->e:Ll/gml;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-boolean v0, p0, Ll/gml$a;->c:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    monitor-exit v1

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    move-object p0, v0

    .line 12
    goto/16 :goto_4

    .line 13
    .line 14
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 16
    .line 17
    iget-object v0, v0, Ll/gml;->h:Ll/gml$a;

    .line 18
    .line 19
    iget-boolean v0, v0, Ll/gml$a;->d:Z

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    if-nez v0, :cond_5

    .line 23
    .line 24
    iget-object v0, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 25
    .line 26
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    const-wide/16 v4, 0x0

    .line 31
    .line 32
    cmp-long v0, v2, v4

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    if-lez v0, :cond_1

    .line 36
    .line 37
    move v0, v1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    move v0, v2

    .line 40
    :goto_0
    iget-object v3, p0, Ll/gml$a;->b:Ll/e0l;

    .line 41
    .line 42
    if-eqz v3, :cond_3

    .line 43
    .line 44
    :goto_1
    iget-object v0, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 45
    .line 46
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 47
    .line 48
    .line 49
    move-result-wide v6

    .line 50
    cmp-long v0, v6, v4

    .line 51
    .line 52
    if-lez v0, :cond_2

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Ll/gml$a;->b(Z)V

    .line 55
    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_2
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 59
    .line 60
    iget-object v2, v0, Ll/gml;->d:Ll/dml;

    .line 61
    .line 62
    iget v0, v0, Ll/gml;->c:I

    .line 63
    .line 64
    iget-object v3, p0, Ll/gml$a;->b:Ll/e0l;

    .line 65
    .line 66
    invoke-static {v3}, Ll/zlk0;->I(Ll/e0l;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v2, v0, v1, v3}, Ll/dml;->k0(IZLjava/util/List;)V

    .line 71
    .line 72
    .line 73
    goto :goto_3

    .line 74
    :cond_3
    if-eqz v0, :cond_4

    .line 75
    .line 76
    :goto_2
    iget-object v0, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 77
    .line 78
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 79
    .line 80
    .line 81
    move-result-wide v2

    .line 82
    cmp-long v0, v2, v4

    .line 83
    .line 84
    if-lez v0, :cond_5

    .line 85
    .line 86
    invoke-virtual {p0, v1}, Ll/gml$a;->b(Z)V

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_4
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 91
    .line 92
    iget-object v2, v0, Ll/gml;->d:Ll/dml;

    .line 93
    .line 94
    iget v3, v0, Ll/gml;->c:I

    .line 95
    .line 96
    const/4 v5, 0x0

    .line 97
    const-wide/16 v6, 0x0

    .line 98
    .line 99
    const/4 v4, 0x1

    .line 100
    invoke-virtual/range {v2 .. v7}, Ll/dml;->j0(IZLokio/Buffer;J)V

    .line 101
    .line 102
    .line 103
    :cond_5
    :goto_3
    iget-object v2, p0, Ll/gml$a;->e:Ll/gml;

    .line 104
    .line 105
    monitor-enter v2

    .line 106
    :try_start_1
    iput-boolean v1, p0, Ll/gml$a;->c:Z

    .line 107
    .line 108
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 109
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 110
    .line 111
    iget-object v0, v0, Ll/gml;->d:Ll/dml;

    .line 112
    .line 113
    invoke-virtual {v0}, Ll/dml;->flush()V

    .line 114
    .line 115
    .line 116
    iget-object p0, p0, Ll/gml$a;->e:Ll/gml;

    .line 117
    .line 118
    invoke-virtual {p0}, Ll/gml;->b()V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :catchall_1
    move-exception v0

    .line 123
    move-object p0, v0

    .line 124
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 125
    throw p0

    .line 126
    :goto_4
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 127
    throw p0
.end method

.method public flush()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/gml$a;->e:Ll/gml;

    .line 5
    .line 6
    invoke-virtual {v1}, Ll/gml;->c()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    :goto_0
    iget-object v0, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 11
    .line 12
    invoke-virtual {v0}, Lokio/Buffer;->size()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-wide/16 v2, 0x0

    .line 17
    .line 18
    cmp-long v0, v0, v2

    .line 19
    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Ll/gml$a;->b(Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/gml$a;->e:Ll/gml;

    .line 27
    .line 28
    iget-object v0, v0, Ll/gml;->d:Ll/dml;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/dml;->flush()V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
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

.method public timeout()Lokio/Timeout;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gml$a;->e:Ll/gml;

    .line 2
    .line 3
    iget-object p0, p0, Ll/gml;->j:Ll/gml$c;

    .line 4
    .line 5
    return-object p0
.end method

.method public write(Lokio/Buffer;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 4
    .line 5
    .line 6
    :goto_0
    iget-object p1, p0, Ll/gml$a;->a:Lokio/Buffer;

    .line 7
    .line 8
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    const-wide/16 v0, 0x4000

    .line 13
    .line 14
    cmp-long p1, p1, v0

    .line 15
    .line 16
    if-ltz p1, :cond_0

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Ll/gml$a;->b(Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method
