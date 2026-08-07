.class public Lorg/spongycastle/pqc/asn1/ParSet;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field private static final ZERO:Ljava/math/BigInteger;


# instance fields
.field private h:[I

.field private k:[I

.field private t:I

.field private w:[I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/spongycastle/pqc/asn1/ParSet;->ZERO:Ljava/math/BigInteger;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(I[I[I[I)V
    .locals 0

    .line 176
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 177
    iput p1, p0, Lorg/spongycastle/pqc/asn1/ParSet;->t:I

    .line 178
    iput-object p2, p0, Lorg/spongycastle/pqc/asn1/ParSet;->h:[I

    .line 179
    iput-object p3, p0, Lorg/spongycastle/pqc/asn1/ParSet;->w:[I

    .line 180
    iput-object p4, p0, Lorg/spongycastle/pqc/asn1/ParSet;->k:[I

    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x4

    .line 9
    const/4 v2, 0x0

    .line 10
    if-ne v0, v1, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 18
    .line 19
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {v1}, Lorg/spongycastle/pqc/asn1/ParSet;->checkBigIntegerInIntRangeAndPositive(Ljava/math/BigInteger;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput v1, p0, Lorg/spongycastle/pqc/asn1/ParSet;->t:I

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {p1, v1}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 35
    .line 36
    const/4 v3, 0x2

    .line 37
    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 42
    .line 43
    const/4 v4, 0x3

    .line 44
    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lorg/spongycastle/asn1/ASN1Sequence;

    .line 49
    .line 50
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    iget v5, p0, Lorg/spongycastle/pqc/asn1/ParSet;->t:I

    .line 55
    .line 56
    if-ne v4, v5, :cond_1

    .line 57
    .line 58
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    iget v5, p0, Lorg/spongycastle/pqc/asn1/ParSet;->t:I

    .line 63
    .line 64
    if-ne v4, v5, :cond_1

    .line 65
    .line 66
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    iget v5, p0, Lorg/spongycastle/pqc/asn1/ParSet;->t:I

    .line 71
    .line 72
    if-ne v4, v5, :cond_1

    .line 73
    .line 74
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    new-array v2, v2, [I

    .line 79
    .line 80
    iput-object v2, p0, Lorg/spongycastle/pqc/asn1/ParSet;->h:[I

    .line 81
    .line 82
    invoke-virtual {v3}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    new-array v2, v2, [I

    .line 87
    .line 88
    iput-object v2, p0, Lorg/spongycastle/pqc/asn1/ParSet;->w:[I

    .line 89
    .line 90
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    new-array v2, v2, [I

    .line 95
    .line 96
    iput-object v2, p0, Lorg/spongycastle/pqc/asn1/ParSet;->k:[I

    .line 97
    .line 98
    :goto_0
    iget v2, p0, Lorg/spongycastle/pqc/asn1/ParSet;->t:I

    .line 99
    .line 100
    if-ge v0, v2, :cond_0

    .line 101
    .line 102
    iget-object v2, p0, Lorg/spongycastle/pqc/asn1/ParSet;->h:[I

    .line 103
    .line 104
    invoke-virtual {v1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    check-cast v4, Lorg/spongycastle/asn1/ASN1Integer;

    .line 109
    .line 110
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-static {v4}, Lorg/spongycastle/pqc/asn1/ParSet;->checkBigIntegerInIntRangeAndPositive(Ljava/math/BigInteger;)I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    aput v4, v2, v0

    .line 119
    .line 120
    iget-object v2, p0, Lorg/spongycastle/pqc/asn1/ParSet;->w:[I

    .line 121
    .line 122
    invoke-virtual {v3, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    check-cast v4, Lorg/spongycastle/asn1/ASN1Integer;

    .line 127
    .line 128
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-static {v4}, Lorg/spongycastle/pqc/asn1/ParSet;->checkBigIntegerInIntRangeAndPositive(Ljava/math/BigInteger;)I

    .line 133
    .line 134
    .line 135
    move-result v4

    .line 136
    aput v4, v2, v0

    .line 137
    .line 138
    iget-object v2, p0, Lorg/spongycastle/pqc/asn1/ParSet;->k:[I

    .line 139
    .line 140
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    check-cast v4, Lorg/spongycastle/asn1/ASN1Integer;

    .line 145
    .line 146
    invoke-virtual {v4}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 147
    .line 148
    .line 149
    move-result-object v4

    .line 150
    invoke-static {v4}, Lorg/spongycastle/pqc/asn1/ParSet;->checkBigIntegerInIntRangeAndPositive(Ljava/math/BigInteger;)I

    .line 151
    .line 152
    .line 153
    move-result v4

    .line 154
    aput v4, v2, v0

    .line 155
    .line 156
    add-int/lit8 v0, v0, 0x1

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_0
    return-void

    .line 160
    :cond_1
    const-string p0, "invalid size of sequences"

    .line 161
    .line 162
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    throw v2

    .line 166
    :cond_2
    const-string p0, "sie of seqOfParams = "

    .line 167
    .line 168
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    invoke-static {p0, p1}, Ll/pvb;->a(Ljava/lang/String;I)V

    .line 173
    .line 174
    .line 175
    throw v2
.end method

.method private static checkBigIntegerInIntRangeAndPositive(Ljava/math/BigInteger;)I
    .locals 3

    .line 1
    const-wide/32 v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    sget-object v0, Lorg/spongycastle/pqc/asn1/ParSet;->ZERO:Ljava/math/BigInteger;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0

    .line 27
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 28
    .line 29
    new-instance v1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "BigInteger not in Range: "

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/pqc/asn1/ParSet;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/pqc/asn1/ParSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/pqc/asn1/ParSet;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/pqc/asn1/ParSet;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/pqc/asn1/ParSet;-><init>(Lorg/spongycastle/asn1/ASN1Sequence;)V

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
.method public getH()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/ParSet;->h:[I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getK()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/ParSet;->k:[I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getT()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/pqc/asn1/ParSet;->t:I

    .line 2
    .line 3
    return p0
.end method

.method public getW()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/pqc/asn1/ParSet;->w:[I

    .line 2
    .line 3
    invoke-static {p0}, Lorg/spongycastle/util/Arrays;->clone([I)[I

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 8

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 7
    .line 8
    invoke-direct {v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 12
    .line 13
    invoke-direct {v2}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x0

    .line 17
    :goto_0
    iget-object v4, p0, Lorg/spongycastle/pqc/asn1/ParSet;->h:[I

    .line 18
    .line 19
    array-length v5, v4

    .line 20
    if-ge v3, v5, :cond_0

    .line 21
    .line 22
    new-instance v5, Lorg/spongycastle/asn1/ASN1Integer;

    .line 23
    .line 24
    aget v4, v4, v3

    .line 25
    .line 26
    int-to-long v6, v4

    .line 27
    invoke-direct {v5, v6, v7}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 31
    .line 32
    .line 33
    new-instance v4, Lorg/spongycastle/asn1/ASN1Integer;

    .line 34
    .line 35
    iget-object v5, p0, Lorg/spongycastle/pqc/asn1/ParSet;->w:[I

    .line 36
    .line 37
    aget v5, v5, v3

    .line 38
    .line 39
    int-to-long v5, v5

    .line 40
    invoke-direct {v4, v5, v6}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 44
    .line 45
    .line 46
    new-instance v4, Lorg/spongycastle/asn1/ASN1Integer;

    .line 47
    .line 48
    iget-object v5, p0, Lorg/spongycastle/pqc/asn1/ParSet;->k:[I

    .line 49
    .line 50
    aget v5, v5, v3

    .line 51
    .line 52
    int-to-long v5, v5

    .line 53
    invoke-direct {v4, v5, v6}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 v3, v3, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    new-instance v3, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 63
    .line 64
    invoke-direct {v3}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 65
    .line 66
    .line 67
    new-instance v4, Lorg/spongycastle/asn1/ASN1Integer;

    .line 68
    .line 69
    iget p0, p0, Lorg/spongycastle/pqc/asn1/ParSet;->t:I

    .line 70
    .line 71
    int-to-long v5, p0

    .line 72
    invoke-direct {v4, v5, v6}, Lorg/spongycastle/asn1/ASN1Integer;-><init>(J)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 76
    .line 77
    .line 78
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 79
    .line 80
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 84
    .line 85
    .line 86
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 87
    .line 88
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v3, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 92
    .line 93
    .line 94
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 95
    .line 96
    invoke-direct {p0, v2}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v3, p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 100
    .line 101
    .line 102
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 103
    .line 104
    invoke-direct {p0, v3}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 105
    .line 106
    .line 107
    return-object p0
.end method
