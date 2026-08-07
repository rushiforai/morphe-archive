.class public Ll/fh3;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public declared-synchronized a(Ll/smc0;)Ll/yc60;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1}, Ll/smc0;->m()Ll/vzv;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "start read buffer"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/vzv;->a(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Ll/smc0;->f()Ll/jx5;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/jx5;->L()Lokio/BufferedSource;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1}, Ll/smc0;->p()Ll/etf0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/etf0;->a()Ll/ftf0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ll/ftf0;->d()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    new-array v2, v2, [B

    .line 32
    .line 33
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    sget-object v3, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v0, v2}, Lokio/BufferedSource;->readFully([B)V

    .line 48
    .line 49
    .line 50
    new-instance v4, Lokio/Buffer;

    .line 51
    .line 52
    invoke-direct {v4}, Lokio/Buffer;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4, v2}, Lokio/Buffer;->write([B)Lokio/Buffer;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v4, p1}, Ll/ftf0;->a(Lokio/Buffer;Ll/smc0;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ll/ftf0;->c()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const/high16 v4, 0xa00000

    .line 66
    .line 67
    if-gt v2, v4, :cond_0

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/ftf0;->c()I

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    new-array v2, v2, [B

    .line 74
    .line 75
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    invoke-interface {v0, v2}, Lokio/BufferedSource;->readFully([B)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ll/smc0;->p()Ll/etf0;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Ll/etf0;->b()Ll/yc60;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p1, v1}, Ll/yc60;->e(Ll/ftf0;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p1, v2}, Ll/yc60;->d([B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 102
    .line 103
    .line 104
    monitor-exit p0

    .line 105
    return-object p1

    .line 106
    :catchall_0
    move-exception p1

    .line 107
    goto :goto_0

    .line 108
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 109
    .line 110
    const-string v0, "body is too long"

    .line 111
    .line 112
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    throw p1

    .line 116
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 117
    throw p1
.end method
