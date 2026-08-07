.class public interface abstract Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final RoleSyntax:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aca:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aca_accessIdentity:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aca_authenticationInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aca_chargingIdentity:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aca_encAttrs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aca_group:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_at_clearance:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_at_role:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_ce_targetInformation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_pe_aaControls:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_pe_ac_auditIdentity:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_pe_ac_proxying:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    const-string v1, "2.5.4.72"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->RoleSyntax:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    sget-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_pe:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 11
    .line 12
    const-string v2, "4"

    .line 13
    .line 14
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    sput-object v3, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_pe_ac_auditIdentity:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 19
    .line 20
    const-string v3, "6"

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    sput-object v4, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_pe_aaControls:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 27
    .line 28
    const-string v4, "10"

    .line 29
    .line 30
    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sput-object v0, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_pe_ac_proxying:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 35
    .line 36
    sget-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_ce:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 37
    .line 38
    const-string v5, "55"

    .line 39
    .line 40
    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sput-object v0, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_ce_targetInformation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 45
    .line 46
    sget-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_pkix:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    sput-object v0, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_aca:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 53
    .line 54
    const-string v4, "1"

    .line 55
    .line 56
    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    sput-object v4, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_aca_authenticationInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 61
    .line 62
    const-string v4, "2"

    .line 63
    .line 64
    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    sput-object v4, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_aca_accessIdentity:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 69
    .line 70
    const-string v4, "3"

    .line 71
    .line 72
    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    sput-object v4, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_aca_chargingIdentity:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    sput-object v2, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_aca_group:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 83
    .line 84
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    sput-object v0, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_aca_encAttrs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 89
    .line 90
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 91
    .line 92
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sput-object v0, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_at_role:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 96
    .line 97
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 98
    .line 99
    const-string v1, "2.5.1.5.55"

    .line 100
    .line 101
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    sput-object v0, Lorg/spongycastle/asn1/x509/X509AttributeIdentifiers;->id_at_clearance:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 105
    .line 106
    return-void
.end method
