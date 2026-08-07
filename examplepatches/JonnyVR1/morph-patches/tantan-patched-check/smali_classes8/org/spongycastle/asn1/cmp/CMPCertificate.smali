.class public Lorg/spongycastle/asn1/cmp/CMPCertificate;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field private otherCert:Lorg/spongycastle/asn1/ASN1Object;

.field private otherTagValue:I

.field private x509v3PKCert:Lorg/spongycastle/asn1/x509/Certificate;


# direct methods
.method public constructor <init>(ILorg/spongycastle/asn1/ASN1Object;)V
    .locals 0

    .line 21
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 22
    iput p1, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->otherTagValue:I

    .line 23
    iput-object p2, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->otherCert:Lorg/spongycastle/asn1/ASN1Object;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/AttributeCertificate;)V
    .locals 1

    const/4 v0, 0x1

    .line 24
    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/cmp/CMPCertificate;-><init>(ILorg/spongycastle/asn1/ASN1Object;)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/Certificate;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x509/Certificate;->getVersionNumber()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x3

    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    iput-object p1, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->x509v3PKCert:Lorg/spongycastle/asn1/x509/Certificate;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "only version 3 certificates allowed"

    .line 15
    .line 16
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    throw p0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/cmp/CMPCertificate;
    .locals 2

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    instance-of v0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    instance-of v0, p0, [B

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    :try_start_0
    check-cast p0, [B

    .line 14
    .line 15
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Primitive;->fromByteArray([B)Lorg/spongycastle/asn1/ASN1Primitive;

    .line 16
    .line 17
    .line 18
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    goto :goto_0

    .line 20
    :catch_0
    const-string p0, "Invalid encoding in CMPCertificate"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object v1

    .line 26
    :cond_1
    :goto_0
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    new-instance v0, Lorg/spongycastle/asn1/cmp/CMPCertificate;

    .line 31
    .line 32
    invoke-static {p0}, Lorg/spongycastle/asn1/x509/Certificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/Certificate;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/cmp/CMPCertificate;-><init>(Lorg/spongycastle/asn1/x509/Certificate;)V

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_2
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 45
    .line 46
    new-instance v0, Lorg/spongycastle/asn1/cmp/CMPCertificate;

    .line 47
    .line 48
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-direct {v0, v1, p0}, Lorg/spongycastle/asn1/cmp/CMPCertificate;-><init>(ILorg/spongycastle/asn1/ASN1Object;)V

    .line 57
    .line 58
    .line 59
    return-object v0

    .line 60
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string v0, "Invalid object: "

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-object v1

    .line 78
    :cond_4
    :goto_1
    check-cast p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;

    .line 79
    .line 80
    return-object p0
.end method


# virtual methods
.method public getOtherCert()Lorg/spongycastle/asn1/ASN1Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->otherCert:Lorg/spongycastle/asn1/ASN1Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherCertTag()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->otherTagValue:I

    .line 2
    .line 3
    return p0
.end method

.method public getX509v2AttrCert()Lorg/spongycastle/asn1/x509/AttributeCertificate;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->otherCert:Lorg/spongycastle/asn1/ASN1Object;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/asn1/x509/AttributeCertificate;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AttributeCertificate;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getX509v3PKCert()Lorg/spongycastle/asn1/x509/Certificate;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->x509v3PKCert:Lorg/spongycastle/asn1/x509/Certificate;

    .line 2
    .line 3
    return-object p0
.end method

.method public isX509v3PKCert()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->x509v3PKCert:Lorg/spongycastle/asn1/x509/Certificate;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->otherCert:Lorg/spongycastle/asn1/ASN1Object;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 6
    .line 7
    iget v1, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->otherTagValue:I

    .line 8
    .line 9
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->otherCert:Lorg/spongycastle/asn1/ASN1Object;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-direct {v0, v2, v1, p0}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 13
    .line 14
    .line 15
    return-object v0

    .line 16
    :cond_0
    iget-object p0, p0, Lorg/spongycastle/asn1/cmp/CMPCertificate;->x509v3PKCert:Lorg/spongycastle/asn1/x509/Certificate;

    .line 17
    .line 18
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x509/Certificate;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
