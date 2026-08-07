.class public Lorg/seamless/util/io/Base64Coder$OutputStream;
.super Ljava/io/FilterOutputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/seamless/util/io/Base64Coder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OutputStream"
.end annotation


# instance fields
.field private b4:[B

.field private breakLines:Z

.field private buffer:[B

.field private bufferLength:I

.field private decodabet:[B

.field private encode:Z

.field private lineLength:I

.field private options:I

.field private position:I

.field private suspendEncoding:Z


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1

    const/4 v0, 0x1

    .line 54
    invoke-direct {p0, p1, v0}, Lorg/seamless/util/io/Base64Coder$OutputStream;-><init>(Ljava/io/OutputStream;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 2
    .line 3
    .line 4
    and-int/lit8 p1, p2, 0x8

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    move p1, v0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move p1, v1

    .line 13
    :goto_0
    iput-boolean p1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->breakLines:Z

    .line 14
    .line 15
    and-int/lit8 p1, p2, 0x1

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    move v0, v1

    .line 21
    :goto_1
    iput-boolean v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->encode:Z

    .line 22
    .line 23
    const/4 p1, 0x4

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v0, 0x3

    .line 27
    goto :goto_2

    .line 28
    :cond_2
    move v0, p1

    .line 29
    :goto_2
    iput v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->bufferLength:I

    .line 30
    .line 31
    new-array v0, v0, [B

    .line 32
    .line 33
    iput-object v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->buffer:[B

    .line 34
    .line 35
    iput v1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 36
    .line 37
    iput v1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->lineLength:I

    .line 38
    .line 39
    iput-boolean v1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->suspendEncoding:Z

    .line 40
    .line 41
    new-array p1, p1, [B

    .line 42
    .line 43
    iput-object p1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->b4:[B

    .line 44
    .line 45
    iput p2, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->options:I

    .line 46
    .line 47
    invoke-static {p2}, Lorg/seamless/util/io/Base64Coder;->access$000(I)[B

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->decodabet:[B

    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/seamless/util/io/Base64Coder$OutputStream;->flushBase64()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->buffer:[B

    .line 9
    .line 10
    iput-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 11
    .line 12
    return-void
.end method

.method public flushBase64()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 2
    .line 3
    if-lez v0, :cond_1

    .line 4
    .line 5
    iget-boolean v1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->encode:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 10
    .line 11
    iget-object v2, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->b4:[B

    .line 12
    .line 13
    iget-object v3, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->buffer:[B

    .line 14
    .line 15
    iget v4, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->options:I

    .line 16
    .line 17
    invoke-static {v2, v3, v0, v4}, Lorg/seamless/util/io/Base64Coder;->access$300([B[BII)[B

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    const-string p0, "Base64 input not properly padded."

    .line 29
    .line 30
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public resumeEncoding()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->suspendEncoding:Z

    .line 3
    .line 4
    return-void
.end method

.method public suspendEncoding()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/seamless/util/io/Base64Coder$OutputStream;->flushBase64()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->suspendEncoding:Z

    .line 6
    .line 7
    return-void
.end method

.method public write(I)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->suspendEncoding:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-boolean v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->encode:Z

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->buffer:[B

    .line 17
    .line 18
    iget v2, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 19
    .line 20
    add-int/lit8 v3, v2, 0x1

    .line 21
    .line 22
    iput v3, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 23
    .line 24
    int-to-byte p1, p1

    .line 25
    aput-byte p1, v0, v2

    .line 26
    .line 27
    iget p1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->bufferLength:I

    .line 28
    .line 29
    if-lt v3, p1, :cond_4

    .line 30
    .line 31
    iget-object v2, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 32
    .line 33
    iget-object v3, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->b4:[B

    .line 34
    .line 35
    iget v4, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->options:I

    .line 36
    .line 37
    invoke-static {v3, v0, p1, v4}, Lorg/seamless/util/io/Base64Coder;->access$300([B[BII)[B

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 42
    .line 43
    .line 44
    iget p1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->lineLength:I

    .line 45
    .line 46
    add-int/lit8 p1, p1, 0x4

    .line 47
    .line 48
    iput p1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->lineLength:I

    .line 49
    .line 50
    iget-boolean v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->breakLines:Z

    .line 51
    .line 52
    if-eqz v0, :cond_1

    .line 53
    .line 54
    const/16 v0, 0x4c

    .line 55
    .line 56
    if-lt p1, v0, :cond_1

    .line 57
    .line 58
    iget-object p1, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 59
    .line 60
    const/16 v0, 0xa

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 63
    .line 64
    .line 65
    iput v1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->lineLength:I

    .line 66
    .line 67
    :cond_1
    iput v1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 68
    .line 69
    return-void

    .line 70
    :cond_2
    iget-object v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->decodabet:[B

    .line 71
    .line 72
    and-int/lit8 v2, p1, 0x7f

    .line 73
    .line 74
    aget-byte v0, v0, v2

    .line 75
    .line 76
    const/4 v2, -0x5

    .line 77
    if-le v0, v2, :cond_3

    .line 78
    .line 79
    iget-object v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->buffer:[B

    .line 80
    .line 81
    iget v2, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 82
    .line 83
    add-int/lit8 v3, v2, 0x1

    .line 84
    .line 85
    iput v3, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 86
    .line 87
    int-to-byte p1, p1

    .line 88
    aput-byte p1, v0, v2

    .line 89
    .line 90
    iget p1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->bufferLength:I

    .line 91
    .line 92
    if-lt v3, p1, :cond_4

    .line 93
    .line 94
    iget-object p1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->b4:[B

    .line 95
    .line 96
    iget v2, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->options:I

    .line 97
    .line 98
    invoke-static {v0, v1, p1, v1, v2}, Lorg/seamless/util/io/Base64Coder;->access$200([BI[BII)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    iget-object v0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    .line 103
    .line 104
    iget-object v2, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->b4:[B

    .line 105
    .line 106
    invoke-virtual {v0, v2, v1, p1}, Ljava/io/OutputStream;->write([BII)V

    .line 107
    .line 108
    .line 109
    iput v1, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->position:I

    .line 110
    .line 111
    return-void

    .line 112
    :cond_3
    if-ne v0, v2, :cond_5

    .line 113
    .line 114
    :cond_4
    return-void

    .line 115
    :cond_5
    const-string p0, "Invalid character in Base64 data."

    .line 116
    .line 117
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public write([BII)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    iget-boolean v0, p0, Lorg/seamless/util/io/Base64Coder$OutputStream;->suspendEncoding:Z

    if-eqz v0, :cond_0

    .line 122
    iget-object p0, p0, Ljava/io/FilterOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {p0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    return-void

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_1

    add-int v1, p2, v0

    .line 123
    aget-byte v1, p1, v1

    invoke-virtual {p0, v1}, Lorg/seamless/util/io/Base64Coder$OutputStream;->write(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
