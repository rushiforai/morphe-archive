.class public Lorg/spongycastle/util/io/BufferingOutputStream;
.super Ljava/io/OutputStream;
.source "SourceFile"


# instance fields
.field private final buf:[B

.field private bufOff:I

.field private final other:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->other:Ljava/io/OutputStream;

    .line 5
    .line 6
    const/16 p1, 0x1000

    .line 7
    .line 8
    new-array p1, p1, [B

    .line 9
    .line 10
    iput-object p1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->buf:[B

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;I)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->other:Ljava/io/OutputStream;

    .line 15
    new-array p1, p2, [B

    iput-object p1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->buf:[B

    return-void
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
    invoke-virtual {p0}, Lorg/spongycastle/util/io/BufferingOutputStream;->flush()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->other:Ljava/io/OutputStream;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public flush()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->other:Ljava/io/OutputStream;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->buf:[B

    .line 4
    .line 5
    iget v2, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-virtual {v0, v1, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 9
    .line 10
    .line 11
    iput v3, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 12
    .line 13
    iget-object p0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->buf:[B

    .line 14
    .line 15
    invoke-static {p0, v3}, Lorg/spongycastle/util/Arrays;->fill([BB)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public write(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->buf:[B

    iget v1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    .line 65
    array-length p1, v0

    if-ne v2, p1, :cond_0

    .line 66
    invoke-virtual {p0}, Lorg/spongycastle/util/io/BufferingOutputStream;->flush()V

    :cond_0
    return-void
.end method

.method public write([BII)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->buf:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    iget v2, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 5
    .line 6
    sub-int/2addr v1, v2

    .line 7
    if-ge p3, v1, :cond_0

    .line 8
    .line 9
    invoke-static {p1, p2, v0, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    iget p1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 13
    .line 14
    add-int/2addr p1, p3

    .line 15
    iput p1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    array-length v1, v0

    .line 19
    sub-int/2addr v1, v2

    .line 20
    invoke-static {p1, p2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    iget v0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 24
    .line 25
    add-int/2addr v0, v1

    .line 26
    iput v0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 27
    .line 28
    invoke-virtual {p0}, Lorg/spongycastle/util/io/BufferingOutputStream;->flush()V

    .line 29
    .line 30
    .line 31
    add-int/2addr p2, v1

    .line 32
    sub-int/2addr p3, v1

    .line 33
    :goto_0
    iget-object v0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->buf:[B

    .line 34
    .line 35
    array-length v1, v0

    .line 36
    if-lt p3, v1, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->other:Ljava/io/OutputStream;

    .line 39
    .line 40
    array-length v0, v0

    .line 41
    invoke-virtual {v1, p1, p2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->buf:[B

    .line 45
    .line 46
    array-length v1, v0

    .line 47
    add-int/2addr p2, v1

    .line 48
    array-length v0, v0

    .line 49
    sub-int/2addr p3, v0

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    if-lez p3, :cond_2

    .line 52
    .line 53
    iget v1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 54
    .line 55
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    .line 57
    .line 58
    iget p1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 59
    .line 60
    add-int/2addr p1, p3

    .line 61
    iput p1, p0, Lorg/spongycastle/util/io/BufferingOutputStream;->bufOff:I

    .line 62
    .line 63
    :cond_2
    return-void
.end method
