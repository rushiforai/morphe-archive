.class public abstract Lorg/spongycastle/asn1/x509/X509NameEntryConverter;
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
.method public canBePrintable(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/spongycastle/asn1/DERPrintableString;->isPrintableString(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public convertHexEncoded(Ljava/lang/String;I)Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lorg/spongycastle/util/Strings;->toLowerCase(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sub-int/2addr p1, p2

    .line 10
    div-int/lit8 p1, p1, 0x2

    .line 11
    .line 12
    new-array v0, p1, [B

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    if-eq v1, p1, :cond_2

    .line 16
    .line 17
    mul-int/lit8 v2, v1, 0x2

    .line 18
    .line 19
    add-int/2addr v2, p2

    .line 20
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/16 v4, 0x61

    .line 31
    .line 32
    if-ge v3, v4, :cond_0

    .line 33
    .line 34
    add-int/lit8 v3, v3, -0x30

    .line 35
    .line 36
    shl-int/lit8 v3, v3, 0x4

    .line 37
    .line 38
    int-to-byte v3, v3

    .line 39
    aput-byte v3, v0, v1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_0
    add-int/lit8 v3, v3, -0x57

    .line 43
    .line 44
    shl-int/lit8 v3, v3, 0x4

    .line 45
    .line 46
    int-to-byte v3, v3

    .line 47
    aput-byte v3, v0, v1

    .line 48
    .line 49
    :goto_1
    if-ge v2, v4, :cond_1

    .line 50
    .line 51
    aget-byte v3, v0, v1

    .line 52
    .line 53
    add-int/lit8 v2, v2, -0x30

    .line 54
    .line 55
    int-to-byte v2, v2

    .line 56
    or-int/2addr v2, v3

    .line 57
    int-to-byte v2, v2

    .line 58
    aput-byte v2, v0, v1

    .line 59
    .line 60
    goto :goto_2

    .line 61
    :cond_1
    aget-byte v3, v0, v1

    .line 62
    .line 63
    add-int/lit8 v2, v2, -0x57

    .line 64
    .line 65
    int-to-byte v2, v2

    .line 66
    or-int/2addr v2, v3

    .line 67
    int-to-byte v2, v2

    .line 68
    aput-byte v2, v0, v1

    .line 69
    .line 70
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_2
    new-instance p0, Lorg/spongycastle/asn1/ASN1InputStream;

    .line 74
    .line 75
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>([B)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method public abstract getConvertedValue(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1Primitive;
.end method
