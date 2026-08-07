.class public Lorg/spongycastle/asn1/smime/SMIMECapabilitiesAttribute;
.super Lorg/spongycastle/asn1/cms/Attribute;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/smime/SMIMECapabilityVector;)V
    .locals 3

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/smime/SMIMEAttributes;->smimeCapabilities:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/asn1/DERSet;

    .line 4
    .line 5
    new-instance v2, Lorg/spongycastle/asn1/DERSequence;

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/spongycastle/asn1/smime/SMIMECapabilityVector;->toASN1EncodableVector()Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-direct {v2, p1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/DERSet;-><init>(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/cms/Attribute;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;Lorg/spongycastle/asn1/ASN1Set;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
