.class public Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;
.super Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;
.source "SourceFile"


# instance fields
.field private algId:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

.field private bitlen:I

.field private erdData:[B

.field private flags:I

.field private format:I

.field private hashAlg:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

.field private hashSize:I

.field private ivData:[B

.field private keyBlob:[B

.field private rcount:J

.field private recipientKeyHash:[B

.field private vCRC32:[B

.field private vData:[B


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/16 v1, 0x17

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private assertDynamicLengthFits(Ljava/lang/String;III)V
    .locals 2

    .line 1
    add-int p0, p3, p2

    .line 2
    .line 3
    if-gt p0, p4, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p0, Ljava/util/zip/ZipException;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "Invalid X0017_StrongEncryptionHeader: "

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string p1, " "

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p1, " doesn\'t fit into "

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p1, " bytes of data at position "

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw p0
.end method


# virtual methods
.method public getEncryptionAlgorithm()Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->algId:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHashAlgorithm()Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashAlg:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecordCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->rcount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public parseCentralDirectoryFormat([BII)V
    .locals 4

    .line 1
    const/16 v0, 0xc

    .line 2
    .line 3
    invoke-virtual {p0, v0, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->assertMinimalLength(II)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->format:I

    .line 11
    .line 12
    add-int/lit8 v0, p2, 0x2

    .line 13
    .line 14
    invoke-static {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->getAlgorithmByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->algId:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 23
    .line 24
    add-int/lit8 v0, p2, 0x4

    .line 25
    .line 26
    invoke-static {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->bitlen:I

    .line 31
    .line 32
    add-int/lit8 v0, p2, 0x6

    .line 33
    .line 34
    invoke-static {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->flags:I

    .line 39
    .line 40
    add-int/lit8 v0, p2, 0x8

    .line 41
    .line 42
    invoke-static {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 43
    .line 44
    .line 45
    move-result-wide v0

    .line 46
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->rcount:J

    .line 47
    .line 48
    const-wide/16 v2, 0x0

    .line 49
    .line 50
    cmp-long v0, v0, v2

    .line 51
    .line 52
    if-lez v0, :cond_1

    .line 53
    .line 54
    const/16 v0, 0x10

    .line 55
    .line 56
    invoke-virtual {p0, v0, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->assertMinimalLength(II)V

    .line 57
    .line 58
    .line 59
    add-int/lit8 p3, p2, 0xc

    .line 60
    .line 61
    invoke-static {p1, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    invoke-static {p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->getAlgorithmByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashAlg:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 70
    .line 71
    add-int/lit8 p2, p2, 0xe

    .line 72
    .line 73
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    iput p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashSize:I

    .line 78
    .line 79
    :goto_0
    iget-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->rcount:J

    .line 80
    .line 81
    cmp-long p1, v2, p1

    .line 82
    .line 83
    if-gez p1, :cond_1

    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    :goto_1
    iget p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashSize:I

    .line 87
    .line 88
    if-ge p1, p2, :cond_0

    .line 89
    .line 90
    add-int/lit8 p1, p1, 0x1

    .line 91
    .line 92
    goto :goto_1

    .line 93
    :cond_0
    const-wide/16 p1, 0x1

    .line 94
    .line 95
    add-long/2addr v2, p1

    .line 96
    goto :goto_0

    .line 97
    :cond_1
    return-void
.end method

.method public parseFileFormat([BII)V
    .locals 12

    .line 1
    const/4 v0, 0x4

    .line 2
    invoke-virtual {p0, v0, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->assertMinimalLength(II)V

    .line 3
    .line 4
    .line 5
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, "ivSize"

    .line 10
    .line 11
    invoke-direct {p0, v2, v1, v0, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->assertDynamicLengthFits(Ljava/lang/String;III)V

    .line 12
    .line 13
    .line 14
    add-int/lit8 v2, p2, 0x4

    .line 15
    .line 16
    invoke-static {p1, v2, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->ivData:[B

    .line 21
    .line 22
    add-int/lit8 v2, v1, 0x10

    .line 23
    .line 24
    invoke-virtual {p0, v2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->assertMinimalLength(II)V

    .line 25
    .line 26
    .line 27
    add-int/2addr p2, v1

    .line 28
    add-int/lit8 v3, p2, 0x6

    .line 29
    .line 30
    invoke-static {p1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iput v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->format:I

    .line 35
    .line 36
    add-int/lit8 v3, p2, 0x8

    .line 37
    .line 38
    invoke-static {p1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;->getAlgorithmByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->algId:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$EncryptionAlgorithm;

    .line 47
    .line 48
    add-int/lit8 v3, p2, 0xa

    .line 49
    .line 50
    invoke-static {p1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    iput v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->bitlen:I

    .line 55
    .line 56
    add-int/lit8 v3, p2, 0xc

    .line 57
    .line 58
    invoke-static {p1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    iput v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->flags:I

    .line 63
    .line 64
    add-int/lit8 v3, p2, 0xe

    .line 65
    .line 66
    invoke-static {p1, v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    const-string v4, "erdSize"

    .line 71
    .line 72
    invoke-direct {p0, v4, v3, v2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->assertDynamicLengthFits(Ljava/lang/String;III)V

    .line 73
    .line 74
    .line 75
    add-int/lit8 v2, p2, 0x10

    .line 76
    .line 77
    invoke-static {p1, v2, v3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    iput-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->erdData:[B

    .line 82
    .line 83
    add-int/lit8 v4, v1, 0x14

    .line 84
    .line 85
    add-int/2addr v4, v3

    .line 86
    invoke-virtual {p0, v4, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->assertMinimalLength(II)V

    .line 87
    .line 88
    .line 89
    add-int/2addr v2, v3

    .line 90
    invoke-static {p1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 91
    .line 92
    .line 93
    move-result-wide v5

    .line 94
    iput-wide v5, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->rcount:J

    .line 95
    .line 96
    const-wide/16 v7, 0x0

    .line 97
    .line 98
    cmp-long v2, v5, v7

    .line 99
    .line 100
    const-string v5, " is too small to hold CRC"

    .line 101
    .line 102
    const-string v6, "Invalid X0017_StrongEncryptionHeader: vSize "

    .line 103
    .line 104
    const-string v7, "vSize"

    .line 105
    .line 106
    if-nez v2, :cond_1

    .line 107
    .line 108
    add-int/lit8 v4, v4, 0x2

    .line 109
    .line 110
    invoke-virtual {p0, v4, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->assertMinimalLength(II)V

    .line 111
    .line 112
    .line 113
    add-int/lit8 v2, p2, 0x14

    .line 114
    .line 115
    add-int/2addr v2, v3

    .line 116
    invoke-static {p1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 117
    .line 118
    .line 119
    move-result v2

    .line 120
    add-int/lit8 v1, v1, 0x16

    .line 121
    .line 122
    add-int/2addr v1, v3

    .line 123
    invoke-direct {p0, v7, v2, v1, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->assertDynamicLengthFits(Ljava/lang/String;III)V

    .line 124
    .line 125
    .line 126
    if-lt v2, v0, :cond_0

    .line 127
    .line 128
    add-int/lit8 p2, p2, 0x16

    .line 129
    .line 130
    add-int/2addr p2, v3

    .line 131
    add-int/lit8 p3, v2, -0x4

    .line 132
    .line 133
    invoke-static {p1, p2, p3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 134
    .line 135
    .line 136
    move-result-object p3

    .line 137
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->vData:[B

    .line 138
    .line 139
    add-int/2addr p2, v2

    .line 140
    sub-int/2addr p2, v0

    .line 141
    invoke-static {p1, p2, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->vCRC32:[B

    .line 146
    .line 147
    return-void

    .line 148
    :cond_0
    invoke-static {v6, v2, v5}, Ll/p11;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_1
    add-int/lit8 v4, v4, 0x6

    .line 153
    .line 154
    invoke-virtual {p0, v4, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->assertMinimalLength(II)V

    .line 155
    .line 156
    .line 157
    add-int/lit8 v2, p2, 0x14

    .line 158
    .line 159
    add-int/2addr v2, v3

    .line 160
    invoke-static {p1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 161
    .line 162
    .line 163
    move-result v2

    .line 164
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;->getAlgorithmByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    iput-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashAlg:Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader$HashAlgorithm;

    .line 169
    .line 170
    add-int/lit8 v2, p2, 0x16

    .line 171
    .line 172
    add-int/2addr v2, v3

    .line 173
    invoke-static {p1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 174
    .line 175
    .line 176
    move-result v4

    .line 177
    iput v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashSize:I

    .line 178
    .line 179
    add-int/lit8 v4, p2, 0x18

    .line 180
    .line 181
    add-int/2addr v4, v3

    .line 182
    invoke-static {p1, v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    iget v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashSize:I

    .line 187
    .line 188
    new-array v10, v9, [B

    .line 189
    .line 190
    iput-object v10, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->recipientKeyHash:[B

    .line 191
    .line 192
    if-lt v8, v9, :cond_3

    .line 193
    .line 194
    sub-int v9, v8, v9

    .line 195
    .line 196
    new-array v9, v9, [B

    .line 197
    .line 198
    iput-object v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->keyBlob:[B

    .line 199
    .line 200
    add-int/lit8 v9, v1, 0x18

    .line 201
    .line 202
    add-int/2addr v9, v3

    .line 203
    const-string v10, "resize"

    .line 204
    .line 205
    invoke-direct {p0, v10, v8, v9, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->assertDynamicLengthFits(Ljava/lang/String;III)V

    .line 206
    .line 207
    .line 208
    iget-object v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->recipientKeyHash:[B

    .line 209
    .line 210
    iget v10, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashSize:I

    .line 211
    .line 212
    const/4 v11, 0x0

    .line 213
    invoke-static {p1, v4, v9, v11, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 214
    .line 215
    .line 216
    iget v9, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashSize:I

    .line 217
    .line 218
    add-int/2addr v4, v9

    .line 219
    iget-object v10, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->keyBlob:[B

    .line 220
    .line 221
    sub-int v9, v8, v9

    .line 222
    .line 223
    invoke-static {p1, v4, v10, v11, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 224
    .line 225
    .line 226
    add-int/lit8 v4, v1, 0x1a

    .line 227
    .line 228
    add-int/2addr v4, v3

    .line 229
    add-int/2addr v4, v8

    .line 230
    add-int/lit8 v4, v4, 0x2

    .line 231
    .line 232
    invoke-virtual {p0, v4, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->assertMinimalLength(II)V

    .line 233
    .line 234
    .line 235
    add-int/lit8 p2, p2, 0x1a

    .line 236
    .line 237
    add-int/2addr p2, v3

    .line 238
    add-int/2addr p2, v8

    .line 239
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue([BI)I

    .line 240
    .line 241
    .line 242
    move-result p2

    .line 243
    if-lt p2, v0, :cond_2

    .line 244
    .line 245
    add-int/lit8 v1, v1, 0x16

    .line 246
    .line 247
    add-int/2addr v1, v3

    .line 248
    add-int/2addr v1, v8

    .line 249
    invoke-direct {p0, v7, p2, v1, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->assertDynamicLengthFits(Ljava/lang/String;III)V

    .line 250
    .line 251
    .line 252
    add-int/lit8 p3, p2, -0x4

    .line 253
    .line 254
    new-array v1, p3, [B

    .line 255
    .line 256
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->vData:[B

    .line 257
    .line 258
    new-array v3, v0, [B

    .line 259
    .line 260
    iput-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->vCRC32:[B

    .line 261
    .line 262
    add-int/2addr v2, v8

    .line 263
    invoke-static {p1, v2, v1, v11, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 264
    .line 265
    .line 266
    add-int/2addr v2, p2

    .line 267
    sub-int/2addr v2, v0

    .line 268
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->vCRC32:[B

    .line 269
    .line 270
    invoke-static {p1, v2, p0, v11, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    :cond_2
    invoke-static {v6, p2, v5}, Ll/p11;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 275
    .line 276
    .line 277
    return-void

    .line 278
    :cond_3
    new-instance p1, Ljava/util/zip/ZipException;

    .line 279
    .line 280
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->hashSize:I

    .line 281
    .line 282
    new-instance p2, Ljava/lang/StringBuilder;

    .line 283
    .line 284
    const-string p3, "Invalid X0017_StrongEncryptionHeader: resize "

    .line 285
    .line 286
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 287
    .line 288
    .line 289
    invoke-virtual {p2, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 290
    .line 291
    .line 292
    const-string p3, " is too small to hold hashSize"

    .line 293
    .line 294
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object p0

    .line 304
    invoke-direct {p1, p0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    throw p1
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->parseFromCentralDirectoryData([BII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->parseCentralDirectoryFormat([BII)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/PKWareExtraHeader;->parseFromLocalFileData([BII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X0017_StrongEncryptionHeader;->parseFileFormat([BII)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
