.class public abstract Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
.super Lorg/spongycastle/asn1/ASN1Primitive;
.source "SourceFile"


# instance fields
.field protected final isConstructed:Z

.field protected final octets:[B

.field protected final tag:I


# direct methods
.method public constructor <init>(ZI[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Primitive;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->isConstructed:Z

    .line 5
    .line 6
    iput p2, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->tag:I

    .line 7
    .line 8
    iput-object p3, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->octets:[B

    .line 9
    .line 10
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ApplicationSpecific;
    .locals 2

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of v0, p0, [B

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :try_start_0
    check-cast p0, [B

    .line 14
    .line 15
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    .line 20
    .line 21
    .line 22
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    return-object p0

    .line 24
    :catch_0
    move-exception p0

    .line 25
    const-string v0, "Failed to construct object from byte[]: "

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {v0, p0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-object v1

    .line 35
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string v0, "unknown object in getInstance: "

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-object v1

    .line 53
    :cond_2
    :goto_0
    check-cast p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    .line 54
    .line 55
    return-object p0
.end method

.method public static getLengthOfHeader([B)I
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    aget-byte p0, p0, v0

    .line 3
    .line 4
    and-int/lit16 v0, p0, 0xff

    .line 5
    .line 6
    const/16 v1, 0x80

    .line 7
    .line 8
    const/4 v2, 0x2

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    return v2

    .line 12
    :cond_0
    const/16 v1, 0x7f

    .line 13
    .line 14
    if-le v0, v1, :cond_2

    .line 15
    .line 16
    and-int/2addr p0, v1

    .line 17
    const/4 v0, 0x4

    .line 18
    if-gt p0, v0, :cond_1

    .line 19
    .line 20
    add-int/2addr p0, v2

    .line 21
    return p0

    .line 22
    :cond_1
    const-string v0, "DER length more than 4 bytes: "

    .line 23
    .line 24
    invoke-static {v0, p0}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_2
    return v2
.end method

.method private replaceTagNumber(I[B)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    aget-byte v0, p2, p0

    .line 3
    .line 4
    const/16 v1, 0x1f

    .line 5
    .line 6
    and-int/2addr v0, v1

    .line 7
    const/4 v2, 0x1

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    aget-byte v0, p2, v2

    .line 11
    .line 12
    and-int/lit16 v1, v0, 0xff

    .line 13
    .line 14
    and-int/lit8 v0, v0, 0x7f

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    :goto_0
    if-ltz v1, :cond_2

    .line 20
    .line 21
    and-int/lit16 v1, v1, 0x80

    .line 22
    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    add-int/lit8 v1, v0, 0x1

    .line 26
    .line 27
    aget-byte v0, p2, v0

    .line 28
    .line 29
    and-int/lit16 v0, v0, 0xff

    .line 30
    .line 31
    move v4, v1

    .line 32
    move v1, v0

    .line 33
    move v0, v4

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance p0, Lorg/spongycastle/asn1/ASN1ParsingException;

    .line 36
    .line 37
    const-string p1, "corrupted stream - invalid high tag number found"

    .line 38
    .line 39
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1ParsingException;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    throw p0

    .line 43
    :cond_1
    move v0, v2

    .line 44
    :cond_2
    array-length v1, p2

    .line 45
    sub-int/2addr v1, v0

    .line 46
    add-int/lit8 v3, v1, 0x1

    .line 47
    .line 48
    new-array v3, v3, [B

    .line 49
    .line 50
    invoke-static {p2, v0, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    .line 52
    .line 53
    int-to-byte p1, p1

    .line 54
    aput-byte p1, v3, p0

    .line 55
    .line 56
    return-object v3
.end method


# virtual methods
.method public asn1Equals(Lorg/spongycastle/asn1/ASN1Primitive;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    check-cast p1, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;

    .line 8
    .line 9
    iget-boolean v0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->isConstructed:Z

    .line 10
    .line 11
    iget-boolean v2, p1, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->isConstructed:Z

    .line 12
    .line 13
    if-ne v0, v2, :cond_1

    .line 14
    .line 15
    iget v0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->tag:I

    .line 16
    .line 17
    iget v2, p1, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->tag:I

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->octets:[B

    .line 22
    .line 23
    iget-object p1, p1, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->octets:[B

    .line 24
    .line 25
    invoke-static {p0, p1}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    return v1
.end method

.method public encode(Lorg/spongycastle/asn1/ASN1OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->isConstructed:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/16 v0, 0x60

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/16 v0, 0x40

    .line 9
    .line 10
    :goto_0
    iget v1, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->tag:I

    .line 11
    .line 12
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->octets:[B

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1, p0}, Lorg/spongycastle/asn1/ASN1OutputStream;->writeEncoded(II[B)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public encodedLength()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->tag:I

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/asn1/StreamUtil;->calculateTagLength(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->octets:[B

    .line 8
    .line 9
    array-length v1, v1

    .line 10
    invoke-static {v1}, Lorg/spongycastle/asn1/StreamUtil;->calculateBodyLength(I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/2addr v0, v1

    .line 15
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->octets:[B

    .line 16
    .line 17
    array-length p0, p0

    .line 18
    add-int/2addr v0, p0

    .line 19
    return v0
.end method

.method public getApplicationTag()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->tag:I

    .line 2
    .line 3
    return p0
.end method

.method public getContents()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->octets:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 44
    new-instance v0, Lorg/spongycastle/asn1/ASN1InputStream;

    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->getContents()[B

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object p0

    return-object p0
.end method

.method public getObject(I)Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x1f

    .line 2
    .line 3
    if-ge p1, v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Object;->getEncoded()[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->replaceTagNumber(I[B)[B

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 p1, 0x0

    .line 14
    aget-byte v0, v0, p1

    .line 15
    .line 16
    and-int/lit8 v0, v0, 0x20

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    aget-byte v0, p0, p1

    .line 21
    .line 22
    or-int/lit8 v0, v0, 0x20

    .line 23
    .line 24
    int-to-byte v0, v0

    .line 25
    aput-byte v0, p0, p1

    .line 26
    .line 27
    :cond_0
    new-instance p1, Lorg/spongycastle/asn1/ASN1InputStream;

    .line 28
    .line 29
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_1
    const-string p0, "unsupported tag number"

    .line 38
    .line 39
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-boolean v0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->isConstructed:Z

    .line 2
    .line 3
    iget v1, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->tag:I

    .line 4
    .line 5
    xor-int/2addr v0, v1

    .line 6
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->octets:[B

    .line 7
    .line 8
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->hashCode([B)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    xor-int/2addr p0, v0

    .line 13
    return p0
.end method

.method public isConstructed()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/spongycastle/asn1/ASN1ApplicationSpecific;->isConstructed:Z

    .line 2
    .line 3
    return p0
.end method
