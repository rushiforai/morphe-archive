.class public interface abstract Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final commonName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final countryName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final crlAccessMethod:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_SHA1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_ad:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_ad_caIssuers:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_ad_ocsp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_at_name:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_at_telephoneNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_ce:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_ea_rsa:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_pe:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final id_pkix:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final localityName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final ocspAccessMethod:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final organization:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final organizationalUnitName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final ripemd160:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final ripemd160WithRSAEncryption:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final stateOrProvinceName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    const-string v1, "2.5.4.3"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->commonName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 13
    .line 14
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 15
    .line 16
    const-string v1, "2.5.4.6"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->countryName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 26
    .line 27
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 28
    .line 29
    const-string v1, "2.5.4.7"

    .line 30
    .line 31
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->localityName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 39
    .line 40
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 41
    .line 42
    const-string v1, "2.5.4.8"

    .line 43
    .line 44
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->stateOrProvinceName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 52
    .line 53
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 54
    .line 55
    const-string v1, "2.5.4.10"

    .line 56
    .line 57
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->organization:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 65
    .line 66
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 67
    .line 68
    const-string v1, "2.5.4.11"

    .line 69
    .line 70
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->organizationalUnitName:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 78
    .line 79
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 80
    .line 81
    const-string v1, "2.5.4.20"

    .line 82
    .line 83
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_at_telephoneNumber:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 91
    .line 92
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 93
    .line 94
    const-string v1, "2.5.4.41"

    .line 95
    .line 96
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_at_name:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 104
    .line 105
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 106
    .line 107
    const-string v1, "1.3.14.3.2.26"

    .line 108
    .line 109
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_SHA1:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 117
    .line 118
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 119
    .line 120
    const-string v1, "1.3.36.3.2.1"

    .line 121
    .line 122
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->ripemd160:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 130
    .line 131
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 132
    .line 133
    const-string v1, "1.3.36.3.3.1.2"

    .line 134
    .line 135
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->ripemd160WithRSAEncryption:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 143
    .line 144
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 145
    .line 146
    const-string v1, "2.5.8.1.1"

    .line 147
    .line 148
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_ea_rsa:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 156
    .line 157
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 158
    .line 159
    const-string v1, "1.3.6.1.5.5.7"

    .line 160
    .line 161
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_pkix:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 165
    .line 166
    const-string v1, "1"

    .line 167
    .line 168
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    sput-object v2, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_pe:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 173
    .line 174
    new-instance v2, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 175
    .line 176
    const-string v3, "2.5.29"

    .line 177
    .line 178
    invoke-direct {v2, v3}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    sput-object v2, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_ce:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 182
    .line 183
    const-string v2, "48"

    .line 184
    .line 185
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_ad:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 190
    .line 191
    const-string v2, "2"

    .line 192
    .line 193
    invoke-virtual {v0, v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {v2}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    sput-object v2, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_ad_caIssuers:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 202
    .line 203
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->branch(Ljava/lang/String;)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->intern()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->id_ad_ocsp:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 212
    .line 213
    sput-object v0, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->ocspAccessMethod:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 214
    .line 215
    sput-object v2, Lorg/spongycastle/asn1/x509/X509ObjectIdentifiers;->crlAccessMethod:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 216
    .line 217
    return-void
.end method
