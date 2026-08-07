.class public Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;
.super Lorg/spongycastle/math/ec/ECPoint$AbstractFp;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)V
    .locals 1

    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, p2, p3, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    return-void
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;Z)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lorg/spongycastle/math/ec/ECPoint$AbstractFp;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-nez p2, :cond_0

    .line 7
    .line 8
    move p2, v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move p2, p1

    .line 11
    :goto_0
    if-nez p3, :cond_1

    .line 12
    .line 13
    move p1, v0

    .line 14
    :cond_1
    if-ne p2, p1, :cond_2

    .line 15
    .line 16
    iput-boolean p4, p0, Lorg/spongycastle/math/ec/ECPoint;->withCompression:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_2
    const-string p0, "Exactly one of the field elements is null"

    .line 20
    .line 21
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    throw p0
.end method

.method public constructor <init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V
    .locals 0

    .line 27
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/spongycastle/math/ec/ECPoint$AbstractFp;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 28
    iput-boolean p5, p0, Lorg/spongycastle/math/ec/ECPoint;->withCompression:Z

    return-void
.end method


# virtual methods
.method public add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;
    .locals 14

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    if-ne p0, p1, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;->twice()Lorg/spongycastle/math/ec/ECPoint;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_2
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECPoint;->x:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 27
    .line 28
    check-cast v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 29
    .line 30
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECPoint;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 31
    .line 32
    check-cast v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 33
    .line 34
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECPoint;->getXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 39
    .line 40
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECPoint;->getYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 45
    .line 46
    iget-object v5, p0, Lorg/spongycastle/math/ec/ECPoint;->zs:[Lorg/spongycastle/math/ec/ECFieldElement;

    .line 47
    .line 48
    const/4 v6, 0x0

    .line 49
    aget-object v5, v5, v6

    .line 50
    .line 51
    check-cast v5, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 52
    .line 53
    invoke-virtual {p1, v6}, Lorg/spongycastle/math/ec/ECPoint;->getZCoord(I)Lorg/spongycastle/math/ec/ECFieldElement;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 58
    .line 59
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->createExt()[I

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 68
    .line 69
    .line 70
    move-result-object v9

    .line 71
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    invoke-virtual {v5}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->isOne()Z

    .line 76
    .line 77
    .line 78
    move-result v11

    .line 79
    if-eqz v11, :cond_3

    .line 80
    .line 81
    iget-object v3, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 82
    .line 83
    iget-object v4, v4, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    iget-object v12, v5, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 87
    .line 88
    invoke-static {v12, v9}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->square([I[I)V

    .line 89
    .line 90
    .line 91
    iget-object v3, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 92
    .line 93
    invoke-static {v9, v3, v8}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 94
    .line 95
    .line 96
    iget-object v3, v5, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 97
    .line 98
    invoke-static {v9, v3, v9}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 99
    .line 100
    .line 101
    iget-object v3, v4, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 102
    .line 103
    invoke-static {v9, v3, v9}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 104
    .line 105
    .line 106
    move-object v3, v8

    .line 107
    move-object v4, v9

    .line 108
    :goto_0
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->isOne()Z

    .line 109
    .line 110
    .line 111
    move-result v12

    .line 112
    if-eqz v12, :cond_4

    .line 113
    .line 114
    iget-object v0, v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 115
    .line 116
    iget-object v2, v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_4
    iget-object v13, p1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 120
    .line 121
    invoke-static {v13, v10}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->square([I[I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 125
    .line 126
    invoke-static {v10, v0, v7}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 130
    .line 131
    invoke-static {v10, v0, v10}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 132
    .line 133
    .line 134
    iget-object v0, v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 135
    .line 136
    invoke-static {v10, v0, v10}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 137
    .line 138
    .line 139
    move-object v0, v7

    .line 140
    move-object v2, v10

    .line 141
    :goto_1
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 142
    .line 143
    .line 144
    move-result-object v13

    .line 145
    invoke-static {v0, v3, v13}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 146
    .line 147
    .line 148
    invoke-static {v2, v4, v8}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 149
    .line 150
    .line 151
    invoke-static {v13}, Lorg/spongycastle/math/raw/Nat160;->isZero([I)Z

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    if-eqz v3, :cond_6

    .line 156
    .line 157
    invoke-static {v8}, Lorg/spongycastle/math/raw/Nat160;->isZero([I)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_5

    .line 162
    .line 163
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;->twice()Lorg/spongycastle/math/ec/ECPoint;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    return-object p0

    .line 168
    :cond_5
    invoke-virtual {v1}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    return-object p0

    .line 173
    :cond_6
    invoke-static {v13, v9}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->square([I[I)V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-static {v9, v13, v3}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 181
    .line 182
    .line 183
    invoke-static {v9, v0, v9}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 184
    .line 185
    .line 186
    invoke-static {v3, v3}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->negate([I[I)V

    .line 187
    .line 188
    .line 189
    invoke-static {v2, v3, v7}, Lorg/spongycastle/math/raw/Nat160;->mul([I[I[I)V

    .line 190
    .line 191
    .line 192
    invoke-static {v9, v9, v3}, Lorg/spongycastle/math/raw/Nat160;->addBothTo([I[I[I)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    invoke-static {v0, v3}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce32(I[I)V

    .line 197
    .line 198
    .line 199
    new-instance v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 200
    .line 201
    invoke-direct {v2, v10}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;-><init>([I)V

    .line 202
    .line 203
    .line 204
    iget-object v0, v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 205
    .line 206
    invoke-static {v8, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->square([I[I)V

    .line 207
    .line 208
    .line 209
    iget-object v0, v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 210
    .line 211
    invoke-static {v0, v3, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 212
    .line 213
    .line 214
    move-object v0, v3

    .line 215
    new-instance v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 216
    .line 217
    invoke-direct {v3, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;-><init>([I)V

    .line 218
    .line 219
    .line 220
    iget-object v0, v2, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 221
    .line 222
    iget-object v4, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 223
    .line 224
    invoke-static {v9, v0, v4}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 225
    .line 226
    .line 227
    iget-object v0, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 228
    .line 229
    invoke-static {v0, v8, v7}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiplyAddToExt([I[I[I)V

    .line 230
    .line 231
    .line 232
    iget-object v0, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 233
    .line 234
    invoke-static {v7, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce([I[I)V

    .line 235
    .line 236
    .line 237
    new-instance v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 238
    .line 239
    invoke-direct {v0, v13}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;-><init>([I)V

    .line 240
    .line 241
    .line 242
    if-nez v11, :cond_7

    .line 243
    .line 244
    iget-object v4, v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 245
    .line 246
    iget-object v5, v5, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 247
    .line 248
    invoke-static {v4, v5, v4}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 249
    .line 250
    .line 251
    :cond_7
    if-nez v12, :cond_8

    .line 252
    .line 253
    iget-object v4, v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 254
    .line 255
    iget-object p1, p1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 256
    .line 257
    invoke-static {v4, p1, v4}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 258
    .line 259
    .line 260
    :cond_8
    const/4 p1, 0x1

    .line 261
    new-array v4, p1, [Lorg/spongycastle/math/ec/ECFieldElement;

    .line 262
    .line 263
    aput-object v0, v4, v6

    .line 264
    .line 265
    new-instance v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;

    .line 266
    .line 267
    iget-boolean v5, p0, Lorg/spongycastle/math/ec/ECPoint;->withCompression:Z

    .line 268
    .line 269
    invoke-direct/range {v0 .. v5}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    .line 270
    .line 271
    .line 272
    return-object v0
.end method

.method public detach()Lorg/spongycastle/math/ec/ECPoint;
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getAffineXCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getAffineYCoord()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v0, v2, v1, p0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public negate()Lorg/spongycastle/math/ec/ECPoint;
    .locals 7

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;

    .line 9
    .line 10
    iget-object v2, p0, Lorg/spongycastle/math/ec/ECPoint;->curve:Lorg/spongycastle/math/ec/ECCurve;

    .line 11
    .line 12
    iget-object v3, p0, Lorg/spongycastle/math/ec/ECPoint;->x:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 13
    .line 14
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECPoint;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 15
    .line 16
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->negate()Lorg/spongycastle/math/ec/ECFieldElement;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    iget-object v5, p0, Lorg/spongycastle/math/ec/ECPoint;->zs:[Lorg/spongycastle/math/ec/ECFieldElement;

    .line 21
    .line 22
    iget-boolean v6, p0, Lorg/spongycastle/math/ec/ECPoint;->withCompression:Z

    .line 23
    .line 24
    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    .line 25
    .line 26
    .line 27
    return-object v1
.end method

.method public threeTimes()Lorg/spongycastle/math/ec/ECPoint;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECPoint;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;->twice()Lorg/spongycastle/math/ec/ECPoint;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Lorg/spongycastle/math/ec/ECPoint;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :cond_1
    :goto_0
    return-object p0
.end method

.method public twice()Lorg/spongycastle/math/ec/ECPoint;
    .locals 12

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->getCurve()Lorg/spongycastle/math/ec/ECCurve;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECPoint;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 13
    .line 14
    check-cast v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 15
    .line 16
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->isZero()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v2}, Lorg/spongycastle/math/ec/ECCurve;->getInfinity()Lorg/spongycastle/math/ec/ECPoint;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    iget-object v1, p0, Lorg/spongycastle/math/ec/ECPoint;->x:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 28
    .line 29
    check-cast v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 30
    .line 31
    iget-object v3, p0, Lorg/spongycastle/math/ec/ECPoint;->zs:[Lorg/spongycastle/math/ec/ECFieldElement;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    aget-object v3, v3, v4

    .line 35
    .line 36
    check-cast v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 37
    .line 38
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 47
    .line 48
    .line 49
    move-result-object v7

    .line 50
    iget-object v8, v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 51
    .line 52
    invoke-static {v8, v7}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->square([I[I)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lorg/spongycastle/math/raw/Nat160;->create()[I

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    invoke-static {v7, v8}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->square([I[I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->isOne()Z

    .line 63
    .line 64
    .line 65
    move-result v9

    .line 66
    iget-object v10, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 67
    .line 68
    if-nez v9, :cond_2

    .line 69
    .line 70
    invoke-static {v10, v6}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->square([I[I)V

    .line 71
    .line 72
    .line 73
    move-object v10, v6

    .line 74
    :cond_2
    iget-object v11, v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 75
    .line 76
    invoke-static {v11, v10, v5}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 77
    .line 78
    .line 79
    iget-object v11, v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 80
    .line 81
    invoke-static {v11, v10, v6}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->add([I[I[I)V

    .line 82
    .line 83
    .line 84
    invoke-static {v6, v5, v6}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 85
    .line 86
    .line 87
    invoke-static {v6, v6, v6}, Lorg/spongycastle/math/raw/Nat160;->addBothTo([I[I[I)I

    .line 88
    .line 89
    .line 90
    move-result v10

    .line 91
    invoke-static {v10, v6}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce32(I[I)V

    .line 92
    .line 93
    .line 94
    iget-object v1, v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 95
    .line 96
    invoke-static {v7, v1, v7}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 97
    .line 98
    .line 99
    const/4 v1, 0x2

    .line 100
    const/4 v10, 0x5

    .line 101
    invoke-static {v10, v7, v1, v4}, Lorg/spongycastle/math/raw/Nat;->shiftUpBits(I[III)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    invoke-static {v1, v7}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce32(I[I)V

    .line 106
    .line 107
    .line 108
    const/4 v1, 0x3

    .line 109
    invoke-static {v10, v8, v1, v4, v5}, Lorg/spongycastle/math/raw/Nat;->shiftUpBits(I[III[I)I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-static {v1, v5}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->reduce32(I[I)V

    .line 114
    .line 115
    .line 116
    move-object v1, v3

    .line 117
    new-instance v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 118
    .line 119
    invoke-direct {v3, v8}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;-><init>([I)V

    .line 120
    .line 121
    .line 122
    iget-object v8, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 123
    .line 124
    invoke-static {v6, v8}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->square([I[I)V

    .line 125
    .line 126
    .line 127
    iget-object v8, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 128
    .line 129
    invoke-static {v8, v7, v8}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 130
    .line 131
    .line 132
    iget-object v8, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 133
    .line 134
    invoke-static {v8, v7, v8}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 135
    .line 136
    .line 137
    move v8, v4

    .line 138
    new-instance v4, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 139
    .line 140
    invoke-direct {v4, v7}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;-><init>([I)V

    .line 141
    .line 142
    .line 143
    iget-object v10, v3, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 144
    .line 145
    iget-object v11, v4, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 146
    .line 147
    invoke-static {v7, v10, v11}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 148
    .line 149
    .line 150
    iget-object v7, v4, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 151
    .line 152
    invoke-static {v7, v6, v7}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 153
    .line 154
    .line 155
    iget-object v7, v4, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 156
    .line 157
    invoke-static {v7, v5, v7}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->subtract([I[I[I)V

    .line 158
    .line 159
    .line 160
    new-instance v5, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;

    .line 161
    .line 162
    invoke-direct {v5, v6}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;-><init>([I)V

    .line 163
    .line 164
    .line 165
    iget-object v0, v0, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 166
    .line 167
    iget-object v6, v5, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 168
    .line 169
    invoke-static {v0, v6}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->twice([I[I)V

    .line 170
    .line 171
    .line 172
    if-nez v9, :cond_3

    .line 173
    .line 174
    iget-object v0, v5, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 175
    .line 176
    iget-object v1, v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1FieldElement;->x:[I

    .line 177
    .line 178
    invoke-static {v0, v1, v0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Field;->multiply([I[I[I)V

    .line 179
    .line 180
    .line 181
    :cond_3
    new-instance v1, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;

    .line 182
    .line 183
    const/4 v0, 0x1

    .line 184
    new-array v0, v0, [Lorg/spongycastle/math/ec/ECFieldElement;

    .line 185
    .line 186
    aput-object v5, v0, v8

    .line 187
    .line 188
    iget-boolean v6, p0, Lorg/spongycastle/math/ec/ECPoint;->withCompression:Z

    .line 189
    .line 190
    move-object v5, v0

    .line 191
    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECFieldElement;Lorg/spongycastle/math/ec/ECFieldElement;[Lorg/spongycastle/math/ec/ECFieldElement;Z)V

    .line 192
    .line 193
    .line 194
    return-object v1
.end method

.method public twicePlus(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;
    .locals 1

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;->threeTimes()Lorg/spongycastle/math/ec/ECPoint;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    return-object p1

    .line 15
    :cond_1
    invoke-virtual {p1}, Lorg/spongycastle/math/ec/ECPoint;->isInfinity()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;->twice()Lorg/spongycastle/math/ec/ECPoint;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_2
    iget-object v0, p0, Lorg/spongycastle/math/ec/ECPoint;->y:Lorg/spongycastle/math/ec/ECFieldElement;

    .line 27
    .line 28
    invoke-virtual {v0}, Lorg/spongycastle/math/ec/ECFieldElement;->isZero()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    return-object p1

    .line 35
    :cond_3
    invoke-virtual {p0}, Lorg/spongycastle/math/ec/custom/sec/SecP160R1Point;->twice()Lorg/spongycastle/math/ec/ECPoint;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p0, p1}, Lorg/spongycastle/math/ec/ECPoint;->add(Lorg/spongycastle/math/ec/ECPoint;)Lorg/spongycastle/math/ec/ECPoint;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0
.end method
