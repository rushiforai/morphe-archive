.class public Lorg/spongycastle/crypto/tls/ByteQueue;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DEFAULT_CAPACITY:I = 0x400


# instance fields
.field private available:I

.field private databuf:[B

.field private skipped:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x400

    .line 14
    invoke-direct {p0, v0}, Lorg/spongycastle/crypto/tls/ByteQueue;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 6
    .line 7
    iput v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 8
    .line 9
    new-array p1, p1, [B

    .line 10
    .line 11
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->databuf:[B

    .line 12
    .line 13
    return-void
.end method

.method public static nextTwoPow(I)I
    .locals 1

    shr-int/lit8 v0, p0, 0x1

    or-int/2addr p0, v0

    shr-int/lit8 v0, p0, 0x2

    or-int/2addr p0, v0

    shr-int/lit8 v0, p0, 0x4

    or-int/2addr p0, v0

    shr-int/lit8 v0, p0, 0x8

    or-int/2addr p0, v0

    shr-int/lit8 v0, p0, 0x10

    or-int/2addr p0, v0

    add-int/lit8 p0, p0, 0x1

    return p0
.end method


# virtual methods
.method public addData([BII)V
    .locals 5

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 4
    .line 5
    add-int/2addr v0, v1

    .line 6
    add-int/2addr v0, p3

    .line 7
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->databuf:[B

    .line 8
    .line 9
    array-length v2, v2

    .line 10
    if-le v0, v2, :cond_1

    .line 11
    .line 12
    add-int/2addr v1, p3

    .line 13
    invoke-static {v1}, Lorg/spongycastle/crypto/tls/ByteQueue;->nextTwoPow(I)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->databuf:[B

    .line 18
    .line 19
    array-length v2, v1

    .line 20
    const/4 v3, 0x0

    .line 21
    if-le v0, v2, :cond_0

    .line 22
    .line 23
    new-array v0, v0, [B

    .line 24
    .line 25
    iget v2, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 26
    .line 27
    iget v4, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 28
    .line 29
    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->databuf:[B

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 36
    .line 37
    iget v2, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 38
    .line 39
    invoke-static {v1, v0, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iput v3, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->databuf:[B

    .line 45
    .line 46
    iget v1, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 47
    .line 48
    iget v2, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 49
    .line 50
    add-int/2addr v1, v2

    .line 51
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    .line 53
    .line 54
    iget p1, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 55
    .line 56
    add-int/2addr p1, p3

    .line 57
    iput p1, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 58
    .line 59
    return-void
.end method

.method public available()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 2
    .line 3
    return p0
.end method

.method public read([BIII)V
    .locals 1

    .line 1
    array-length v0, p1

    .line 2
    sub-int/2addr v0, p2

    .line 3
    if-lt v0, p3, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 6
    .line 7
    sub-int/2addr v0, p4

    .line 8
    if-lt v0, p3, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->databuf:[B

    .line 11
    .line 12
    iget p0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 13
    .line 14
    add-int/2addr p0, p4

    .line 15
    invoke-static {v0, p0, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const-string p0, "Not enough data to read"

    .line 20
    .line 21
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    array-length p0, p1

    .line 26
    const-string p1, " is too small for a read of "

    .line 27
    .line 28
    const-string p2, " bytes"

    .line 29
    .line 30
    const-string p4, "Buffer size of "

    .line 31
    .line 32
    invoke-static {p4, p0, p1, p3, p2}, Ll/cmq;->a(Ljava/lang/String;ILjava/lang/Object;ILjava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public removeData(I)V
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 2
    .line 3
    if-gt p1, v0, :cond_0

    .line 4
    .line 5
    sub-int/2addr v0, p1

    .line 6
    iput v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 7
    .line 8
    iget v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 9
    .line 10
    add-int/2addr v0, p1

    .line 11
    iput v0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->skipped:I

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 15
    .line 16
    iget p0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "Cannot remove "

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p1, " bytes, only got "

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw v0
.end method

.method public removeData([BIII)V
    .locals 0

    .line 44
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/spongycastle/crypto/tls/ByteQueue;->read([BIII)V

    add-int/2addr p4, p3

    .line 45
    invoke-virtual {p0, p4}, Lorg/spongycastle/crypto/tls/ByteQueue;->removeData(I)V

    return-void
.end method

.method public removeData(II)[B
    .locals 2

    .line 46
    new-array v0, p1, [B

    const/4 v1, 0x0

    .line 47
    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/spongycastle/crypto/tls/ByteQueue;->removeData([BIII)V

    return-object v0
.end method

.method public size()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/crypto/tls/ByteQueue;->available:I

    .line 2
    .line 3
    return p0
.end method
