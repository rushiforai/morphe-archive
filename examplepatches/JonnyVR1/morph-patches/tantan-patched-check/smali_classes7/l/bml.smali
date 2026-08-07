.class public final Ll/bml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o6f;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/bml$g;,
        Ll/bml$d;,
        Ll/bml$e;,
        Ll/bml$b;,
        Ll/bml$c;,
        Ll/bml$f;
    }
.end annotation


# instance fields
.field public final a:Ll/rg50;

.field public final b:Ll/imc0;

.field public final c:Lokio/BufferedSource;

.field public final d:Lokio/BufferedSink;

.field public e:I

.field public f:J

.field public g:Ll/e0l;


# direct methods
.method public constructor <init>(Ll/rg50;Ll/imc0;Lokio/BufferedSource;Lokio/BufferedSink;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/bml;->e:I

    .line 6
    .line 7
    const-wide/32 v0, 0x40000

    .line 8
    .line 9
    .line 10
    iput-wide v0, p0, Ll/bml;->f:J

    .line 11
    .line 12
    iput-object p1, p0, Ll/bml;->a:Ll/rg50;

    .line 13
    .line 14
    iput-object p2, p0, Ll/bml;->b:Ll/imc0;

    .line 15
    .line 16
    iput-object p3, p0, Ll/bml;->c:Lokio/BufferedSource;

    .line 17
    .line 18
    iput-object p4, p0, Ll/bml;->d:Lokio/BufferedSink;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic h(Ll/bml;)Ll/rg50;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml;->a:Ll/rg50;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic i(Ll/bml;)Lokio/BufferedSink;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml;->d:Lokio/BufferedSink;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic j(Ll/bml;Lokio/ForwardingTimeout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bml;->r(Lokio/ForwardingTimeout;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic k(Ll/bml;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/bml;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic l(Ll/bml;I)I
    .locals 0

    .line 1
    iput p1, p0, Ll/bml;->e:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic m(Ll/bml;)Lokio/BufferedSource;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml;->c:Lokio/BufferedSource;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic n(Ll/bml;)Ll/imc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml;->b:Ll/imc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ll/bml;)Ll/e0l;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml;->g:Ll/e0l;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Ll/bml;Ll/e0l;)Ll/e0l;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bml;->g:Ll/e0l;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic q(Ll/bml;)Ll/e0l;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/bml;->y()Ll/e0l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public A(Ll/e0l;Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/bml;->e:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/bml;->d:Lokio/BufferedSink;

    .line 6
    .line 7
    invoke-interface {v0, p2}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    const-string v0, "\r\n"

    .line 12
    .line 13
    invoke-interface {p2, v0}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/e0l;->k()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    iget-object v2, p0, Ll/bml;->d:Lokio/BufferedSink;

    .line 22
    .line 23
    if-ge v1, p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Ll/e0l;->f(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const-string v3, ": "

    .line 34
    .line 35
    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p1, v1}, Ll/e0l;->m(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-interface {v2, v3}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v2, v0}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 48
    .line 49
    .line 50
    add-int/lit8 v1, v1, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-interface {v2, v0}, Lokio/BufferedSink;->writeUtf8(Ljava/lang/String;)Lokio/BufferedSink;

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    iput p1, p0, Ll/bml;->e:I

    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    const-string p1, "state: "

    .line 61
    .line 62
    iget p0, p0, Ll/bml;->e:I

    .line 63
    .line 64
    invoke-static {p1, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public a(Ll/i5d0;)J
    .locals 1

    .line 1
    invoke-static {p1}, Ll/yml;->c(Ll/i5d0;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-wide/16 p0, 0x0

    .line 8
    .line 9
    return-wide p0

    .line 10
    :cond_0
    const-string p0, "Transfer-Encoding"

    .line 11
    .line 12
    invoke-virtual {p1, p0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string v0, "chunked"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const-wide/16 p0, -0x1

    .line 25
    .line 26
    return-wide p0

    .line 27
    :cond_1
    invoke-static {p1}, Ll/yml;->b(Ll/i5d0;)J

    .line 28
    .line 29
    .line 30
    move-result-wide p0

    .line 31
    return-wide p0
.end method

.method public b(Ll/x1d0;J)Lokio/Sink;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/z1d0;->isDuplex()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p0, "Duplex connections are not supported for HTTP/1"

    .line 20
    .line 21
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_1
    :goto_0
    const-string v0, "Transfer-Encoding"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "chunked"

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/bml;->s()Lokio/Sink;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_2
    const-wide/16 v2, -0x1

    .line 45
    .line 46
    cmp-long p1, p2, v2

    .line 47
    .line 48
    if-eqz p1, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/bml;->v()Lokio/Sink;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0

    .line 55
    :cond_3
    const-string p0, "Cannot stream a request body without chunked encoding or a known content length!"

    .line 56
    .line 57
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-object v1
.end method

.method public c()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bml;->d:Lokio/BufferedSink;

    .line 2
    .line 3
    invoke-interface {p0}, Lokio/BufferedSink;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml;->b:Ll/imc0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/imc0;->g()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public connection()Ll/imc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bml;->b:Ll/imc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/x1d0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bml;->b:Ll/imc0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/imc0;->b()Ll/nnd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/nnd0;->b()Ljava/net/Proxy;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, v0}, Ll/i2d0;->a(Ll/x1d0;Ljava/net/Proxy$Type;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1}, Ll/x1d0;->e()Ll/e0l;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1, v0}, Ll/bml;->A(Ll/e0l;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public e()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bml;->d:Lokio/BufferedSink;

    .line 2
    .line 3
    invoke-interface {p0}, Lokio/BufferedSink;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Z)Ll/i5d0$a;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/bml;->e:I

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
    iget p0, p0, Ll/bml;->e:I

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
    invoke-virtual {p0}, Ll/bml;->x()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Ll/r4g0;->a(Ljava/lang/String;)Ll/r4g0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/i5d0$a;

    .line 28
    .line 29
    invoke-direct {v1}, Ll/i5d0$a;-><init>()V

    .line 30
    .line 31
    .line 32
    iget-object v4, v0, Ll/r4g0;->a:Lokhttp3/Protocol;

    .line 33
    .line 34
    invoke-virtual {v1, v4}, Ll/i5d0$a;->o(Lokhttp3/Protocol;)Ll/i5d0$a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget v4, v0, Ll/r4g0;->b:I

    .line 39
    .line 40
    invoke-virtual {v1, v4}, Ll/i5d0$a;->g(I)Ll/i5d0$a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v4, v0, Ll/r4g0;->c:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1, v4}, Ll/i5d0$a;->l(Ljava/lang/String;)Ll/i5d0$a;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0}, Ll/bml;->y()Ll/e0l;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v1, v4}, Ll/i5d0$a;->j(Ll/e0l;)Ll/i5d0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/16 v4, 0x64

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget p1, v0, Ll/r4g0;->b:I

    .line 63
    .line 64
    if-ne p1, v4, :cond_2

    .line 65
    .line 66
    return-object v2

    .line 67
    :catch_0
    move-exception p1

    .line 68
    goto :goto_1

    .line 69
    :cond_2
    iget p1, v0, Ll/r4g0;->b:I

    .line 70
    .line 71
    if-ne p1, v4, :cond_3

    .line 72
    .line 73
    iput v3, p0, Ll/bml;->e:I

    .line 74
    .line 75
    return-object v1

    .line 76
    :cond_3
    const/4 p1, 0x4

    .line 77
    iput p1, p0, Ll/bml;->e:I
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 78
    .line 79
    return-object v1

    .line 80
    :goto_1
    iget-object p0, p0, Ll/bml;->b:Ll/imc0;

    .line 81
    .line 82
    if-eqz p0, :cond_4

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/imc0;->b()Ll/nnd0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Ll/nnd0;->a()Ll/y80;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p0}, Ll/y80;->l()Ll/rnl;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Ll/rnl;->G()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    goto :goto_2

    .line 101
    :cond_4
    const-string p0, "unknown"

    .line 102
    .line 103
    :goto_2
    new-instance v0, Ljava/io/IOException;

    .line 104
    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v2, "unexpected end of stream on "

    .line 108
    .line 109
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-direct {v0, p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 120
    .line 121
    .line 122
    throw v0
.end method

.method public g(Ll/i5d0;)Lokio/Source;
    .locals 4

    .line 1
    invoke-static {p1}, Ll/yml;->c(Ll/i5d0;)Z

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
    invoke-virtual {p0, v0, v1}, Ll/bml;->u(J)Lokio/Source;

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
    invoke-virtual {p1, v0}, Ll/i5d0;->u(Ljava/lang/String;)Ljava/lang/String;

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
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/i5d0;->Z()Ll/x1d0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Ll/x1d0;->k()Ll/rnl;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ll/bml;->t(Ll/rnl;)Lokio/Source;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    invoke-static {p1}, Ll/yml;->b(Ll/i5d0;)J

    .line 42
    .line 43
    .line 44
    move-result-wide v0

    .line 45
    const-wide/16 v2, -0x1

    .line 46
    .line 47
    cmp-long p1, v0, v2

    .line 48
    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    invoke-virtual {p0, v0, v1}, Ll/bml;->u(J)Lokio/Source;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_2
    invoke-virtual {p0}, Ll/bml;->w()Lokio/Source;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public final r(Lokio/ForwardingTimeout;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lokio/ForwardingTimeout;->delegate()Lokio/Timeout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lokio/Timeout;->NONE:Lokio/Timeout;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lokio/ForwardingTimeout;->setDelegate(Lokio/Timeout;)Lokio/ForwardingTimeout;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lokio/Timeout;->clearDeadline()Lokio/Timeout;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lokio/Timeout;->clearTimeout()Lokio/Timeout;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final s()Lokio/Sink;
    .locals 2

    .line 1
    iget v0, p0, Ll/bml;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    iput v0, p0, Ll/bml;->e:I

    .line 8
    .line 9
    new-instance v0, Ll/bml$c;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/bml$c;-><init>(Ll/bml;)V

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    const-string v0, "state: "

    .line 16
    .line 17
    iget p0, p0, Ll/bml;->e:I

    .line 18
    .line 19
    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final t(Ll/rnl;)Lokio/Source;
    .locals 2

    .line 1
    iget v0, p0, Ll/bml;->e:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    iput v0, p0, Ll/bml;->e:I

    .line 8
    .line 9
    new-instance v0, Ll/bml$d;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ll/bml$d;-><init>(Ll/bml;Ll/rnl;)V

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    const-string p1, "state: "

    .line 16
    .line 17
    iget p0, p0, Ll/bml;->e:I

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final u(J)Lokio/Source;
    .locals 2

    .line 1
    iget v0, p0, Ll/bml;->e:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    iput v0, p0, Ll/bml;->e:I

    .line 8
    .line 9
    new-instance v0, Ll/bml$e;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1, p2}, Ll/bml$e;-><init>(Ll/bml;J)V

    .line 12
    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    const-string p1, "state: "

    .line 16
    .line 17
    iget p0, p0, Ll/bml;->e:I

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final v()Lokio/Sink;
    .locals 2

    .line 1
    iget v0, p0, Ll/bml;->e:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    iput v0, p0, Ll/bml;->e:I

    .line 8
    .line 9
    new-instance v0, Ll/bml$f;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, p0, v1}, Ll/bml$f;-><init>(Ll/bml;Ll/bml$a;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    const-string v0, "state: "

    .line 17
    .line 18
    iget p0, p0, Ll/bml;->e:I

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public final w()Lokio/Source;
    .locals 2

    .line 1
    iget v0, p0, Ll/bml;->e:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x5

    .line 7
    iput v0, p0, Ll/bml;->e:I

    .line 8
    .line 9
    iget-object v0, p0, Ll/bml;->b:Ll/imc0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/imc0;->t()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ll/bml$g;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-direct {v0, p0, v1}, Ll/bml$g;-><init>(Ll/bml;Ll/bml$a;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    const-string v0, "state: "

    .line 22
    .line 23
    iget p0, p0, Ll/bml;->e:I

    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/h5d0;->a(Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public final x()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bml;->c:Lokio/BufferedSource;

    .line 2
    .line 3
    iget-wide v1, p0, Ll/bml;->f:J

    .line 4
    .line 5
    invoke-interface {v0, v1, v2}, Lokio/BufferedSource;->readUtf8LineStrict(J)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-wide v1, p0, Ll/bml;->f:J

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    int-to-long v3, v3

    .line 16
    sub-long/2addr v1, v3

    .line 17
    iput-wide v1, p0, Ll/bml;->f:J

    .line 18
    .line 19
    return-object v0
.end method

.method public final y()Ll/e0l;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/e0l$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e0l$a;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p0}, Ll/bml;->x()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    sget-object v2, Ll/kzm;->a:Ll/kzm;

    .line 17
    .line 18
    invoke-virtual {v2, v0, v1}, Ll/kzm;->a(Ll/e0l$a;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {v0}, Ll/e0l$a;->e()Ll/e0l;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public z(Ll/i5d0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/yml;->b(Ll/i5d0;)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, -0x1

    .line 6
    .line 7
    cmp-long p1, v0, v2

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0, v0, v1}, Ll/bml;->u(J)Lokio/Source;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const p1, 0x7fffffff

    .line 17
    .line 18
    .line 19
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 20
    .line 21
    invoke-static {p0, p1, v0}, Ll/zlk0;->E(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z

    .line 22
    .line 23
    .line 24
    invoke-interface {p0}, Lokio/Source;->close()V

    .line 25
    .line 26
    .line 27
    return-void
.end method
