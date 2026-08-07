.class public Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/DerivationFunction;


# instance fields
.field private algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

.field private final digest:Lorg/spongycastle/crypto/Digest;

.field private keySize:I

.field private partyAInfo:[B

.field private z:[B


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/Digest;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public generateBytes([BII)I
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/spongycastle/crypto/DataLengthException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p3

    .line 6
    .line 7
    array-length v3, v1

    .line 8
    sub-int/2addr v3, v2

    .line 9
    const/4 v4, 0x0

    .line 10
    move/from16 v5, p2

    .line 11
    .line 12
    if-lt v3, v5, :cond_4

    .line 13
    .line 14
    int-to-long v6, v2

    .line 15
    iget-object v3, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 16
    .line 17
    invoke-interface {v3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    const-wide v8, 0x1ffffffffL

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    cmp-long v8, v6, v8

    .line 27
    .line 28
    if-gtz v8, :cond_3

    .line 29
    .line 30
    int-to-long v8, v3

    .line 31
    add-long v10, v6, v8

    .line 32
    .line 33
    const-wide/16 v12, 0x1

    .line 34
    .line 35
    sub-long/2addr v10, v12

    .line 36
    div-long/2addr v10, v8

    .line 37
    long-to-int v8, v10

    .line 38
    iget-object v9, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 39
    .line 40
    invoke-interface {v9}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 41
    .line 42
    .line 43
    move-result v9

    .line 44
    new-array v9, v9, [B

    .line 45
    .line 46
    const/4 v10, 0x1

    .line 47
    move v11, v4

    .line 48
    move v12, v10

    .line 49
    :goto_0
    iget-object v13, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 50
    .line 51
    if-ge v11, v8, :cond_2

    .line 52
    .line 53
    iget-object v14, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->z:[B

    .line 54
    .line 55
    array-length v15, v14

    .line 56
    invoke-interface {v13, v14, v4, v15}, Lorg/spongycastle/crypto/Digest;->update([BII)V

    .line 57
    .line 58
    .line 59
    new-instance v13, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 60
    .line 61
    invoke-direct {v13}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v14, Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 65
    .line 66
    invoke-direct {v14}, Lorg/spongycastle/asn1/ASN1EncodableVector;-><init>()V

    .line 67
    .line 68
    .line 69
    iget-object v15, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 70
    .line 71
    invoke-virtual {v14, v15}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 72
    .line 73
    .line 74
    new-instance v15, Lorg/spongycastle/asn1/DEROctetString;

    .line 75
    .line 76
    invoke-static {v12}, Lorg/spongycastle/util/Pack;->intToBigEndian(I)[B

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-direct {v15, v4}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v14, v15}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 84
    .line 85
    .line 86
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    .line 87
    .line 88
    invoke-direct {v4, v14}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v13, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 92
    .line 93
    .line 94
    iget-object v4, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->partyAInfo:[B

    .line 95
    .line 96
    if-eqz v4, :cond_0

    .line 97
    .line 98
    new-instance v4, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 99
    .line 100
    new-instance v14, Lorg/spongycastle/asn1/DEROctetString;

    .line 101
    .line 102
    iget-object v15, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->partyAInfo:[B

    .line 103
    .line 104
    invoke-direct {v14, v15}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 105
    .line 106
    .line 107
    const/4 v15, 0x0

    .line 108
    invoke-direct {v4, v10, v15, v14}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v13, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 112
    .line 113
    .line 114
    :cond_0
    new-instance v4, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 115
    .line 116
    new-instance v14, Lorg/spongycastle/asn1/DEROctetString;

    .line 117
    .line 118
    iget v15, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->keySize:I

    .line 119
    .line 120
    invoke-static {v15}, Lorg/spongycastle/util/Pack;->intToBigEndian(I)[B

    .line 121
    .line 122
    .line 123
    move-result-object v15

    .line 124
    invoke-direct {v14, v15}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 125
    .line 126
    .line 127
    const/4 v15, 0x2

    .line 128
    invoke-direct {v4, v10, v15, v14}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v13, v4}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 132
    .line 133
    .line 134
    :try_start_0
    new-instance v4, Lorg/spongycastle/asn1/DERSequence;

    .line 135
    .line 136
    invoke-direct {v4, v13}, Lorg/spongycastle/asn1/DERSequence;-><init>(Lorg/spongycastle/asn1/ASN1EncodableVector;)V

    .line 137
    .line 138
    .line 139
    const-string v13, "DER"

    .line 140
    .line 141
    invoke-virtual {v4, v13}, Lorg/spongycastle/asn1/ASN1Object;->getEncoded(Ljava/lang/String;)[B

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    iget-object v13, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 146
    .line 147
    array-length v14, v4

    .line 148
    const/4 v15, 0x0

    .line 149
    invoke-interface {v13, v4, v15, v14}, Lorg/spongycastle/crypto/Digest;->update([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    .line 151
    .line 152
    iget-object v4, v0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 153
    .line 154
    invoke-interface {v4, v9, v15}, Lorg/spongycastle/crypto/Digest;->doFinal([BI)I

    .line 155
    .line 156
    .line 157
    if-le v2, v3, :cond_1

    .line 158
    .line 159
    invoke-static {v9, v15, v1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 160
    .line 161
    .line 162
    add-int/2addr v5, v3

    .line 163
    sub-int/2addr v2, v3

    .line 164
    goto :goto_1

    .line 165
    :cond_1
    invoke-static {v9, v15, v1, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 166
    .line 167
    .line 168
    :goto_1
    add-int/lit8 v12, v12, 0x1

    .line 169
    .line 170
    add-int/lit8 v11, v11, 0x1

    .line 171
    .line 172
    const/4 v4, 0x0

    .line 173
    goto :goto_0

    .line 174
    :catch_0
    move-exception v0

    .line 175
    const-string v1, "unable to encode parameter info: "

    .line 176
    .line 177
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-static {v1, v0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    const/16 v16, 0x0

    .line 185
    .line 186
    return v16

    .line 187
    :cond_2
    invoke-interface {v13}, Lorg/spongycastle/crypto/Digest;->reset()V

    .line 188
    .line 189
    .line 190
    long-to-int v0, v6

    .line 191
    return v0

    .line 192
    :cond_3
    move/from16 v16, v4

    .line 193
    .line 194
    const-string v0, "Output length too large"

    .line 195
    .line 196
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    return v16

    .line 200
    :cond_4
    move/from16 v16, v4

    .line 201
    .line 202
    const-string v0, "output buffer too small"

    .line 203
    .line 204
    invoke-static {v0}, Ll/tyk0;->a(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    return v16
.end method

.method public getDigest()Lorg/spongycastle/crypto/Digest;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->digest:Lorg/spongycastle/crypto/Digest;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Lorg/spongycastle/crypto/DerivationParameters;)V
    .locals 1

    .line 1
    check-cast p1, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->getAlgorithm()Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->algorithm:Lorg/spongycastle/asn1/ASN1ObjectIdentifier;

    .line 8
    .line 9
    invoke-virtual {p1}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->getKeySize()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->keySize:I

    .line 14
    .line 15
    invoke-virtual {p1}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->getZ()[B

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->z:[B

    .line 20
    .line 21
    invoke-virtual {p1}, Lorg/spongycastle/crypto/agreement/kdf/DHKDFParameters;->getExtraInfo()[B

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lorg/spongycastle/crypto/agreement/kdf/DHKEKGenerator;->partyAInfo:[B

    .line 26
    .line 27
    return-void
.end method
