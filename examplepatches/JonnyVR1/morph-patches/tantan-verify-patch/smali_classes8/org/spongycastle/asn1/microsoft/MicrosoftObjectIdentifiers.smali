.class public interface abstract Lorg/spongycastle/asn1/microsoft/MicrosoftObjectIdentifiers;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final microsoft:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final microsoftAppPolicies:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final microsoftCaVersion:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final microsoftCertTemplateV1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final microsoftCertTemplateV2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final microsoftCrlNextPublish:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final microsoftPrevCaCertHash:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    const-string v1, "1.3.6.1.4.1.311"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/microsoft/MicrosoftObjectIdentifiers;->microsoft:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    const-string v1, "20.2"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sput-object v1, Lorg/spongycastle/asn1/microsoft/MicrosoftObjectIdentifiers;->microsoftCertTemplateV1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 17
    .line 18
    const-string v1, "21.1"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sput-object v1, Lorg/spongycastle/asn1/microsoft/MicrosoftObjectIdentifiers;->microsoftCaVersion:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 25
    .line 26
    const-string v1, "21.2"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    sput-object v1, Lorg/spongycastle/asn1/microsoft/MicrosoftObjectIdentifiers;->microsoftPrevCaCertHash:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 33
    .line 34
    const-string v1, "21.4"

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sput-object v1, Lorg/spongycastle/asn1/microsoft/MicrosoftObjectIdentifiers;->microsoftCrlNextPublish:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 41
    .line 42
    const-string v1, "21.7"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    sput-object v1, Lorg/spongycastle/asn1/microsoft/MicrosoftObjectIdentifiers;->microsoftCertTemplateV2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 49
    .line 50
    const-string v1, "21.10"

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, Lorg/spongycastle/asn1/microsoft/MicrosoftObjectIdentifiers;->microsoftAppPolicies:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 57
    .line 58
    return-void
.end method
