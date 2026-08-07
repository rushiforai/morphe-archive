.class public Lorg/spongycastle/asn1/x509/PolicyQualifierId;
.super Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
.source "SourceFile"


# static fields
.field private static final id_qt:Ljava/lang/String; = "1.3.6.1.5.5.7.2"

.field public static final id_qt_cps:Lorg/spongycastle/asn1/x509/PolicyQualifierId;

.field public static final id_qt_unotice:Lorg/spongycastle/asn1/x509/PolicyQualifierId;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/x509/PolicyQualifierId;

    .line 2
    .line 3
    const-string v1, "1.3.6.1.5.5.7.2.1"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/PolicyQualifierId;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/x509/PolicyQualifierId;->id_qt_cps:Lorg/spongycastle/asn1/x509/PolicyQualifierId;

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/x509/PolicyQualifierId;

    .line 11
    .line 12
    const-string v1, "1.3.6.1.5.5.7.2.2"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/PolicyQualifierId;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/spongycastle/asn1/x509/PolicyQualifierId;->id_qt_unotice:Lorg/spongycastle/asn1/x509/PolicyQualifierId;

    .line 18
    .line 19
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
