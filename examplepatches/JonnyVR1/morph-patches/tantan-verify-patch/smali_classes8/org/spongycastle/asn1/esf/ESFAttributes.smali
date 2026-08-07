.class public interface abstract Lorg/spongycastle/asn1/esf/ESFAttributes;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final archiveTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final archiveTimestampV2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final certCRLTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final certValues:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final certificateRefs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final commitmentType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final contentTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final escTimeStamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final otherSigCert:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final revocationRefs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final revocationValues:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final sigPolicyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final signerAttr:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final signerLocation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_sigPolicyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->sigPolicyId:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 4
    .line 5
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_commitmentType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 6
    .line 7
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->commitmentType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 8
    .line 9
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_signerLocation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 10
    .line 11
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->signerLocation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 12
    .line 13
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_signerAttr:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 14
    .line 15
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->signerAttr:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 16
    .line 17
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_otherSigCert:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 18
    .line 19
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->otherSigCert:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 20
    .line 21
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_contentTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 22
    .line 23
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->contentTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 24
    .line 25
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_certificateRefs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 26
    .line 27
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->certificateRefs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 28
    .line 29
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_revocationRefs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 30
    .line 31
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->revocationRefs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 32
    .line 33
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_certValues:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 34
    .line 35
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->certValues:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 36
    .line 37
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_revocationValues:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 38
    .line 39
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->revocationValues:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 40
    .line 41
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_escTimeStamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 42
    .line 43
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->escTimeStamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 44
    .line 45
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_certCRLTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 46
    .line 47
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->certCRLTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 48
    .line 49
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa_ets_archiveTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 50
    .line 51
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->archiveTimestamp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 52
    .line 53
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_aa:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 54
    .line 55
    const-string v1, "48"

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sput-object v0, Lorg/spongycastle/asn1/esf/ESFAttributes;->archiveTimestampV2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 62
    .line 63
    return-void
.end method
