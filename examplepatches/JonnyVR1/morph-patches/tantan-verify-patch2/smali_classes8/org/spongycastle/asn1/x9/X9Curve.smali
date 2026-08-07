.class public Lorg/spongycastle/asn1/x9/X9Curve;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;


# instance fields
.field private curve:Lorg/spongycastle/math/ec/ECCurve;

.field private fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private seed:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/asn1/x9/X9FieldID;Lorg/spongycastle/asn1/ASN1Sequence;)V
    .locals 12

    .line 1
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x9/X9FieldID;->getIdentifier()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iput-object v1, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 12
    .line 13
    sget-object v2, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->prime_field:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x2

    .line 20
    const/4 v3, 0x1

    .line 21
    const/4 v4, 0x0

    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x9/X9FieldID;->getParameters()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 29
    .line 30
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance v0, Lorg/spongycastle/asn1/x9/X9FieldElement;

    .line 35
    .line 36
    invoke-virtual {p2, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 41
    .line 42
    invoke-direct {v0, p1, v1}, Lorg/spongycastle/asn1/x9/X9FieldElement;-><init>(Ljava/math/BigInteger;Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 43
    .line 44
    .line 45
    new-instance v1, Lorg/spongycastle/asn1/x9/X9FieldElement;

    .line 46
    .line 47
    invoke-virtual {p2, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    check-cast v3, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 52
    .line 53
    invoke-direct {v1, p1, v3}, Lorg/spongycastle/asn1/x9/X9FieldElement;-><init>(Ljava/math/BigInteger;Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 54
    .line 55
    .line 56
    new-instance v3, Lorg/spongycastle/math/ec/ECCurve$Fp;

    .line 57
    .line 58
    invoke-virtual {v0}, Lorg/spongycastle/asn1/x9/X9FieldElement;->getValue()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x9/X9FieldElement;->getValue()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-direct {v3, p1, v0, v1}, Lorg/spongycastle/math/ec/ECCurve$Fp;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 75
    .line 76
    .line 77
    iput-object v3, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 78
    .line 79
    goto/16 :goto_1

    .line 80
    .line 81
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 82
    .line 83
    sget-object v5, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->characteristic_two_field:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 84
    .line 85
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_4

    .line 90
    .line 91
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x9/X9FieldID;->getParameters()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    check-cast v1, Lorg/spongycastle/asn1/ASN1Integer;

    .line 104
    .line 105
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    .line 110
    .line 111
    .line 112
    move-result v6

    .line 113
    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    check-cast v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 118
    .line 119
    sget-object v5, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->tpBasis:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 120
    .line 121
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    if-eqz v5, :cond_1

    .line 126
    .line 127
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    invoke-virtual {p1}, Ljava/math/BigInteger;->intValue()I

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    move v7, p1

    .line 144
    move v8, v4

    .line 145
    move v9, v8

    .line 146
    goto :goto_0

    .line 147
    :cond_1
    sget-object v5, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->ppBasis:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 148
    .line 149
    invoke-virtual {v1, v5}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_3

    .line 154
    .line 155
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Sequence;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-static {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    invoke-virtual {p1, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-static {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    invoke-virtual {v1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {v1}, Ljava/math/BigInteger;->intValue()I

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    invoke-virtual {p1, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1Integer;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1Integer;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1Integer;->getValue()Ljava/math/BigInteger;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {p1}, Ljava/math/BigInteger;->intValue()I

    .line 208
    .line 209
    .line 210
    move-result p1

    .line 211
    move v9, p1

    .line 212
    move v7, v0

    .line 213
    move v8, v1

    .line 214
    :goto_0
    new-instance v5, Lorg/spongycastle/asn1/x9/X9FieldElement;

    .line 215
    .line 216
    invoke-virtual {p2, v4}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    move-object v10, p1

    .line 221
    check-cast v10, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 222
    .line 223
    invoke-direct/range {v5 .. v10}, Lorg/spongycastle/asn1/x9/X9FieldElement;-><init>(IIIILorg/spongycastle/asn1/ASN1OctetString;)V

    .line 224
    .line 225
    .line 226
    move-object p1, v5

    .line 227
    new-instance v5, Lorg/spongycastle/asn1/x9/X9FieldElement;

    .line 228
    .line 229
    invoke-virtual {p2, v3}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    move-object v10, v0

    .line 234
    check-cast v10, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 235
    .line 236
    invoke-direct/range {v5 .. v10}, Lorg/spongycastle/asn1/x9/X9FieldElement;-><init>(IIIILorg/spongycastle/asn1/ASN1OctetString;)V

    .line 237
    .line 238
    .line 239
    new-instance v0, Lorg/spongycastle/math/ec/ECCurve$F2m;

    .line 240
    .line 241
    invoke-virtual {p1}, Lorg/spongycastle/asn1/x9/X9FieldElement;->getValue()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    .line 246
    .line 247
    .line 248
    move-result-object v10

    .line 249
    invoke-virtual {v5}, Lorg/spongycastle/asn1/x9/X9FieldElement;->getValue()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECFieldElement;->toBigInteger()Ljava/math/BigInteger;

    .line 254
    .line 255
    .line 256
    move-result-object v11

    .line 257
    move-object v5, v0

    .line 258
    invoke-direct/range {v5 .. v11}, Lorg/spongycastle/math/ec/ECCurve$F2m;-><init>(IIIILjava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 259
    .line 260
    .line 261
    iput-object v5, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 262
    .line 263
    :goto_1
    invoke-virtual {p2}, Lorg/spongycastle/asn1/ASN1Sequence;->size()I

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    const/4 v0, 0x3

    .line 268
    if-ne p1, v0, :cond_2

    .line 269
    .line 270
    invoke-virtual {p2, v2}, Lorg/spongycastle/asn1/ASN1Sequence;->getObjectAt(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    check-cast p1, Lorg/spongycastle/asn1/DERBitString;

    .line 275
    .line 276
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1BitString;->getBytes()[B

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    iput-object p1, p0, Lorg/spongycastle/asn1/x9/X9Curve;->seed:[B

    .line 281
    .line 282
    :cond_2
    return-void

    .line 283
    :cond_3
    const-string p0, "This type of EC basis is not implemented"

    .line 284
    .line 285
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    throw v0

    .line 289
    :cond_4
    const-string p0, "This type of ECCurve is not implemented"

    .line 290
    .line 291
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    throw v0
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;)V
    .locals 1

    .line 300
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    const/4 v0, 0x0

    .line 301
    iput-object v0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 302
    iput-object p1, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 303
    iput-object v0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->seed:[B

    .line 304
    invoke-direct {p0}, Lorg/spongycastle/asn1/x9/X9Curve;->setFieldIdentifier()V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;[B)V
    .locals 1

    .line 295
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    const/4 v0, 0x0

    .line 296
    iput-object v0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 297
    iput-object p1, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 298
    iput-object p2, p0, Lorg/spongycastle/asn1/x9/X9Curve;->seed:[B

    .line 299
    invoke-direct {p0}, Lorg/spongycastle/asn1/x9/X9Curve;->setFieldIdentifier()V

    return-void
.end method

.method private setFieldIdentifier()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/spongycastle/math/ec/ECAlgorithms;->isFpCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->prime_field:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 10
    .line 11
    iput-object v0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 15
    .line 16
    invoke-static {v0}, Lorg/spongycastle/math/ec/ECAlgorithms;->isF2mCurve(Lorg/spongycastle/math/ec/ECCurve;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v0, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->characteristic_two_field:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 23
    .line 24
    iput-object v0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const-string p0, "This type of ECCurve is not implemented"

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public getCurve()Lorg/spongycastle/math/ec/ECCurve;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSeed()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->seed:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 7
    .line 8
    sget-object v2, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->prime_field:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Lorg/spongycastle/asn1/x9/X9FieldElement;

    .line 17
    .line 18
    iget-object v2, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 19
    .line 20
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECCurve;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x9/X9FieldElement;-><init>(Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x9/X9FieldElement;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Lorg/spongycastle/asn1/x9/X9FieldElement;

    .line 35
    .line 36
    iget-object v2, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 37
    .line 38
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x9/X9FieldElement;-><init>(Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x9/X9FieldElement;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    iget-object v1, p0, Lorg/spongycastle/asn1/x9/X9Curve;->fieldIdentifier:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 54
    .line 55
    sget-object v2, Lorg/spongycastle/asn1/x9/X9ObjectIdentifiers;->characteristic_two_field:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Lorg/spongycastle/asn1/ASN1Primitive;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    new-instance v1, Lorg/spongycastle/asn1/x9/X9FieldElement;

    .line 64
    .line 65
    iget-object v2, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 66
    .line 67
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECCurve;->getA()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x9/X9FieldElement;-><init>(Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x9/X9FieldElement;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 79
    .line 80
    .line 81
    new-instance v1, Lorg/spongycastle/asn1/x9/X9FieldElement;

    .line 82
    .line 83
    iget-object v2, p0, Lorg/spongycastle/asn1/x9/X9Curve;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 84
    .line 85
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECCurve;->getB()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x9/X9FieldElement;-><init>(Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1}, Lorg/spongycastle/asn1/x9/X9FieldElement;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    :goto_0
    iget-object v1, p0, Lorg/spongycastle/asn1/x9/X9Curve;->seed:[B

    .line 100
    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    new-instance v1, Lorg/spongycastle/asn1/DERBitString;

    .line 104
    .line 105
    iget-object p0, p0, Lorg/spongycastle/asn1/x9/X9Curve;->seed:[B

    .line 106
    .line 107
    invoke-direct {v1, p0}, Lorg/spongycastle/asn1/DERBitString;-><init>([B)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 111
    .line 112
    .line 113
    :cond_2
    new-instance p0, Lorg/spongycastle/asn1/DERSequence;

    .line 114
    .line 115
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 116
    .line 117
    .line 118
    return-object p0
.end method
