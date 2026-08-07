.class public interface abstract Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CRC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final CRC32:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final GNU:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final GnuPG:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final GnuRadar:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_128_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_128_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_128_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_192_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_192_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_192_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_256_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_256_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Serpent_256_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final Tiger_192:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final digestAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final encryptionAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final notation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field public static final pkaAddress:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 2
    .line 3
    const-string v1, "1.3.6.1.4.1.11591.1"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->GNU:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 9
    .line 10
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 11
    .line 12
    const-string v1, "1.3.6.1.4.1.11591.2"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->GnuPG:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 18
    .line 19
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 20
    .line 21
    const-string v1, "1.3.6.1.4.1.11591.2.1"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->notation:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 27
    .line 28
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 29
    .line 30
    const-string v1, "1.3.6.1.4.1.11591.2.1.1"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->pkaAddress:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 36
    .line 37
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 38
    .line 39
    const-string v1, "1.3.6.1.4.1.11591.3"

    .line 40
    .line 41
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->GnuRadar:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 45
    .line 46
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 47
    .line 48
    const-string v1, "1.3.6.1.4.1.11591.12"

    .line 49
    .line 50
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->digestAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 54
    .line 55
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 56
    .line 57
    const-string v1, "1.3.6.1.4.1.11591.12.2"

    .line 58
    .line 59
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Tiger_192:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 63
    .line 64
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 65
    .line 66
    const-string v1, "1.3.6.1.4.1.11591.13"

    .line 67
    .line 68
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->encryptionAlgorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 72
    .line 73
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 74
    .line 75
    const-string v1, "1.3.6.1.4.1.11591.13.2"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 81
    .line 82
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 83
    .line 84
    const-string v1, "1.3.6.1.4.1.11591.13.2.1"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_128_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 90
    .line 91
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 92
    .line 93
    const-string v1, "1.3.6.1.4.1.11591.13.2.2"

    .line 94
    .line 95
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_128_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 99
    .line 100
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 101
    .line 102
    const-string v1, "1.3.6.1.4.1.11591.13.2.3"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_128_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 108
    .line 109
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 110
    .line 111
    const-string v1, "1.3.6.1.4.1.11591.13.2.4"

    .line 112
    .line 113
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_128_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 117
    .line 118
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 119
    .line 120
    const-string v1, "1.3.6.1.4.1.11591.13.2.21"

    .line 121
    .line 122
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_192_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 126
    .line 127
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 128
    .line 129
    const-string v1, "1.3.6.1.4.1.11591.13.2.22"

    .line 130
    .line 131
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_192_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 135
    .line 136
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 137
    .line 138
    const-string v1, "1.3.6.1.4.1.11591.13.2.23"

    .line 139
    .line 140
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_192_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 144
    .line 145
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 146
    .line 147
    const-string v1, "1.3.6.1.4.1.11591.13.2.24"

    .line 148
    .line 149
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_192_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 153
    .line 154
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 155
    .line 156
    const-string v1, "1.3.6.1.4.1.11591.13.2.41"

    .line 157
    .line 158
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_256_ECB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 162
    .line 163
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 164
    .line 165
    const-string v1, "1.3.6.1.4.1.11591.13.2.42"

    .line 166
    .line 167
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_256_CBC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 171
    .line 172
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 173
    .line 174
    const-string v1, "1.3.6.1.4.1.11591.13.2.43"

    .line 175
    .line 176
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_256_OFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 180
    .line 181
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 182
    .line 183
    const-string v1, "1.3.6.1.4.1.11591.13.2.44"

    .line 184
    .line 185
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->Serpent_256_CFB:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 189
    .line 190
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 191
    .line 192
    const-string v1, "1.3.6.1.4.1.11591.14"

    .line 193
    .line 194
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->CRC:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 198
    .line 199
    new-instance v0, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 200
    .line 201
    const-string v1, "1.3.6.1.4.1.11591.14.1"

    .line 202
    .line 203
    invoke-direct {v0, v1}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;-><init>(Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    sput-object v0, Lorg/spongycastle/asn1/gnu/GNUObjectIdentifiers;->CRC32:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 207
    .line 208
    return-void
.end method
