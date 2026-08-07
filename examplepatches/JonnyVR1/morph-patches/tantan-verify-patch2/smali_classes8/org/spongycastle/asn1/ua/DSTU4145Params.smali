.class public Lorg/spongycastle/asn1/ua/DSTU4145Params;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field private static final DEFAULT_DKE:[B


# instance fields
.field private dke:[B

.field private ecbinary:Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;

.field private namedCurve:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->DEFAULT_DKE:[B

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 1
        -0x57t
        -0x2at
        -0x15t
        0x45t
        -0xft
        0x3ct
        0x70t
        -0x7et
        -0x80t
        -0x3ct
        -0x6at
        0x7bt
        0x23t
        0x1ft
        0x5et
        -0x53t
        -0xat
        0x58t
        -0x15t
        -0x5ct
        -0x40t
        0x37t
        0x29t
        0x1dt
        0x38t
        -0x27t
        0x6bt
        -0x10t
        0x25t
        -0x36t
        0x4et
        0x17t
        -0x8t
        -0x17t
        0x72t
        0xdt
        -0x3at
        0x15t
        -0x4ct
        0x3at
        0x28t
        -0x69t
        0x5ft
        0xbt
        -0x3ft
        -0x22t
        -0x5dt
        0x64t
        0x38t
        -0x4bt
        0x64t
        -0x16t
        0x2ct
        0x17t
        -0x61t
        -0x30t
        0x12t
        0x3et
        0x6dt
        -0x48t
        -0x6t
        -0x3bt
        0x79t
        0x4t
    .end array-data
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .locals 1

    .line 17
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 18
    sget-object v0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->DEFAULT_DKE:[B

    iput-object v0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->dke:[B

    .line 19
    iput-object p1, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->namedCurve:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;[B)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->DEFAULT_DKE:[B

    .line 5
    .line 6
    iput-object v0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->dke:[B

    .line 7
    .line 8
    iput-object p1, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->namedCurve:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    invoke-static {p2}, Lorg/spongycastle/util/Arrays;->clone([B)[B

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->dke:[B

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;)V
    .locals 1

    .line 20
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 21
    sget-object v0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->DEFAULT_DKE:[B

    iput-object v0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->dke:[B

    .line 22
    iput-object p1, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->ecbinary:Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;

    return-void
.end method

.method public static getDefaultDKE()[B
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->DEFAULT_DKE:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ua/DSTU4145Params;
    .locals 5

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    const-string v1, "object parse error"

    .line 10
    .line 11
    if-eqz p0, :cond_4

    .line 12
    .line 13
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    instance-of v3, v3, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 23
    .line 24
    if-eqz v3, :cond_1

    .line 25
    .line 26
    new-instance v3, Lorg/spongycastle/asn1/ua/DSTU4145Params;

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-direct {v3, v2}, Lorg/spongycastle/asn1/ua/DSTU4145Params;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    new-instance v3, Lorg/spongycastle/asn1/ua/DSTU4145Params;

    .line 41
    .line 42
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-static {v2}, Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-direct {v3, v2}, Lorg/spongycastle/asn1/ua/DSTU4145Params;-><init>(Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    const/4 v4, 0x2

    .line 58
    if-ne v2, v4, :cond_3

    .line 59
    .line 60
    const/4 v2, 0x1

    .line 61
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iput-object p0, v3, Lorg/spongycastle/asn1/ua/DSTU4145Params;->dke:[B

    .line 74
    .line 75
    array-length p0, p0

    .line 76
    sget-object v2, Lorg/spongycastle/asn1/ua/DSTU4145Params;->DEFAULT_DKE:[B

    .line 77
    .line 78
    array-length v2, v2

    .line 79
    if-ne p0, v2, :cond_2

    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_2
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-object v0

    .line 86
    :cond_3
    :goto_1
    return-object v3

    .line 87
    :cond_4
    invoke-static {v1}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    return-object v0
.end method


# virtual methods
.method public getDKE()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->dke:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public getECBinary()Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->ecbinary:Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNamedCurve()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->namedCurve:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public isNamedCurve()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->namedCurve:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->namedCurve:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->ecbinary:Lorg/spongycastle/asn1/ua/DSTU4145ECBinary;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->dke:[B

    .line 20
    .line 21
    sget-object v2, Lorg/spongycastle/asn1/ua/DSTU4145Params;->DEFAULT_DKE:[B

    .line 22
    .line 23
    invoke-static {v1, v2}, Lorg/spongycastle/util/Arrays;->areEqual([B[B)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_1

    .line 28
    .line 29
    new-instance v1, Lorg/spongycastle/asn1/DEROctetString;

    .line 30
    .line 31
    iget-object p0, p0, Lorg/spongycastle/asn1/ua/DSTU4145Params;->dke:[B

    .line 32
    .line 33
    invoke-direct {v1, p0}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 40
    .line 41
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 42
    .line 43
    .line 44
    return-object p0
.end method
