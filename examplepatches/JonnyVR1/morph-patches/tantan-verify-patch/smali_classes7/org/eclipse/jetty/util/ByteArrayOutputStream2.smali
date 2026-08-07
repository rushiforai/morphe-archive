.class public Lorg/eclipse/jetty/util/ByteArrayOutputStream2;
.super Ljava/io/ByteArrayOutputStream;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 5
    invoke-direct {p0, p1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getBuf()[B
    .locals 0

    .line 1
    iget-object p0, p0, Ljava/io/ByteArrayOutputStream;->buf:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget p0, p0, Ljava/io/ByteArrayOutputStream;->count:I

    .line 2
    .line 3
    return p0
.end method

.method public reset(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ljava/io/ByteArrayOutputStream;->buf:[B

    .line 5
    .line 6
    array-length v0, v0

    .line 7
    if-ge v0, p1, :cond_0

    .line 8
    .line 9
    new-array p1, p1, [B

    .line 10
    .line 11
    iput-object p1, p0, Ljava/io/ByteArrayOutputStream;->buf:[B

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Ljava/io/ByteArrayOutputStream;->count:I

    .line 2
    .line 3
    return-void
.end method

.method public writeUnchecked(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ljava/io/ByteArrayOutputStream;->buf:[B

    .line 2
    .line 3
    iget v1, p0, Ljava/io/ByteArrayOutputStream;->count:I

    .line 4
    .line 5
    add-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    iput v2, p0, Ljava/io/ByteArrayOutputStream;->count:I

    .line 8
    .line 9
    int-to-byte p0, p1

    .line 10
    aput-byte p0, v0, v1

    .line 11
    .line 12
    return-void
.end method
