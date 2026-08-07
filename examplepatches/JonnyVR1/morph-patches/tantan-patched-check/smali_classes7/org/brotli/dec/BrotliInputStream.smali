.class public Lorg/brotli/dec/BrotliInputStream;
.super Ljava/io/InputStream;
.source "SourceFile"


# static fields
.field public static final DEFAULT_INTERNAL_BUFFER_SIZE:I = 0x4000


# instance fields
.field private buffer:[B

.field private bufferOffset:I

.field private remainingBufferBytes:I

.field private final state:Lorg/brotli/dec/State;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x4000

    const/4 v1, 0x0

    .line 56
    invoke-direct {p0, p1, v0, v1}, Lorg/brotli/dec/BrotliInputStream;-><init>(Ljava/io/InputStream;I[B)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 55
    invoke-direct {p0, p1, p2, v0}, Lorg/brotli/dec/BrotliInputStream;-><init>(Ljava/io/InputStream;I[B)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I[B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/brotli/dec/State;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/brotli/dec/State;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/brotli/dec/BrotliInputStream;->state:Lorg/brotli/dec/State;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-lez p2, :cond_2

    .line 13
    .line 14
    if-eqz p1, :cond_1

    .line 15
    .line 16
    new-array p2, p2, [B

    .line 17
    .line 18
    iput-object p2, p0, Lorg/brotli/dec/BrotliInputStream;->buffer:[B

    .line 19
    .line 20
    const/4 p2, 0x0

    .line 21
    iput p2, p0, Lorg/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    .line 22
    .line 23
    iput p2, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    .line 24
    .line 25
    :try_start_0
    invoke-static {v0, p1}, Lorg/brotli/dec/State;->setInput(Lorg/brotli/dec/State;Ljava/io/InputStream;)V
    :try_end_0
    .catch Lorg/brotli/dec/BrotliRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    .line 28
    if-eqz p3, :cond_0

    .line 29
    .line 30
    invoke-static {v0, p3}, Lorg/brotli/dec/Decode;->setCustomDictionary(Lorg/brotli/dec/State;[B)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    new-instance p1, Ljava/io/IOException;

    .line 36
    .line 37
    const-string p2, "Brotli decoder initialization failed"

    .line 38
    .line 39
    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    throw p1

    .line 43
    :cond_1
    const-string p0, "source is null"

    .line 44
    .line 45
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    throw v1

    .line 49
    :cond_2
    const-string p0, "Bad buffer size:"

    .line 50
    .line 51
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 52
    .line 53
    .line 54
    throw v1
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/brotli/dec/BrotliInputStream;->state:Lorg/brotli/dec/State;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/brotli/dec/State;->close(Lorg/brotli/dec/State;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 99
    iget v0, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    iget v1, p0, Lorg/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    if-lt v0, v1, :cond_0

    .line 100
    iget-object v0, p0, Lorg/brotli/dec/BrotliInputStream;->buffer:[B

    array-length v1, v0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Lorg/brotli/dec/BrotliInputStream;->read([BII)I

    move-result v0

    iput v0, p0, Lorg/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    .line 101
    iput v2, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return v1

    .line 102
    :cond_0
    iget-object v0, p0, Lorg/brotli/dec/BrotliInputStream;->buffer:[B

    iget v1, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    aget-byte p0, v0, v1

    and-int/lit16 p0, p0, 0xff

    return p0
.end method

.method public read([BII)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p2, :cond_5

    .line 3
    .line 4
    if-ltz p3, :cond_4

    .line 5
    .line 6
    add-int v1, p2, p3

    .line 7
    .line 8
    array-length v2, p1

    .line 9
    if-gt v1, v2, :cond_3

    .line 10
    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    iget v1, p0, Lorg/brotli/dec/BrotliInputStream;->remainingBufferBytes:I

    .line 15
    .line 16
    iget v2, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    .line 17
    .line 18
    sub-int/2addr v1, v2

    .line 19
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-static {v1, p3}, Ljava/lang/Math;->min(II)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Lorg/brotli/dec/BrotliInputStream;->buffer:[B

    .line 30
    .line 31
    iget v3, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    .line 32
    .line 33
    invoke-static {v2, v3, p1, p2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 34
    .line 35
    .line 36
    iget v2, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    .line 37
    .line 38
    add-int/2addr v2, v1

    .line 39
    iput v2, p0, Lorg/brotli/dec/BrotliInputStream;->bufferOffset:I

    .line 40
    .line 41
    add-int/2addr p2, v1

    .line 42
    sub-int/2addr p3, v1

    .line 43
    if-nez p3, :cond_1

    .line 44
    .line 45
    return v1

    .line 46
    :cond_1
    :try_start_0
    iget-object v2, p0, Lorg/brotli/dec/BrotliInputStream;->state:Lorg/brotli/dec/State;

    .line 47
    .line 48
    iput-object p1, v2, Lorg/brotli/dec/State;->output:[B

    .line 49
    .line 50
    iput p2, v2, Lorg/brotli/dec/State;->outputOffset:I

    .line 51
    .line 52
    iput p3, v2, Lorg/brotli/dec/State;->outputLength:I

    .line 53
    .line 54
    iput v0, v2, Lorg/brotli/dec/State;->outputUsed:I

    .line 55
    .line 56
    invoke-static {v2}, Lorg/brotli/dec/Decode;->decompress(Lorg/brotli/dec/State;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lorg/brotli/dec/BrotliInputStream;->state:Lorg/brotli/dec/State;

    .line 60
    .line 61
    iget p0, p0, Lorg/brotli/dec/State;->outputUsed:I
    :try_end_0
    .catch Lorg/brotli/dec/BrotliRuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    if-nez p0, :cond_2

    .line 64
    .line 65
    const/4 p0, -0x1

    .line 66
    return p0

    .line 67
    :cond_2
    add-int/2addr p0, v1

    .line 68
    return p0

    .line 69
    :catch_0
    move-exception p0

    .line 70
    new-instance p1, Ljava/io/IOException;

    .line 71
    .line 72
    const-string p2, "Brotli stream decoding failed"

    .line 73
    .line 74
    invoke-direct {p1, p2, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 75
    .line 76
    .line 77
    throw p1

    .line 78
    :cond_3
    const-string p0, " > "

    .line 79
    .line 80
    array-length p1, p1

    .line 81
    const-string p2, "Buffer overflow: "

    .line 82
    .line 83
    invoke-static {p2, v1, p0, p1}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 84
    .line 85
    .line 86
    return v0

    .line 87
    :cond_4
    const-string p0, "Bad length: "

    .line 88
    .line 89
    invoke-static {p0, p3}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 90
    .line 91
    .line 92
    return v0

    .line 93
    :cond_5
    const-string p0, "Bad offset: "

    .line 94
    .line 95
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 96
    .line 97
    .line 98
    return v0
.end method
