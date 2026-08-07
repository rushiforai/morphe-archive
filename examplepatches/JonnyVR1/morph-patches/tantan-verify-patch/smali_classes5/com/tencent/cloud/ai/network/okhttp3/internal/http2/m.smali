.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/b;
.source "SourceFile"


# instance fields
.field public final synthetic b:Z

.field public final synthetic c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

.field public final synthetic d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;


# direct methods
.method public varargs constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;Ljava/lang/String;[Ljava/lang/Object;ZLcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 2
    .line 3
    iput-boolean p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;->b:Z

    .line 4
    .line 5
    iput-object p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 6
    .line 7
    invoke-direct {p0, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;->d:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;->b:Z

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/m;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 6
    .line 7
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    .line 10
    .line 11
    monitor-enter v2

    .line 12
    :try_start_0
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 13
    .line 14
    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 15
    :try_start_1
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 16
    .line 17
    iget-object v4, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->t:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 18
    .line 19
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    const/4 v5, 0x0

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->t:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 29
    .line 30
    iput v5, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a:I

    .line 31
    .line 32
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->b:[I

    .line 33
    .line 34
    invoke-static {v1, v5}, Ljava/util/Arrays;->fill([II)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    goto/16 :goto_7

    .line 40
    .line 41
    :cond_0
    :goto_0
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->t:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 44
    .line 45
    const/4 v6, 0x0

    .line 46
    if-eqz v1, :cond_7

    .line 47
    .line 48
    move v7, v5

    .line 49
    :goto_1
    const/16 v8, 0xa

    .line 50
    .line 51
    if-ge v7, v8, :cond_2

    .line 52
    .line 53
    const/4 v8, 0x1

    .line 54
    shl-int/2addr v8, v7

    .line 55
    iget v9, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a:I

    .line 56
    .line 57
    and-int/2addr v8, v9

    .line 58
    if-eqz v8, :cond_1

    .line 59
    .line 60
    iget-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->b:[I

    .line 61
    .line 62
    aget v8, v8, v7

    .line 63
    .line 64
    invoke-virtual {v1, v7, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a(II)Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 65
    .line 66
    .line 67
    :cond_1
    add-int/lit8 v7, v7, 0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_2
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->t:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;->a()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    const/4 v1, -0x1

    .line 79
    const-wide/16 v7, 0x0

    .line 80
    .line 81
    if-eq p0, v1, :cond_3

    .line 82
    .line 83
    if-eq p0, v4, :cond_3

    .line 84
    .line 85
    sub-int/2addr p0, v4

    .line 86
    int-to-long v9, p0

    .line 87
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    .line 90
    .line 91
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-nez p0, :cond_4

    .line 96
    .line 97
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    .line 100
    .line 101
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 106
    .line 107
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->c:Ljava/util/Map;

    .line 108
    .line 109
    invoke-interface {v1}, Ljava/util/Map;->size()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    new-array v1, v1, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 114
    .line 115
    invoke-interface {p0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    move-object v6, p0

    .line 120
    check-cast v6, [Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_3
    move-wide v9, v7

    .line 124
    :cond_4
    :goto_2
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 125
    :try_start_2
    iget-object p0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 126
    .line 127
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->v:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->t:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;

    .line 130
    .line 131
    invoke-virtual {v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/r;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/u;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 132
    .line 133
    .line 134
    goto :goto_3

    .line 135
    :catchall_1
    move-exception p0

    .line 136
    goto :goto_8

    .line 137
    :catch_0
    move-exception p0

    .line 138
    :try_start_3
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 139
    .line 140
    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;

    .line 141
    .line 142
    invoke-virtual {v1, v3, v3, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/b;Ljava/io/IOException;)V

    .line 143
    .line 144
    .line 145
    :goto_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 146
    if-eqz v6, :cond_6

    .line 147
    .line 148
    array-length p0, v6

    .line 149
    :goto_4
    if-ge v5, p0, :cond_6

    .line 150
    .line 151
    aget-object v1, v6, v5

    .line 152
    .line 153
    monitor-enter v1

    .line 154
    :try_start_4
    iget-wide v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    .line 155
    .line 156
    add-long/2addr v2, v9

    .line 157
    iput-wide v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/q;->b:J

    .line 158
    .line 159
    cmp-long v2, v9, v7

    .line 160
    .line 161
    if-lez v2, :cond_5

    .line 162
    .line 163
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 164
    .line 165
    .line 166
    goto :goto_5

    .line 167
    :catchall_2
    move-exception p0

    .line 168
    goto :goto_6

    .line 169
    :cond_5
    :goto_5
    monitor-exit v1

    .line 170
    add-int/lit8 v5, v5, 0x1

    .line 171
    .line 172
    goto :goto_4

    .line 173
    :goto_6
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 174
    throw p0

    .line 175
    :cond_6
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->y:Ljava/util/concurrent/ExecutorService;

    .line 176
    .line 177
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/n;

    .line 178
    .line 179
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;

    .line 180
    .line 181
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f;->d:Ljava/lang/String;

    .line 182
    .line 183
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    const-string v3, "OkHttp %s settings"

    .line 188
    .line 189
    invoke-direct {v1, v0, v3, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/n;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http2/f$g;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 190
    .line 191
    .line 192
    invoke-interface {p0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_7
    :try_start_5
    throw v6

    .line 197
    :goto_7
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 198
    :try_start_6
    throw p0

    .line 199
    :goto_8
    monitor-exit v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 200
    throw p0
.end method
