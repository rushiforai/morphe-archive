.class public Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final names:Ljava/util/Hashtable;

.field static final objIds:Ljava/util/Hashtable;

.field static final params:Ljava/util/Hashtable;


# direct methods
.method static constructor <clinit>()V
    .locals 20

    .line 1
    new-instance v0, Ljava/util/Hashtable;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/Hashtable;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->objIds:Ljava/util/Hashtable;

    .line 7
    .line 8
    new-instance v1, Ljava/util/Hashtable;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/Hashtable;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->params:Ljava/util/Hashtable;

    .line 14
    .line 15
    new-instance v2, Ljava/util/Hashtable;

    .line 16
    .line 17
    invoke-direct {v2}, Ljava/util/Hashtable;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v2, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->names:Ljava/util/Hashtable;

    .line 21
    .line 22
    new-instance v4, Ljava/math/BigInteger;

    .line 23
    .line 24
    const-string v9, "115792089237316195423570985008687907853269984665640564039457584007913129639319"

    .line 25
    .line 26
    invoke-direct {v4, v9}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    new-instance v7, Ljava/math/BigInteger;

    .line 30
    .line 31
    const-string v10, "115792089237316195423570985008687907853073762908499243225378155805079068850323"

    .line 32
    .line 33
    invoke-direct {v7, v10}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance v3, Lorg/spongycastle/math/ec/ECCurve$Fp;

    .line 37
    .line 38
    new-instance v5, Ljava/math/BigInteger;

    .line 39
    .line 40
    const-string v11, "115792089237316195423570985008687907853269984665640564039457584007913129639316"

    .line 41
    .line 42
    invoke-direct {v5, v11}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    new-instance v6, Ljava/math/BigInteger;

    .line 46
    .line 47
    const-string v12, "166"

    .line 48
    .line 49
    invoke-direct {v6, v12}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object v18, Lorg/spongycastle/math/ec/ECConstants;->ONE:Ljava/math/BigInteger;

    .line 53
    .line 54
    move-object/from16 v8, v18

    .line 55
    .line 56
    invoke-direct/range {v3 .. v8}, Lorg/spongycastle/math/ec/ECCurve$Fp;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 57
    .line 58
    .line 59
    new-instance v4, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 60
    .line 61
    new-instance v5, Ljava/math/BigInteger;

    .line 62
    .line 63
    const-string v6, "1"

    .line 64
    .line 65
    invoke-direct {v5, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    new-instance v8, Ljava/math/BigInteger;

    .line 69
    .line 70
    const-string v13, "64033881142927202683649881450433473985931760268884941288852745803908878638612"

    .line 71
    .line 72
    invoke-direct {v8, v13}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v5, v8}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 76
    .line 77
    .line 78
    move-result-object v5

    .line 79
    invoke-direct {v4, v3, v5, v7}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)V

    .line 80
    .line 81
    .line 82
    sget-object v3, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3410_2001_CryptoPro_A:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 83
    .line 84
    invoke-virtual {v1, v3, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    new-instance v14, Ljava/math/BigInteger;

    .line 88
    .line 89
    invoke-direct {v14, v9}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    new-instance v4, Ljava/math/BigInteger;

    .line 93
    .line 94
    invoke-direct {v4, v10}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    move-object v5, v13

    .line 98
    new-instance v13, Lorg/spongycastle/math/ec/ECCurve$Fp;

    .line 99
    .line 100
    new-instance v15, Ljava/math/BigInteger;

    .line 101
    .line 102
    invoke-direct {v15, v11}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    new-instance v7, Ljava/math/BigInteger;

    .line 106
    .line 107
    invoke-direct {v7, v12}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    move-object/from16 v17, v4

    .line 111
    .line 112
    move-object/from16 v16, v7

    .line 113
    .line 114
    invoke-direct/range {v13 .. v18}, Lorg/spongycastle/math/ec/ECCurve$Fp;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 115
    .line 116
    .line 117
    new-instance v7, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 118
    .line 119
    new-instance v8, Ljava/math/BigInteger;

    .line 120
    .line 121
    invoke-direct {v8, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    new-instance v9, Ljava/math/BigInteger;

    .line 125
    .line 126
    invoke-direct {v9, v5}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v13, v8, v9}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 130
    .line 131
    .line 132
    move-result-object v5

    .line 133
    invoke-direct {v7, v13, v5, v4}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)V

    .line 134
    .line 135
    .line 136
    sget-object v4, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3410_2001_CryptoPro_XchA:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 137
    .line 138
    invoke-virtual {v1, v4, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    new-instance v14, Ljava/math/BigInteger;

    .line 142
    .line 143
    const-string v5, "57896044618658097711785492504343953926634992332820282019728792003956564823193"

    .line 144
    .line 145
    invoke-direct {v14, v5}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    new-instance v5, Ljava/math/BigInteger;

    .line 149
    .line 150
    const-string v7, "57896044618658097711785492504343953927102133160255826820068844496087732066703"

    .line 151
    .line 152
    invoke-direct {v5, v7}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    new-instance v13, Lorg/spongycastle/math/ec/ECCurve$Fp;

    .line 156
    .line 157
    new-instance v15, Ljava/math/BigInteger;

    .line 158
    .line 159
    const-string v7, "57896044618658097711785492504343953926634992332820282019728792003956564823190"

    .line 160
    .line 161
    invoke-direct {v15, v7}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    new-instance v7, Ljava/math/BigInteger;

    .line 165
    .line 166
    const-string v8, "28091019353058090096996979000309560759124368558014865957655842872397301267595"

    .line 167
    .line 168
    invoke-direct {v7, v8}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    move-object/from16 v17, v5

    .line 172
    .line 173
    move-object/from16 v16, v7

    .line 174
    .line 175
    invoke-direct/range {v13 .. v18}, Lorg/spongycastle/math/ec/ECCurve$Fp;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 176
    .line 177
    .line 178
    new-instance v7, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 179
    .line 180
    new-instance v8, Ljava/math/BigInteger;

    .line 181
    .line 182
    invoke-direct {v8, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    new-instance v6, Ljava/math/BigInteger;

    .line 186
    .line 187
    const-string v9, "28792665814854611296992347458380284135028636778229113005756334730996303888124"

    .line 188
    .line 189
    invoke-direct {v6, v9}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v13, v8, v6}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 193
    .line 194
    .line 195
    move-result-object v6

    .line 196
    invoke-direct {v7, v13, v6, v5}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)V

    .line 197
    .line 198
    .line 199
    sget-object v5, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3410_2001_CryptoPro_B:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 200
    .line 201
    invoke-virtual {v1, v5, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    .line 203
    .line 204
    new-instance v14, Ljava/math/BigInteger;

    .line 205
    .line 206
    const-string v6, "70390085352083305199547718019018437841079516630045180471284346843705633502619"

    .line 207
    .line 208
    invoke-direct {v14, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    new-instance v7, Ljava/math/BigInteger;

    .line 212
    .line 213
    const-string v8, "70390085352083305199547718019018437840920882647164081035322601458352298396601"

    .line 214
    .line 215
    invoke-direct {v7, v8}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    new-instance v13, Lorg/spongycastle/math/ec/ECCurve$Fp;

    .line 219
    .line 220
    new-instance v15, Ljava/math/BigInteger;

    .line 221
    .line 222
    const-string v9, "70390085352083305199547718019018437841079516630045180471284346843705633502616"

    .line 223
    .line 224
    invoke-direct {v15, v9}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    new-instance v10, Ljava/math/BigInteger;

    .line 228
    .line 229
    const-string v11, "32858"

    .line 230
    .line 231
    invoke-direct {v10, v11}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    move-object/from16 v17, v7

    .line 235
    .line 236
    move-object/from16 v16, v10

    .line 237
    .line 238
    invoke-direct/range {v13 .. v18}, Lorg/spongycastle/math/ec/ECCurve$Fp;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 239
    .line 240
    .line 241
    new-instance v10, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 242
    .line 243
    new-instance v12, Ljava/math/BigInteger;

    .line 244
    .line 245
    const-string v14, "0"

    .line 246
    .line 247
    invoke-direct {v12, v14}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 248
    .line 249
    .line 250
    new-instance v15, Ljava/math/BigInteger;

    .line 251
    .line 252
    move-object/from16 v19, v2

    .line 253
    .line 254
    const-string v2, "29818893917731240733471273240314769927240550812383695689146495261604565990247"

    .line 255
    .line 256
    invoke-direct {v15, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v13, v12, v15}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 260
    .line 261
    .line 262
    move-result-object v12

    .line 263
    invoke-direct {v10, v13, v12, v7}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)V

    .line 264
    .line 265
    .line 266
    sget-object v7, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3410_2001_CryptoPro_XchB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 267
    .line 268
    invoke-virtual {v1, v7, v10}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    .line 270
    .line 271
    move-object v10, v14

    .line 272
    new-instance v14, Ljava/math/BigInteger;

    .line 273
    .line 274
    invoke-direct {v14, v6}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    new-instance v6, Ljava/math/BigInteger;

    .line 278
    .line 279
    invoke-direct {v6, v8}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    new-instance v13, Lorg/spongycastle/math/ec/ECCurve$Fp;

    .line 283
    .line 284
    new-instance v15, Ljava/math/BigInteger;

    .line 285
    .line 286
    invoke-direct {v15, v9}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    new-instance v8, Ljava/math/BigInteger;

    .line 290
    .line 291
    invoke-direct {v8, v11}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    move-object/from16 v17, v6

    .line 295
    .line 296
    move-object/from16 v16, v8

    .line 297
    .line 298
    invoke-direct/range {v13 .. v18}, Lorg/spongycastle/math/ec/ECCurve$Fp;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    .line 299
    .line 300
    .line 301
    new-instance v8, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 302
    .line 303
    new-instance v9, Ljava/math/BigInteger;

    .line 304
    .line 305
    invoke-direct {v9, v10}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    new-instance v10, Ljava/math/BigInteger;

    .line 309
    .line 310
    invoke-direct {v10, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    invoke-virtual {v13, v9, v10}, Lorg/spongycastle/math/ec/ECCurve;->createPoint(Ljava/math/BigInteger;Ljava/math/BigInteger;)Lorg/spongycastle/math/ec/ECPoint;

    .line 314
    .line 315
    .line 316
    move-result-object v2

    .line 317
    invoke-direct {v8, v13, v2, v6}, Lorg/spongycastle/crypto/params/ECDomainParameters;-><init>(Lorg/spongycastle/math/ec/ECCurve;Lorg/spongycastle/math/ec/ECPoint;Ljava/math/BigInteger;)V

    .line 318
    .line 319
    .line 320
    sget-object v2, Lorg/spongycastle/asn1/cryptopro/CryptoProObjectIdentifiers;->gostR3410_2001_CryptoPro_C:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 321
    .line 322
    invoke-virtual {v1, v2, v8}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    const-string v1, "GostR3410-2001-CryptoPro-A"

    .line 326
    .line 327
    invoke-virtual {v0, v1, v3}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    const-string v6, "GostR3410-2001-CryptoPro-B"

    .line 331
    .line 332
    invoke-virtual {v0, v6, v5}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 333
    .line 334
    .line 335
    const-string v8, "GostR3410-2001-CryptoPro-C"

    .line 336
    .line 337
    invoke-virtual {v0, v8, v2}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    const-string v9, "GostR3410-2001-CryptoPro-XchA"

    .line 341
    .line 342
    invoke-virtual {v0, v9, v4}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    const-string v10, "GostR3410-2001-CryptoPro-XchB"

    .line 346
    .line 347
    invoke-virtual {v0, v10, v7}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-object/from16 v0, v19

    .line 351
    .line 352
    invoke-virtual {v0, v3, v1}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 353
    .line 354
    .line 355
    invoke-virtual {v0, v5, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    invoke-virtual {v0, v2, v8}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    invoke-virtual {v0, v4, v9}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0, v7, v10}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getByName(Ljava/lang/String;)Lorg/spongycastle/crypto/params/ECDomainParameters;
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->objIds:Ljava/util/Hashtable;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->params:Ljava/util/Hashtable;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public static getByOID(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Lorg/spongycastle/crypto/params/ECDomainParameters;
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->params:Ljava/util/Hashtable;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/spongycastle/crypto/params/ECDomainParameters;

    .line 8
    .line 9
    return-object p0
.end method

.method public static getName(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->names:Ljava/util/Hashtable;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public static getNames()Ljava/util/Enumeration;
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->names:Ljava/util/Hashtable;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Hashtable;->elements()Ljava/util/Enumeration;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static getOID(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .locals 1

    .line 1
    sget-object v0, Lorg/spongycastle/asn1/cryptopro/ECGOST3410NamedCurves;->objIds:Ljava/util/Hashtable;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 8
    .line 9
    return-object p0
.end method
