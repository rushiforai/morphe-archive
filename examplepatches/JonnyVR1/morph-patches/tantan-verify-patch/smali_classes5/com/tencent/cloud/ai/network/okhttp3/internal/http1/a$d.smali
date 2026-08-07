.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final d:Lcom/tencent/cloud/ai/network/okhttp3/p;

.field public e:J

.field public f:Z

.field public final synthetic g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;Lcom/tencent/cloud/ai/network/okhttp3/p;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$a;)V

    .line 5
    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->f:Z

    .line 13
    .line 14
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->d:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 8

    .line 1
    const-string v0, "expected chunk size and optional extensions but was \""

    .line 2
    .line 3
    const-wide/16 v1, 0x0

    .line 4
    .line 5
    cmp-long v3, p2, v1

    .line 6
    .line 7
    if-ltz v3, :cond_9

    .line 8
    .line 9
    iget-boolean v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->b:Z

    .line 10
    .line 11
    if-nez v3, :cond_8

    .line 12
    .line 13
    iget-boolean v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->f:Z

    .line 14
    .line 15
    const-wide/16 v4, -0x1

    .line 16
    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    return-wide v4

    .line 20
    :cond_0
    iget-wide v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 21
    .line 22
    cmp-long v3, v6, v1

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    cmp-long v3, v6, v4

    .line 27
    .line 28
    if-nez v3, :cond_5

    .line 29
    .line 30
    :cond_1
    cmp-long v3, v6, v4

    .line 31
    .line 32
    if-eqz v3, :cond_2

    .line 33
    .line 34
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 35
    .line 36
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->c:Lcom/tencent/cloud/ai/network/okio/g;

    .line 37
    .line 38
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okio/g;->e()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    :cond_2
    :try_start_0
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->c:Lcom/tencent/cloud/ai/network/okio/g;

    .line 44
    .line 45
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okio/g;->c()J

    .line 46
    .line 47
    .line 48
    move-result-wide v6

    .line 49
    iput-wide v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 50
    .line 51
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 52
    .line 53
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->c:Lcom/tencent/cloud/ai/network/okio/g;

    .line 54
    .line 55
    invoke-interface {v3}, Lcom/tencent/cloud/ai/network/okio/g;->e()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iget-wide v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 64
    .line 65
    cmp-long v6, v6, v1

    .line 66
    .line 67
    if-ltz v6, :cond_7

    .line 68
    .line 69
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 70
    .line 71
    .line 72
    move-result v6

    .line 73
    if-nez v6, :cond_3

    .line 74
    .line 75
    const-string v6, ";"

    .line 76
    .line 77
    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v6
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    if-eqz v6, :cond_7

    .line 82
    .line 83
    :cond_3
    iget-wide v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 84
    .line 85
    cmp-long v0, v6, v1

    .line 86
    .line 87
    if-nez v0, :cond_4

    .line 88
    .line 89
    const/4 v0, 0x0

    .line 90
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->f:Z

    .line 91
    .line 92
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 93
    .line 94
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d()Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->g:Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 99
    .line 100
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 101
    .line 102
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 103
    .line 104
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->cookieJar()Lcom/tencent/cloud/ai/network/okhttp3/l;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->d:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 109
    .line 110
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 111
    .line 112
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->g:Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 113
    .line 114
    invoke-static {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/l;Lcom/tencent/cloud/ai/network/okhttp3/p;Lcom/tencent/cloud/ai/network/okhttp3/o;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->k()V

    .line 118
    .line 119
    .line 120
    :cond_4
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->f:Z

    .line 121
    .line 122
    if-nez v0, :cond_5

    .line 123
    .line 124
    return-wide v4

    .line 125
    :cond_5
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 126
    .line 127
    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 128
    .line 129
    .line 130
    move-result-wide p2

    .line 131
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 132
    .line 133
    .line 134
    move-result-wide p1

    .line 135
    cmp-long p3, p1, v4

    .line 136
    .line 137
    if-eqz p3, :cond_6

    .line 138
    .line 139
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 140
    .line 141
    sub-long/2addr v0, p1

    .line 142
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 143
    .line 144
    return-wide p1

    .line 145
    :cond_6
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 146
    .line 147
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b()V

    .line 150
    .line 151
    .line 152
    new-instance p1, Ljava/net/ProtocolException;

    .line 153
    .line 154
    const-string p2, "unexpected end of stream"

    .line 155
    .line 156
    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->k()V

    .line 160
    .line 161
    .line 162
    throw p1

    .line 163
    :cond_7
    :try_start_1
    new-instance p1, Ljava/net/ProtocolException;

    .line 164
    .line 165
    new-instance p2, Ljava/lang/StringBuilder;

    .line 166
    .line 167
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->e:J

    .line 171
    .line 172
    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string p0, "\""

    .line 179
    .line 180
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-direct {p1, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    throw p1
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 191
    :catch_0
    move-exception p0

    .line 192
    new-instance p1, Ljava/net/ProtocolException;

    .line 193
    .line 194
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-direct {p1, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    throw p1

    .line 202
    :cond_8
    const-string p0, "closed"

    .line 203
    .line 204
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    return-wide v1

    .line 208
    :cond_9
    const-string p0, "byteCount < 0: "

    .line 209
    .line 210
    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 211
    .line 212
    .line 213
    return-wide v1
.end method

.method public close()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->f:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 11
    .line 12
    const/16 v1, 0x64

    .line 13
    .line 14
    invoke-static {p0, v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Lcom/tencent/cloud/ai/network/okio/w;ILjava/util/concurrent/TimeUnit;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->k()V

    .line 28
    .line 29
    .line 30
    :cond_1
    const/4 v0, 0x1

    .line 31
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;->b:Z

    .line 32
    .line 33
    return-void
.end method
