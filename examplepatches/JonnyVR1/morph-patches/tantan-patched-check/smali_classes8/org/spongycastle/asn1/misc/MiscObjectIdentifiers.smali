.class public interface abstract Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final as_sys_sec_alg_ideaCBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final blake2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final cast5CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final cryptlib:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final cryptlib_algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final cryptlib_algorithm_blowfish_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final cryptlib_algorithm_blowfish_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final cryptlib_algorithm_blowfish_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final cryptlib_algorithm_blowfish_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final entrust:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final entrustVersionExtension:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_blake2b160:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_blake2b256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_blake2b384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_blake2b512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscape:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscapeBaseURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscapeCARevocationURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscapeCApolicyURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscapeCertComment:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscapeCertType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscapeRenewalURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscapeRevocationURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final netscapeSSLServerName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final novell:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final novellSecurityAttribs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final verisign:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final verisignBitString_6_13:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final verisignCzagExtension:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final verisignDnbDunsNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final verisignIssStrongCrypto:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final verisignOnSiteJurisdictionHash:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final verisignPrivate_6_9:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    const-string v1, "2.16.840.1.113730.1"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscape:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    const-string v1, "1"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeCertType:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 17
    .line 18
    const-string v2, "2"

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeBaseURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 25
    .line 26
    const-string v2, "3"

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeRevocationURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 33
    .line 34
    const-string v2, "4"

    .line 35
    .line 36
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeCARevocationURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 41
    .line 42
    const-string v2, "7"

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeRenewalURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 49
    .line 50
    const-string v2, "8"

    .line 51
    .line 52
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeCApolicyURL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 57
    .line 58
    const-string v2, "12"

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeSSLServerName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 65
    .line 66
    const-string v2, "13"

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->netscapeCertComment:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 73
    .line 74
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 75
    .line 76
    const-string v2, "2.16.840.1.113733.1"

    .line 77
    .line 78
    invoke-direct {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->verisign:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 82
    .line 83
    const-string v2, "6.3"

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->verisignCzagExtension:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 90
    .line 91
    const-string v2, "6.9"

    .line 92
    .line 93
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->verisignPrivate_6_9:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 98
    .line 99
    const-string v2, "6.11"

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->verisignOnSiteJurisdictionHash:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 106
    .line 107
    const-string v2, "6.13"

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->verisignBitString_6_13:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 114
    .line 115
    const-string v2, "6.15"

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->verisignDnbDunsNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 122
    .line 123
    const-string v2, "8.1"

    .line 124
    .line 125
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->verisignIssStrongCrypto:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 130
    .line 131
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 132
    .line 133
    const-string v2, "2.16.840.1.113719"

    .line 134
    .line 135
    invoke-direct {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->novell:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 139
    .line 140
    const-string v2, "1.9.4.1"

    .line 141
    .line 142
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->novellSecurityAttribs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 147
    .line 148
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 149
    .line 150
    const-string v2, "1.2.840.113533.7"

    .line 151
    .line 152
    invoke-direct {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->entrust:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 156
    .line 157
    const-string v2, "65.0"

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    sput-object v2, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->entrustVersionExtension:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 164
    .line 165
    const-string v2, "66.10"

    .line 166
    .line 167
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->cast5CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 172
    .line 173
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 174
    .line 175
    const-string v2, "1.3.6.1.4.1.188.7.1.1.2"

    .line 176
    .line 177
    invoke-direct {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->as_sys_sec_alg_ideaCBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 181
    .line 182
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 183
    .line 184
    const-string v2, "1.3.6.1.4.1.3029"

    .line 185
    .line 186
    invoke-direct {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->cryptlib:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 190
    .line 191
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->cryptlib_algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 196
    .line 197
    const-string v1, "1.1"

    .line 198
    .line 199
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    sput-object v1, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->cryptlib_algorithm_blowfish_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 204
    .line 205
    const-string v1, "1.2"

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 208
    .line 209
    .line 210
    move-result-object v1

    .line 211
    sput-object v1, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->cryptlib_algorithm_blowfish_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 212
    .line 213
    const-string v1, "1.3"

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    sput-object v1, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->cryptlib_algorithm_blowfish_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 220
    .line 221
    const-string v1, "1.4"

    .line 222
    .line 223
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->cryptlib_algorithm_blowfish_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 228
    .line 229
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 230
    .line 231
    const-string v1, "1.3.6.1.4.1.1722.12.2"

    .line 232
    .line 233
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->blake2:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 237
    .line 238
    const-string v1, "1.5"

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    sput-object v1, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->id_blake2b160:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 245
    .line 246
    const-string v1, "1.8"

    .line 247
    .line 248
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    sput-object v1, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->id_blake2b256:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 253
    .line 254
    const-string v1, "1.12"

    .line 255
    .line 256
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    sput-object v1, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->id_blake2b384:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 261
    .line 262
    const-string v1, "1.16"

    .line 263
    .line 264
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    sput-object v0, Lorg/spongycastle/asn1/misc/MiscObjectIdentifiers;->id_blake2b512:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 269
    .line 270
    return-void
.end method
