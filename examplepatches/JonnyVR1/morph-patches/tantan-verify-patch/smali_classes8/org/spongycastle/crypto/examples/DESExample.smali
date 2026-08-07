.class public Lorg/spongycastle/crypto/examples/DESExample;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

.field private encrypt:Z

.field private in:Ljava/io/BufferedInputStream;

.field private key:[B

.field private out:Ljava/io/BufferedOutputStream;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 251
    iput-boolean v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->encrypt:Z

    const/4 v0, 0x0

    .line 252
    iput-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 253
    iput-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->in:Ljava/io/BufferedInputStream;

    .line 254
    iput-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 255
    iput-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->key:[B

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 6

    .line 1
    const-string v0, "]"

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    iput-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 8
    .line 9
    iput-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->in:Ljava/io/BufferedInputStream;

    .line 10
    .line 11
    iput-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 12
    .line 13
    iput-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->key:[B

    .line 14
    .line 15
    iput-boolean p4, p0, Lorg/spongycastle/crypto/examples/DESExample;->encrypt:Z

    .line 16
    .line 17
    const/4 v2, 0x1

    .line 18
    :try_start_0
    new-instance v3, Ljava/io/BufferedInputStream;

    .line 19
    .line 20
    new-instance v4, Ljava/io/FileInputStream;

    .line 21
    .line 22
    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-direct {v3, v4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 26
    .line 27
    .line 28
    iput-object v3, p0, Lorg/spongycastle/crypto/examples/DESExample;->in:Ljava/io/BufferedInputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    sget-object v3, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 32
    .line 33
    new-instance v4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v5, "Input file not found ["

    .line 36
    .line 37
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v3, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 54
    .line 55
    .line 56
    :goto_0
    :try_start_1
    new-instance p1, Ljava/io/BufferedOutputStream;

    .line 57
    .line 58
    new-instance v3, Ljava/io/FileOutputStream;

    .line 59
    .line 60
    invoke-direct {v3, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    invoke-direct {p1, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :catch_1
    sget-object p1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 70
    .line 71
    new-instance v3, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v4, "Output file not created ["

    .line 74
    .line 75
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    invoke-virtual {p1, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 92
    .line 93
    .line 94
    :goto_1
    const/4 p1, 0x0

    .line 95
    if-eqz p4, :cond_0

    .line 96
    .line 97
    :try_start_2
    new-instance p2, Ljava/security/SecureRandom;

    .line 98
    .line 99
    invoke-direct {p2}, Ljava/security/SecureRandom;-><init>()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    .line 100
    .line 101
    .line 102
    :try_start_3
    const-string p4, "www.bouncycastle.org"

    .line 103
    .line 104
    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    .line 105
    .line 106
    .line 107
    move-result-object p4

    .line 108
    invoke-virtual {p2, p4}, Ljava/security/SecureRandom;->setSeed([B)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 109
    .line 110
    .line 111
    goto :goto_2

    .line 112
    :catch_2
    move-object v1, p2

    .line 113
    :catch_3
    :try_start_4
    sget-object p2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 114
    .line 115
    const-string p4, "Hmmm, no SHA1PRNG, you need the Sun implementation"

    .line 116
    .line 117
    invoke-virtual {p2, p4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 121
    .line 122
    .line 123
    move-object p2, v1

    .line 124
    :goto_2
    new-instance p4, Lorg/spongycastle/crypto/KeyGenerationParameters;

    .line 125
    .line 126
    const/16 v1, 0xc0

    .line 127
    .line 128
    invoke-direct {p4, p2, v1}, Lorg/spongycastle/crypto/KeyGenerationParameters;-><init>(Ljava/security/SecureRandom;I)V

    .line 129
    .line 130
    .line 131
    new-instance p2, Lorg/spongycastle/crypto/generators/DESedeKeyGenerator;

    .line 132
    .line 133
    invoke-direct {p2}, Lorg/spongycastle/crypto/generators/DESedeKeyGenerator;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p2, p4}, Lorg/spongycastle/crypto/generators/DESedeKeyGenerator;->init(Lorg/spongycastle/crypto/KeyGenerationParameters;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p2}, Lorg/spongycastle/crypto/generators/DESedeKeyGenerator;->generateKey()[B

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    iput-object p2, p0, Lorg/spongycastle/crypto/examples/DESExample;->key:[B

    .line 144
    .line 145
    new-instance p2, Ljava/io/BufferedOutputStream;

    .line 146
    .line 147
    new-instance p4, Ljava/io/FileOutputStream;

    .line 148
    .line 149
    invoke-direct {p4, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    invoke-direct {p2, p4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Lorg/spongycastle/crypto/examples/DESExample;->key:[B

    .line 156
    .line 157
    invoke-static {p0}, Lorg/spongycastle/util/encoders/Hex;->encode([B)[B

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    array-length p4, p0

    .line 162
    invoke-virtual {p2, p0, p1, p4}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {p2}, Ljava/io/BufferedOutputStream;->flush()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 169
    .line 170
    .line 171
    goto :goto_3

    .line 172
    :catch_4
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 173
    .line 174
    new-instance p1, Ljava/lang/StringBuilder;

    .line 175
    .line 176
    const-string p2, "Could not decryption create key file ["

    .line 177
    .line 178
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 195
    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_0
    :try_start_5
    new-instance p2, Ljava/io/BufferedInputStream;

    .line 199
    .line 200
    new-instance p4, Ljava/io/FileInputStream;

    .line 201
    .line 202
    invoke-direct {p4, p3}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-direct {p2, p4}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p2}, Ljava/io/BufferedInputStream;->available()I

    .line 209
    .line 210
    .line 211
    move-result p4

    .line 212
    new-array v1, p4, [B

    .line 213
    .line 214
    invoke-virtual {p2, v1, p1, p4}, Ljava/io/BufferedInputStream;->read([BII)I

    .line 215
    .line 216
    .line 217
    invoke-static {v1}, Lorg/spongycastle/util/encoders/Hex;->decode([B)[B

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    iput-object p1, p0, Lorg/spongycastle/crypto/examples/DESExample;->key:[B
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5

    .line 222
    .line 223
    goto :goto_3

    .line 224
    :catch_5
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 225
    .line 226
    new-instance p1, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    const-string p2, "Decryption key file not found, or not valid ["

    .line 229
    .line 230
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-virtual {p0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-static {v2}, Ljava/lang/System;->exit(I)V

    .line 247
    .line 248
    .line 249
    :goto_3
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 6

    .line 1
    array-length v0, p0

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x2

    .line 4
    if-ge v0, v2, :cond_0

    .line 5
    .line 6
    new-instance v0, Lorg/spongycastle/crypto/examples/DESExample;

    .line 7
    .line 8
    invoke-direct {v0}, Lorg/spongycastle/crypto/examples/DESExample;-><init>()V

    .line 9
    .line 10
    .line 11
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 12
    .line 13
    new-instance v3, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v4, "Usage: java "

    .line 16
    .line 17
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    const-class v4, Lorg/spongycastle/crypto/examples/DESExample;

    .line 21
    .line 22
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v4, " infile outfile [keyfile]"

    .line 30
    .line 31
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v0, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 42
    .line 43
    .line 44
    :cond_0
    const/4 v0, 0x0

    .line 45
    aget-object v3, p0, v0

    .line 46
    .line 47
    aget-object v4, p0, v1

    .line 48
    .line 49
    array-length v5, p0

    .line 50
    if-le v5, v2, :cond_1

    .line 51
    .line 52
    aget-object p0, p0, v2

    .line 53
    .line 54
    move v1, v0

    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const-string p0, "deskey.dat"

    .line 57
    .line 58
    :goto_0
    new-instance v0, Lorg/spongycastle/crypto/examples/DESExample;

    .line 59
    .line 60
    invoke-direct {v0, v3, v4, p0, v1}, Lorg/spongycastle/crypto/examples/DESExample;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 61
    .line 62
    .line 63
    invoke-direct {v0}, Lorg/spongycastle/crypto/examples/DESExample;->process()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method private performDecrypt([B)V
    .locals 9

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {v0, p1, v1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/io/BufferedReader;

    .line 13
    .line 14
    new-instance v1, Ljava/io/InputStreamReader;

    .line 15
    .line 16
    iget-object v2, p0, Lorg/spongycastle/crypto/examples/DESExample;->in:Ljava/io/BufferedInputStream;

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 22
    .line 23
    .line 24
    const/4 v1, 0x0

    .line 25
    :goto_0
    :try_start_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    invoke-static {v2}, Lorg/spongycastle/util/encoders/Hex;->decode(Ljava/lang/String;)[B

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    iget-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 36
    .line 37
    array-length v2, v4

    .line 38
    invoke-virtual {v1, v2}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->getOutputSize(I)I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    new-array v7, v1, [B

    .line 43
    .line 44
    iget-object v3, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 45
    .line 46
    array-length v6, v4

    .line 47
    const/4 v8, 0x0

    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-virtual/range {v3 .. v8}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->processBytes([BII[BI)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-lez v1, :cond_0

    .line 54
    .line 55
    iget-object v2, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 56
    .line 57
    invoke-virtual {v2, v7, p1, v1}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    :cond_0
    move-object v1, v7

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    :try_start_1
    iget-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 63
    .line 64
    invoke-virtual {v0, v1, p1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->doFinal([BI)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-lez v0, :cond_2

    .line 69
    .line 70
    iget-object p0, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 71
    .line 72
    invoke-virtual {p0, v1, p1, v0}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_1
    .catch Lorg/spongycastle/crypto/CryptoException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 73
    .line 74
    .line 75
    goto :goto_1

    .line 76
    :catch_0
    move-exception v0

    .line 77
    move-object p0, v0

    .line 78
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    :catch_1
    :cond_2
    :goto_1
    return-void
.end method

.method private performEncrypt([B)V
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/crypto/params/KeyParameter;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Lorg/spongycastle/crypto/params/KeyParameter;-><init>([B)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-virtual {v0, p1, v1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->init(ZLorg/spongycastle/crypto/CipherParameters;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 13
    .line 14
    const/16 v0, 0x2f

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->getOutputSize(I)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    new-array v2, v0, [B

    .line 21
    .line 22
    new-array v5, p1, [B

    .line 23
    .line 24
    :cond_0
    :goto_0
    :try_start_0
    iget-object p1, p0, Lorg/spongycastle/crypto/examples/DESExample;->in:Ljava/io/BufferedInputStream;

    .line 25
    .line 26
    const/4 v7, 0x0

    .line 27
    invoke-virtual {p1, v2, v7, v0}, Ljava/io/BufferedInputStream;->read([BII)I

    .line 28
    .line 29
    .line 30
    move-result v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    iget-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 32
    .line 33
    const/16 p1, 0xa

    .line 34
    .line 35
    if-lez v4, :cond_1

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    const/4 v6, 0x0

    .line 39
    :try_start_1
    invoke-virtual/range {v1 .. v6}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->processBytes([BII[BI)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-lez v1, :cond_0

    .line 44
    .line 45
    invoke-static {v5, v7, v1}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v3, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 50
    .line 51
    array-length v4, v1

    .line 52
    invoke-virtual {v3, v1, v7, v4}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 56
    .line 57
    invoke-virtual {v1, p1}, Ljava/io/BufferedOutputStream;->write(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    :try_start_2
    invoke-virtual {v1, v5, v7}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;->doFinal([BI)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-lez v0, :cond_2

    .line 66
    .line 67
    invoke-static {v5, v7, v0}, Lorg/spongycastle/util/encoders/Hex;->encode([BII)[B

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 72
    .line 73
    array-length v2, v0

    .line 74
    invoke-virtual {v1, v0, v7, v2}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/io/BufferedOutputStream;->write(I)V
    :try_end_2
    .catch Lorg/spongycastle/crypto/CryptoException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :catch_0
    move-exception v0

    .line 84
    move-object p0, v0

    .line 85
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 86
    .line 87
    .line 88
    :catch_1
    :cond_2
    :goto_1
    return-void
.end method

.method private process()V
    .locals 3

    .line 1
    new-instance v0, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 2
    .line 3
    new-instance v1, Lorg/spongycastle/crypto/modes/CBCBlockCipher;

    .line 4
    .line 5
    new-instance v2, Lorg/spongycastle/crypto/engines/DESedeEngine;

    .line 6
    .line 7
    invoke-direct {v2}, Lorg/spongycastle/crypto/engines/DESedeEngine;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-direct {v1, v2}, Lorg/spongycastle/crypto/modes/CBCBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {v0, v1}, Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;-><init>(Lorg/spongycastle/crypto/BlockCipher;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->cipher:Lorg/spongycastle/crypto/paddings/PaddedBufferedBlockCipher;

    .line 17
    .line 18
    iget-boolean v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->encrypt:Z

    .line 19
    .line 20
    iget-object v1, p0, Lorg/spongycastle/crypto/examples/DESExample;->key:[B

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/examples/DESExample;->performEncrypt([B)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-direct {p0, v1}, Lorg/spongycastle/crypto/examples/DESExample;->performDecrypt([B)V

    .line 29
    .line 30
    .line 31
    :goto_0
    :try_start_0
    iget-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->in:Ljava/io/BufferedInputStream;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->flush()V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lorg/spongycastle/crypto/examples/DESExample;->out:Ljava/io/BufferedOutputStream;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    :catch_0
    return-void
.end method
