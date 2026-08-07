.class public final Ll/ftp0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ftp0$a;
    }
.end annotation


# instance fields
.field public final a:Z

.field public final b:Ljava/util/Random;

.field public final c:Lokio/BufferedSink;

.field public final d:Lokio/Buffer;

.field public e:Z

.field public final f:Lokio/Buffer;

.field public final g:Ll/ftp0$a;

.field public h:Z

.field public final i:[B

.field public final j:Lokio/Buffer$UnsafeCursor;


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
    iput-object v0, p0, Ll/ftp0;->f:Lokio/Buffer;

    .line 10
    .line 11
    new-instance v0, Ll/ftp0$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/ftp0$a;-><init>(Ll/ftp0;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ftp0;->g:Ll/ftp0$a;

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
    iput-boolean p1, p0, Ll/ftp0;->a:Z

    .line 24
    .line 25
    iput-object p2, p0, Ll/ftp0;->c:Lokio/BufferedSink;

    .line 26
    .line 27
    invoke-interface {p2}, Lokio/BufferedSink;->buffer()Lokio/Buffer;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    iput-object p2, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 32
    .line 33
    iput-object p3, p0, Ll/ftp0;->b:Ljava/util/Random;

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    const/4 p2, 0x4

    .line 38
    new-array p2, p2, [B

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    move-object p2, v0

    .line 42
    :goto_0
    iput-object p2, p0, Ll/ftp0;->i:[B

    .line 43
    .line 44
    if-eqz p1, :cond_1

    .line 45
    .line 46
    new-instance v0, Lokio/Buffer$UnsafeCursor;

    .line 47
    .line 48
    invoke-direct {v0}, Lokio/Buffer$UnsafeCursor;-><init>()V

    .line 49
    .line 50
    .line 51
    :cond_1
    iput-object v0, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 52
    .line 53
    return-void

    .line 54
    :cond_2
    const-string p0, "random == null"

    .line 55
    .line 56
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw v0

    .line 60
    :cond_3
    const-string p0, "sink == null"

    .line 61
    .line 62
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw v0
.end method


# virtual methods
.method public a(IJ)Lokio/Sink;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ftp0;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/ftp0;->h:Z

    .line 7
    .line 8
    iget-object p0, p0, Ll/ftp0;->g:Ll/ftp0$a;

    .line 9
    .line 10
    iput p1, p0, Ll/ftp0$a;->a:I

    .line 11
    .line 12
    iput-wide p2, p0, Ll/ftp0$a;->b:J

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/ftp0$a;->c:Z

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Ll/ftp0$a;->d:Z

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
    invoke-static {p1}, Ll/atp0;->c(I)V

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
    invoke-virtual {p0, p1, v0}, Ll/ftp0;->c(ILokio/ByteString;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    .line 34
    .line 35
    iput-boolean p2, p0, Ll/ftp0;->e:Z

    .line 36
    .line 37
    return-void

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    iput-boolean p2, p0, Ll/ftp0;->e:Z

    .line 40
    .line 41
    throw p1
.end method

.method public final c(ILokio/ByteString;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ftp0;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

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
    if-gtz v1, :cond_2

    .line 15
    .line 16
    or-int/lit16 p1, p1, 0x80

    .line 17
    .line 18
    iget-object v1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 19
    .line 20
    invoke-virtual {v1, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 21
    .line 22
    .line 23
    iget-boolean p1, p0, Ll/ftp0;->a:Z

    .line 24
    .line 25
    iget-object v1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    or-int/lit16 p1, v0, 0x80

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ftp0;->b:Ljava/util/Random;

    .line 35
    .line 36
    iget-object v1, p0, Ll/ftp0;->i:[B

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Ljava/util/Random;->nextBytes([B)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 42
    .line 43
    iget-object v1, p0, Ll/ftp0;->i:[B

    .line 44
    .line 45
    invoke-virtual {p1, v1}, Lokio/Buffer;->write([B)Lokio/Buffer;

    .line 46
    .line 47
    .line 48
    if-lez v0, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 51
    .line 52
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    .line 53
    .line 54
    .line 55
    move-result-wide v0

    .line 56
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 62
    .line 63
    iget-object p2, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 64
    .line 65
    invoke-virtual {p1, p2}, Lokio/Buffer;->readAndWriteUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 69
    .line 70
    invoke-virtual {p1, v0, v1}, Lokio/Buffer$UnsafeCursor;->seek(J)I

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 74
    .line 75
    iget-object p2, p0, Ll/ftp0;->i:[B

    .line 76
    .line 77
    invoke-static {p1, p2}, Ll/atp0;->b(Lokio/Buffer$UnsafeCursor;[B)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 81
    .line 82
    invoke-virtual {p1}, Lokio/Buffer$UnsafeCursor;->close()V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {v1, v0}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 90
    .line 91
    invoke-virtual {p1, p2}, Lokio/Buffer;->write(Lokio/ByteString;)Lokio/Buffer;

    .line 92
    .line 93
    .line 94
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/ftp0;->c:Lokio/BufferedSink;

    .line 95
    .line 96
    invoke-interface {p0}, Lokio/BufferedSink;->flush()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_2
    const-string p0, "Payload size must be less than or equal to 125"

    .line 101
    .line 102
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_3
    const-string p0, "closed"

    .line 107
    .line 108
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public d(IJZZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/ftp0;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_7

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
    iget-object p4, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 15
    .line 16
    invoke-virtual {p4, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 17
    .line 18
    .line 19
    iget-boolean p1, p0, Ll/ftp0;->a:Z

    .line 20
    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    const/16 v0, 0x80

    .line 24
    .line 25
    :cond_2
    const-wide/16 p4, 0x7d

    .line 26
    .line 27
    cmp-long p1, p2, p4

    .line 28
    .line 29
    if-gtz p1, :cond_3

    .line 30
    .line 31
    long-to-int p1, p2

    .line 32
    or-int/2addr p1, v0

    .line 33
    iget-object p4, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 34
    .line 35
    invoke-virtual {p4, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    const-wide/32 p4, 0xffff

    .line 40
    .line 41
    .line 42
    cmp-long p1, p2, p4

    .line 43
    .line 44
    iget-object p4, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 45
    .line 46
    if-gtz p1, :cond_4

    .line 47
    .line 48
    or-int/lit8 p1, v0, 0x7e

    .line 49
    .line 50
    invoke-virtual {p4, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 54
    .line 55
    long-to-int p4, p2

    .line 56
    invoke-virtual {p1, p4}, Lokio/Buffer;->writeShort(I)Lokio/Buffer;

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_4
    or-int/lit8 p1, v0, 0x7f

    .line 61
    .line 62
    invoke-virtual {p4, p1}, Lokio/Buffer;->writeByte(I)Lokio/Buffer;

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 66
    .line 67
    invoke-virtual {p1, p2, p3}, Lokio/Buffer;->writeLong(J)Lokio/Buffer;

    .line 68
    .line 69
    .line 70
    :goto_1
    iget-boolean p1, p0, Ll/ftp0;->a:Z

    .line 71
    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    iget-object p1, p0, Ll/ftp0;->b:Ljava/util/Random;

    .line 75
    .line 76
    iget-object p4, p0, Ll/ftp0;->i:[B

    .line 77
    .line 78
    invoke-virtual {p1, p4}, Ljava/util/Random;->nextBytes([B)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 82
    .line 83
    iget-object p4, p0, Ll/ftp0;->i:[B

    .line 84
    .line 85
    invoke-virtual {p1, p4}, Lokio/Buffer;->write([B)Lokio/Buffer;

    .line 86
    .line 87
    .line 88
    const-wide/16 p4, 0x0

    .line 89
    .line 90
    cmp-long p1, p2, p4

    .line 91
    .line 92
    if-lez p1, :cond_6

    .line 93
    .line 94
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 95
    .line 96
    invoke-virtual {p1}, Lokio/Buffer;->size()J

    .line 97
    .line 98
    .line 99
    move-result-wide p4

    .line 100
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 101
    .line 102
    iget-object v0, p0, Ll/ftp0;->f:Lokio/Buffer;

    .line 103
    .line 104
    invoke-virtual {p1, v0, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 108
    .line 109
    iget-object p2, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 110
    .line 111
    invoke-virtual {p1, p2}, Lokio/Buffer;->readAndWriteUnsafe(Lokio/Buffer$UnsafeCursor;)Lokio/Buffer$UnsafeCursor;

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 115
    .line 116
    invoke-virtual {p1, p4, p5}, Lokio/Buffer$UnsafeCursor;->seek(J)I

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 120
    .line 121
    iget-object p2, p0, Ll/ftp0;->i:[B

    .line 122
    .line 123
    invoke-static {p1, p2}, Ll/atp0;->b(Lokio/Buffer$UnsafeCursor;[B)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Ll/ftp0;->j:Lokio/Buffer$UnsafeCursor;

    .line 127
    .line 128
    invoke-virtual {p1}, Lokio/Buffer$UnsafeCursor;->close()V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_5
    iget-object p1, p0, Ll/ftp0;->d:Lokio/Buffer;

    .line 133
    .line 134
    iget-object p4, p0, Ll/ftp0;->f:Lokio/Buffer;

    .line 135
    .line 136
    invoke-virtual {p1, p4, p2, p3}, Lokio/Buffer;->write(Lokio/Buffer;J)V

    .line 137
    .line 138
    .line 139
    :cond_6
    :goto_2
    iget-object p0, p0, Ll/ftp0;->c:Lokio/BufferedSink;

    .line 140
    .line 141
    invoke-interface {p0}, Lokio/BufferedSink;->emit()Lokio/BufferedSink;

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_7
    const-string p0, "closed"

    .line 146
    .line 147
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
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
    invoke-virtual {p0, v0, p1}, Ll/ftp0;->c(ILokio/ByteString;)V

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
    invoke-virtual {p0, v0, p1}, Ll/ftp0;->c(ILokio/ByteString;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
