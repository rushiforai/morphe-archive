.class public final Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/spongycastle/crypto/util/DEROtherInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private final algorithmID:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

.field private final partyUVInfo:Lorg/spongycastle/asn1/ASN1OctetString;

.field private final partyVInfo:Lorg/spongycastle/asn1/ASN1OctetString;

.field private suppPrivInfo:Lorg/spongycastle/asn1/ASN1TaggedObject;

.field private suppPubInfo:Lorg/spongycastle/asn1/ASN1TaggedObject;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;[B[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->algorithmID:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 5
    .line 6
    invoke-static {p2}, Lorg/spongycastle/crypto/util/DerUtil;->getOctetString([B)Lorg/spongycastle/asn1/ASN1OctetString;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->partyUVInfo:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 11
    .line 12
    invoke-static {p3}, Lorg/spongycastle/crypto/util/DerUtil;->getOctetString([B)Lorg/spongycastle/asn1/ASN1OctetString;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->partyVInfo:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public build()Lorg/spongycastle/crypto/util/DEROtherInfo;
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->algorithmID:Lorg/spongycastle/asn1/x509/AlgorithmIdentifier;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->partyUVInfo:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->partyVInfo:Lorg/spongycastle/asn1/ASN1OctetString;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->suppPubInfo:Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->suppPrivInfo:Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 29
    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    new-instance p0, Lorg/spongycastle/crypto/util/DEROtherInfo;

    .line 36
    .line 37
    new-instance v1, Lorg/spongycastle/asn1/DERSequence;

    .line 38
    .line 39
    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, v1, v0}, Lorg/spongycastle/crypto/util/DEROtherInfo;-><init>(Lorg/spongycastle/asn1/DERSequence;Lorg/spongycastle/crypto/util/DEROtherInfo$1;)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method

.method public withSuppPrivInfo([B)Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {p1}, Lorg/spongycastle/crypto/util/DerUtil;->getOctetString([B)Lorg/spongycastle/asn1/ASN1OctetString;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v2, v1, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->suppPrivInfo:Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 13
    .line 14
    return-object p0
.end method

.method public withSuppPubInfo([B)Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p1}, Lorg/spongycastle/crypto/util/DerUtil;->getOctetString([B)Lorg/spongycastle/asn1/ASN1OctetString;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-direct {v0, v1, v1, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/crypto/util/DEROtherInfo$Builder;->suppPubInfo:Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 12
    .line 13
    return-object p0
.end method
