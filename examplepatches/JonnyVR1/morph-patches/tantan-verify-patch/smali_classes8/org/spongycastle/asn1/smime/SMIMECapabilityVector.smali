.class public Lorg/spongycastle/asn1/smime/SMIMECapabilityVector;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private capabilities:Lorg/spongycastle/asn1/ASN1EncodableVector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 5
    .line 6
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilityVector;->capabilities:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public addCapability(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .locals 1

    .line 29
    iget-object p0, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilityVector;->capabilities:Lorg/spongycastle/asn1/ASN1EncodableVector;

    new-instance v0, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    invoke-virtual {p0, v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    return-void
.end method

.method public addCapability(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;I)V
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 10
    .line 11
    int-to-long v1, p2

    .line 12
    invoke-direct {p1, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilityVector;->capabilities:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 19
    .line 20
    new-instance p1, Lorg/spongycastle/asn1/DERSequence;

    .line 21
    .line 22
    invoke-direct {p1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public addCapability(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Encodable;)V
    .locals 1

    .line 30
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 31
    invoke-virtual {v0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 32
    invoke-virtual {v0, p2}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 33
    iget-object p0, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilityVector;->capabilities:Lorg/spongycastle/asn1/ASN1EncodableVector;

    new-instance p1, Lorg/spongycastle/asn1/DERSequence;

    invoke-direct {p1, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    return-void
.end method

.method public toASN1EncodableVector()Lorg/spongycastle/asn1/ASN1EncodableVector;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/smime/SMIMECapabilityVector;->capabilities:Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    return-object p0
.end method
