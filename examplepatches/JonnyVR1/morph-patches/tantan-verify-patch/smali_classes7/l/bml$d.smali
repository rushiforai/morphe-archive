.class public Ll/bml$d;
.super Ll/bml$b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/bml;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final d:Ll/rnl;

.field public e:J

.field public f:Z

.field public final synthetic g:Ll/bml;


# direct methods
.method public constructor <init>(Ll/bml;Ll/rnl;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/bml$d;->g:Ll/bml;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, v0}, Ll/bml$b;-><init>(Ll/bml;Ll/bml$a;)V

    .line 5
    .line 6
    .line 7
    const-wide/16 v0, -0x1

    .line 8
    .line 9
    iput-wide v0, p0, Ll/bml$d;->e:J

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/bml$d;->f:Z

    .line 13
    .line 14
    iput-object p2, p0, Ll/bml$d;->d:Ll/rnl;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/bml$b;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-boolean v0, p0, Ll/bml$d;->f:Z

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    const/16 v0, 0x64

    .line 11
    .line 12
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 13
    .line 14
    invoke-static {p0, v0, v1}, Ll/zlk0;->p(Lokio/Source;ILjava/util/concurrent/TimeUnit;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/bml$d;->g:Ll/bml;

    .line 21
    .line 22
    invoke-static {v0}, Ll/bml;->n(Ll/bml;)Ll/imc0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/imc0;->t()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/bml$b;->k()V

    .line 30
    .line 31
    .line 32
    :cond_1
    const/4 v0, 0x1

    .line 33
    iput-boolean v0, p0, Ll/bml$b;->b:Z

    .line 34
    .line 35
    return-void
.end method

.method public final m()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string v0, "expected chunk size and optional extensions but was \""

    .line 2
    .line 3
    iget-wide v1, p0, Ll/bml$d;->e:J

    .line 4
    .line 5
    const-wide/16 v3, -0x1

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/bml$d;->g:Ll/bml;

    .line 12
    .line 13
    invoke-static {v1}, Ll/bml;->m(Ll/bml;)Lokio/BufferedSource;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    :cond_0
    :try_start_0
    iget-object v1, p0, Ll/bml$d;->g:Ll/bml;

    .line 21
    .line 22
    invoke-static {v1}, Ll/bml;->m(Ll/bml;)Lokio/BufferedSource;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-interface {v1}, Lokio/BufferedSource;->readHexadecimalUnsignedLong()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    iput-wide v1, p0, Ll/bml$d;->e:J

    .line 31
    .line 32
    iget-object v1, p0, Ll/bml$d;->g:Ll/bml;

    .line 33
    .line 34
    invoke-static {v1}, Ll/bml;->m(Ll/bml;)Lokio/BufferedSource;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Lokio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iget-wide v2, p0, Ll/bml$d;->e:J

    .line 47
    .line 48
    const-wide/16 v4, 0x0

    .line 49
    .line 50
    cmp-long v2, v2, v4

    .line 51
    .line 52
    if-ltz v2, :cond_3

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_1

    .line 59
    .line 60
    const-string v2, ";"

    .line 61
    .line 62
    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    if-eqz v2, :cond_3

    .line 67
    .line 68
    :cond_1
    iget-wide v0, p0, Ll/bml$d;->e:J

    .line 69
    .line 70
    cmp-long v0, v0, v4

    .line 71
    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    iput-boolean v0, p0, Ll/bml$d;->f:Z

    .line 76
    .line 77
    iget-object v0, p0, Ll/bml$d;->g:Ll/bml;

    .line 78
    .line 79
    invoke-static {v0}, Ll/bml;->q(Ll/bml;)Ll/e0l;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-static {v0, v1}, Ll/bml;->p(Ll/bml;Ll/e0l;)Ll/e0l;

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Ll/bml$d;->g:Ll/bml;

    .line 87
    .line 88
    invoke-static {v0}, Ll/bml;->h(Ll/bml;)Ll/rg50;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/rg50;->l()Ll/eu6;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, p0, Ll/bml$d;->d:Ll/rnl;

    .line 97
    .line 98
    iget-object v2, p0, Ll/bml$d;->g:Ll/bml;

    .line 99
    .line 100
    invoke-static {v2}, Ll/bml;->o(Ll/bml;)Ll/e0l;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-static {v0, v1, v2}, Ll/yml;->g(Ll/eu6;Ll/rnl;Ll/e0l;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Ll/bml$b;->k()V

    .line 108
    .line 109
    .line 110
    :cond_2
    return-void

    .line 111
    :cond_3
    :try_start_1
    new-instance v2, Ljava/net/ProtocolException;

    .line 112
    .line 113
    new-instance v3, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iget-wide v4, p0, Ll/bml$d;->e:J

    .line 119
    .line 120
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string p0, "\""

    .line 127
    .line 128
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-direct {v2, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    throw v2
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 139
    :catch_0
    move-exception p0

    .line 140
    new-instance v0, Ljava/net/ProtocolException;

    .line 141
    .line 142
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-direct {v0, p0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 147
    .line 148
    .line 149
    throw v0
.end method

.method public read(Lokio/Buffer;J)J
    .locals 7
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
    if-ltz v2, :cond_5

    .line 6
    .line 7
    iget-boolean v2, p0, Ll/bml$b;->b:Z

    .line 8
    .line 9
    if-nez v2, :cond_4

    .line 10
    .line 11
    iget-boolean v2, p0, Ll/bml$d;->f:Z

    .line 12
    .line 13
    const-wide/16 v3, -0x1

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    return-wide v3

    .line 18
    :cond_0
    iget-wide v5, p0, Ll/bml$d;->e:J

    .line 19
    .line 20
    cmp-long v0, v5, v0

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    cmp-long v0, v5, v3

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    :cond_1
    invoke-virtual {p0}, Ll/bml$d;->m()V

    .line 29
    .line 30
    .line 31
    iget-boolean v0, p0, Ll/bml$d;->f:Z

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    return-wide v3

    .line 36
    :cond_2
    iget-wide v0, p0, Ll/bml$d;->e:J

    .line 37
    .line 38
    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->min(JJ)J

    .line 39
    .line 40
    .line 41
    move-result-wide p2

    .line 42
    invoke-super {p0, p1, p2, p3}, Ll/bml$b;->read(Lokio/Buffer;J)J

    .line 43
    .line 44
    .line 45
    move-result-wide p1

    .line 46
    cmp-long p3, p1, v3

    .line 47
    .line 48
    if-eqz p3, :cond_3

    .line 49
    .line 50
    iget-wide v0, p0, Ll/bml$d;->e:J

    .line 51
    .line 52
    sub-long/2addr v0, p1

    .line 53
    iput-wide v0, p0, Ll/bml$d;->e:J

    .line 54
    .line 55
    return-wide p1

    .line 56
    :cond_3
    iget-object p1, p0, Ll/bml$d;->g:Ll/bml;

    .line 57
    .line 58
    invoke-static {p1}, Ll/bml;->n(Ll/bml;)Ll/imc0;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ll/imc0;->t()V

    .line 63
    .line 64
    .line 65
    new-instance p1, Ljava/net/ProtocolException;

    .line 66
    .line 67
    const-string p2, "unexpected end of stream"

    .line 68
    .line 69
    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/bml$b;->k()V

    .line 73
    .line 74
    .line 75
    throw p1

    .line 76
    :cond_4
    const-string p0, "closed"

    .line 77
    .line 78
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :goto_0
    const-wide/16 p0, 0x0

    .line 82
    .line 83
    return-wide p0

    .line 84
    :cond_5
    const-string p0, "byteCount < 0: "

    .line 85
    .line 86
    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 87
    .line 88
    .line 89
    goto :goto_0
.end method
