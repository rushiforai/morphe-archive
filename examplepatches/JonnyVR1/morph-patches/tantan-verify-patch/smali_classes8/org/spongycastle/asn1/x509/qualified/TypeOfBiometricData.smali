.class public Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/asn1/ASN1Choice;


# static fields
.field public static final HANDWRITTEN_SIGNATURE:I = 0x1

.field public static final PICTURE:I


# instance fields
.field obj:Lorg/spongycastle/asn1/ASN1Encodable;


# direct methods
.method public constructor <init>(I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "unknow PredefinedBiometricType : "

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    throw p0

    .line 17
    :cond_1
    :goto_0
    new-instance v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 18
    .line 19
    int-to-long v1, p1

    .line 20
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 27
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;
    .locals 1

    .line 1
    if-eqz p0, :cond_3

    .line 2
    .line 3
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    new-instance v0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;-><init>(I)V

    .line 27
    .line 28
    .line 29
    return-object v0

    .line 30
    :cond_1
    instance-of v0, p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance v0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 39
    .line 40
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 41
    .line 42
    .line 43
    return-object v0

    .line 44
    :cond_2
    const-string p0, "unknown object in getInstance"

    .line 45
    .line 46
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0

    .line 51
    :cond_3
    :goto_0
    check-cast p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;

    .line 52
    .line 53
    return-object p0
.end method


# virtual methods
.method public getBiometricDataOid()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 2
    .line 3
    check-cast p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 4
    .line 5
    return-object p0
.end method

.method public getPredefinedBiometricType()I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 2
    .line 3
    check-cast p0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public isPredefined()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 2
    .line 3
    instance-of p0, p0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 4
    .line 5
    return p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/qualified/TypeOfBiometricData;->obj:Lorg/spongycastle/asn1/ASN1Encodable;

    .line 2
    .line 3
    invoke-interface {p0}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
