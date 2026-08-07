.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/internal/http/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$g;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$e;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$b;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;
    }
.end annotation


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

.field public final c:Lcom/tencent/cloud/ai/network/okio/g;

.field public final d:Lcom/tencent/cloud/ai/network/okio/f;

.field public e:I

.field public f:J

.field public g:Lcom/tencent/cloud/ai/network/okhttp3/o;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;Lcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okio/f;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 6
    .line 7
    const-wide/32 v0, 0x40000

    .line 8
    .line 9
    .line 10
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->f:J

    .line 11
    .line 12
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 15
    .line 16
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->c:Lcom/tencent/cloud/ai/network/okio/g;

    .line 17
    .line 18
    iput-object p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)Lcom/tencent/cloud/ai/network/okio/f;
    .locals 0

    .line 131
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    return-object p0
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;Lcom/tencent/cloud/ai/network/okio/j;)V
    .locals 1

    .line 175
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 176
    iget-object p0, p1, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 177
    sget-object v0, Lcom/tencent/cloud/ai/network/okio/x;->d:Lcom/tencent/cloud/ai/network/okio/x;

    .line 178
    iput-object v0, p1, Lcom/tencent/cloud/ai/network/okio/j;->e:Lcom/tencent/cloud/ai/network/okio/x;

    .line 179
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->a()Lcom/tencent/cloud/ai/network/okio/x;

    .line 180
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/x;->b()Lcom/tencent/cloud/ai/network/okio/x;

    return-void
.end method

