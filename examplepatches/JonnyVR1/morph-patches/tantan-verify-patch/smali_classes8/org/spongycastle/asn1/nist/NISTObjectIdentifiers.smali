.class public interface abstract Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final aes:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dsa_with_sha224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dsa_with_sha256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dsa_with_sha384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dsa_with_sha512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final hashAlgs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes128_CCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes128_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes128_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes128_GCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes128_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes128_wrap:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes192_CCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes192_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes192_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes192_GCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes192_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes192_wrap:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes256_CCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes256_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes256_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes256_GCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes256_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_aes256_wrap:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_dsa_with_sha2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha3_224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha3_256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha3_384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha3_512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha512_224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_sha512_256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_shake128:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_shake256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final nistAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    const-string v1, "2.16.840.1.101.3.4"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->nistAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    const-string v1, "2"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sput-object v2, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->hashAlgs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 17
    .line 18
    const-string v3, "1"

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    sput-object v4, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 25
    .line 26
    invoke-virtual {v2, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    sput-object v4, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 31
    .line 32
    const-string v4, "3"

    .line 33
    .line 34
    invoke-virtual {v2, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 35
    .line 36
    .line 37
    move-result-object v5

    .line 38
    sput-object v5, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 39
    .line 40
    const-string v5, "4"

    .line 41
    .line 42
    invoke-virtual {v2, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 47
    .line 48
    const-string v6, "5"

    .line 49
    .line 50
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    sput-object v7, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha512_224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 55
    .line 56
    const-string v7, "6"

    .line 57
    .line 58
    invoke-virtual {v2, v7}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 59
    .line 60
    .line 61
    move-result-object v8

    .line 62
    sput-object v8, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha512_256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 63
    .line 64
    const-string v8, "7"

    .line 65
    .line 66
    invoke-virtual {v2, v8}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha3_224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 71
    .line 72
    const-string v9, "8"

    .line 73
    .line 74
    invoke-virtual {v2, v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 75
    .line 76
    .line 77
    move-result-object v9

    .line 78
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha3_256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 79
    .line 80
    const-string v9, "9"

    .line 81
    .line 82
    invoke-virtual {v2, v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha3_384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 87
    .line 88
    const-string v9, "10"

    .line 89
    .line 90
    invoke-virtual {v2, v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 91
    .line 92
    .line 93
    move-result-object v9

    .line 94
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_sha3_512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 95
    .line 96
    const-string v9, "11"

    .line 97
    .line 98
    invoke-virtual {v2, v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 99
    .line 100
    .line 101
    move-result-object v9

    .line 102
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_shake128:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 103
    .line 104
    const-string v9, "12"

    .line 105
    .line 106
    invoke-virtual {v2, v9}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    sput-object v2, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_shake256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 111
    .line 112
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    sput-object v2, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->aes:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 117
    .line 118
    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 119
    .line 120
    .line 121
    move-result-object v9

    .line 122
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 123
    .line 124
    invoke-virtual {v2, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 125
    .line 126
    .line 127
    move-result-object v9

    .line 128
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 129
    .line 130
    invoke-virtual {v2, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 131
    .line 132
    .line 133
    move-result-object v9

    .line 134
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 135
    .line 136
    invoke-virtual {v2, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 137
    .line 138
    .line 139
    move-result-object v9

    .line 140
    sput-object v9, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 141
    .line 142
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 143
    .line 144
    .line 145
    move-result-object v6

    .line 146
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_wrap:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 147
    .line 148
    invoke-virtual {v2, v7}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 149
    .line 150
    .line 151
    move-result-object v6

    .line 152
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_GCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 153
    .line 154
    invoke-virtual {v2, v8}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 155
    .line 156
    .line 157
    move-result-object v6

    .line 158
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes128_CCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 159
    .line 160
    const-string v6, "21"

    .line 161
    .line 162
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 167
    .line 168
    const-string v6, "22"

    .line 169
    .line 170
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 175
    .line 176
    const-string v6, "23"

    .line 177
    .line 178
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 179
    .line 180
    .line 181
    move-result-object v6

    .line 182
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 183
    .line 184
    const-string v6, "24"

    .line 185
    .line 186
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 191
    .line 192
    const-string v6, "25"

    .line 193
    .line 194
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_wrap:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 199
    .line 200
    const-string v6, "26"

    .line 201
    .line 202
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 203
    .line 204
    .line 205
    move-result-object v6

    .line 206
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_GCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 207
    .line 208
    const-string v6, "27"

    .line 209
    .line 210
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 211
    .line 212
    .line 213
    move-result-object v6

    .line 214
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes192_CCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 215
    .line 216
    const-string v6, "41"

    .line 217
    .line 218
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 219
    .line 220
    .line 221
    move-result-object v6

    .line 222
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 223
    .line 224
    const-string v6, "42"

    .line 225
    .line 226
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 227
    .line 228
    .line 229
    move-result-object v6

    .line 230
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 231
    .line 232
    const-string v6, "43"

    .line 233
    .line 234
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 235
    .line 236
    .line 237
    move-result-object v6

    .line 238
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 239
    .line 240
    const-string v6, "44"

    .line 241
    .line 242
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 243
    .line 244
    .line 245
    move-result-object v6

    .line 246
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 247
    .line 248
    const-string v6, "45"

    .line 249
    .line 250
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 251
    .line 252
    .line 253
    move-result-object v6

    .line 254
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_wrap:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 255
    .line 256
    const-string v6, "46"

    .line 257
    .line 258
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 259
    .line 260
    .line 261
    move-result-object v6

    .line 262
    sput-object v6, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_GCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 263
    .line 264
    const-string v6, "47"

    .line 265
    .line 266
    invoke-virtual {v2, v6}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    sput-object v2, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_aes256_CCM:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 271
    .line 272
    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    sput-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->id_dsa_with_sha2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 277
    .line 278
    invoke-virtual {v0, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    sput-object v2, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->dsa_with_sha224:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 283
    .line 284
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    sput-object v1, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->dsa_with_sha256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 289
    .line 290
    invoke-virtual {v0, v4}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    sput-object v1, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->dsa_with_sha384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 295
    .line 296
    invoke-virtual {v0, v5}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    sput-object v0, Lorg/spongycastle/asn1/nist/NISTObjectIdentifiers;->dsa_with_sha512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 301
    .line 302
    return-void
.end method
