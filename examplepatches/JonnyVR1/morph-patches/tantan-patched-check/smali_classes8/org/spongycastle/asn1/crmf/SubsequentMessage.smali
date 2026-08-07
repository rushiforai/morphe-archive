.class public Lorg/spongycastle/asn1/crmf/SubsequentMessage;
.super Lorg/spongycastle/asn1/ASN1Integer;
.source "SourceFile"


# static fields
.field public static final challengeResp:Lorg/spongycastle/asn1/crmf/SubsequentMessage;

.field public static final encrCert:Lorg/spongycastle/asn1/crmf/SubsequentMessage;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/crmf/SubsequentMessage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/crmf/SubsequentMessage;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/spongycastle/asn1/crmf/SubsequentMessage;->encrCert:Lorg/spongycastle/asn1/crmf/SubsequentMessage;

    .line 8
    .line 9
    new-instance v0, Lorg/spongycastle/asn1/crmf/SubsequentMessage;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/crmf/SubsequentMessage;-><init>(I)V

    .line 13
    .line 14
    .line 15
    sput-object v0, Lorg/spongycastle/asn1/crmf/SubsequentMessage;->challengeResp:Lorg/spongycastle/asn1/crmf/SubsequentMessage;

    .line 16
    .line 17
    return-void
.end method

.method private constructor <init>(I)V
    .locals 2

    .line 1
    int-to-long v0, p1

    .line 2
    invoke-direct {p0, v0, v1}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static valueOf(I)Lorg/spongycastle/asn1/crmf/SubsequentMessage;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    sget-object p0, Lorg/spongycastle/asn1/crmf/SubsequentMessage;->encrCert:Lorg/spongycastle/asn1/crmf/SubsequentMessage;

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    if-ne p0, v0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lorg/spongycastle/asn1/crmf/SubsequentMessage;->challengeResp:Lorg/spongycastle/asn1/crmf/SubsequentMessage;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_1
    const-string v0, "unknown value: "

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method
