.class public interface abstract Lorg/spongycastle/asn1/esf/CommitmentTypeIdentifier;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final proofOfApproval:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final proofOfCreation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final proofOfDelivery:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final proofOfOrigin:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final proofOfReceipt:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final proofOfSender:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_cti_ets_proofOfOrigin:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    sput-object v0, Lorg/spongycastle/asn1/esf/CommitmentTypeIdentifier;->proofOfOrigin:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 4
    .line 5
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_cti_ets_proofOfReceipt:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 6
    .line 7
    sput-object v0, Lorg/spongycastle/asn1/esf/CommitmentTypeIdentifier;->proofOfReceipt:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 8
    .line 9
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_cti_ets_proofOfDelivery:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 10
    .line 11
    sput-object v0, Lorg/spongycastle/asn1/esf/CommitmentTypeIdentifier;->proofOfDelivery:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 12
    .line 13
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_cti_ets_proofOfSender:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 14
    .line 15
    sput-object v0, Lorg/spongycastle/asn1/esf/CommitmentTypeIdentifier;->proofOfSender:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 16
    .line 17
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_cti_ets_proofOfApproval:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 18
    .line 19
    sput-object v0, Lorg/spongycastle/asn1/esf/CommitmentTypeIdentifier;->proofOfApproval:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 20
    .line 21
    sget-object v0, Lorg/spongycastle/asn1/pkcs/PKCSObjectIdentifiers;->id_cti_ets_proofOfCreation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 22
    .line 23
    sput-object v0, Lorg/spongycastle/asn1/esf/CommitmentTypeIdentifier;->proofOfCreation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 24
    .line 25
    return-void
.end method
