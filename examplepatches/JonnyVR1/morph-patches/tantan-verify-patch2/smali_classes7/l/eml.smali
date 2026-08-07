.class public final Ll/eml;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/o6f;


# static fields
.field public static final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ll/azm$a;

.field public final b:Ll/imc0;

.field public final c:Ll/dml;

.field public volatile d:Ll/gml;

.field public final e:Lokhttp3/Protocol;

.field public volatile f:Z


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    const-string v10, ":scheme"

    .line 2
    .line 3
    const-string v11, ":authority"

    .line 4
    .line 5
    const-string v0, "connection"

    .line 6
    .line 7
    const-string v1, "host"

    .line 8
    .line 9
    const-string v2, "keep-alive"

    .line 10
    .line 11
    const-string v3, "proxy-connection"

    .line 12
    .line 13
    const-string v4, "te"

    .line 14
    .line 15
    const-string v5, "transfer-encoding"

    .line 16
    .line 17
    const-string v6, "encoding"

    .line 18
    .line 19
    const-string v7, "upgrade"

    .line 20
    .line 21
    const-string v8, ":method"

    .line 22
    .line 23
    const-string v9, ":path"

    .line 24
    .line 25
    filled-new-array/range {v0 .. v11}, [Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ll/zlk0;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Ll/eml;->g:Ljava/util/List;

    .line 34
    .line 35
    const-string v7, "encoding"

    .line 36
    .line 37
    const-string v8, "upgrade"

    .line 38
    .line 39
    const-string v1, "connection"

    .line 40
    .line 41
    const-string v2, "host"

    .line 42
    .line 43
    const-string v3, "keep-alive"

    .line 44
    .line 45
    const-string v4, "proxy-connection"

    .line 46
    .line 47
    const-string v5, "te"

    .line 48
    .line 49
    const-string v6, "transfer-encoding"

    .line 50
    .line 51
    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v0}, Ll/zlk0;->u([Ljava/lang/Object;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Ll/eml;->h:Ljava/util/List;

    .line 60
    .line 61
    return-void
.end method

.method public constructor <init>(Ll/rg50;Ll/imc0;Ll/azm$a;Ll/dml;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/eml;->b:Ll/imc0;

    .line 5
    .line 6
    iput-object p3, p0, Ll/eml;->a:Ll/azm$a;

    .line 7
    .line 8
    iput-object p4, p0, Ll/eml;->c:Ll/dml;

    .line 9
    .line 10
    invoke-virtual {p1}, Ll/rg50;->z()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    sget-object p2, Lokhttp3/Protocol;->H2_PRIOR_KNOWLEDGE:Lokhttp3/Protocol;

    .line 15
    .line 16
    invoke-interface {p1, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object p2, Lokhttp3/Protocol;->HTTP_2:Lokhttp3/Protocol;

    .line 24
    .line 25
    :goto_0
    iput-object p2, p0, Ll/eml;->e:Lokhttp3/Protocol;

    .line 26
    .line 27
    return-void
.end method

.method public static h(Ll/x1d0;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            ")",
            "Ljava/util/List<",
            "Ll/xzk;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/x1d0;->e()Ll/e0l;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/e0l;->k()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    add-int/lit8 v2, v2, 0x4

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/xzk;

    .line 17
    .line 18
    sget-object v3, Ll/xzk;->f:Lokio/ByteString;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/x1d0;->g()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-direct {v2, v3, v4}, Ll/xzk;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance v2, Ll/xzk;

    .line 31
    .line 32
    sget-object v3, Ll/xzk;->g:Lokio/ByteString;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-static {v4}, Ll/i2d0;->c(Ll/rnl;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-direct {v2, v3, v4}, Ll/xzk;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    const-string v2, "Host"

    .line 49
    .line 50
    invoke-virtual {p0, v2}, Ll/x1d0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    new-instance v3, Ll/xzk;

    .line 57
    .line 58
    sget-object v4, Ll/xzk;->i:Lokio/ByteString;

    .line 59
    .line 60
    invoke-direct {v3, v4, v2}, Ll/xzk;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_0
    new-instance v2, Ll/xzk;

    .line 67
    .line 68
    sget-object v3, Ll/xzk;->h:Lokio/ByteString;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Ll/rnl;->I()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-direct {v2, v3, p0}, Ll/xzk;-><init>(Lokio/ByteString;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0}, Ll/e0l;->k()I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    const/4 v2, 0x0

    .line 89
    :goto_0
    if-ge v2, p0, :cond_3

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ll/e0l;->f(I)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 96
    .line 97
    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v3

    .line 101
    sget-object v4, Ll/eml;->g:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v4

    .line 107
    if-eqz v4, :cond_1

    .line 108
    .line 109
    const-string v4, "te"

    .line 110
    .line 111
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v4

    .line 115
    if-eqz v4, :cond_2

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Ll/e0l;->m(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    const-string v5, "trailers"

    .line 122
    .line 123
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    if-eqz v4, :cond_2

    .line 128
    .line 129
    :cond_1
    new-instance v4, Ll/xzk;

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Ll/e0l;->m(I)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v5

    .line 135
    invoke-direct {v4, v3, v5}, Ll/xzk;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_3
    return-object v1
.end method

.method public static i(Ll/e0l;Lokhttp3/Protocol;)Ll/i5d0$a;
    .locals 8
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
    invoke-virtual {p0}, Ll/e0l;->k()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x0

    .line 12
    move-object v4, v2

    .line 13
    :goto_0
    if-ge v3, v1, :cond_2

    .line 14
    .line 15
    invoke-virtual {p0, v3}, Ll/e0l;->f(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v5

    .line 19
    invoke-virtual {p0, v3}, Ll/e0l;->m(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    const-string v7, ":status"

    .line 24
    .line 25
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    if-eqz v7, :cond_0

    .line 30
    .line 31
    new-instance v4, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v5, "HTTP/1.1 "

    .line 34
    .line 35
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-static {v4}, Ll/r4g0;->a(Ljava/lang/String;)Ll/r4g0;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    sget-object v7, Ll/eml;->h:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v7, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v7

    .line 56
    if-nez v7, :cond_1

    .line 57
    .line 58
    sget-object v7, Ll/kzm;->a:Ll/kzm;

    .line 59
    .line 60
    invoke-virtual {v7, v0, v5, v6}, Ll/kzm;->b(Ll/e0l$a;Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_2
    if-eqz v4, :cond_3

    .line 67
    .line 68
    new-instance p0, Ll/i5d0$a;

    .line 69
    .line 70
    invoke-direct {p0}, Ll/i5d0$a;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ll/i5d0$a;->o(Lokhttp3/Protocol;)Ll/i5d0$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iget p1, v4, Ll/r4g0;->b:I

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ll/i5d0$a;->g(I)Ll/i5d0$a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    iget-object p1, v4, Ll/r4g0;->c:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ll/i5d0$a;->l(Ljava/lang/String;)Ll/i5d0$a;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {v0}, Ll/e0l$a;->e()Ll/e0l;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Ll/i5d0$a;->j(Ll/e0l;)Ll/i5d0$a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    return-object p0

    .line 98
    :cond_3
    const-string p0, "Expected \':status\' header not present"

    .line 99
    .line 100
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-object v2
.end method


# virtual methods
.method public a(Ll/i5d0;)J
    .locals 0

    .line 1
    invoke-static {p1}, Ll/yml;->b(Ll/i5d0;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    return-wide p0
.end method

.method public b(Ll/x1d0;J)Lokio/Sink;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eml;->d:Ll/gml;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gml;->h()Lokio/Sink;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/eml;->c:Ll/dml;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/dml;->flush()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public cancel()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/eml;->f:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/eml;->d:Ll/gml;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/eml;->d:Ll/gml;

    .line 9
    .line 10
    sget-object v0, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/gml;->f(Lokhttp3/internal/http2/ErrorCode;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public connection()Ll/imc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eml;->b:Ll/imc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ll/x1d0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/eml;->d:Ll/gml;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/x1d0;->a()Ll/z1d0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-static {p1}, Ll/eml;->h(Ll/x1d0;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v1, p0, Ll/eml;->c:Ll/dml;

    .line 20
    .line 21
    invoke-virtual {v1, p1, v0}, Ll/dml;->I(Ljava/util/List;Z)Ll/gml;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/eml;->d:Ll/gml;

    .line 26
    .line 27
    iget-boolean p1, p0, Ll/eml;->f:Z

    .line 28
    .line 29
    iget-object v0, p0, Ll/eml;->d:Ll/gml;

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/gml;->l()Lokio/Timeout;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object v0, p0, Ll/eml;->a:Ll/azm$a;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/azm$a;->readTimeoutMillis()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    int-to-long v0, v0

    .line 44
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 45
    .line 46
    invoke-virtual {p1, v0, v1, v2}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/eml;->d:Ll/gml;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/gml;->r()Lokio/Timeout;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p0, p0, Ll/eml;->a:Ll/azm$a;

    .line 56
    .line 57
    invoke-interface {p0}, Ll/azm$a;->writeTimeoutMillis()I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    int-to-long v0, p0

    .line 62
    invoke-virtual {p1, v0, v1, v2}, Lokio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lokio/Timeout;

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    sget-object p0, Lokhttp3/internal/http2/ErrorCode;->CANCEL:Lokhttp3/internal/http2/ErrorCode;

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Ll/gml;->f(Lokhttp3/internal/http2/ErrorCode;)V

    .line 69
    .line 70
    .line 71
    const-string p0, "Canceled"

    .line 72
    .line 73
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
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
    iget-object p0, p0, Ll/eml;->d:Ll/gml;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gml;->h()Lokio/Sink;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lokio/Sink;->close()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(Z)Ll/i5d0$a;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/eml;->d:Ll/gml;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gml;->p()Ll/e0l;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/eml;->e:Lokhttp3/Protocol;

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/eml;->i(Ll/e0l;Lokhttp3/Protocol;)Ll/i5d0$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    sget-object p1, Ll/kzm;->a:Ll/kzm;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ll/kzm;->d(Ll/i5d0$a;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/16 v0, 0x64

    .line 22
    .line 23
    if-ne p1, v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    :cond_0
    return-object p0
.end method

.method public g(Ll/i5d0;)Lokio/Source;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eml;->d:Ll/gml;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gml;->i()Lokio/Source;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
