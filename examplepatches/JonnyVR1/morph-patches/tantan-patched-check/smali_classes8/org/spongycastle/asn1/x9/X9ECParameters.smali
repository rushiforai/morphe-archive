.class public Lorg/spongycastle/asn1/x9/X9ECParameters;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;


# static fields
.field private static final ONE:Ljava/math/BigInteger;


# instance fields
.field private curve:Lorg/spongycastle/math/ec/ECCurve;

.field private fieldID:Lorg/spongycastle/asn1/x9/X9FieldID;

.field private g:Lorg/spongycastle/asn1/x9/X9ECPoint;

.field private h:Ljava/math/BigInteger;

.field private n:Ljava/math/BigInteger;

.field private seed:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x1

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/asn1/x9/X9ECParameters;->ONE:Ljava/math/BigInteger;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    instance-of v1, v1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 10
    .line 11
    if-eqz v1, :cond_2

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 18
    .line 19
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget-object v1, Lorg/spongycastle/asn1/x9/X9ECParameters;->ONE:Ljava/math/BigInteger;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    new-instance v0, Lorg/spongycastle/asn1/x9/X9Curve;

    .line 32
    .line 33
    const/4 v1, 0x1

    .line 34
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-static {v1}, Lorg/spongycastle/asn1/x9/X9FieldID;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x9/X9FieldID;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v2, 0x2

    .line 43
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-static {v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-direct {v0, v1, v2}, Lorg/spongycastle/asn1/x9/X9Curve;-><init>(Lorg/spongycastle/asn1/x9/X9FieldID;Lorg/spongycastle/asn1/ASN1Sequence;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x9/X9Curve;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 59
    .line 60
    const/4 v1, 0x3

    .line 61
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    instance-of v2, v1, Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 66
    .line 67
    if-eqz v2, :cond_0

    .line 68
    .line 69
    check-cast v1, Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 70
    .line 71
    iput-object v1, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->g:Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    new-instance v2, Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 75
    .line 76
    iget-object v3, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 77
    .line 78
    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 79
    .line 80
    invoke-direct {v2, v3, v1}, Lorg/spongycastle/asn1/x9/X9ECPoint;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 81
    .line 82
    .line 83
    iput-object v2, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->g:Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 84
    .line 85
    :goto_0
    const/4 v1, 0x4

    .line 86
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    check-cast v1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 91
    .line 92
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iput-object v1, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->n:Ljava/math/BigInteger;

    .line 97
    .line 98
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x9/X9Curve;->getSeed()[B

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iput-object v0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->seed:[B

    .line 103
    .line 104
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    const/4 v1, 0x6

    .line 109
    if-ne v0, v1, :cond_1

    .line 110
    .line 111
    const/4 v0, 0x5

    .line 112
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    check-cast p1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 117
    .line 118
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->h:Ljava/math/BigInteger;

    .line 123
    .line 124
    :cond_1
    return-void

    .line 125
    :cond_2
    const-string p0, "bad version in X9ECParameters"

    .line 126
    .line 127
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    const/4 p0, 0x0

    .line 131
    throw p0
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/asn1/x9/X9ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 133
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/asn1/x9/X9ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/asn1/x9/X9ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V
    .locals 2

    .line 136
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 137
    iput-object p1, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 138
    iput-object p2, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->g:Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 139
    iput-object p3, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->n:Ljava/math/BigInteger;

    .line 140
    iput-object p4, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->h:Ljava/math/BigInteger;

    .line 141
    iput-object p5, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->seed:[B

    .line 142
    invoke-static {p1}, Lorg/spongycastle/math/ec/ECAlgorithms;->isFpCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 143
    new-instance p2, Lorg/spongycastle/asn1/x9/X9FieldID;

    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECCurve;->getField()Lorg/spongycastle/math/field/FiniteField;

    move-result-object p1

    invoke-interface {p1}, Lorg/spongycastle/math/field/FiniteField;->getCharacteristic()Ljava/math/BigInteger;

    move-result-object p1

    invoke-direct {p2, p1}, Lorg/spongycastle/asn1/x9/X9FieldID;-><init>(Ljava/math/BigInteger;)V

    iput-object p2, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->fieldID:Lorg/spongycastle/asn1/x9/X9FieldID;

    return-void

    .line 144
    :cond_0
    invoke-static {p1}, Lorg/spongycastle/math/ec/ECAlgorithms;->isF2mCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    move-result p2

    const/4 p3, 0x0

    if-eqz p2, :cond_3

    .line 145
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECCurve;->getField()Lorg/spongycastle/math/field/FiniteField;

    move-result-object p1

    check-cast p1, Lorg/spongycastle/math/field/PolynomialExtensionField;

    .line 146
    invoke-interface {p1}, Lorg/spongycastle/math/field/PolynomialExtensionField;->getMinimalPolynomial()Lorg/spongycastle/math/field/Polynomial;

    move-result-object p1

    invoke-interface {p1}, Lorg/spongycastle/math/field/Polynomial;->getExponentsPresent()[I

    move-result-object p1

    .line 147
    array-length p2, p1

    const/4 p4, 0x1

    const/4 p5, 0x2

    const/4 v0, 0x3

    if-ne p2, v0, :cond_1

    .line 148
    new-instance p2, Lorg/spongycastle/asn1/x9/X9FieldID;

    aget p3, p1, p5

    aget p1, p1, p4

    invoke-direct {p2, p3, p1}, Lorg/spongycastle/asn1/x9/X9FieldID;-><init>(II)V

    iput-object p2, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->fieldID:Lorg/spongycastle/asn1/x9/X9FieldID;

    return-void

    .line 149
    :cond_1
    array-length p2, p1

    const/4 v1, 0x5

    if-ne p2, v1, :cond_2

    .line 150
    new-instance p2, Lorg/spongycastle/asn1/x9/X9FieldID;

    const/4 p3, 0x4

    aget p3, p1, p3

    aget p4, p1, p4

    aget p5, p1, p5

    aget p1, p1, v0

    invoke-direct {p2, p3, p4, p5, p1}, Lorg/spongycastle/asn1/x9/X9FieldID;-><init>(IIII)V

    iput-object p2, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->fieldID:Lorg/spongycastle/asn1/x9/X9FieldID;

    return-void

    .line 151
    :cond_2
    const-string p0, "Only trinomial and pentomial curves are supported"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw p3

    .line 152
    :cond_3
    const-string p0, "\'curve\' is of an unsupported type"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw p3
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 132
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 134
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V
    .locals 1

    move-object v0, p2

    .line 135
    new-instance p2, Lorg/spongycastle/asn1/x9/X9ECPoint;

    invoke-direct {p2, v0}, Lorg/spongycastle/asn1/x9/X9ECPoint;-><init>(Lorg/spongycastle/math/ec/ECPoint;)V

    invoke-direct/range {p0 .. p5}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/asn1/x9/X9ECPoint;Ljava/math/BigInteger;Ljava/math/BigInteger;[B)V

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x9/X9ECParameters;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/x9/X9ECParameters;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/x9/X9ECParameters;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x9/X9ECParameters;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method


# virtual methods
.method public getBaseEntry()Lorg/spongycastle/asn1/x9/X9ECPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->g:Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurve()Lorg/spongycastle/math/ec/ECCurve;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurveEntry()Lorg/spongycastle/asn1/x9/X9Curve;
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/x9/X9Curve;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 4
    .line 5
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->seed:[B

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lorg/spongycastle/asn1/x9/X9Curve;-><init>(Lorg/spongycastle/math/ec/ECCurve;[B)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public getFieldIDEntry()Lorg/spongycastle/asn1/x9/X9FieldID;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->fieldID:Lorg/spongycastle/asn1/x9/X9FieldID;

    .line 2
    .line 3
    return-object p0
.end method

.method public getG()Lorg/spongycastle/math/ec/ECPoint;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->g:Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/asn1/x9/X9ECPoint;->getPoint()Lorg/spongycastle/math/ec/ECPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getH()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->h:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getN()Ljava/math/BigInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->n:Ljava/math/BigInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSeed()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->seed:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 4

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 7
    .line 8
    sget-object v2, Lorg/spongycastle/asn1/x9/X9ECParameters;->ONE:Ljava/math/BigInteger;

    .line 9
    .line 10
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->fieldID:Lorg/spongycastle/asn1/x9/X9FieldID;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 19
    .line 20
    .line 21
    new-instance v1, Lorg/spongycastle/asn1/x9/X9Curve;

    .line 22
    .line 23
    iget-object v2, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 24
    .line 25
    iget-object v3, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->seed:[B

    .line 26
    .line 27
    invoke-direct {v1, v2, v3}, Lorg/spongycastle/asn1/x9/X9Curve;-><init>(Lorg/spongycastle/math/ec/ECCurve;[B)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->g:Lorg/spongycastle/asn1/x9/X9ECPoint;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 36
    .line 37
    .line 38
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 39
    .line 40
    iget-object v2, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->n:Ljava/math/BigInteger;

    .line 41
    .line 42
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9ECParameters;->h:Ljava/math/BigInteger;

    .line 49
    .line 50
    if-eqz p0, :cond_0

    .line 51
    .line 52
    new-instance v1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(Ljava/math/BigInteger;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 58
    .line 59
    .line 60
    :cond_0
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 61
    .line 62
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 63
    .line 64
    .line 65
    return-object p0
.end method
