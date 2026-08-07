.class public Lorg/spongycastle/crypto/tls/TlsBlockCipher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/spongycastle/crypto/tls/TlsCipher;


# instance fields
.field protected context:Lorg/spongycastle/crypto/tls/TlsContext;

.field protected decryptCipher:Lorg/spongycastle/crypto/BlockCipher;

.field protected encryptCipher:Lorg/spongycastle/crypto/BlockCipher;

.field protected encryptThenMAC:Z

.field protected randomData:[B

.field protected readMac:Lorg/spongycastle/crypto/tls/TlsMac;

.field protected useExplicitIV:Z

.field protected writeMac:Lorg/spongycastle/crypto/tls/TlsMac;


# direct methods
.method public constructor <init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/BlockCipher;Lorg/spongycastle/crypto/Digest;Lorg/spongycastle/crypto/Digest;I)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 5
    .line 6
    const/16 v0, 0x100

    .line 7
    .line 8
    new-array v0, v0, [B

    .line 9
    .line 10
    iput-object v0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->randomData:[B

    .line 11
    .line 12
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->getNonceRandomGenerator()Lorg/spongycastle/crypto/prng/RandomGenerator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->randomData:[B

    .line 17
    .line 18
    invoke-interface {v0, v1}, Lorg/spongycastle/crypto/prng/RandomGenerator;->nextBytes([B)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Lorg/spongycastle/crypto/tls/TlsUtils;->isTLSv11(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->useExplicitIV:Z

    .line 26
    .line 27
    invoke-interface {p1}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecurityParameters()Lorg/spongycastle/crypto/tls/SecurityParameters;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-boolean v0, v0, Lorg/spongycastle/crypto/tls/SecurityParameters;->encryptThenMAC:Z

    .line 32
    .line 33
    iput-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 34
    .line 35
    mul-int/lit8 v0, p6, 0x2

    .line 36
    .line 37
    invoke-interface {p4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    add-int/2addr v0, v1

    .line 42
    invoke-interface {p5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    add-int/2addr v0, v1

    .line 47
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->useExplicitIV:Z

    .line 48
    .line 49
    if-nez v1, :cond_0

    .line 50
    .line 51
    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    invoke-interface {p3}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    add-int/2addr v1, v2

    .line 60
    add-int/2addr v0, v1

    .line 61
    :cond_0
    invoke-static {p1, v0}, Lorg/spongycastle/crypto/tls/TlsUtils;->calculateKeyBlock(Lorg/spongycastle/crypto/tls/TlsContext;I)[B

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsMac;

    .line 66
    .line 67
    invoke-interface {p4}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    const/4 v5, 0x0

    .line 72
    move-object v2, p1

    .line 73
    move-object v3, p4

    .line 74
    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/crypto/tls/TlsMac;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V

    .line 75
    .line 76
    .line 77
    move-object p1, v1

    .line 78
    invoke-interface {v3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 79
    .line 80
    .line 81
    move-result v5

    .line 82
    new-instance v1, Lorg/spongycastle/crypto/tls/TlsMac;

    .line 83
    .line 84
    invoke-interface {p5}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    move-object v3, p5

    .line 89
    invoke-direct/range {v1 .. v6}, Lorg/spongycastle/crypto/tls/TlsMac;-><init>(Lorg/spongycastle/crypto/tls/TlsContext;Lorg/spongycastle/crypto/Digest;[BII)V

    .line 90
    .line 91
    .line 92
    invoke-interface {v3}, Lorg/spongycastle/crypto/Digest;->getDigestSize()I

    .line 93
    .line 94
    .line 95
    move-result p4

    .line 96
    add-int/2addr v5, p4

    .line 97
    new-instance p4, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 98
    .line 99
    invoke-direct {p4, v4, v5, p6}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 100
    .line 101
    .line 102
    add-int/2addr v5, p6

    .line 103
    new-instance p5, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 104
    .line 105
    invoke-direct {p5, v4, v5, p6}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([BII)V

    .line 106
    .line 107
    .line 108
    add-int/2addr v5, p6

    .line 109
    iget-boolean p6, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->useExplicitIV:Z

    .line 110
    .line 111
    if-eqz p6, :cond_1

    .line 112
    .line 113
    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 114
    .line 115
    .line 116
    move-result p6

    .line 117
    new-array p6, p6, [B

    .line 118
    .line 119
    invoke-interface {p3}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    new-array v3, v3, [B

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_1
    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 127
    .line 128
    .line 129
    move-result p6

    .line 130
    add-int/2addr p6, v5

    .line 131
    invoke-static {v4, v5, p6}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 132
    .line 133
    .line 134
    move-result-object p6

    .line 135
    invoke-interface {p2}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    add-int/2addr v5, v3

    .line 140
    invoke-interface {p3}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    add-int/2addr v3, v5

    .line 145
    invoke-static {v4, v5, v3}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-interface {p3}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    add-int/2addr v5, v4

    .line 154
    :goto_0
    if-ne v5, v0, :cond_3

    .line 155
    .line 156
    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsContext;->isServer()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-eqz v0, :cond_2

    .line 161
    .line 162
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 163
    .line 164
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 165
    .line 166
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 167
    .line 168
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->decryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 169
    .line 170
    new-instance p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 171
    .line 172
    invoke-direct {p1, p5, v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 173
    .line 174
    .line 175
    new-instance p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 176
    .line 177
    invoke-direct {p2, p4, p6}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_2
    iput-object p1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 182
    .line 183
    iput-object v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 184
    .line 185
    iput-object p2, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 186
    .line 187
    iput-object p3, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->decryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 188
    .line 189
    new-instance p1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 190
    .line 191
    invoke-direct {p1, p4, p6}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 192
    .line 193
    .line 194
    new-instance p2, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 195
    .line 196
    invoke-direct {p2, p5, v3}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 197
    .line 198
    .line 199
    :goto_1
    iget-object p3, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 200
    .line 201
    const/4 p4, 0x1

    .line 202
    invoke-interface {p3, p4, p1}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 203
    .line 204
    .line 205
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->decryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 206
    .line 207
    const/4 p1, 0x0

    .line 208
    invoke-interface {p0, p1, p2}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 209
    .line 210
    .line 211
    return-void

    .line 212
    :cond_3
    const/16 p0, 0x50

    .line 213
    .line 214
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 215
    .line 216
    .line 217
    const/4 p0, 0x0

    .line 218
    throw p0
.end method


# virtual methods
.method public checkPaddingConstantTime([BIIII)I
    .locals 4

    .line 1
    add-int/2addr p2, p3

    .line 2
    add-int/lit8 v0, p2, -0x1

    .line 3
    .line 4
    aget-byte v0, p1, v0

    .line 5
    .line 6
    and-int/lit16 v1, v0, 0xff

    .line 7
    .line 8
    add-int/lit8 v1, v1, 0x1

    .line 9
    .line 10
    iget-object v2, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 11
    .line 12
    invoke-static {v2}, Lorg/spongycastle/crypto/tls/TlsUtils;->isSSL(Lorg/spongycastle/crypto/tls/TlsContext;)Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v2, :cond_0

    .line 18
    .line 19
    if-gt v1, p4, :cond_1

    .line 20
    .line 21
    :cond_0
    add-int/2addr p5, v1

    .line 22
    if-le p5, p3, :cond_2

    .line 23
    .line 24
    :cond_1
    move p1, v3

    .line 25
    move p4, p1

    .line 26
    move v1, p4

    .line 27
    goto :goto_1

    .line 28
    :cond_2
    sub-int p3, p2, v1

    .line 29
    .line 30
    move p4, v3

    .line 31
    :goto_0
    add-int/lit8 p5, p3, 0x1

    .line 32
    .line 33
    aget-byte p3, p1, p3

    .line 34
    .line 35
    xor-int/2addr p3, v0

    .line 36
    or-int/2addr p3, p4

    .line 37
    int-to-byte p4, p3

    .line 38
    if-lt p5, p2, :cond_5

    .line 39
    .line 40
    move p1, v1

    .line 41
    if-eqz p4, :cond_3

    .line 42
    .line 43
    move v1, v3

    .line 44
    :cond_3
    :goto_1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->randomData:[B

    .line 45
    .line 46
    :goto_2
    const/16 p2, 0x100

    .line 47
    .line 48
    if-ge p1, p2, :cond_4

    .line 49
    .line 50
    add-int/lit8 p2, p1, 0x1

    .line 51
    .line 52
    aget-byte p1, p0, p1

    .line 53
    .line 54
    xor-int/2addr p1, v0

    .line 55
    or-int/2addr p1, p4

    .line 56
    int-to-byte p4, p1

    .line 57
    move p1, p2

    .line 58
    goto :goto_2

    .line 59
    :cond_4
    aget-byte p1, p0, v3

    .line 60
    .line 61
    xor-int/2addr p1, p4

    .line 62
    int-to-byte p1, p1

    .line 63
    aput-byte p1, p0, v3

    .line 64
    .line 65
    return v1

    .line 66
    :cond_5
    move p3, p5

    .line 67
    goto :goto_0
.end method

.method public chooseExtraPadBlocks(Ljava/security/SecureRandom;I)I
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/util/Random;->nextInt()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->lowestBitSet(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public decodeCiphertext(JS[BII)[B
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v4, p4

    .line 2
    .line 3
    move/from16 v0, p6

    .line 4
    .line 5
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->decryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 6
    .line 7
    invoke-interface {v1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 8
    .line 9
    .line 10
    move-result v7

    .line 11
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 12
    .line 13
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    .line 14
    .line 15
    .line 16
    move-result v8

    .line 17
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    add-int v1, v7, v8

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    add-int/lit8 v1, v8, 0x1

    .line 25
    .line 26
    invoke-static {v7, v1}, Ljava/lang/Math;->max(II)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    :goto_0
    iget-boolean v2, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->useExplicitIV:Z

    .line 31
    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    add-int/2addr v1, v7

    .line 35
    :cond_1
    if-lt v0, v1, :cond_c

    .line 36
    .line 37
    iget-boolean v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 38
    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    sub-int v2, v0, v8

    .line 42
    .line 43
    move v9, v2

    .line 44
    goto :goto_1

    .line 45
    :cond_2
    move v9, v0

    .line 46
    :goto_1
    rem-int v2, v9, v7

    .line 47
    .line 48
    if-nez v2, :cond_b

    .line 49
    .line 50
    const/16 v10, 0x14

    .line 51
    .line 52
    if-eqz v1, :cond_4

    .line 53
    .line 54
    add-int v1, p5, v0

    .line 55
    .line 56
    sub-int v2, v1, v8

    .line 57
    .line 58
    invoke-static {v4, v2, v1}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 59
    .line 60
    .line 61
    move-result-object v11

    .line 62
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 63
    .line 64
    sub-int v6, p6, v8

    .line 65
    .line 66
    move-wide v1, p1

    .line 67
    move/from16 v3, p3

    .line 68
    .line 69
    move/from16 v5, p5

    .line 70
    .line 71
    invoke-virtual/range {v0 .. v6}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-static {v0, v11}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_3
    invoke-static {v10}, Ll/f1j0;->a(I)V

    .line 83
    .line 84
    .line 85
    const/4 p0, 0x0

    .line 86
    return-object p0

    .line 87
    :cond_4
    move/from16 v5, p5

    .line 88
    .line 89
    :goto_2
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->useExplicitIV:Z

    .line 90
    .line 91
    const/4 v6, 0x0

    .line 92
    if-eqz v0, :cond_5

    .line 93
    .line 94
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->decryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 95
    .line 96
    new-instance v1, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 97
    .line 98
    const/4 v2, 0x0

    .line 99
    invoke-direct {v1, v2, v4, v5, v7}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[BII)V

    .line 100
    .line 101
    .line 102
    invoke-interface {v0, v6, v1}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 103
    .line 104
    .line 105
    add-int v0, v5, v7

    .line 106
    .line 107
    sub-int/2addr v9, v7

    .line 108
    move v2, v0

    .line 109
    :goto_3
    move v3, v9

    .line 110
    goto :goto_4

    .line 111
    :cond_5
    move v2, v5

    .line 112
    goto :goto_3

    .line 113
    :goto_4
    move v0, v6

    .line 114
    :goto_5
    if-ge v0, v3, :cond_6

    .line 115
    .line 116
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->decryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 117
    .line 118
    add-int v5, v2, v0

    .line 119
    .line 120
    invoke-interface {v1, v4, v5, v4, v5}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 121
    .line 122
    .line 123
    add-int/2addr v0, v7

    .line 124
    goto :goto_5

    .line 125
    :cond_6
    iget-boolean v0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 126
    .line 127
    if-eqz v0, :cond_7

    .line 128
    .line 129
    move v5, v6

    .line 130
    :goto_6
    move-object v0, p0

    .line 131
    move-object v1, v4

    .line 132
    move v4, v7

    .line 133
    goto :goto_7

    .line 134
    :cond_7
    move v5, v8

    .line 135
    goto :goto_6

    .line 136
    :goto_7
    invoke-virtual/range {v0 .. v5}, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->checkPaddingConstantTime([BIIII)I

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    const/4 v9, 0x1

    .line 141
    if-nez v4, :cond_8

    .line 142
    .line 143
    move v11, v9

    .line 144
    goto :goto_8

    .line 145
    :cond_8
    move v11, v6

    .line 146
    :goto_8
    sub-int v4, v3, v4

    .line 147
    .line 148
    iget-boolean v5, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 149
    .line 150
    if-nez v5, :cond_9

    .line 151
    .line 152
    sub-int v6, v4, v8

    .line 153
    .line 154
    add-int v4, v2, v6

    .line 155
    .line 156
    add-int v5, v4, v8

    .line 157
    .line 158
    invoke-static {v1, v4, v5}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 159
    .line 160
    .line 161
    move-result-object v12

    .line 162
    iget-object v4, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 163
    .line 164
    sub-int v7, v3, v8

    .line 165
    .line 166
    iget-object v8, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->randomData:[B

    .line 167
    .line 168
    move/from16 v3, p3

    .line 169
    .line 170
    move v5, v2

    .line 171
    move-object v0, v4

    .line 172
    move-object v4, v1

    .line 173
    move-wide v1, p1

    .line 174
    invoke-virtual/range {v0 .. v8}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMacConstantTime(JS[BIII[B)[B

    .line 175
    .line 176
    .line 177
    move-result-object p0

    .line 178
    move-object v1, v4

    .line 179
    move v2, v5

    .line 180
    invoke-static {p0, v12}, Lorg/spongycastle/util/Arrays;->constantTimeAreEqual([B[B)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    xor-int/2addr p0, v9

    .line 185
    or-int/2addr v11, p0

    .line 186
    move v4, v6

    .line 187
    :cond_9
    if-nez v11, :cond_a

    .line 188
    .line 189
    add-int p0, v2, v4

    .line 190
    .line 191
    invoke-static {v1, v2, p0}, Lorg/spongycastle/util/Arrays;->copyOfRange([BII)[B

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    return-object p0

    .line 196
    :cond_a
    invoke-static {v10}, Ll/f1j0;->a(I)V

    .line 197
    .line 198
    .line 199
    const/4 p0, 0x0

    .line 200
    return-object p0

    .line 201
    :cond_b
    const/16 p0, 0x15

    .line 202
    .line 203
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 204
    .line 205
    .line 206
    const/4 p0, 0x0

    .line 207
    return-object p0

    .line 208
    :cond_c
    const/16 p0, 0x32

    .line 209
    .line 210
    invoke-static {p0}, Ll/f1j0;->a(I)V

    .line 211
    .line 212
    .line 213
    const/4 p0, 0x0

    .line 214
    return-object p0
.end method

.method public encodePlaintext(JS[BII)[B
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v7, p6

    .line 4
    .line 5
    iget-object v1, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 6
    .line 7
    invoke-interface {v1}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 8
    .line 9
    .line 10
    move-result v8

    .line 11
    iget-object v1, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 12
    .line 13
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 18
    .line 19
    invoke-interface {v2}, Lorg/spongycastle/crypto/tls/TlsContext;->getServerVersion()Lorg/spongycastle/crypto/tls/ProtocolVersion;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    iget-boolean v3, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 24
    .line 25
    if-nez v3, :cond_0

    .line 26
    .line 27
    add-int v3, v7, v1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v3, v7

    .line 31
    :goto_0
    add-int/lit8 v4, v8, -0x1

    .line 32
    .line 33
    rem-int/2addr v3, v8

    .line 34
    sub-int/2addr v4, v3

    .line 35
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isDTLS()Z

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    invoke-virtual {v2}, Lorg/spongycastle/crypto/tls/ProtocolVersion;->isSSL()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-nez v2, :cond_1

    .line 46
    .line 47
    rsub-int v2, v4, 0xff

    .line 48
    .line 49
    div-int/2addr v2, v8

    .line 50
    iget-object v3, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 51
    .line 52
    invoke-interface {v3}, Lorg/spongycastle/crypto/tls/TlsContext;->getSecureRandom()Ljava/security/SecureRandom;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v0, v3, v2}, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->chooseExtraPadBlocks(Ljava/security/SecureRandom;I)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    mul-int/2addr v2, v8

    .line 61
    add-int/2addr v4, v2

    .line 62
    :cond_1
    move v9, v4

    .line 63
    add-int/2addr v1, v7

    .line 64
    add-int/2addr v1, v9

    .line 65
    const/4 v2, 0x1

    .line 66
    add-int/2addr v1, v2

    .line 67
    iget-boolean v3, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->useExplicitIV:Z

    .line 68
    .line 69
    if-eqz v3, :cond_2

    .line 70
    .line 71
    add-int/2addr v1, v8

    .line 72
    :cond_2
    new-array v14, v1, [B

    .line 73
    .line 74
    const/4 v10, 0x0

    .line 75
    if-eqz v3, :cond_3

    .line 76
    .line 77
    new-array v1, v8, [B

    .line 78
    .line 79
    iget-object v3, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->context:Lorg/spongycastle/crypto/tls/TlsContext;

    .line 80
    .line 81
    invoke-interface {v3}, Lorg/spongycastle/crypto/tls/TlsContext;->getNonceRandomGenerator()Lorg/spongycastle/crypto/prng/RandomGenerator;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-interface {v3, v1}, Lorg/spongycastle/crypto/prng/RandomGenerator;->nextBytes([B)V

    .line 86
    .line 87
    .line 88
    iget-object v3, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 89
    .line 90
    new-instance v4, Lorg/spongycastle/crypto/params/ParametersWithIV;

    .line 91
    .line 92
    const/4 v5, 0x0

    .line 93
    invoke-direct {v4, v5, v1}, Lorg/spongycastle/crypto/params/ParametersWithIV;-><init>(Lorg/spongycastle/crypto/CipherParameters;[B)V

    .line 94
    .line 95
    .line 96
    invoke-interface {v3, v2, v4}, Lorg/spongycastle/crypto/BlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v1, v10, v14, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 100
    .line 101
    .line 102
    move v11, v8

    .line 103
    :goto_1
    move-object/from16 v5, p4

    .line 104
    .line 105
    move/from16 v6, p5

    .line 106
    .line 107
    goto :goto_2

    .line 108
    :cond_3
    move v11, v10

    .line 109
    goto :goto_1

    .line 110
    :goto_2
    invoke-static {v5, v6, v14, v11, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 111
    .line 112
    .line 113
    add-int v12, v11, v7

    .line 114
    .line 115
    iget-boolean v1, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 116
    .line 117
    if-nez v1, :cond_4

    .line 118
    .line 119
    iget-object v1, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 120
    .line 121
    move-wide/from16 v2, p1

    .line 122
    .line 123
    move/from16 v4, p3

    .line 124
    .line 125
    invoke-virtual/range {v1 .. v7}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    array-length v2, v1

    .line 130
    invoke-static {v1, v10, v14, v12, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 131
    .line 132
    .line 133
    array-length v1, v1

    .line 134
    add-int/2addr v12, v1

    .line 135
    :cond_4
    move v1, v10

    .line 136
    :goto_3
    if-gt v1, v9, :cond_5

    .line 137
    .line 138
    add-int/lit8 v2, v12, 0x1

    .line 139
    .line 140
    int-to-byte v3, v9

    .line 141
    aput-byte v3, v14, v12

    .line 142
    .line 143
    add-int/lit8 v1, v1, 0x1

    .line 144
    .line 145
    move v12, v2

    .line 146
    goto :goto_3

    .line 147
    :cond_5
    :goto_4
    if-ge v11, v12, :cond_6

    .line 148
    .line 149
    iget-object v1, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 150
    .line 151
    invoke-interface {v1, v14, v11, v14, v11}, Lorg/spongycastle/crypto/BlockCipher;->processBlock([BI[BI)I

    .line 152
    .line 153
    .line 154
    add-int/2addr v11, v8

    .line 155
    goto :goto_4

    .line 156
    :cond_6
    iget-boolean v1, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 157
    .line 158
    if-eqz v1, :cond_7

    .line 159
    .line 160
    iget-object v0, v0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 161
    .line 162
    const/4 v15, 0x0

    .line 163
    move v11, v10

    .line 164
    move-object v10, v0

    .line 165
    move v0, v11

    .line 166
    move/from16 v13, p3

    .line 167
    .line 168
    move/from16 v16, v12

    .line 169
    .line 170
    move-wide/from16 v11, p1

    .line 171
    .line 172
    invoke-virtual/range {v10 .. v16}, Lorg/spongycastle/crypto/tls/TlsMac;->calculateMac(JS[BII)[B

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    move/from16 v12, v16

    .line 177
    .line 178
    array-length v2, v1

    .line 179
    invoke-static {v1, v0, v14, v12, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 180
    .line 181
    .line 182
    :cond_7
    return-object v14
.end method

.method public getPlaintextLimit(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptCipher:Lorg/spongycastle/crypto/BlockCipher;

    .line 2
    .line 3
    invoke-interface {v0}, Lorg/spongycastle/crypto/BlockCipher;->getBlockSize()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 8
    .line 9
    invoke-virtual {v1}, Lorg/spongycastle/crypto/tls/TlsMac;->getSize()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-boolean v2, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->useExplicitIV:Z

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    sub-int/2addr p1, v0

    .line 18
    :cond_0
    iget-boolean p0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->encryptThenMAC:Z

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    sub-int/2addr p1, v1

    .line 23
    rem-int p0, p1, v0

    .line 24
    .line 25
    sub-int/2addr p1, p0

    .line 26
    goto :goto_0

    .line 27
    :cond_1
    rem-int p0, p1, v0

    .line 28
    .line 29
    sub-int/2addr p1, p0

    .line 30
    sub-int/2addr p1, v1

    .line 31
    :goto_0
    add-int/lit8 p1, p1, -0x1

    .line 32
    .line 33
    return p1
.end method

.method public getReadMac()Lorg/spongycastle/crypto/tls/TlsMac;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->readMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 2
    .line 3
    return-object p0
.end method

.method public getWriteMac()Lorg/spongycastle/crypto/tls/TlsMac;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/spongycastle/crypto/tls/TlsBlockCipher;->writeMac:Lorg/spongycastle/crypto/tls/TlsMac;

    .line 2
    .line 3
    return-object p0
.end method

.method public lowestBitSet(I)I
    .locals 1

    if-nez p1, :cond_0

    const/16 p0, 0x20

    return p0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    and-int/lit8 v0, p1, 0x1

    if-nez v0, :cond_1

    add-int/lit8 p0, p0, 0x1

    shr-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    return p0
.end method
