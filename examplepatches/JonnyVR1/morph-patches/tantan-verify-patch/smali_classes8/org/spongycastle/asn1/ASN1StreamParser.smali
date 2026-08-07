.class public Lorg/spongycastle/asn1/ASN1StreamParser;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final _in:Ljava/io/InputStream;

.field private final _limit:I

.field private final tmpBuffers:[[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .line 15
    invoke-static {p1}, Lorg/spongycastle/asn1/StreamUtil;->findLimit(Ljava/io/InputStream;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 5
    .line 6
    iput p2, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_limit:I

    .line 7
    .line 8
    const/16 p1, 0xb

    .line 9
    .line 10
    new-array p1, p1, [[B

    .line 11
    .line 12
    iput-object p1, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->tmpBuffers:[[B

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    .line 16
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length p1, p1

    invoke-direct {p0, v0, p1}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    return-void
.end method

.method private set00Check(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 2
    .line 3
    instance-of v0, p0, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    check-cast p0, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;->setEofOn00(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public readImplicit(ZI)Lorg/spongycastle/asn1/ASN1Encodable;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 2
    .line 3
    instance-of v1, v0, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lorg/spongycastle/asn1/ASN1StreamParser;->readIndef(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "indefinite-length primitive encoding encountered"

    .line 15
    .line 16
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_1
    const/16 v1, 0x11

    .line 22
    .line 23
    const/16 v2, 0x10

    .line 24
    .line 25
    const/4 v3, 0x4

    .line 26
    if-eqz p1, :cond_4

    .line 27
    .line 28
    if-eq p2, v3, :cond_3

    .line 29
    .line 30
    if-eq p2, v2, :cond_2

    .line 31
    .line 32
    if-ne p2, v1, :cond_5

    .line 33
    .line 34
    new-instance p1, Lorg/spongycastle/asn1/DERSetParser;

    .line 35
    .line 36
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/DERSetParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 37
    .line 38
    .line 39
    return-object p1

    .line 40
    :cond_2
    new-instance p1, Lorg/spongycastle/asn1/DERSequenceParser;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/DERSequenceParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 43
    .line 44
    .line 45
    return-object p1

    .line 46
    :cond_3
    new-instance p1, Lorg/spongycastle/asn1/BEROctetStringParser;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/BEROctetStringParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 49
    .line 50
    .line 51
    return-object p1

    .line 52
    :cond_4
    if-eq p2, v3, :cond_8

    .line 53
    .line 54
    if-eq p2, v2, :cond_7

    .line 55
    .line 56
    if-eq p2, v1, :cond_6

    .line 57
    .line 58
    :cond_5
    new-instance p0, Lorg/spongycastle/asn1/ASN1Exception;

    .line 59
    .line 60
    const-string p1, "implicit tagging not implemented"

    .line 61
    .line 62
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :cond_6
    new-instance p0, Lorg/spongycastle/asn1/ASN1Exception;

    .line 67
    .line 68
    const-string p1, "sequences must use constructed encoding (see X.690 8.9.1/8.10.1)"

    .line 69
    .line 70
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    throw p0

    .line 74
    :cond_7
    new-instance p0, Lorg/spongycastle/asn1/ASN1Exception;

    .line 75
    .line 76
    const-string p1, "sets must use constructed encoding (see X.690 8.11.1/8.12.1)"

    .line 77
    .line 78
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    throw p0

    .line 82
    :cond_8
    new-instance p0, Lorg/spongycastle/asn1/DEROctetStringParser;

    .line 83
    .line 84
    check-cast v0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;

    .line 85
    .line 86
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DEROctetStringParser;-><init>(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)V

    .line 87
    .line 88
    .line 89
    return-object p0
.end method

.method public readIndef(I)Lorg/spongycastle/asn1/ASN1Encodable;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    if-eq p1, v0, :cond_3

    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    if-eq p1, v0, :cond_2

    .line 7
    .line 8
    const/16 v0, 0x10

    .line 9
    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x11

    .line 13
    .line 14
    if-ne p1, v0, :cond_0

    .line 15
    .line 16
    new-instance p1, Lorg/spongycastle/asn1/BERSetParser;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/BERSetParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 19
    .line 20
    .line 21
    return-object p1

    .line 22
    :cond_0
    new-instance p0, Lorg/spongycastle/asn1/ASN1Exception;

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v1, "unknown BER object encountered: 0x"

    .line 31
    .line 32
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p0, p1}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw p0

    .line 46
    :cond_1
    new-instance p1, Lorg/spongycastle/asn1/BERSequenceParser;

    .line 47
    .line 48
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/BERSequenceParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 49
    .line 50
    .line 51
    return-object p1

    .line 52
    :cond_2
    new-instance p1, Lorg/spongycastle/asn1/DERExternalParser;

    .line 53
    .line 54
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/DERExternalParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 55
    .line 56
    .line 57
    return-object p1

    .line 58
    :cond_3
    new-instance p1, Lorg/spongycastle/asn1/BEROctetStringParser;

    .line 59
    .line 60
    invoke-direct {p1, p0}, Lorg/spongycastle/asn1/BEROctetStringParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 61
    .line 62
    .line 63
    return-object p1
.end method

.method public readObject()Lorg/spongycastle/asn1/ASN1Encodable;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 v1, 0x0

    .line 13
    invoke-direct {p0, v1}, Lorg/spongycastle/asn1/ASN1StreamParser;->set00Check(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 17
    .line 18
    invoke-static {v2, v0}, Lorg/spongycastle/asn1/ASN1InputStream;->readTagNumber(Ljava/io/InputStream;I)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    and-int/lit8 v3, v0, 0x20

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    if-eqz v3, :cond_1

    .line 26
    .line 27
    move v1, v4

    .line 28
    :cond_1
    iget-object v3, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 29
    .line 30
    iget v5, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_limit:I

    .line 31
    .line 32
    invoke-static {v3, v5}, Lorg/spongycastle/asn1/ASN1InputStream;->readLength(Ljava/io/InputStream;I)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-gez v3, :cond_5

    .line 37
    .line 38
    if-eqz v1, :cond_4

    .line 39
    .line 40
    new-instance v1, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    .line 41
    .line 42
    iget-object v3, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 43
    .line 44
    iget v5, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_limit:I

    .line 45
    .line 46
    invoke-direct {v1, v3, v5}, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 47
    .line 48
    .line 49
    new-instance v3, Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 50
    .line 51
    iget p0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_limit:I

    .line 52
    .line 53
    invoke-direct {v3, v1, p0}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;I)V

    .line 54
    .line 55
    .line 56
    and-int/lit8 p0, v0, 0x40

    .line 57
    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    new-instance p0, Lorg/spongycastle/asn1/BERApplicationSpecificParser;

    .line 61
    .line 62
    invoke-direct {p0, v2, v3}, Lorg/spongycastle/asn1/BERApplicationSpecificParser;-><init>(ILorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 63
    .line 64
    .line 65
    return-object p0

    .line 66
    :cond_2
    and-int/lit16 p0, v0, 0x80

    .line 67
    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    new-instance p0, Lorg/spongycastle/asn1/BERTaggedObjectParser;

    .line 71
    .line 72
    invoke-direct {p0, v4, v2, v3}, Lorg/spongycastle/asn1/BERTaggedObjectParser;-><init>(ZILorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 73
    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_3
    invoke-virtual {v3, v2}, Lorg/spongycastle/asn1/ASN1StreamParser;->readIndef(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_4
    const-string p0, "indefinite-length primitive encoding encountered"

    .line 82
    .line 83
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    const/4 p0, 0x0

    .line 87
    return-object p0

    .line 88
    :cond_5
    new-instance v4, Lorg/spongycastle/asn1/DefiniteLengthInputStream;

    .line 89
    .line 90
    iget-object v5, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 91
    .line 92
    invoke-direct {v4, v5, v3}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 93
    .line 94
    .line 95
    and-int/lit8 v3, v0, 0x40

    .line 96
    .line 97
    if-eqz v3, :cond_6

    .line 98
    .line 99
    new-instance p0, Lorg/spongycastle/asn1/DERApplicationSpecific;

    .line 100
    .line 101
    invoke-virtual {v4}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-direct {p0, v1, v2, v0}, Lorg/spongycastle/asn1/DERApplicationSpecific;-><init>(ZI[B)V

    .line 106
    .line 107
    .line 108
    return-object p0

    .line 109
    :cond_6
    and-int/lit16 v0, v0, 0x80

    .line 110
    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    new-instance p0, Lorg/spongycastle/asn1/BERTaggedObjectParser;

    .line 114
    .line 115
    new-instance v0, Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 116
    .line 117
    invoke-direct {v0, v4}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    .line 118
    .line 119
    .line 120
    invoke-direct {p0, v1, v2, v0}, Lorg/spongycastle/asn1/BERTaggedObjectParser;-><init>(ZILorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 121
    .line 122
    .line 123
    return-object p0

    .line 124
    :cond_7
    const/4 v0, 0x4

    .line 125
    if-eqz v1, :cond_c

    .line 126
    .line 127
    if-eq v2, v0, :cond_b

    .line 128
    .line 129
    const/16 p0, 0x8

    .line 130
    .line 131
    if-eq v2, p0, :cond_a

    .line 132
    .line 133
    const/16 p0, 0x10

    .line 134
    .line 135
    if-eq v2, p0, :cond_9

    .line 136
    .line 137
    const/16 p0, 0x11

    .line 138
    .line 139
    if-ne v2, p0, :cond_8

    .line 140
    .line 141
    new-instance p0, Lorg/spongycastle/asn1/DERSetParser;

    .line 142
    .line 143
    new-instance v0, Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 144
    .line 145
    invoke-direct {v0, v4}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    .line 146
    .line 147
    .line 148
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSetParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 149
    .line 150
    .line 151
    return-object p0

    .line 152
    :cond_8
    const-string p0, "unknown tag "

    .line 153
    .line 154
    const-string v0, " encountered"

    .line 155
    .line 156
    invoke-static {p0, v2, v0}, Ll/w1;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 157
    .line 158
    .line 159
    const/4 p0, 0x0

    .line 160
    return-object p0

    .line 161
    :cond_9
    new-instance p0, Lorg/spongycastle/asn1/DERSequenceParser;

    .line 162
    .line 163
    new-instance v0, Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 164
    .line 165
    invoke-direct {v0, v4}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    .line 166
    .line 167
    .line 168
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERSequenceParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 169
    .line 170
    .line 171
    return-object p0

    .line 172
    :cond_a
    new-instance p0, Lorg/spongycastle/asn1/DERExternalParser;

    .line 173
    .line 174
    new-instance v0, Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 175
    .line 176
    invoke-direct {v0, v4}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    .line 177
    .line 178
    .line 179
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/DERExternalParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 180
    .line 181
    .line 182
    return-object p0

    .line 183
    :cond_b
    new-instance p0, Lorg/spongycastle/asn1/BEROctetStringParser;

    .line 184
    .line 185
    new-instance v0, Lorg/spongycastle/asn1/ASN1StreamParser;

    .line 186
    .line 187
    invoke-direct {v0, v4}, Lorg/spongycastle/asn1/ASN1StreamParser;-><init>(Ljava/io/InputStream;)V

    .line 188
    .line 189
    .line 190
    invoke-direct {p0, v0}, Lorg/spongycastle/asn1/BEROctetStringParser;-><init>(Lorg/spongycastle/asn1/ASN1StreamParser;)V

    .line 191
    .line 192
    .line 193
    return-object p0

    .line 194
    :cond_c
    if-eq v2, v0, :cond_d

    .line 195
    .line 196
    :try_start_0
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->tmpBuffers:[[B

    .line 197
    .line 198
    invoke-static {v2, v4, p0}, Lorg/spongycastle/asn1/ASN1InputStream;->createPrimitiveDERObject(ILorg/spongycastle/asn1/DefiniteLengthInputStream;[[B)Lorg/spongycastle/asn1/ASN1Primitive;

    .line 199
    .line 200
    .line 201
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 202
    return-object p0

    .line 203
    :catch_0
    move-exception p0

    .line 204
    new-instance v0, Lorg/spongycastle/asn1/ASN1Exception;

    .line 205
    .line 206
    const-string v1, "corrupted stream detected"

    .line 207
    .line 208
    invoke-direct {v0, v1, p0}, Lorg/spongycastle/asn1/ASN1Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 209
    .line 210
    .line 211
    throw v0

    .line 212
    :cond_d
    new-instance p0, Lorg/spongycastle/asn1/DEROctetStringParser;

    .line 213
    .line 214
    invoke-direct {p0, v4}, Lorg/spongycastle/asn1/DEROctetStringParser;-><init>(Lorg/spongycastle/asn1/DefiniteLengthInputStream;)V

    .line 215
    .line 216
    .line 217
    return-object p0
.end method

.method public readTaggedObject(ZI)Lorg/spongycastle/asn1/ASN1Primitive;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 5
    .line 6
    check-cast p0, Lorg/spongycastle/asn1/DefiniteLengthInputStream;

    .line 7
    .line 8
    new-instance p1, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 9
    .line 10
    new-instance v1, Lorg/spongycastle/asn1/DEROctetString;

    .line 11
    .line 12
    invoke-virtual {p0}, Lorg/spongycastle/asn1/DefiniteLengthInputStream;->toByteArray()[B

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-direct {v1, p0}, Lorg/spongycastle/asn1/DEROctetString;-><init>([B)V

    .line 17
    .line 18
    .line 19
    invoke-direct {p1, v0, p2, v1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 20
    .line 21
    .line 22
    return-object p1

    .line 23
    :cond_0
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1StreamParser;->readVector()Lorg/spongycastle/asn1/ASN1EncodableVector;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object p0, p0, Lorg/spongycastle/asn1/ASN1StreamParser;->_in:Ljava/io/InputStream;

    .line 28
    .line 29
    instance-of p0, p0, Lorg/spongycastle/asn1/IndefiniteLengthInputStream;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-ne p0, v1, :cond_1

    .line 39
    .line 40
    new-instance p0, Lorg/spongycastle/asn1/BERTaggedObject;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-direct {p0, v1, p2, p1}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 47
    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_1
    new-instance p0, Lorg/spongycastle/asn1/BERTaggedObject;

    .line 51
    .line 52
    invoke-static {p1}, Lorg/spongycastle/asn1/BERFactory;->createSequence(Lorg/spongycastle/asn1/ASN1EncodableVector;)Lorg/spongycastle/asn1/BERSequence;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-direct {p0, v0, p2, p1}, Lorg/spongycastle/asn1/BERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 57
    .line 58
    .line 59
    return-object p0

    .line 60
    :cond_2
    invoke-virtual {p1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->size()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-ne p0, v1, :cond_3

    .line 65
    .line 66
    new-instance p0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 67
    .line 68
    invoke-virtual {p1, v0}, Lorg/spongycastle/asn1/ASN1EncodableVector;->get(I)Lorg/spongycastle/asn1/ASN1Encodable;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-direct {p0, v1, p2, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 73
    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_3
    new-instance p0, Lorg/spongycastle/asn1/DERTaggedObject;

    .line 77
    .line 78
    invoke-static {p1}, Lorg/spongycastle/asn1/DERFactory;->createSequence(Lorg/spongycastle/asn1/ASN1EncodableVector;)Lorg/spongycastle/asn1/ASN1Sequence;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-direct {p0, v0, p2, p1}, Lorg/spongycastle/asn1/DERTaggedObject;-><init>(ZILorg/spongycastle/asn1/ASN1Encodable;)V

    .line 83
    .line 84
    .line 85
    return-object p0
.end method

.method public readVector()Lorg/spongycastle/asn1/ASN1EncodableVector;
    .locals 3
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
    invoke-virtual {p0}, Lorg/spongycastle/asn1/ASN1StreamParser;->readObject()Lorg/spongycastle/asn1/ASN1Encodable;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    instance-of v2, v1, Lorg/spongycastle/asn1/InMemoryRepresentable;

    .line 13
    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    check-cast v1, Lorg/spongycastle/asn1/InMemoryRepresentable;

    .line 17
    .line 18
    invoke-interface {v1}, Lorg/spongycastle/asn1/InMemoryRepresentable;->getLoadedObject()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-interface {v1}, Lorg/spongycastle/asn1/ASN1Encodable;->toASN1Primitive()Lorg/spongycastle/asn1/ASN1Primitive;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v0, v1}, Lorg/spongycastle/asn1/ASN1EncodableVector;->add(Lorg/spongycastle/asn1/ASN1Encodable;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-object v0
.end method
