.class public Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BitString"
.end annotation


# instance fields
.field bytes:[B

.field lastByteBits:I

.field numBytes:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [B

    .line 6
    .line 7
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public appendBits(B)V
    .locals 6

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    if-ne v0, v2, :cond_0

    .line 7
    .line 8
    array-length v0, v1

    .line 9
    mul-int/lit8 v0, v0, 0x2

    .line 10
    .line 11
    invoke-static {v1, v0}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator;->access$000([BI)[B

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 16
    .line 17
    :cond_0
    iget v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 18
    .line 19
    const/16 v1, 0x8

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 25
    .line 26
    iget-object v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    aput-byte p1, v0, v2

    .line 30
    .line 31
    iput v1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->lastByteBits:I

    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->lastByteBits:I

    .line 35
    .line 36
    iget-object v3, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 37
    .line 38
    if-ne v2, v1, :cond_2

    .line 39
    .line 40
    add-int/lit8 v1, v0, 0x1

    .line 41
    .line 42
    iput v1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 43
    .line 44
    aput-byte p1, v3, v0

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    rsub-int/lit8 v1, v2, 0x8

    .line 48
    .line 49
    add-int/lit8 v4, v0, -0x1

    .line 50
    .line 51
    aget-byte v5, v3, v4

    .line 52
    .line 53
    and-int/lit16 p1, p1, 0xff

    .line 54
    .line 55
    shl-int v2, p1, v2

    .line 56
    .line 57
    or-int/2addr v2, v5

    .line 58
    int-to-byte v2, v2

    .line 59
    aput-byte v2, v3, v4

    .line 60
    .line 61
    add-int/lit8 v2, v0, 0x1

    .line 62
    .line 63
    iput v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 64
    .line 65
    shr-int p0, p1, v1

    .line 66
    .line 67
    int-to-byte p0, p0

    .line 68
    aput-byte p0, v3, v0

    .line 69
    .line 70
    return-void
.end method

.method public appendBits([B)V
    .locals 2

    const/4 v0, 0x0

    .line 71
    :goto_0
    array-length v1, p1

    if-eq v0, v1, :cond_0

    .line 72
    aget-byte v1, p1, v0

    invoke-virtual {p0, v1}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->appendBits(B)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getBytes()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLeadingAsInt(I)I
    .locals 3

    .line 1
    iget v0, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x8

    .line 6
    .line 7
    iget v1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->lastByteBits:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    sub-int/2addr v0, p1

    .line 11
    div-int/lit8 p1, v0, 0x8

    .line 12
    .line 13
    rem-int/lit8 v0, v0, 0x8

    .line 14
    .line 15
    iget-object v1, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 16
    .line 17
    aget-byte v1, v1, p1

    .line 18
    .line 19
    and-int/lit16 v1, v1, 0xff

    .line 20
    .line 21
    ushr-int/2addr v1, v0

    .line 22
    rsub-int/lit8 v0, v0, 0x8

    .line 23
    .line 24
    :goto_0
    add-int/lit8 p1, p1, 0x1

    .line 25
    .line 26
    iget v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 27
    .line 28
    if-ge p1, v2, :cond_0

    .line 29
    .line 30
    iget-object v2, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 31
    .line 32
    aget-byte v2, v2, p1

    .line 33
    .line 34
    and-int/lit16 v2, v2, 0xff

    .line 35
    .line 36
    shl-int/2addr v2, v0

    .line 37
    or-int/2addr v1, v2

    .line 38
    add-int/lit8 v0, v0, 0x8

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return v1
.end method

.method public getTrailing(I)Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;
    .locals 5

    .line 1
    new-instance v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;-><init>()V

    .line 4
    .line 5
    .line 6
    add-int/lit8 v1, p1, 0x7

    .line 7
    .line 8
    const/16 v2, 0x8

    .line 9
    .line 10
    div-int/2addr v1, v2

    .line 11
    iput v1, v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 12
    .line 13
    new-array v1, v1, [B

    .line 14
    .line 15
    iput-object v1, v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    :goto_0
    iget v3, v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->numBytes:I

    .line 19
    .line 20
    if-ge v1, v3, :cond_0

    .line 21
    .line 22
    iget-object v3, v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 23
    .line 24
    iget-object v4, p0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 25
    .line 26
    aget-byte v4, v4, v1

    .line 27
    .line 28
    aput-byte v4, v3, v1

    .line 29
    .line 30
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    rem-int/2addr p1, v2

    .line 34
    iput p1, v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->lastByteBits:I

    .line 35
    .line 36
    if-nez p1, :cond_1

    .line 37
    .line 38
    iput v2, v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->lastByteBits:I

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_1
    rsub-int/lit8 p0, p1, 0x20

    .line 42
    .line 43
    iget-object p1, v0, Lorg/spongycastle/pqc/crypto/ntru/IndexGenerator$BitString;->bytes:[B

    .line 44
    .line 45
    add-int/lit8 v1, v3, -0x1

    .line 46
    .line 47
    add-int/lit8 v3, v3, -0x1

    .line 48
    .line 49
    aget-byte v2, p1, v3

    .line 50
    .line 51
    shl-int/2addr v2, p0

    .line 52
    ushr-int p0, v2, p0

    .line 53
    .line 54
    int-to-byte p0, p0

    .line 55
    aput-byte p0, p1, v1

    .line 56
    .line 57
    return-object v0
.end method
