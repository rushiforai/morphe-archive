.class public Lorg/spongycastle/asn1/x509/KeyPurposeId;
.super Lorg/spongycastle/asn1/ASN1Object;
.source "SourceFile"


# static fields
.field public static final anyExtendedKeyUsage:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field private static final id_kp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_kp_OCSPSigning:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_capwapAC:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_capwapWTP:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_clientAuth:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_codeSigning:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_dvcs:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_eapOverLAN:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_eapOverPPP:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_emailProtection:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_ipsecEndSystem:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_ipsecIKE:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_ipsecTunnel:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_ipsecUser:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_sbgpCertAAServerAuth:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_scvpClient:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_scvpServer:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_scvp_responder:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_serverAuth:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_smartcardlogon:Lorg/spongycastle/asn1/x509/KeyPurposeId;

.field public static final id_kp_timeStamping:Lorg/spongycastle/asn1/x509/KeyPurposeId;


# instance fields
.field private id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    const-string v1, "1.3.6.1.5.5.7.3"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 11
    .line 12
    sget-object v2, Lorg/spongycastle/asn1/x509/Extension;->extendedKeyUsage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 13
    .line 14
    const-string v3, "0"

    .line 15
    .line 16
    invoke-virtual {v2, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 21
    .line 22
    .line 23
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->anyExtendedKeyUsage:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 24
    .line 25
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 26
    .line 27
    const-string v2, "1"

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 34
    .line 35
    .line 36
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_serverAuth:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 37
    .line 38
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 39
    .line 40
    const-string v2, "2"

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 47
    .line 48
    .line 49
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_clientAuth:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 50
    .line 51
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 52
    .line 53
    const-string v2, "3"

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 60
    .line 61
    .line 62
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_codeSigning:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 63
    .line 64
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 65
    .line 66
    const-string v2, "4"

    .line 67
    .line 68
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 73
    .line 74
    .line 75
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_emailProtection:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 76
    .line 77
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 78
    .line 79
    const-string v2, "5"

    .line 80
    .line 81
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 86
    .line 87
    .line 88
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_ipsecEndSystem:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 89
    .line 90
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 91
    .line 92
    const-string v2, "6"

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 99
    .line 100
    .line 101
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_ipsecTunnel:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 102
    .line 103
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 104
    .line 105
    const-string v2, "7"

    .line 106
    .line 107
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 112
    .line 113
    .line 114
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_ipsecUser:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 115
    .line 116
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 117
    .line 118
    const-string v2, "8"

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 125
    .line 126
    .line 127
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_timeStamping:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 128
    .line 129
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 130
    .line 131
    const-string v2, "9"

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 138
    .line 139
    .line 140
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_OCSPSigning:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 141
    .line 142
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 143
    .line 144
    const-string v2, "10"

    .line 145
    .line 146
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 151
    .line 152
    .line 153
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_dvcs:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 154
    .line 155
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 156
    .line 157
    const-string v2, "11"

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 164
    .line 165
    .line 166
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_sbgpCertAAServerAuth:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 167
    .line 168
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 169
    .line 170
    const-string v2, "12"

    .line 171
    .line 172
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 177
    .line 178
    .line 179
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_scvp_responder:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 180
    .line 181
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 182
    .line 183
    const-string v2, "13"

    .line 184
    .line 185
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 186
    .line 187
    .line 188
    move-result-object v2

    .line 189
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 190
    .line 191
    .line 192
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_eapOverPPP:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 193
    .line 194
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 195
    .line 196
    const-string v2, "14"

    .line 197
    .line 198
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 203
    .line 204
    .line 205
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_eapOverLAN:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 206
    .line 207
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 208
    .line 209
    const-string v2, "15"

    .line 210
    .line 211
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 216
    .line 217
    .line 218
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_scvpServer:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 219
    .line 220
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 221
    .line 222
    const-string v2, "16"

    .line 223
    .line 224
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 229
    .line 230
    .line 231
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_scvpClient:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 232
    .line 233
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 234
    .line 235
    const-string v2, "17"

    .line 236
    .line 237
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 242
    .line 243
    .line 244
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_ipsecIKE:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 245
    .line 246
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 247
    .line 248
    const-string v2, "18"

    .line 249
    .line 250
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 255
    .line 256
    .line 257
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_capwapAC:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 258
    .line 259
    new-instance v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 260
    .line 261
    const-string v2, "19"

    .line 262
    .line 263
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-direct {v1, v0}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 268
    .line 269
    .line 270
    sput-object v1, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_capwapWTP:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 271
    .line 272
    new-instance v0, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 273
    .line 274
    new-instance v1, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 275
    .line 276
    const-string v2, "1.3.6.1.4.1.311.20.2.2"

    .line 277
    .line 278
    invoke-direct {v1, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 282
    .line 283
    .line 284
    sput-object v0, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id_kp_smartcardlogon:Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 285
    .line 286
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V
    .locals 0

    .line 10
    invoke-direct {p0}, Lorg/spongycastle/asn1/ASN1Object;-><init>()V

    .line 11
    iput-object p1, p0, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    return-void
.end method

.method public static getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/x509/KeyPurposeId;
    .locals 1

    .line 1
    instance-of v0, p0, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    if-eqz p0, :cond_1

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/x509/KeyPurposeId;

    .line 11
    .line 12
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getInstance(Ljava/lang/Object;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v0, p0}, Lorg/spongycastle/asn1/x509/KeyPurposeId;-><init>(Lorg/spongycastle/asn1/ASN1ObjectIdentifier;)V

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
.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->getId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public toOID()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/x509/KeyPurposeId;->id:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
