.class public Lorg/spongycastle/asn1/esf/OtherHash;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private otherHash:Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;

.field private sha1Hash:Lorg/spongycastle/asn1/ASN1OctetString;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1OctetString;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/spongycastle/asn1/esf/OtherHash;->sha1Hash:Lorg/spongycastle/asn1/ASN1OctetString;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;)V
    .locals 0

    .line 12
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 13
    iput-object p1, p0, Lorg/spongycastle/asn1/esf/OtherHash;->otherHash:Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/asn1/DEROctetString;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/asn1/esf/OtherHash;->sha1Hash:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 10
    .line 11
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/OtherHash;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/esf/OtherHash;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/esf/OtherHash;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Lorg/spongycastle/asn1/esf/OtherHash;

    .line 13
    .line 14
    check-cast p0, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/esf/OtherHash;-><init>(Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    new-instance v0, Lorg/spongycastle/asn1/esf/OtherHash;

    .line 21
    .line 22
    invoke-static {p0}, Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/esf/OtherHash;-><init>(Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method


# virtual methods
.method public getHashAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/OtherHash;->otherHash:Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 6
    .line 7
    sget-object v0, Lorg/spongycastle/asn1/oiw/OIWObjectIdentifiers;->idSHA1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 8
    .line 9
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;->getHashAlgorithm()Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getHashValue()[B
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/OtherHash;->otherHash:Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/OtherHash;->sha1Hash:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {v0}, Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;->getHashValue()Lorg/spongycastle/asn1/ASN1OctetString;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1OctetString;->getOctets()[B

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/esf/OtherHash;->otherHash:Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/OtherHash;->sha1Hash:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {v0}, Lorg/spongycastle/asn1/esf/OtherHashAlgAndValue;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
