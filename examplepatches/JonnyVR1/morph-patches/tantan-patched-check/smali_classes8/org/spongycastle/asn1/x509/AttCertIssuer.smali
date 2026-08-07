.class public Lorg/spongycastle/asn1/x509/AttCertIssuer;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# instance fields
.field choiceObj:Lorg/spongycastle/asn1/ASN1Primitive;

.field obj:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/x509/GeneralNames;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 18
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 19
    invoke-interface {p1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object p1

    iput-object p1, p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;->choiceObj:Lorg/spongycastle/asn1/ASN1Primitive;

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/x509/V2Form;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 5
    .line 6
    new-instance p1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iget-object v1, p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 10
    .line 11
    invoke-direct {p1, v0, v0, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;->choiceObj:Lorg/spongycastle/asn1/ASN1Primitive;

    .line 15
    .line 16
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AttCertIssuer;
    .locals 2

    .line 1
    if-eqz p0, :cond_5

    .line 2
    .line 3
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/V2Form;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Lorg/spongycastle/asn1/x509/AttCertIssuer;

    .line 13
    .line 14
    invoke-static {p0}, Lorg/spongycastle/asn1/x509/V2Form;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/V2Form;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/AttCertIssuer;-><init>(Lorg/spongycastle/asn1/x509/V2Form;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :cond_1
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    new-instance v0, Lorg/spongycastle/asn1/x509/AttCertIssuer;

    .line 27
    .line 28
    check-cast p0, Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/AttCertIssuer;-><init>(Lorg/spongycastle/asn1/x509/GeneralNames;)V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_2
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    new-instance v0, Lorg/spongycastle/asn1/x509/AttCertIssuer;

    .line 39
    .line 40
    check-cast p0, Lorg/spongycastle/asn1/ASN1TaggedObject;

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-static {p0, v1}, Lorg/spongycastle/asn1/x509/V2Form;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/V2Form;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/AttCertIssuer;-><init>(Lorg/spongycastle/asn1/x509/V2Form;)V

    .line 48
    .line 49
    .line 50
    return-object v0

    .line 51
    :cond_3
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    new-instance v0, Lorg/spongycastle/asn1/x509/AttCertIssuer;

    .line 56
    .line 57
    invoke-static {p0}, Lorg/spongycastle/asn1/x509/GeneralNames;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/GeneralNames;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/AttCertIssuer;-><init>(Lorg/spongycastle/asn1/x509/GeneralNames;)V

    .line 62
    .line 63
    .line 64
    return-object v0

    .line 65
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string v0, "unknown object in factory: "

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/4 p0, 0x0

    .line 83
    return-object p0

    .line 84
    :cond_5
    :goto_0
    check-cast p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;

    .line 85
    .line 86
    return-object p0
.end method

.method public static getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/x509/AttCertIssuer;
    .locals 0

    .line 87
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getObject()Lorg/spongycastle/asn1/ASN1Primitive;

    move-result-object p0

    invoke-static {p0}, Lorg/spongycastle/asn1/x509/AttCertIssuer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/AttCertIssuer;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getIssuer()Lorg/spongycastle/asn1/ASN1Encodable;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 2
    .line 3
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/AttCertIssuer;->choiceObj:Lorg/spongycastle/asn1/ASN1Primitive;

    .line 2
    .line 3
    return-object p0
.end method
