.class public Lorg/spongycastle/asn1/x509/qualified/BiometricData;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# instance fields
.field private biometricDataHash:Lorg/spongycastle/asn1/ASN1OctetString;

.field private hashAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private sourceDataUri:Lorg/spongycastle/asn1/DERIA5String;

.field private typeOfBiometricData:Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjects()Ljava/util/Enumeration;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->typeOfBiometricData:Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->hashAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 27
    .line 28
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1OctetString;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1OctetString;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->biometricDataHash:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p1}, Lorg/spongycastle/asn1/DERIA5String;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/DERIA5String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->sourceDataUri:Lorg/spongycastle/asn1/DERIA5String;

    .line 53
    .line 54
    :cond_0
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1OctetString;)V
    .locals 0

    .line 60
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->typeOfBiometricData:Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 62
    iput-object p2, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->hashAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 63
    iput-object p3, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->biometricDataHash:Lorg/spongycastle/asn1/ASN1OctetString;

    const/4 p1, 0x0

    .line 64
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->sourceDataUri:Lorg/spongycastle/asn1/DERIA5String;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;Lorg/spongycastle/asn1/ASN1OctetString;Lorg/spongycastle/asn1/DERIA5String;)V
    .locals 0

    .line 55
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 56
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->typeOfBiometricData:Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 57
    iput-object p2, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->hashAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 58
    iput-object p3, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->biometricDataHash:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 59
    iput-object p4, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->sourceDataUri:Lorg/spongycastle/asn1/DERIA5String;

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/qualified/BiometricData;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/qualified/BiometricData;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

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
.method public getBiometricDataHash()Lorg/spongycastle/asn1/ASN1OctetString;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->biometricDataHash:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHashAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->hashAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSourceDataUri()Lorg/spongycastle/asn1/DERIA5String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->sourceDataUri:Lorg/spongycastle/asn1/DERIA5String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeOfBiometricData()Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->typeOfBiometricData:Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 2
    .line 3
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->typeOfBiometricData:Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->hashAlgorithm:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->biometricDataHash:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/BiometricData;->sourceDataUri:Lorg/spongycastle/asn1/DERIA5String;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 29
    .line 30
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 31
    .line 32
    .line 33
    return-object p0
.end method