.method public static synthetic b(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)Lcom/tencent/cloud/ai/network/okio/g;
    .locals 0

    .line 97
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->c:Lcom/tencent/cloud/ai/network/okio/g;

    return-object p0
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J
    .locals 1

    .line 158
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Z

    move-result p0

    if-nez p0, :cond_0

    const-wide/16 p0, 0x0

    return-wide p0

    :cond_0
    const-string p0, "Transfer-Encoding"

    .line 159
    invoke-virtual {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "chunked"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const-wide/16 p0, -0x1

    return-wide p0

    .line 160
    :cond_1
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J

    move-result-wide p0

    return-wide p0
.end method

.method public a(Z)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;
    .locals 8

    .line 1
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    const/4 v3, 0x3

    .line 6
    if-eq v0, v1, :cond_1

    .line 7
    .line 8
    if-ne v0, v3, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p1, "state: "

    .line 12
    .line 13
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 14
    .line 15
    invoke-static {p1, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    return-object v2

    .line 19
    :cond_1
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->c:Lcom/tencent/cloud/ai/network/okio/g;

    .line 20
    .line 21
    iget-wide v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->f:J

    .line 22
    .line 23
    invoke-interface {v0, v4, v5}, Lcom/tencent/cloud/ai/network/okio/g;->c(J)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iget-wide v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->f:J

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    int-to-long v6, v1

    .line 34
    sub-long/2addr v4, v6

    .line 35
    iput-wide v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->f:J

    .line 36
    .line 37
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 42
    .line 43
    invoke-direct {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->a:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 47
    .line 48
    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->protocol(Lcom/tencent/cloud/ai/network/okhttp3/q;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->b:I

    .line 53
    .line 54
    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code(I)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->c:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d()Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers(Lcom/tencent/cloud/ai/network/okhttp3/o;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/16 v4, 0x64

    .line 73
    .line 74
    if-eqz p1, :cond_2

    .line 75
    .line 76
    iget p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->b:I

    .line 77
    .line 78
    if-ne p1, v4, :cond_2

    .line 79
    .line 80
    return-object v2

    .line 81
    :catch_0
    move-exception p1

    .line 82
    goto :goto_1

    .line 83
    :cond_2
    iget p1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/e;->b:I

    .line 84
    .line 85
    if-ne p1, v4, :cond_3

    .line 86
    .line 87
    iput v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 88
    .line 89
    return-object v1

    .line 90
    :cond_3
    const/4 p1, 0x4

    .line 91
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    return-object v1

    .line 94
    :goto_1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 95
    .line 96
    if-eqz p0, :cond_4

    .line 97
    .line 98
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/s;->a:Lcom/tencent/cloud/ai/network/okhttp3/a;

    .line 101
    .line 102
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->f()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    goto :goto_2

    .line 109
    :cond_4
    const-string p0, "unknown"

    .line 110
    .line 111
    :goto_2
    new-instance v0, Ljava/io/IOException;

    .line 112
    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v2, "unexpected end of stream on "

    .line 116
    .line 117
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-direct {v0, p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    .line 129
    .line 130
    throw v0
.end method

.method public a()Lcom/tencent/cloud/ai/network/okhttp3/o;
    .locals 2

    .line 161
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    const/4 v1, 0x6

    if-ne v0, v1, :cond_1

    .line 162
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->g:Lcom/tencent/cloud/ai/network/okhttp3/o;

    if-eqz p0, :cond_0

    return-object p0

    :cond_0
    sget-object p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/o;

    return-object p0

    .line 163
    :cond_1
    const-string p0, "too early; can\'t read the trailers yet"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/Request;J)Lcom/tencent/cloud/ai/network/okio/v;
    .locals 6

    .line 132
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->body()Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;

    move-result-object v0

    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/RequestBody;->isDuplex()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 133
    :cond_0
    const-string p0, "Duplex connections are not supported for HTTP/1"

    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    return-object v1

    :cond_1
    :goto_0
    const-string v0, "Transfer-Encoding"

    .line 134
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "chunked"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    const-string v0, "state: "

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz p1, :cond_3

    .line 135
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    if-ne p1, v3, :cond_2

    .line 136
    iput v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 137
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;

    invoke-direct {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)V

    return-object p1

    .line 138
    :cond_2
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    return-object v1

    :cond_3
    const-wide/16 v4, -0x1

    cmp-long p1, p2, v4

    if-eqz p1, :cond_5

    .line 139
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    if-ne p1, v3, :cond_4

    .line 140
    iput v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 141
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;

    .line 142
    invoke-direct {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$f;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)V

    return-object p1

    .line 143
    :cond_4
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    return-object v1

    .line 144
    :cond_5
    const-string p0, "Cannot stream a request body without chunked encoding or a known content length!"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    return-object v1
.end method

.method public final a(J)Lcom/tencent/cloud/ai/network/okio/w;
    .locals 2

    .line 181
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x5

    .line 182
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 183
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$e;

    invoke-direct {v0, p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$e;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;J)V

    return-object v0

    .line 184
    :cond_0
    const-string p1, "state: "

    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    invoke-static {p1, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/Request;)V
    .locals 3

    .line 145
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 146
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->c:Lcom/tencent/cloud/ai/network/okhttp3/s;

    .line 147
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/s;->b:Ljava/net/Proxy;

    .line 148
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    .line 149
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 150
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v2, 0x20

    .line 151
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 152
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->isHttps()Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne v0, v2, :cond_0

    .line 153
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 154
    :cond_0
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    move-result-object v0

    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/d;->a(Lcom/tencent/cloud/ai/network/okhttp3/p;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    const-string v0, " HTTP/1.1"

    .line 155
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 157
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->headers()Lcom/tencent/cloud/ai/network/okhttp3/o;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/o;Ljava/lang/String;)V

    return-void
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/o;Ljava/lang/String;)V
    .locals 4

    .line 164
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    if-nez v0, :cond_1

    .line 165
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    invoke-interface {v0, p2}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object p2

    const-string v0, "\r\n"

    invoke-interface {p2, v0}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 166
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    move-result p2

    const/4 v1, 0x0

    .line 167
    :goto_0
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    if-ge v1, p2, :cond_0

    .line 168
    invoke-virtual {p1, v1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object v2

    const-string v3, ": "

    .line 169
    invoke-interface {v2, v3}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object v2

    .line 170
    invoke-virtual {p1, v1}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object v2

    .line 171
    invoke-interface {v2, v0}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 172
    :cond_0
    invoke-interface {v2, v0}, Lcom/tencent/cloud/ai/network/okio/f;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/f;

    const/4 p1, 0x1

    .line 173
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    return-void

    .line 174
    :cond_1
    const-string p1, "state: "

    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    invoke-static {p1, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    return-void
.end method

.method public b(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okio/w;
    .locals 9

    .line 1
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(J)Lcom/tencent/cloud/ai/network/okio/w;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string v0, "Transfer-Encoding"

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "chunked"

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v1, 0x0

    .line 27
    const-string v2, "state: "

    .line 28
    .line 29
    const/4 v3, 0x5

    .line 30
    const/4 v4, 0x4

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 42
    .line 43
    if-ne v0, v4, :cond_1

    .line 44
    .line 45
    iput v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 46
    .line 47
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;

    .line 48
    .line 49
    invoke-direct {v0, p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$d;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;Lcom/tencent/cloud/ai/network/okhttp3/p;)V

    .line 50
    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_1
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 54
    .line 55
    invoke-static {v2, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 56
    .line 57
    .line 58
    return-object v1

    .line 59
    :cond_2
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v5

    .line 63
    const-wide/16 v7, -0x1

    .line 64
    .line 65
    cmp-long p1, v5, v7

    .line 66
    .line 67
    if-eqz p1, :cond_3

    .line 68
    .line 69
    invoke-virtual {p0, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->a(J)Lcom/tencent/cloud/ai/network/okio/w;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_3
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 75
    .line 76
    if-ne p1, v4, :cond_4

    .line 77
    .line 78
    iput v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 79
    .line 80
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->b()V

    .line 83
    .line 84
    .line 85
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$g;

    .line 86
    .line 87
    invoke-direct {p1, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a$g;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;)V

    .line 88
    .line 89
    .line 90
    return-object p1

    .line 91
    :cond_4
    iget p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->e:I

    .line 92
    .line 93
    invoke-static {v2, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 94
    .line 95
    .line 96
    return-object v1
.end method

.method public b()V
    .locals 0

    .line 98
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V

    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->d:Lcom/tencent/cloud/ai/network/okio/f;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/f;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;->d:Ljava/net/Socket;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/net/Socket;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public connection()Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d()Lcom/tencent/cloud/ai/network/okhttp3/o;
    .locals 6

    .line 1
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->c:Lcom/tencent/cloud/ai/network/okio/g;

    .line 7
    .line 8
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->f:J

    .line 9
    .line 10
    invoke-interface {v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/g;->c(J)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->f:J

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    int-to-long v4, v4

    .line 21
    sub-long/2addr v2, v4

    .line 22
    iput-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/http1/a;->f:J

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_2

    .line 29
    .line 30
    sget-object v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    .line 31
    .line 32
    check-cast v2, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    const-string v2, ":"

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    const/4 v5, -0x1

    .line 45
    if-eq v4, v5, :cond_0

    .line 46
    .line 47
    const/4 v2, 0x0

    .line 48
    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    add-int/lit8 v4, v4, 0x1

    .line 53
    .line 54
    invoke-virtual {v1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    const-string v4, ""

    .line 67
    .line 68
    if-eqz v2, :cond_1

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 75
    .line 76
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_1
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_2
    new-instance p0, Lcom/tencent/cloud/ai/network/okhttp3/o;

    .line 105
    .line 106
    invoke-direct {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/o;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/o$a;)V

    .line 107
    .line 108
    .line 109
    return-object p0
.end method
