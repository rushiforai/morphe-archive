.class public Ll/etp0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/etp0$a;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Ljava/util/Random;

.field public final c:Lokio/BufferedSink;

.field public d:Z

.field public final e:Lokio/Buffer;

.field public final f:Ll/etp0$a;

.field public g:Z

.field public final h:[B

.field public final i:[B


# direct methods
.method public constructor <init>(ZLokio/BufferedSink;Ljava/util/Random;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lokio/Buffer;

    .line 5
    .line 6
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/etp0;->e:Lokio/Buffer;

    .line 10
    .line 11
    new-instance v0, Ll/etp0$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/etp0$a;-><init>(Ll/etp0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/etp0;->f:Ll/etp0$a;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    if-eqz p2, :cond_3

    .line 20
    .line 21
    if-eqz p3, :cond_2

    .line 22
    .line 23
    iput-boolean p1, p0, Ll/etp0;->a:Z

    .line 24
    .line 25
    iput-object p2, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 26
    .line 27
    iput-object p3, p0, Ll/etp0;->b:Ljava/util/Random;

    .line 28
    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    const/4 p2, 0x4

    .line 32
    new-array p2, p2, [B

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move-object p2, v0

    .line 36
    :goto_0
    iput-object p2, p0, Ll/etp0;->h:[B

    .line 37
    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    const/16 p1, 0x2000

    .line 41
    .line 42
    new-array v0, p1, [B

    .line 43
    .line 44
    :cond_1
    iput-object v0, p0, Ll/etp0;->i:[B

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    const-string p0, "random == null"

    .line 48
    .line 49
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw v0

    .line 53
    :cond_3
    const-string p0, "sink == null"

    .line 54
    .line 55
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    throw v0
.end method


# virtual methods
.method public a(IJ)Lokio/Sink;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/etp0;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/etp0;->g:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/etp0;->f:Ll/etp0$a;

    .line 9
    .line 10
    iput p1, p0, Ll/etp0$a;->a:I

    .line 11
    .line 12
    iput-wide p2, p0, Ll/etp0$a;->b:J

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/etp0$a;->c:Z

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Ll/etp0$a;->d:Z

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const-string p0, "Another message writer is active. Did you call close()?"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public b(ILokio/ByteString;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    if-eqz p2, :cond_3

    .line 6
    .line 7
    :cond_0
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-static {p1}, Ll/btp0;->c(I)V

    .line 10
    .line 11
    .line 12
    :cond_1
    new-instance v0, Lokio/Buffer;

    .line 13
    .line 14
    invoke-direct {v0}, Lokio/Buffer;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    .line 18
    .line 19
    .line 20
    if-eqz p2, :cond_2

    .line 21
    .line 22
    invoke-virtual {v0, p2}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    .line 23
    .line 24
    .line 25
    :cond_2
    invoke-virtual {v0}, Lokio/Buffer;->readByteString()Lokio/ByteString;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_3
    const/16 p1, 0x8

    .line 30
    .line 31
    const/4 p2, 0x1

    .line 32
    :try_start_0
    invoke-virtual {p0, p1, v0}, Ll/etp0;->c(ILokio/ByteString;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    iput-boolean p2, p0, Ll/etp0;->d:Z

    .line 36
    .line 37
    return-void

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    iput-boolean p2, p0, Ll/etp0;->d:Z

    .line 40
    .line 41
    throw p1
.end method

.method public final c(ILokio/ByteString;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/etp0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p2}, Lokio/ByteString;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    int-to-long v1, v0

    .line 10
    const-wide/16 v3, 0x7d

    .line 11
    .line 12
    cmp-long v1, v1, v3

    .line 13
    .line 14
    if-gtz v1, :cond_1

    .line 15
    .line 16
    or-int/lit16 p1, p1, 0x80

    .line 17
    .line 18
    iget-object v1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 19
    .line 20
    invoke-interface {v1, p1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 21
    .line 22
    .line 23
    iget-boolean p1, p0, Ll/etp0;->a:Z

    .line 24
    .line 25
    iget-object v1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    or-int/lit16 p1, v0, 0x80

    .line 30
    .line 31
    invoke-interface {v1, p1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/etp0;->b:Ljava/util/Random;

    .line 35
    .line 36
    iget-object v0, p0, Ll/etp0;->h:[B

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Ljava/util/Random;->nextBytes([B)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 42
    .line 43
    iget-object v0, p0, Ll/etp0;->h:[B

    .line 44
    .line 45
    invoke-interface {p1, v0}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2}, Lokio/ByteString;->toByteArray()[B

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    array-length p1, v1

    .line 53
    int-to-long v2, p1

    .line 54
    iget-object v4, p0, Ll/etp0;->h:[B

    .line 55
    .line 56
    const-wide/16 v5, 0x0

    .line 57
    .line 58
    invoke-static/range {v1 .. v6}, Ll/btp0;->b([BJ[BJ)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 62
    .line 63
    invoke-interface {p1, v1}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-interface {v1, v0}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 71
    .line 72
    invoke-interface {p1, p2}, Lokio/BufferedSink;->write(Lokio/ByteString;)Lokio/BufferedSink;

    .line 73
    .line 74
    .line 75
    :goto_0
    iget-object p0, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 76
    .line 77
    invoke-interface {p0}, Lokio/BufferedSink;->flush()V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    const-string p0, "Payload size must be less than or equal to 125"

    .line 82
    .line 83
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    const-string p0, "closed"

    .line 88
    .line 89
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public d(IJZZ)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/etp0;->d:Z

    .line 2
    .line 3
    if-nez v0, :cond_8

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p4, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move p1, v0

    .line 10
    :goto_0
    if-eqz p5, :cond_1

    .line 11
    .line 12
    or-int/lit16 p1, p1, 0x80

    .line 13
    .line 14
    :cond_1
    iget-object p4, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 15
    .line 16
    invoke-interface {p4, p1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 17
    .line 18
    .line 19
    iget-boolean p1, p0, Ll/etp0;->a:Z

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/16 p1, 0x80

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    move p1, v0

    .line 27
    :goto_1
    const-wide/16 p4, 0x7d

    .line 28
    .line 29
    cmp-long p4, p2, p4

    .line 30
    .line 31
    if-gtz p4, :cond_3

    .line 32
    .line 33
    long-to-int p4, p2

    .line 34
    or-int/2addr p1, p4

    .line 35
    iget-object p4, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 36
    .line 37
    invoke-interface {p4, p1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 38
    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_3
    const-wide/32 p4, 0xffff

    .line 42
    .line 43
    .line 44
    cmp-long p4, p2, p4

    .line 45
    .line 46
    iget-object p5, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 47
    .line 48
    if-gtz p4, :cond_4

    .line 49
    .line 50
    or-int/lit8 p1, p1, 0x7e

    .line 51
    .line 52
    invoke-interface {p5, p1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 56
    .line 57
    long-to-int p4, p2

    .line 58
    invoke-interface {p1, p4}, Lokio/BufferedSink;->writeShort(I)Lokio/BufferedSink;

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :cond_4
    or-int/lit8 p1, p1, 0x7f

    .line 63
    .line 64
    invoke-interface {p5, p1}, Lokio/BufferedSink;->writeByte(I)Lokio/BufferedSink;

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 68
    .line 69
    invoke-interface {p1, p2, p3}, Lokio/BufferedSink;->writeLong(J)Lokio/BufferedSink;

    .line 70
    .line 71
    .line 72
    :goto_2
    iget-boolean p1, p0, Ll/etp0;->a:Z

    .line 73
    .line 74
    if-eqz p1, :cond_6

    .line 75
    .line 76
    iget-object p1, p0, Ll/etp0;->b:Ljava/util/Random;

    .line 77
    .line 78
    iget-object p4, p0, Ll/etp0;->h:[B

    .line 79
    .line 80
    invoke-virtual {p1, p4}, Ljava/util/Random;->nextBytes([B)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 84
    .line 85
    iget-object p4, p0, Ll/etp0;->h:[B

    .line 86
    .line 87
    invoke-interface {p1, p4}, Lokio/BufferedSink;->write([B)Lokio/BufferedSink;

    .line 88
    .line 89
    .line 90
    const-wide/16 p4, 0x0

    .line 91
    .line 92
    move-wide v5, p4

    .line 93
    :goto_3
    cmp-long p1, v5, p2

    .line 94
    .line 95
    if-gez p1, :cond_7

    .line 96
    .line 97
    iget-object p1, p0, Ll/etp0;->i:[B

    .line 98
    .line 99
    array-length p1, p1

    .line 100
    int-to-long p4, p1

    .line 101
    invoke-static {p2, p3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    .line 102
    .line 103
    .line 104
    move-result-wide p4

    .line 105
    long-to-int p1, p4

    .line 106
    iget-object p4, p0, Ll/etp0;->e:Lokio/Buffer;

    .line 107
    .line 108
    iget-object p5, p0, Ll/etp0;->i:[B

    .line 109
    .line 110
    invoke-virtual {p4, p5, v0, p1}, Lokio/Buffer;->read([BII)I

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    const/4 p4, -0x1

    .line 115
    if-eq p1, p4, :cond_5

    .line 116
    .line 117
    iget-object v1, p0, Ll/etp0;->i:[B

    .line 118
    .line 119
    int-to-long v2, p1

    .line 120
    iget-object v4, p0, Ll/etp0;->h:[B

    .line 121
    .line 122
    invoke-static/range {v1 .. v6}, Ll/btp0;->b([BJ[BJ)V

    .line 123
    .line 124
    .line 125
    iget-object p4, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 126
    .line 127
    iget-object p5, p0, Ll/etp0;->i:[B

    .line 128
    .line 129
    invoke-interface {p4, p5, v0, p1}, Lokio/BufferedSink;->write([BII)Lokio/BufferedSink;

    .line 130
    .line 131
    .line 132
    add-long/2addr v5, v2

    .line 133
    goto :goto_3

    .line 134
    :cond_5
    invoke-static {}, Ll/aqg0;->a()V

    .line 135
    .line 136
    .line 137
    return-void

    .line 138
    :cond_6
    iget-object p1, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 139
    .line 140
    iget-object p4, p0, Ll/etp0;->e:Lokio/Buffer;

    .line 141
    .line 142
    invoke-interface {p1, p4, p2, p3}, Lokio/Sink;->write(Lokio/Buffer;J)V

    .line 143
    .line 144
    .line 145
    :cond_7
    iget-object p0, p0, Ll/etp0;->c:Lokio/BufferedSink;

    .line 146
    .line 147
    invoke-interface {p0}, Lokio/BufferedSink;->emit()Lokio/BufferedSink;

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :cond_8
    const-string p0, "closed"

    .line 152
    .line 153
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    return-void
.end method

.method public e(Lokio/ByteString;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/etp0;->c(ILokio/ByteString;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public f(Lokio/ByteString;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/etp0;->c(ILokio/ByteString;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
