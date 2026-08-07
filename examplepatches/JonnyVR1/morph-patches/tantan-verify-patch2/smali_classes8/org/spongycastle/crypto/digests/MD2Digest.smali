.class public Lorg/spongycastle/crypto/digests/MD2Digest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/ExtendedDigest;
.implements Lorg/spongycastle/util/Memoable;


# static fields
.field private static final DIGEST_LENGTH:I = 0x10

.field private static final S:[B


# instance fields
.field private C:[B

.field private COff:I

.field private M:[B

.field private X:[B

.field private mOff:I

.field private xOff:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/crypto/digests/MD2Digest;->S:[B

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 1
        0x29t
        0x2et
        0x43t
        -0x37t
        -0x5et
        -0x28t
        0x7ct
        0x1t
        0x3dt
        0x36t
        0x54t
        -0x5ft
        -0x14t
        -0x10t
        0x6t
        0x13t
        0x62t
        -0x59t
        0x5t
        -0xdt
        -0x40t
        -0x39t
        0x73t
        -0x74t
        -0x68t
        -0x6dt
        0x2bt
        -0x27t
        -0x44t
        0x4ct
        -0x7et
        -0x36t
        0x1et
        -0x65t
        0x57t
        0x3ct
        -0x3t
        -0x2ct
        -0x20t
        0x16t
        0x67t
        0x42t
        0x6ft
        0x18t
        -0x76t
        0x17t
        -0x1bt
        0x12t
        -0x42t
        0x4et
        -0x3ct
        -0x2at
        -0x26t
        -0x62t
        -0x22t
        0x49t
        -0x60t
        -0x5t
        -0xbt
        -0x72t
        -0x45t
        0x2ft
        -0x12t
        0x7at
        -0x57t
        0x68t
        0x79t
        -0x6ft
        0x15t
        -0x4et
        0x7t
        0x3ft
        -0x6ct
        -0x3et
        0x10t
        -0x77t
        0xbt
        0x22t
        0x5ft
        0x21t
        -0x80t
        0x7ft
        0x5dt
        -0x66t
        0x5at
        -0x70t
        0x32t
        0x27t
        0x35t
        0x3et
        -0x34t
        -0x19t
        -0x41t
        -0x9t
        -0x69t
        0x3t
        -0x1t
        0x19t
        0x30t
        -0x4dt
        0x48t
        -0x5bt
        -0x4bt
        -0x2ft
        -0x29t
        0x5et
        -0x6et
        0x2at
        -0x54t
        0x56t
        -0x56t
        -0x3at
        0x4ft
        -0x48t
        0x38t
        -0x2et
        -0x6at
        -0x5ct
        0x7dt
        -0x4at
        0x76t
        -0x4t
        0x6bt
        -0x1et
        -0x64t
        0x74t
        0x4t
        -0xft
        0x45t
        -0x63t
        0x70t
        0x59t
        0x64t
        0x71t
        -0x79t
        0x20t
        -0x7at
        0x5bt
        -0x31t
        0x65t
        -0x1at
        0x2dt
        -0x58t
        0x2t
        0x1bt
        0x60t
        0x25t
        -0x53t
        -0x52t
        -0x50t
        -0x47t
        -0xat
        0x1ct
        0x46t
        0x61t
        0x69t
        0x34t
        0x40t
        0x7et
        0xft
        0x55t
        0x47t
        -0x5dt
        0x23t
        -0x23t
        0x51t
        -0x51t
        0x3at
        -0x3dt
        0x5ct
        -0x7t
        -0x32t
        -0x46t
        -0x3bt
        -0x16t
        0x26t
        0x2ct
        0x53t
        0xdt
        0x6et
        -0x7bt
        0x28t
        -0x7ct
        0x9t
        -0x2dt
        -0x21t
        -0x33t
        -0xct
        0x41t
        -0x7ft
        0x4dt
        0x52t
        0x6at
        -0x24t
        0x37t
        -0x38t
        0x6ct
        -0x3ft
        -0x55t
        -0x6t
        0x24t
        -0x1ft
        0x7bt
        0x8t
        0xct
        -0x43t
        -0x4ft
        0x4at
        0x78t
        -0x78t
        -0x6bt
        -0x75t
        -0x1dt
        0x63t
        -0x18t
        0x6dt
        -0x17t
        -0x35t
        -0x2bt
        -0x2t
        0x3bt
        0x0t
        0x1dt
        0x39t
        -0xet
        -0x11t
        -0x49t
        0xet
        0x66t
        0x58t
        -0x30t
        -0x1ct
        -0x5at
        0x77t
        0x72t
        -0x8t
        -0x15t
        0x75t
        0x4bt
        0xat
        0x31t
        0x44t
        0x50t
        -0x4ct
        -0x71t
        -0x13t
        0x1ft
        0x1at
        -0x25t
        -0x67t
        -0x73t
        0x33t
        -0x61t
        0x11t
        -0x7dt
        0x14t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x30

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->X:[B

    .line 9
    .line 10
    const/16 v0, 0x10

    .line 11
    .line 12
    new-array v1, v0, [B

    .line 13
    .line 14
    iput-object v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 15
    .line 16
    new-array v0, v0, [B

    .line 17
    .line 18
    iput-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->C:[B

    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/MD2Digest;->reset()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/crypto/digests/MD2Digest;)V
    .locals 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x30

    .line 25
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->X:[B

    const/16 v0, 0x10

    .line 26
    new-array v1, v0, [B

    iput-object v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 27
    new-array v0, v0, [B

    iput-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->C:[B

    .line 28
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/MD2Digest;->copyIn(Lorg/spongycastle/crypto/digests/MD2Digest;)V

    return-void
.end method

.method private copyIn(Lorg/spongycastle/crypto/digests/MD2Digest;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/MD2Digest;->X:[B

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->X:[B

    .line 4
    .line 5
    array-length v2, v0

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 8
    .line 9
    .line 10
    iget v0, p1, Lorg/spongycastle/crypto/digests/MD2Digest;->xOff:I

    .line 11
    .line 12
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->xOff:I

    .line 13
    .line 14
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 15
    .line 16
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 17
    .line 18
    array-length v2, v0

    .line 19
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    iget v0, p1, Lorg/spongycastle/crypto/digests/MD2Digest;->mOff:I

    .line 23
    .line 24
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->mOff:I

    .line 25
    .line 26
    iget-object v0, p1, Lorg/spongycastle/crypto/digests/MD2Digest;->C:[B

    .line 27
    .line 28
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->C:[B

    .line 29
    .line 30
    array-length v2, v0

    .line 31
    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    .line 33
    .line 34
    iget p1, p1, Lorg/spongycastle/crypto/digests/MD2Digest;->COff:I

    .line 35
    .line 36
    iput p1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->COff:I

    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public copy()Lorg/spongycastle/util/Memoable;
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/digests/MD2Digest;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lorg/spongycastle/crypto/digests/MD2Digest;-><init>(Lorg/spongycastle/crypto/digests/MD2Digest;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public doFinal([BI)I
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    iget v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->mOff:I

    .line 5
    .line 6
    sub-int/2addr v0, v1

    .line 7
    int-to-byte v0, v0

    .line 8
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 9
    .line 10
    array-length v3, v2

    .line 11
    if-ge v1, v3, :cond_0

    .line 12
    .line 13
    aput-byte v0, v2, v1

    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0, v2}, Lorg/spongycastle/crypto/digests/MD2Digest;->processCheckSum([B)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/MD2Digest;->processBlock([B)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->C:[B

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/MD2Digest;->processBlock([B)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->X:[B

    .line 32
    .line 33
    iget v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->xOff:I

    .line 34
    .line 35
    const/16 v2, 0x10

    .line 36
    .line 37
    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lorg/spongycastle/crypto/digests/MD2Digest;->reset()V

    .line 41
    .line 42
    .line 43
    return v2
.end method

.method public getAlgorithmName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "MD2"

    .line 2
    .line 3
    return-object p0
.end method

.method public getByteLength()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public getDigestSize()I
    .locals 0

    const/16 p0, 0x10

    return p0
.end method

.method public processBlock([B)V
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    const/16 v2, 0x10

    .line 4
    .line 5
    if-ge v1, v2, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->X:[B

    .line 8
    .line 9
    add-int/lit8 v3, v1, 0x10

    .line 10
    .line 11
    aget-byte v4, p1, v1

    .line 12
    .line 13
    aput-byte v4, v2, v3

    .line 14
    .line 15
    add-int/lit8 v3, v1, 0x20

    .line 16
    .line 17
    aget-byte v4, p1, v1

    .line 18
    .line 19
    aget-byte v5, v2, v1

    .line 20
    .line 21
    xor-int/2addr v4, v5

    .line 22
    int-to-byte v4, v4

    .line 23
    aput-byte v4, v2, v3

    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move p1, v0

    .line 29
    move v1, p1

    .line 30
    :goto_1
    const/16 v2, 0x12

    .line 31
    .line 32
    if-ge p1, v2, :cond_2

    .line 33
    .line 34
    move v2, v0

    .line 35
    :goto_2
    const/16 v3, 0x30

    .line 36
    .line 37
    if-ge v2, v3, :cond_1

    .line 38
    .line 39
    iget-object v3, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->X:[B

    .line 40
    .line 41
    aget-byte v4, v3, v2

    .line 42
    .line 43
    sget-object v5, Lorg/spongycastle/crypto/digests/MD2Digest;->S:[B

    .line 44
    .line 45
    aget-byte v1, v5, v1

    .line 46
    .line 47
    xor-int/2addr v1, v4

    .line 48
    int-to-byte v1, v1

    .line 49
    aput-byte v1, v3, v2

    .line 50
    .line 51
    and-int/lit16 v1, v1, 0xff

    .line 52
    .line 53
    add-int/lit8 v2, v2, 0x1

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_1
    add-int/2addr v1, p1

    .line 57
    rem-int/lit16 v1, v1, 0x100

    .line 58
    .line 59
    add-int/lit8 p1, p1, 0x1

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    return-void
.end method

.method public processCheckSum([B)V
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->C:[B

    .line 2
    .line 3
    const/16 v1, 0xf

    .line 4
    .line 5
    aget-byte v0, v0, v1

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    const/16 v2, 0x10

    .line 9
    .line 10
    if-ge v1, v2, :cond_0

    .line 11
    .line 12
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->C:[B

    .line 13
    .line 14
    aget-byte v3, v2, v1

    .line 15
    .line 16
    sget-object v4, Lorg/spongycastle/crypto/digests/MD2Digest;->S:[B

    .line 17
    .line 18
    aget-byte v5, p1, v1

    .line 19
    .line 20
    xor-int/2addr v0, v5

    .line 21
    and-int/lit16 v0, v0, 0xff

    .line 22
    .line 23
    aget-byte v0, v4, v0

    .line 24
    .line 25
    xor-int/2addr v0, v3

    .line 26
    int-to-byte v0, v0

    .line 27
    aput-byte v0, v2, v1

    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->xOff:I

    .line 3
    .line 4
    move v1, v0

    .line 5
    :goto_0
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->X:[B

    .line 6
    .line 7
    array-length v3, v2

    .line 8
    if-eq v1, v3, :cond_0

    .line 9
    .line 10
    aput-byte v0, v2, v1

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->mOff:I

    .line 16
    .line 17
    move v1, v0

    .line 18
    :goto_1
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 19
    .line 20
    array-length v3, v2

    .line 21
    if-eq v1, v3, :cond_1

    .line 22
    .line 23
    aput-byte v0, v2, v1

    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iput v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->COff:I

    .line 29
    .line 30
    move v1, v0

    .line 31
    :goto_2
    iget-object v2, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->C:[B

    .line 32
    .line 33
    array-length v3, v2

    .line 34
    if-eq v1, v3, :cond_2

    .line 35
    .line 36
    aput-byte v0, v2, v1

    .line 37
    .line 38
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    return-void
.end method

.method public reset(Lorg/spongycastle/util/Memoable;)V
    .locals 0

    .line 42
    check-cast p1, Lorg/spongycastle/crypto/digests/MD2Digest;

    .line 43
    invoke-direct {p0, p1}, Lorg/spongycastle/crypto/digests/MD2Digest;->copyIn(Lorg/spongycastle/crypto/digests/MD2Digest;)V

    return-void
.end method

.method public update(B)V
    .locals 3

    .line 55
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    iget v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->mOff:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->mOff:I

    aput-byte p1, v0, v1

    const/16 p1, 0x10

    if-ne v2, p1, :cond_0

    .line 56
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/MD2Digest;->processCheckSum([B)V

    .line 57
    iget-object p1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/digests/MD2Digest;->processBlock([B)V

    const/4 p1, 0x0

    .line 58
    iput p1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->mOff:I

    :cond_0
    return-void
.end method

.method public update([BII)V
    .locals 3

    .line 1
    :goto_0
    iget v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->mOff:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    if-lez p3, :cond_0

    .line 6
    .line 7
    aget-byte v0, p1, p2

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/MD2Digest;->update(B)V

    .line 10
    .line 11
    .line 12
    add-int/lit8 p2, p2, 0x1

    .line 13
    .line 14
    add-int/lit8 p3, p3, -0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    :goto_1
    const/16 v0, 0x10

    .line 18
    .line 19
    if-le p3, v0, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-static {p1, p2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/MD2Digest;->processCheckSum([B)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lorg/spongycastle/crypto/digests/MD2Digest;->M:[B

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/MD2Digest;->processBlock([B)V

    .line 35
    .line 36
    .line 37
    add-int/lit8 p3, p3, -0x10

    .line 38
    .line 39
    add-int/lit8 p2, p2, 0x10

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    :goto_2
    if-lez p3, :cond_2

    .line 43
    .line 44
    aget-byte v0, p1, p2

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lorg/spongycastle/crypto/digests/MD2Digest;->update(B)V

    .line 47
    .line 48
    .line 49
    add-int/lit8 p2, p2, 0x1

    .line 50
    .line 51
    add-int/lit8 p3, p3, -0x1

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    return-void
.end method
