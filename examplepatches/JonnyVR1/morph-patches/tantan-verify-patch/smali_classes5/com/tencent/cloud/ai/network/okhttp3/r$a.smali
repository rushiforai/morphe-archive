.class public final Lcom/tencent/cloud/ai/network/okhttp3/r$a;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# static fields
.field public static final synthetic e:Z = true


# instance fields
.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/Callback;

.field public volatile c:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic d:Lcom/tencent/cloud/ai/network/okhttp3/r;


# direct methods
.method public static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/r;Lcom/tencent/cloud/ai/network/okhttp3/Callback;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/r;->b()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "OkHttp %s"

    .line 12
    .line 13
    invoke-direct {p0, v0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/b;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->b:Lcom/tencent/cloud/ai/network/okhttp3/Callback;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a()V
    .locals 6

    .line 1
    const-string v0, "Callback failure for "

    .line 2
    .line 3
    const-string v1, "canceled due to "

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 6
    .line 7
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->e:Lcom/tencent/cloud/ai/network/okio/c;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okio/c;->h()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    :try_start_0
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 16
    .line 17
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/r;->a()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 18
    .line 19
    .line 20
    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 21
    const/4 v3, 0x1

    .line 22
    :try_start_1
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->b:Lcom/tencent/cloud/ai/network/okhttp3/Callback;

    .line 23
    .line 24
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 25
    .line 26
    invoke-interface {v4, v5, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Callback;->onResponse(Lcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a(Lcom/tencent/cloud/ai/network/okhttp3/r$a;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception v1

    .line 44
    goto :goto_1

    .line 45
    :goto_0
    move v2, v3

    .line 46
    goto :goto_2

    .line 47
    :goto_1
    move v2, v3

    .line 48
    goto :goto_4

    .line 49
    :catchall_1
    move-exception v0

    .line 50
    goto :goto_2

    .line 51
    :catch_1
    move-exception v1

    .line 52
    goto :goto_4

    .line 53
    :goto_2
    :try_start_2
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 54
    .line 55
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 56
    .line 57
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->a()V

    .line 58
    .line 59
    .line 60
    if-nez v2, :cond_0

    .line 61
    .line 62
    new-instance v2, Ljava/io/IOException;

    .line 63
    .line 64
    new-instance v3, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->b:Lcom/tencent/cloud/ai/network/okhttp3/Callback;

    .line 83
    .line 84
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 85
    .line 86
    invoke-interface {v1, v3, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Callback;->onFailure(Lcom/tencent/cloud/ai/network/okhttp3/Call;Ljava/io/IOException;)V

    .line 87
    .line 88
    .line 89
    goto :goto_3

    .line 90
    :catchall_2
    move-exception v0

    .line 91
    goto :goto_8

    .line 92
    :cond_0
    :goto_3
    throw v0

    .line 93
    :goto_4
    if-eqz v2, :cond_3

    .line 94
    .line 95
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;

    .line 96
    .line 97
    new-instance v3, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 103
    .line 104
    new-instance v4, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/r;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;

    .line 110
    .line 111
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/j;->d()Z

    .line 112
    .line 113
    .line 114
    move-result v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 115
    if-eqz v5, :cond_1

    .line 116
    .line 117
    const-string v5, "canceled "

    .line 118
    .line 119
    goto :goto_5

    .line 120
    :cond_1
    const-string v5, ""

    .line 121
    .line 122
    :goto_5
    :try_start_3
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-boolean v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/r;->d:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 126
    .line 127
    if-eqz v5, :cond_2

    .line 128
    .line 129
    const-string v5, "web socket"

    .line 130
    .line 131
    goto :goto_6

    .line 132
    :cond_2
    const-string v5, "call"

    .line 133
    .line 134
    :goto_6
    :try_start_4
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v5, " to "

    .line 138
    .line 139
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 143
    .line 144
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->f()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    const/4 v3, 0x4

    .line 167
    invoke-virtual {v2, v3, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/platform/c;->a(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 168
    .line 169
    .line 170
    goto :goto_7

    .line 171
    :cond_3
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->b:Lcom/tencent/cloud/ai/network/okhttp3/Callback;

    .line 172
    .line 173
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 174
    .line 175
    invoke-interface {v0, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Callback;->onFailure(Lcom/tencent/cloud/ai/network/okhttp3/Call;Ljava/io/IOException;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 176
    .line 177
    .line 178
    :goto_7
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 179
    .line 180
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 181
    .line 182
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a(Lcom/tencent/cloud/ai/network/okhttp3/r$a;)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :goto_8
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 191
    .line 192
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/r;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->dispatcher()Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    invoke-virtual {v1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Dispatcher;->a(Lcom/tencent/cloud/ai/network/okhttp3/r$a;)V

    .line 199
    .line 200
    .line 201
    throw v0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r$a;->d:Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/r;->c:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0
.end method
