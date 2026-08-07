.class public Lorg/spongycastle/asn1/tsp/Accuracy;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field protected static final MAX_MICROS:I = 0x3e7

.field protected static final MAX_MILLIS:I = 0x3e7

.field protected static final MIN_MICROS:I = 0x1

.field protected static final MIN_MILLIS:I = 0x1


# instance fields
.field micros:Lorg/spongycastle/asn1/ASN1Integer;

.field millis:Lorg/spongycastle/asn1/ASN1Integer;

.field seconds:Lorg/spongycastle/asn1/ASN1Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 151
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ASN1Integer;Lorg/spongycastle/asn1/ASN1Integer;)V
    .locals 3

    .line 141
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 142
    iput-object p1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    const/4 p1, 0x0

    const/16 v0, 0x3e7

    const/4 v1, 0x1

    if-eqz p2, :cond_1

    .line 143
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    if-lt v2, v1, :cond_0

    .line 144
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->intValue()I

    move-result v2

    if-gt v2, v0, :cond_0

    goto :goto_0

    .line 145
    :cond_0
    const-string p0, "Invalid millis field : not in (1..999)"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw p1

    .line 146
    :cond_1
    :goto_0
    iput-object p2, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    if-eqz p3, :cond_3

    .line 147
    invoke-virtual {p3}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object p2

    invoke-virtual {p2}, Ljava/math/BigInteger;->intValue()I

    move-result p2

    if-lt p2, v1, :cond_2

    .line 148
    invoke-virtual {p3}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    move-result-object p2

    invoke-virtual {p2}, Ljava/math/BigInteger;->intValue()I

    move-result p2

    if-gt p2, v0, :cond_2

    goto :goto_1

    .line 149
    :cond_2
    const-string p0, "Invalid micros field : not in (1..999)"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    throw p1

    .line 150
    :cond_3
    :goto_1
    iput-object p3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 7

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    .line 6
    .line 7
    iput-object v0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 8
    .line 9
    iput-object v0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    move v2, v1

    .line 13
    :goto_0
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-ge v2, v3, :cond_6

    .line 18
    .line 19
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    instance-of v3, v3, Lorg/spongycastle/asn1/ASN1Integer;

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    check-cast v3, Lorg/spongycastle/asn1/ASN1Integer;

    .line 32
    .line 33
    iput-object v3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    instance-of v3, v3, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 41
    .line 42
    if-eqz v3, :cond_5

    .line 43
    .line 44
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 49
    .line 50
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1TaggedObject;->getTagNo()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    const/16 v5, 0x3e7

    .line 55
    .line 56
    const/4 v6, 0x1

    .line 57
    if-eqz v4, :cond_3

    .line 58
    .line 59
    if-ne v4, v6, :cond_2

    .line 60
    .line 61
    invoke-static {v3, v1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iput-object v3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 66
    .line 67
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-lt v3, v6, :cond_1

    .line 76
    .line 77
    iget-object v3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 78
    .line 79
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-gt v3, v5, :cond_1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_1
    const-string p0, "Invalid micros field : not in (1..999)."

    .line 91
    .line 92
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    throw v0

    .line 96
    :cond_2
    const-string p0, "Invalig tag number"

    .line 97
    .line 98
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    throw v0

    .line 102
    :cond_3
    invoke-static {v3, v1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Lorg/spongycastle/asn1/ASN1TaggedObject;Z)Lorg/spongycastle/asn1/ASN1Integer;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    iput-object v3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 107
    .line 108
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-lt v3, v6, :cond_4

    .line 117
    .line 118
    iget-object v3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 119
    .line 120
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v3}, Ljava/math/BigInteger;->intValue()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-gt v3, v5, :cond_4

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_4
    const-string p0, "Invalid millis field : not in (1..999)."

    .line 132
    .line 133
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    throw v0

    .line 137
    :cond_5
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_6
    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/tsp/Accuracy;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/tsp/Accuracy;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/tsp/Accuracy;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/tsp/Accuracy;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

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
.method public getMicros()Lorg/spongycastle/asn1/ASN1Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMillis()Lorg/spongycastle/asn1/ASN1Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSeconds()Lorg/spongycastle/asn1/ASN1Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

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
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->seconds:Lorg/spongycastle/asn1/ASN1Integer;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 19
    .line 20
    iget-object v3, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->millis:Lorg/spongycastle/asn1/ASN1Integer;

    .line 21
    .line 22
    invoke-direct {v1, v2, v2, v3}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    new-instance v1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    iget-object p0, p0, Lorg/spongycastle/asn1/tsp/Accuracy;->micros:Lorg/spongycastle/asn1/ASN1Integer;

    .line 36
    .line 37
    invoke-direct {v1, v2, v3, p0}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 44
    .line 45
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 46
    .line 47
    .line 48
    return-object p0
.end method
