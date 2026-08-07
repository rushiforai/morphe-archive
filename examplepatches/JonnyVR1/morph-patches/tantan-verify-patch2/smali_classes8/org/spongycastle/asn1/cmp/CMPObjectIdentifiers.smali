.class public interface abstract Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ct_encKeyWithID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final dhBasedMac:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_pkip:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_regCtrl:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_regInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_caKeyUpdateInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_caProtEncCert:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_confirmWaitTime:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_currentCRL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_encKeyPairTypes:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_implicitConfirm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_keyPairParamRep:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_keyPairParamReq:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_origPKIMessage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_preferredSymAlg:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_revPassphrase:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_signKeyPairTypes:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_suppLangTags:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final it_unsupportedOIDs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final passwordBasedMac:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regCtrl_altCertTemplate:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regCtrl_authenticator:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regCtrl_oldCertID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regCtrl_pkiArchiveOptions:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regCtrl_pkiPublicationInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regCtrl_protocolEncrKey:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regCtrl_regToken:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regInfo_certReq:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final regInfo_utf8Pairs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    const-string v1, "1.2.840.113533.7.66.13"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->passwordBasedMac:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 11
    .line 12
    const-string v1, "1.2.840.113533.7.66.30"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->dhBasedMac:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 18
    .line 19
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 20
    .line 21
    const-string v1, "1.3.6.1.5.5.7.4.1"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_caProtEncCert:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 27
    .line 28
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 29
    .line 30
    const-string v1, "1.3.6.1.5.5.7.4.2"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_signKeyPairTypes:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 36
    .line 37
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 38
    .line 39
    const-string v1, "1.3.6.1.5.5.7.4.3"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_encKeyPairTypes:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 45
    .line 46
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 47
    .line 48
    const-string v1, "1.3.6.1.5.5.7.4.4"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_preferredSymAlg:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 54
    .line 55
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 56
    .line 57
    const-string v1, "1.3.6.1.5.5.7.4.5"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_caKeyUpdateInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 63
    .line 64
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 65
    .line 66
    const-string v1, "1.3.6.1.5.5.7.4.6"

    .line 67
    .line 68
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_currentCRL:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 72
    .line 73
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 74
    .line 75
    const-string v1, "1.3.6.1.5.5.7.4.7"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_unsupportedOIDs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 81
    .line 82
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 83
    .line 84
    const-string v1, "1.3.6.1.5.5.7.4.10"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_keyPairParamReq:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 90
    .line 91
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 92
    .line 93
    const-string v1, "1.3.6.1.5.5.7.4.11"

    .line 94
    .line 95
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_keyPairParamRep:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 99
    .line 100
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 101
    .line 102
    const-string v1, "1.3.6.1.5.5.7.4.12"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_revPassphrase:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 108
    .line 109
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 110
    .line 111
    const-string v1, "1.3.6.1.5.5.7.4.13"

    .line 112
    .line 113
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_implicitConfirm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 117
    .line 118
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 119
    .line 120
    const-string v1, "1.3.6.1.5.5.7.4.14"

    .line 121
    .line 122
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_confirmWaitTime:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 126
    .line 127
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 128
    .line 129
    const-string v1, "1.3.6.1.5.5.7.4.15"

    .line 130
    .line 131
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_origPKIMessage:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 135
    .line 136
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 137
    .line 138
    const-string v1, "1.3.6.1.5.5.7.4.16"

    .line 139
    .line 140
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->it_suppLangTags:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 144
    .line 145
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 146
    .line 147
    const-string v1, "1.3.6.1.5.5.7.5"

    .line 148
    .line 149
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->id_pkip:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 153
    .line 154
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 155
    .line 156
    const-string v1, "1.3.6.1.5.5.7.5.1"

    .line 157
    .line 158
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->id_regCtrl:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 162
    .line 163
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 164
    .line 165
    const-string v1, "1.3.6.1.5.5.7.5.2"

    .line 166
    .line 167
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->id_regInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 171
    .line 172
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 173
    .line 174
    const-string v1, "1.3.6.1.5.5.7.5.1.1"

    .line 175
    .line 176
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regCtrl_regToken:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 180
    .line 181
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 182
    .line 183
    const-string v1, "1.3.6.1.5.5.7.5.1.2"

    .line 184
    .line 185
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regCtrl_authenticator:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 189
    .line 190
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 191
    .line 192
    const-string v1, "1.3.6.1.5.5.7.5.1.3"

    .line 193
    .line 194
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regCtrl_pkiPublicationInfo:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 198
    .line 199
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 200
    .line 201
    const-string v1, "1.3.6.1.5.5.7.5.1.4"

    .line 202
    .line 203
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regCtrl_pkiArchiveOptions:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 207
    .line 208
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 209
    .line 210
    const-string v1, "1.3.6.1.5.5.7.5.1.5"

    .line 211
    .line 212
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regCtrl_oldCertID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 216
    .line 217
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 218
    .line 219
    const-string v1, "1.3.6.1.5.5.7.5.1.6"

    .line 220
    .line 221
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regCtrl_protocolEncrKey:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 225
    .line 226
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 227
    .line 228
    const-string v1, "1.3.6.1.5.5.7.5.1.7"

    .line 229
    .line 230
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regCtrl_altCertTemplate:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 234
    .line 235
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 236
    .line 237
    const-string v1, "1.3.6.1.5.5.7.5.2.1"

    .line 238
    .line 239
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regInfo_utf8Pairs:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 243
    .line 244
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 245
    .line 246
    const-string v1, "1.3.6.1.5.5.7.5.2.2"

    .line 247
    .line 248
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->regInfo_certReq:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 252
    .line 253
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 254
    .line 255
    const-string v1, "1.2.840.113549.1.9.16.1.21"

    .line 256
    .line 257
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    sput-object v0, Lorg/spongycastle/asn1/cmp/CMPObjectIdentifiers;->ct_encKeyWithID:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 261
    .line 262
    return-void
.end method
