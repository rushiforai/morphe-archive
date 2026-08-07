.class public Lorg/spongycastle/asn1/ASN1InputStream;
.super Ljava/io/FilterInputStream;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/asn1/BERTags;


# instance fields
.field private final lazyEvaluate:Z

.field private final limit:I

.field private final tmpBuffers:[[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .line 19
    invoke-static {p1}, Lorg/spongycastle/asn1/StreamUtil;->findLimit(Ljava/io/InputStream;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 1

    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, p1, p2, v0}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;IZ)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2
    .line 3
    .line 4
    iput p2, p0, Lorg/spongycastle/asn1/ASN1InputStream;->limit:I

    .line 5
    .line 6
    iput-boolean p3, p0, Lorg/spongycastle/asn1/ASN1InputStream;->lazyEvaluate:Z

    .line 7
    .line 8
    const/16 p1, 0xb

    .line 9
    .line 10
    new-array p1, p1, [[B

    .line 11
    .line 12
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1InputStream;->tmpBuffers:[[B

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 1

    .line 18
    invoke-static {p1}, Lorg/spongycastle/asn1/StreamUtil;->findLimit(Ljava/io/InputStream;)I

    move-result v0

    invoke-direct {p0, p1, v0, p2}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;IZ)V

    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    .line 15
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length p1, p1

    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;I)V

    return-void
.end method

.method public constructor <init>([BZ)V
    .locals 1

    .line 16
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length p1, p1

    invoke-direct {p0, v0, p1, p2}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;IZ)V

    return-void
.end method

.method public static createPrimitiveDERObject(ILorg/spongycastle/asn1/DefiniteLengthInputStream;[[B)Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0xa

    .line 2
    .line 3
    if-eq p0, v0, :cond_2

    .line 4
    .line 5
    const/16 v0, 0xc

    .line 6
    .line 7
    if-eq p0, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x1e

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    packed-switch p0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    packed-switch p0, :pswitch_data_1

    .line 17
    .line 18
    .line 19
    const-string p1, "unknown tag "

    .line 20
    .line 21
    const-string p2, " encountered"

    .line 22
    .line 23
    invoke-static {p1, p0, p2}, Ll/w1;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0

    .line 28
    :pswitch_0
    new-instance p0, Lorg/spongycastle/asn1/DERUniversalString;

    .line 29
    .line 30
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERUniversalString;-><init>([B)V

    .line 35
    .line 36
    .line 37
    return-object p0

    .line 38
    :pswitch_1
    new-instance p0, Lorg/spongycastle/asn1/DERGeneralString;

    .line 39
    .line 40
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERGeneralString;-><init>([B)V

    .line 45
    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_2
    new-instance p0, Lorg/spongycastle/asn1/DERVisibleString;

    .line 49
    .line 50
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERVisibleString;-><init>([B)V

    .line 55
    .line 56
    .line 57
    return-object p0

    .line 58
    :pswitch_3
    new-instance p0, Lorg/spongycastle/asn1/DERGraphicString;

    .line 59
    .line 60
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERGraphicString;-><init>([B)V

    .line 65
    .line 66
    .line 67
    return-object p0

    .line 68
    :pswitch_4
    new-instance p0, Lorg/spongycastle/asn1/ASN1GeneralizedTime;

    .line 69
    .line 70
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1GeneralizedTime;-><init>([B)V

    .line 75
    .line 76
    .line 77
    return-object p0

    .line 78
    :pswitch_5
    new-instance p0, Lorg/spongycastle/asn1/ASN1UTCTime;

    .line 79
    .line 80
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1UTCTime;-><init>([B)V

    .line 85
    .line 86
    .line 87
    return-object p0

    .line 88
    :pswitch_6
    new-instance p0, Lorg/spongycastle/asn1/DERIA5String;

    .line 89
    .line 90
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERIA5String;-><init>([B)V

    .line 95
    .line 96
    .line 97
    return-object p0

    .line 98
    :pswitch_7
    new-instance p0, Lorg/spongycastle/asn1/DERVideotexString;

    .line 99
    .line 100
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERVideotexString;-><init>([B)V

    .line 105
    .line 106
    .line 107
    return-object p0

    .line 108
    :pswitch_8
    new-instance p0, Lorg/spongycastle/asn1/DERT61String;

    .line 109
    .line 110
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERT61String;-><init>([B)V

    .line 115
    .line 116
    .line 117
    return-object p0

    .line 118
    :pswitch_9
    new-instance p0, Lorg/spongycastle/asn1/DERPrintableString;

    .line 119
    .line 120
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERPrintableString;-><init>([B)V

    .line 125
    .line 126
    .line 127
    return-object p0

    .line 128
    :pswitch_a
    new-instance p0, Lorg/spongycastle/asn1/DERNumericString;

    .line 129
    .line 130
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERNumericString;-><init>([B)V

    .line 135
    .line 136
    .line 137
    return-object p0

    .line 138
    :pswitch_b
    invoke-static {p1, p2}, Lorg/spongycastle/asn1/ASN1InputStream;->getBuffer(Lorg/spongycastle/asn1/DefiniteLengthInputStream;[[B)[B

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1ObjectIdentifier;->fromOctetString([B)Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    return-object p0

    .line 147
    :pswitch_c
    sget-object p0, Lorg/spongycastle/asn1/DERNull;->INSTANCE:Lorg/spongycastle/asn1/DERNull;

    .line 148
    .line 149
    return-object p0

    .line 150
    :pswitch_d
    new-instance p0, Lorg/spongycastle/asn1/DEROctetString;

    .line 151
    .line 152
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 157
    .line 158
    .line 159
    return-object p0

    .line 160
    :pswitch_e
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->getRemaining()I

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    invoke-static {p0, p1}, Lorg/spongycastle/asn1/ASN1BitString;->fromInputStream(ILjava/io/InputStream;)Lorg/spongycastle/asn1/ASN1BitString;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    return-object p0

    .line 169
    :pswitch_f
    new-instance p0, Lorg/spongycastle/asn1/ASN1Integer;

    .line 170
    .line 171
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    const/4 p2, 0x0

    .line 176
    invoke-direct {p0, p1, p2}, Lorg/spongycastle/asn1/ASN1Integer;-><init>([BZ)V

    .line 177
    .line 178
    .line 179
    return-object p0

    .line 180
    :pswitch_10
    invoke-static {p1, p2}, Lorg/spongycastle/asn1/ASN1InputStream;->getBuffer(Lorg/spongycastle/asn1/DefiniteLengthInputStream;[[B)[B

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Boolean;->fromOctetString([B)Lorg/spongycastle/asn1/ASN1Boolean;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    return-object p0

    .line 189
    :cond_0
    new-instance p0, Lorg/spongycastle/asn1/DERBMPString;

    .line 190
    .line 191
    invoke-static {p1}, Lorg/spongycastle/asn1/ASN1InputStream;->getBMPCharBuffer(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)[C

    .line 192
    .line 193
    .line 194
    move-result-object p1

    .line 195
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERBMPString;-><init>([C)V

    .line 196
    .line 197
    .line 198
    return-object p0

    .line 199
    :cond_1
    new-instance p0, Lorg/spongycastle/asn1/DERUTF8String;

    .line 200
    .line 201
    invoke-virtual {p1}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/DERUTF8String;-><init>([B)V

    .line 206
    .line 207
    .line 208
    return-object p0

    .line 209
    :cond_2
    invoke-static {p1, p2}, Lorg/spongycastle/asn1/ASN1InputStream;->getBuffer(Lorg/spongycastle/asn1/DefiniteLengthInputStream;[[B)[B

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    invoke-static {p0}, Lorg/spongycastle/asn1/ASN1Enumerated;->fromOctetString([B)Lorg/spongycastle/asn1/ASN1Enumerated;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    return-object p0

    .line 218
    nop

    .line 219
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch

    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    :pswitch_data_1
    .packed-switch 0x12
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getBMPCharBuffer(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)[C
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->getRemaining()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    div-int/lit8 v0, v0, 0x2

    .line 6
    .line 7
    new-array v1, v0, [C

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v0, :cond_2

    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->read()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-gez v3, :cond_0

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->read()I

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-gez v4, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    add-int/lit8 v5, v2, 0x1

    .line 27
    .line 28
    shl-int/lit8 v3, v3, 0x8

    .line 29
    .line 30
    and-int/lit16 v4, v4, 0xff

    .line 31
    .line 32
    or-int/2addr v3, v4

    .line 33
    int-to-char v3, v3

    .line 34
    aput-char v3, v1, v2

    .line 35
    .line 36
    move v2, v5

    .line 37
    goto :goto_0

    .line 38
    :cond_2
    :goto_1
    return-object v1
.end method

.method private static getBuffer(Lorg/spongycastle/asn1/DefiniteLengthInputStream;[[B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->getRemaining()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->getRemaining()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    array-length v2, p1

    .line 10
    if-ge v1, v2, :cond_1

    .line 11
    .line 12
    aget-object v1, p1, v0

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    new-array v1, v0, [B

    .line 17
    .line 18
    aput-object v1, p1, v0

    .line 19
    .line 20
    :cond_0
    invoke-static {p0, v1}, Lorg/spongycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[B)I

    .line 21
    .line 22
    .line 23
    return-object v1

    .line 24
    :cond_1
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static readLength(Ljava/io/InputStream;I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-ltz v0, :cond_7

    .line 6
    .line 7
    const/16 v1, 0x80

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    const/4 p0, -0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/16 v1, 0x7f

    .line 14
    .line 15
    if-le v0, v1, :cond_6

    .line 16
    .line 17
    and-int/2addr v0, v1

    .line 18
    const/4 v1, 0x4

    .line 19
    const/4 v2, 0x0

    .line 20
    if-gt v0, v1, :cond_5

    .line 21
    .line 22
    move v1, v2

    .line 23
    move v3, v1

    .line 24
    :goto_0
    if-ge v1, v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-ltz v4, :cond_1

    .line 31
    .line 32
    shl-int/lit8 v3, v3, 0x8

    .line 33
    .line 34
    add-int/2addr v3, v4

    .line 35
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 39
    .line 40
    const-string p1, "EOF found reading length"

    .line 41
    .line 42
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw p0

    .line 46
    :cond_2
    if-ltz v3, :cond_4

    .line 47
    .line 48
    if-ge v3, p1, :cond_3

    .line 49
    .line 50
    return v3

    .line 51
    :cond_3
    const-string p0, "corrupted stream - out of bounds length found"

    .line 52
    .line 53
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return v2

    .line 57
    :cond_4
    const-string p0, "corrupted stream - negative length found"

    .line 58
    .line 59
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return v2

    .line 63
    :cond_5
    const-string p0, "DER length more than 4 bytes: "

    .line 64
    .line 65
    invoke-static {p0, v0}, Ll/p3r0;->a(Ljava/lang/String;I)V

    .line 66
    .line 67
    .line 68
    return v2

    .line 69
    :cond_6
    return v0

    .line 70
    :cond_7
    new-instance p0, Ljava/io/EOFException;

    .line 71
    .line 72
    const-string p1, "EOF found when length expected"

    .line 73
    .line 74
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    throw p0
.end method

.method public static readTagNumber(Ljava/io/InputStream;I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x1f

    .line 2
    .line 3
    and-int/2addr p1, v0

    .line 4
    if-ne p1, v0, :cond_3

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    and-int/lit8 v0, p1, 0x7f

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    :goto_0
    if-ltz p1, :cond_0

    .line 16
    .line 17
    and-int/lit16 v0, p1, 0x80

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    and-int/lit8 p1, p1, 0x7f

    .line 22
    .line 23
    or-int/2addr p1, v1

    .line 24
    shl-int/lit8 v1, p1, 0x7

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    if-ltz p1, :cond_1

    .line 32
    .line 33
    and-int/lit8 p0, p1, 0x7f

    .line 34
    .line 35
    or-int/2addr p0, v1

    .line 36
    return p0

    .line 37
    :cond_1
    new-instance p0, Ljava/io/EOFException;

    .line 38
    .line 39
    const-string p1, "EOF found inside tag value."

    .line 40
    .line 41
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw p0

    .line 45
    :cond_2
    const-string p0, "corrupted stream - invalid high tag number found"

    .line 46
    .line 47
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return v1

    .line 51
    :cond_3
    return p1
.end method


# virtual methods
.method public buildDEREncodableVector(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)Lorg/spongycastle/asn1/ASN1EncodableVector;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lorg/spongycastle/asn1/ASN1InputStream;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1InputStream;-><init>(Ljava/io/InputStream;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1InputStream;->buildEncodableVector()Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public buildEncodableVector()Lorg/spongycastle/asn1/ASN1EncodableVector;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1InputStream;->readObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-object v0
.end method

.method public buildObject(III)Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    and-int/lit8 v0, p1, 0x20

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    move v0, v1

    .line 9
    :goto_0
    new-instance v2, Lorg/spongycastle/asn1/DefiniteLengthInputStream;

    .line 10
    .line 11
    invoke-direct {v2, p0, p3}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 12
    .line 13
    .line 14
    and-int/lit8 p3, p1, 0x40

    .line 15
    .line 16
    if-eqz p3, :cond_1

    .line 17
    .line 18
    new-instance p0, Lorg/spongycastle/asn1/DERApplicationSpecific;

    .line 19
    .line 20
    invoke-virtual {v2}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-direct {p0, v0, p2, p1}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZI[B)V

    .line 25
    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    and-int/lit16 p1, p1, 0x80

    .line 29
    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    new-instance p0, Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 33
    .line 34
    invoke-direct {p0, v2}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0, p2}, Lorg/spongycastle/asn1/ASN1StreamParser;->readTaggedObject(ZI)Lorg/spongycastle/asn1/ASN1Primitive;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_2
    if-eqz v0, :cond_9

    .line 43
    .line 44
    const/4 p1, 0x4

    .line 45
    if-eq p2, p1, :cond_7

    .line 46
    .line 47
    const/16 p1, 0x8

    .line 48
    .line 49
    if-eq p2, p1, :cond_6

    .line 50
    .line 51
    const/16 p1, 0x10

    .line 52
    .line 53
    if-eq p2, p1, :cond_4

    .line 54
    .line 55
    const/16 p1, 0x11

    .line 56
    .line 57
    if-ne p2, p1, :cond_3

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1InputStream;->buildDEREncodableVector(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Lorg/spongycastle/asn1/DERFactory;->createSet(Lorg/spongycastle/asn1/ASN1EncodableVector;)Lorg/spongycastle/asn1/ASN1Set;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0

    .line 68
    :cond_3
    const-string p0, "unknown tag "

    .line 69
    .line 70
    const-string p1, " encountered"

    .line 71
    .line 72
    invoke-static {p0, p2, p1}, Ll/w1;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    return-object p0

    .line 77
    :cond_4
    iget-boolean p1, p0, Lorg/spongycastle/asn1/ASN1InputStream;->lazyEvaluate:Z

    .line 78
    .line 79
    if-eqz p1, :cond_5

    .line 80
    .line 81
    new-instance p0, Lorg/spongycastle/asn1/LazyEncodedSequence;

    .line 82
    .line 83
    invoke-virtual {v2}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/LazyEncodedSequence;-><init>([B)V

    .line 88
    .line 89
    .line 90
    return-object p0

    .line 91
    :cond_5
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1InputStream;->buildDEREncodableVector(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {p0}, Lorg/spongycastle/asn1/DERFactory;->createSequence(Lorg/spongycastle/asn1/ASN1EncodableVector;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_6
    new-instance p1, Lorg/spongycastle/asn1/DERExternal;

    .line 101
    .line 102
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1InputStream;->buildDEREncodableVector(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/DERExternal;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 107
    .line 108
    .line 109
    return-object p1

    .line 110
    :cond_7
    invoke-virtual {p0, v2}, Lorg/spongycastle/asn1/ASN1InputStream;->buildDEREncodableVector(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    new-array p2, p1, [Lorg/spongycastle/asn1/ASN1OctetString;

    .line 119
    .line 120
    :goto_1
    if-eq v1, p1, :cond_8

    .line 121
    .line 122
    invoke-virtual {p0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    check-cast p3, Lorg/spongycastle/asn1/ASN1OctetString;

    .line 127
    .line 128
    aput-object p3, p2, v1

    .line 129
    .line 130
    add-int/lit8 v1, v1, 0x1

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_8
    new-instance p0, Lorg/spongycastle/asn1/BEROctetString;

    .line 134
    .line 135
    invoke-direct {p0, p2}, Lorg/spongycastle/asn1/BEROctetString;-><init>([Lorg/spongycastle/asn1/ASN1OctetString;)V

    .line 136
    .line 137
    .line 138
    return-object p0

    .line 139
    :cond_9
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1InputStream;->tmpBuffers:[[B

    .line 140
    .line 141
    invoke-static {p2, v2, p0}, Lorg/spongycastle/asn1/ASN1InputStream;->createPrimitiveDERObject(ILorg/spongycastle/asn1/DefiniteLengthInputStream;[[B)Lorg/spongycastle/asn1/ASN1Primitive;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    return-object p0
.end method

.method public getLimit()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/spongycastle/asn1/ASN1InputStream;->limit:I

    .line 2
    .line 3
    return p0
.end method

.method public readFully([B)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-static {p0, p1}, Lorg/spongycastle/util/io/Streams;->readFully(Ljava/io/InputStream;[B)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    array-length p1, p1

    .line 6
    if-ne p0, p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance p0, Ljava/io/EOFException;

    .line 10
    .line 11
    const-string p1, "EOF encountered in middle of object"

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public readLength()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    iget v0, p0, Lorg/spongycastle/asn1/ASN1InputStream;->limit:I

    invoke-static {p0, v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readLength(Ljava/io/InputStream;I)I

    move-result p0

    return p0
.end method

.method public readObject()Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gtz v0, :cond_1

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const-string p0, "unexpected end-of-contents marker"

    .line 12
    .line 13
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0

    .line 18
    :cond_1
    invoke-static {p0, v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readTagNumber(Ljava/io/InputStream;I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    and-int/lit8 v2, v0, 0x20

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    if-eqz v2, :cond_2

    .line 26
    .line 27
    move v2, v3

    .line 28
    goto :goto_0

    .line 29
    :cond_2
    const/4 v2, 0x0

    .line 30
    :goto_0
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1InputStream;->readLength()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    if-gez v4, :cond_a

    .line 35
    .line 36
    if-eqz v2, :cond_9

    .line 37
    .line 38
    new-instance v2, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    .line 39
    .line 40
    iget v4, p0, Lorg/spongycastle/asn1/ASN1InputStream;->limit:I

    .line 41
    .line 42
    invoke-direct {v2, p0, v4}, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 43
    .line 44
    .line 45
    new-instance v4, Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 46
    .line 47
    iget p0, p0, Lorg/spongycastle/asn1/ASN1InputStream;->limit:I

    .line 48
    .line 49
    invoke-direct {v4, v2, p0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 50
    .line 51
    .line 52
    and-int/lit8 p0, v0, 0x40

    .line 53
    .line 54
    if-eqz p0, :cond_3

    .line 55
    .line 56
    new-instance p0, Lorg/spongycastle/asn1/BERApplicationSpecificParser;

    .line 57
    .line 58
    invoke-direct {p0, v1, v4}, Lorg/spongycastle/asn1/BERApplicationSpecificParser;-><init>(ILorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lorg/spongycastle/asn1/BERApplicationSpecificParser;->getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_3
    and-int/lit16 p0, v0, 0x80

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    new-instance p0, Lorg/spongycastle/asn1/BERTaggedObjectParser;

    .line 71
    .line 72
    invoke-direct {p0, v3, v1, v4}, Lorg/spongycastle/asn1/BERTaggedObjectParser;-><init>(ZILorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0}, Lorg/spongycastle/asn1/BERTaggedObjectParser;->getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_4
    const/4 p0, 0x4

    .line 81
    if-eq v1, p0, :cond_8

    .line 82
    .line 83
    const/16 p0, 0x8

    .line 84
    .line 85
    if-eq v1, p0, :cond_7

    .line 86
    .line 87
    const/16 p0, 0x10

    .line 88
    .line 89
    if-eq v1, p0, :cond_6

    .line 90
    .line 91
    const/16 p0, 0x11

    .line 92
    .line 93
    if-ne v1, p0, :cond_5

    .line 94
    .line 95
    new-instance p0, Lorg/spongycastle/asn1/BERSetParser;

    .line 96
    .line 97
    invoke-direct {p0, v4}, Lorg/spongycastle/asn1/BERSetParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lorg/spongycastle/asn1/BERSetParser;->getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0

    .line 105
    :cond_5
    const-string p0, "unknown BER object encountered"

    .line 106
    .line 107
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    const/4 p0, 0x0

    .line 111
    return-object p0

    .line 112
    :cond_6
    new-instance p0, Lorg/spongycastle/asn1/BERSequenceParser;

    .line 113
    .line 114
    invoke-direct {p0, v4}, Lorg/spongycastle/asn1/BERSequenceParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0}, Lorg/spongycastle/asn1/BERSequenceParser;->getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0

    .line 122
    :cond_7
    new-instance p0, Lorg/spongycastle/asn1/DERExternalParser;

    .line 123
    .line 124
    invoke-direct {p0, v4}, Lorg/spongycastle/asn1/DERExternalParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DERExternalParser;->getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0

    .line 132
    :cond_8
    new-instance p0, Lorg/spongycastle/asn1/BEROctetStringParser;

    .line 133
    .line 134
    invoke-direct {p0, v4}, Lorg/spongycastle/asn1/BEROctetStringParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0}, Lorg/spongycastle/asn1/BEROctetStringParser;->getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0

    .line 142
    :cond_9
    const-string p0, "indefinite-length primitive encoding encountered"

    .line 143
    .line 144
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    const/4 p0, 0x0

    .line 148
    return-object p0

    .line 149
    :cond_a
    :try_start_0
    invoke-virtual {p0, v0, v1, v4}, Lorg/spongycastle/asn1/ASN1InputStream;->buildObject(III)Lorg/spongycastle/asn1/ASN1Primitive;

    .line 150
    .line 151
    .line 152
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    return-object p0

    .line 154
    :catch_0
    move-exception p0

    .line 155
    new-instance v0, Lorg/spongycastle/asn1/ASN1Exception;

    .line 156
    .line 157
    const-string v1, "corrupted stream detected"

    .line 158
    .line 159
    invoke-direct {v0, v1, p0}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 160
    .line 161
    .line 162
    throw v0
.end method
