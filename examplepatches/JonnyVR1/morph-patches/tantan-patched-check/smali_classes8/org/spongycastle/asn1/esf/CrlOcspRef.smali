.class public Lorg/spongycastle/asn1/esf/CrlOcspRef;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# instance fields
.field private crlids:Lorg/spongycastle/asn1/esf/CrlListID;

.field private ocspids:Lorg/spongycastle/asn1/esf/OcspListID;

.field private otherRev:Lorg/spongycastle/asn1/esf/OtherRevRefs;


# direct methods
.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 3

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
    :goto_0
    invoke-interface {p1}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 19
    .line 20
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    if-eq v1, v2, :cond_1

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    if-ne v1, v2, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Lorg/spongycastle/asn1/esf/OtherRevRefs;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/OtherRevRefs;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->otherRev:Lorg/spongycastle/asn1/esf/OtherRevRefs;

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string p0, "illegal tag"

    .line 44
    .line 45
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    const/4 p0, 0x0

    .line 49
    throw p0

    .line 50
    :cond_1
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-static {v0}, Lorg/spongycastle/asn1/esf/OcspListID;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/OcspListID;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->ocspids:Lorg/spongycastle/asn1/esf/OcspListID;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-static {v0}, Lorg/spongycastle/asn1/esf/CrlListID;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/CrlListID;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->crlids:Lorg/spongycastle/asn1/esf/CrlListID;

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_3
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/esf/CrlListID;Lorg/spongycastle/asn1/esf/OcspListID;Lorg/spongycastle/asn1/esf/OtherRevRefs;)V
    .locals 0

    .line 73
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 74
    iput-object p1, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->crlids:Lorg/spongycastle/asn1/esf/CrlListID;

    .line 75
    iput-object p2, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->ocspids:Lorg/spongycastle/asn1/esf/OcspListID;

    .line 76
    iput-object p3, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->otherRev:Lorg/spongycastle/asn1/esf/OtherRevRefs;

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/esf/CrlOcspRef;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/esf/CrlOcspRef;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/esf/CrlOcspRef;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

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
.method public getCrlids()Lorg/spongycastle/asn1/esf/CrlListID;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->crlids:Lorg/spongycastle/asn1/esf/CrlListID;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOcspids()Lorg/spongycastle/asn1/esf/OcspListID;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->ocspids:Lorg/spongycastle/asn1/esf/OcspListID;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherRev()Lorg/spongycastle/asn1/esf/OtherRevRefs;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->otherRev:Lorg/spongycastle/asn1/esf/OtherRevRefs;

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
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->crlids:Lorg/spongycastle/asn1/esf/CrlListID;

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 12
    .line 13
    iget-object v3, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->crlids:Lorg/spongycastle/asn1/esf/CrlListID;

    .line 14
    .line 15
    invoke-virtual {v3}, Lorg/spongycastle/asn1/esf/CrlListID;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-direct {v1, v2, v4, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->ocspids:Lorg/spongycastle/asn1/esf/OcspListID;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 31
    .line 32
    iget-object v3, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->ocspids:Lorg/spongycastle/asn1/esf/OcspListID;

    .line 33
    .line 34
    invoke-virtual {v3}, Lorg/spongycastle/asn1/esf/OcspListID;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-direct {v1, v2, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->otherRev:Lorg/spongycastle/asn1/esf/OtherRevRefs;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 49
    .line 50
    iget-object p0, p0, Lorg/spongycastle/asn1/esf/CrlOcspRef;->otherRev:Lorg/spongycastle/asn1/esf/OtherRevRefs;

    .line 51
    .line 52
    invoke-virtual {p0}, Lorg/spongycastle/asn1/esf/OtherRevRefs;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 v3, 0x2

    .line 57
    invoke-direct {v1, v2, v3, p0}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 61
    .line 62
    .line 63
    :cond_2
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 64
    .line 65
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 66
    .line 67
    .line 68
    return-object p0
.end method
