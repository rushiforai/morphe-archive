.class public Lorg/spongycastle/asn1/icao/LDSSecurityObject;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/asn1/icao/ICAOObjectIdentifiers;


# static fields
.field public static final ub_DataGroups:I = 0x10


# instance fields
.field private datagroupHash:[Lorg/spongycastle/asn1/icao/DataGroupHash;

.field private digestAlgorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private version:Lorg/spongycastle/asn1/ASN1Integer;

.field private versionInfo:Lorg/spongycastle/asn1/icao/LDSVersionInfo;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 12
    .line 13
    if-eqz p1, :cond_2

    .line 14
    .line 15
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->digestAlgorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v1, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 54
    .line 55
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const/4 v2, 0x1

    .line 64
    if-ne v1, v2, :cond_0

    .line 65
    .line 66
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p1}, Lorg/spongycastle/asn1/icao/LDSVersionInfo;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/icao/LDSVersionInfo;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    iput-object p1, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->versionInfo:Lorg/spongycastle/asn1/icao/LDSVersionInfo;

    .line 75
    .line 76
    :cond_0
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->checkDatagroupHashSeqSize(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    new-array p1, p1, [Lorg/spongycastle/asn1/icao/DataGroupHash;

    .line 88
    .line 89
    iput-object p1, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->datagroupHash:[Lorg/spongycastle/asn1/icao/DataGroupHash;

    .line 90
    .line 91
    const/4 p1, 0x0

    .line 92
    :goto_0
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-ge p1, v1, :cond_1

    .line 97
    .line 98
    iget-object v1, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->datagroupHash:[Lorg/spongycastle/asn1/icao/DataGroupHash;

    .line 99
    .line 100
    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-static {v2}, Lorg/spongycastle/asn1/icao/DataGroupHash;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/icao/DataGroupHash;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    aput-object v2, v1, p1

    .line 109
    .line 110
    add-int/lit8 p1, p1, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_1
    return-void

    .line 114
    :cond_2
    const-string p0, "null or empty sequence passed."

    .line 115
    .line 116
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    const/4 p0, 0x0

    .line 120
    throw p0
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[Lorg/spongycastle/asn1/icao/DataGroupHash;)V
    .locals 3

    .line 121
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 122
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 123
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 124
    iput-object p1, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->digestAlgorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 125
    iput-object p2, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->datagroupHash:[Lorg/spongycastle/asn1/icao/DataGroupHash;

    .line 126
    array-length p1, p2

    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->checkDatagroupHashSeqSize(I)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[Lorg/spongycastle/asn1/icao/DataGroupHash;Lorg/spongycastle/asn1/icao/LDSVersionInfo;)V
    .locals 3

    .line 127
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 128
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x0

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 129
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    const-wide/16 v1, 0x1

    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    iput-object v0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 130
    iput-object p1, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->digestAlgorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 131
    iput-object p2, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->datagroupHash:[Lorg/spongycastle/asn1/icao/DataGroupHash;

    .line 132
    iput-object p3, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->versionInfo:Lorg/spongycastle/asn1/icao/LDSVersionInfo;

    .line 133
    array-length p1, p2

    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->checkDatagroupHashSeqSize(I)V

    return-void
.end method

.method private checkDatagroupHashSeqSize(I)V
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    if-lt p1, p0, :cond_0

    .line 3
    .line 4
    const/16 p0, 0x10

    .line 5
    .line 6
    if-gt p1, p0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    const-string p0, "wrong size in DataGroupHashValues : not in (2..16)"

    .line 10
    .line 11
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/icao/LDSSecurityObject;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/icao/LDSSecurityObject;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method


# virtual methods
.method public getDatagroupHash()[Lorg/spongycastle/asn1/icao/DataGroupHash;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->datagroupHash:[Lorg/spongycastle/asn1/icao/DataGroupHash;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDigestAlgorithmIdentifier()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->digestAlgorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getVersionInfo()Lorg/spongycastle/asn1/icao/LDSVersionInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->versionInfo:Lorg/spongycastle/asn1/icao/LDSVersionInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 5

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->version:Lorg/spongycastle/asn1/ASN1Integer;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->digestAlgorithmIdentifier:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 17
    .line 18
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    :goto_0
    iget-object v3, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->datagroupHash:[Lorg/spongycastle/asn1/icao/DataGroupHash;

    .line 23
    .line 24
    array-length v4, v3

    .line 25
    if-ge v2, v4, :cond_0

    .line 26
    .line 27
    aget-object v3, v3, v2

    .line 28
    .line 29
    invoke-virtual {v1, v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    .line 36
    .line 37
    invoke-direct {v2, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lorg/spongycastle/asn1/icao/LDSSecurityObject;->versionInfo:Lorg/spongycastle/asn1/icao/LDSVersionInfo;

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 51
    .line 52
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 53
    .line 54
    .line 55
    return-object p0
.end method
