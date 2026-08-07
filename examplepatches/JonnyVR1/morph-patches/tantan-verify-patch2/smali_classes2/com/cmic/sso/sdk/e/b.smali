.class public Lcom/cmic/sso/sdk/e/b;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:[B


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 93
    invoke-static {}, Lcom/cmic/sso/sdk/e/b;->a()V

    .line 94
    invoke-static {p0}, Lcom/cmic/sso/sdk/e/b;->b(Landroid/content/Context;)[B

    move-result-object p0

    if-eqz p0, :cond_0

    .line 95
    sget-object v0, Lcom/cmic/sso/sdk/e/b;->a:[B

    invoke-static {p0, p1, v0}, Lcom/cmic/sso/sdk/e/a;->a([BLjava/lang/String;[B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 96
    :cond_0
    invoke-static {}, Lcom/cmic/sso/sdk/e/b;->a()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static a()V
    .locals 1

    .line 97
    const-string v0, "AES_KEY"

    invoke-static {v0}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/lang/String;)V

    return-void
.end method

.method private static a(Landroid/content/Context;)Z
    .locals 4

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    const-string v0, "AES"

    .line 3
    .line 4
    const-string v1, "AndroidKeyStore"

    .line 5
    .line 6
    invoke-static {v0, v1}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 11
    .line 12
    const-string v2, "CMCC_SDK_V1"

    .line 13
    .line 14
    const/4 v3, 0x3

    .line 15
    invoke-direct {v1, v2, v3}, Landroid/security/keystore/KeyGenParameterSpec$Builder;-><init>(Ljava/lang/String;I)V

    .line 16
    .line 17
    .line 18
    const-string v2, "SHA-256"

    .line 19
    .line 20
    const-string v3, "SHA-512"

    .line 21
    .line 22
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setDigests([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "CBC"

    .line 31
    .line 32
    filled-new-array {v2}, [Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setBlockModes([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v2, "PKCS7Padding"

    .line 41
    .line 42
    filled-new-array {v2}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setEncryptionPaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1, p0}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setRandomizedEncryptionRequired(Z)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/16 v2, 0x100

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setKeySize(I)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->build()Landroid/security/keystore/KeyGenParameterSpec;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v0, v1}, Ljavax/crypto/KeyGenerator;->init(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 65
    .line 66
    .line 67
    const-wide/16 v1, 0x3e8

    .line 68
    .line 69
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :catch_0
    move-exception v0

    .line 78
    const-string v1, "KeystoreUtil"

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-static {v1, v0}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return p0
.end method

.method public static a(Landroid/content/Context;Z)Z
    .locals 3

    .line 88
    :try_start_0
    const-string v0, "AndroidKeyStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v0

    const/4 v1, 0x0

    .line 89
    invoke-virtual {v0, v1}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 90
    const-string v2, "CMCC_SDK_V1"

    invoke-virtual {v0, v2, v1}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :catch_0
    move-exception v0

    .line 91
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_0
    if-eqz p1, :cond_1

    .line 92
    invoke-static {p0}, Lcom/cmic/sso/sdk/e/b;->a(Landroid/content/Context;)Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static b()Ljava/lang/String;
    .locals 2

    .line 269
    const-string v0, "AES_KEY"

    const-string v1, ""

    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 265
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 266
    invoke-static {p0}, Lcom/cmic/sso/sdk/e/b;->b(Landroid/content/Context;)[B

    move-result-object p0

    if-eqz p0, :cond_0

    .line 267
    sget-object v0, Lcom/cmic/sso/sdk/e/b;->a:[B

    invoke-static {p0, p1, v0}, Lcom/cmic/sso/sdk/e/a;->b([BLjava/lang/String;[B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 268
    :cond_0
    invoke-static {}, Lcom/cmic/sso/sdk/e/b;->a()V

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method private static declared-synchronized b(Landroid/content/Context;)[B
    .locals 10

    .line 1
    const-string v0, "\u662f\u5426\u89e3\u5bc6\u51fa\u79d8\u94a5\uff1a"

    .line 2
    .line 3
    const-class v1, Lcom/cmic/sso/sdk/e/b;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    const/4 v2, 0x0

    .line 7
    :try_start_0
    const-string v3, "AndroidKeyStore"

    .line 8
    .line 9
    invoke-static {v3}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3, v2}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 14
    .line 15
    .line 16
    const/4 v4, 0x0

    .line 17
    invoke-static {p0, v4}, Lcom/cmic/sso/sdk/e/b;->a(Landroid/content/Context;Z)Z

    .line 18
    .line 19
    .line 20
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    monitor-exit v1

    .line 24
    return-object v2

    .line 25
    :cond_0
    :try_start_1
    invoke-static {}, Lcom/cmic/sso/sdk/e/b;->b()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    const/4 v6, 0x1

    .line 34
    if-eqz v5, :cond_3

    .line 35
    .line 36
    invoke-static {}, Lcom/cmic/sso/sdk/e/q;->a()[B

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {}, Lcom/cmic/sso/sdk/e/q;->a()[B

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    sput-object v0, Lcom/cmic/sso/sdk/e/b;->a:[B

    .line 45
    .line 46
    const-string v0, "CMCC_SDK_V1"

    .line 47
    .line 48
    invoke-virtual {v3, v0, v2}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    instance-of v5, v0, Ljavax/crypto/SecretKey;

    .line 53
    .line 54
    if-eqz v5, :cond_1

    .line 55
    .line 56
    const-string v3, "KeystoreUtil"

    .line 57
    .line 58
    const-string v5, "\u968f\u673a\u751f\u6210aes\u79d8\u94a5"

    .line 59
    .line 60
    invoke-static {v3, v5}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    const-string v3, "AES/CBC/PKCS7Padding"

    .line 64
    .line 65
    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    new-instance v5, Ljavax/crypto/spec/IvParameterSpec;

    .line 70
    .line 71
    sget-object v7, Lcom/cmic/sso/sdk/e/b;->a:[B

    .line 72
    .line 73
    invoke-direct {v5, v7}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v6, v0, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :catchall_0
    move-exception p0

    .line 81
    goto/16 :goto_4

    .line 82
    .line 83
    :catch_0
    move-exception p0

    .line 84
    goto/16 :goto_3

    .line 85
    .line 86
    :cond_1
    instance-of v0, v0, Ljava/security/PrivateKey;

    .line 87
    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    const-string v0, "CMCC_SDK_V1"

    .line 91
    .line 92
    invoke-virtual {v3, v0}, Ljava/security/KeyStore;->getCertificate(Ljava/lang/String;)Ljava/security/cert/Certificate;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-string v3, "RSA/ECB/OAEPWithSHA256AndMGF1Padding"

    .line 101
    .line 102
    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    const-string v5, "KeystoreUtil"

    .line 107
    .line 108
    const-string v7, "\u751f\u6210rsa\u5bc6"

    .line 109
    .line 110
    invoke-static {v5, v7}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v3, v6, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 114
    .line 115
    .line 116
    :goto_0
    invoke-virtual {v3, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {v0, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    sget-object v3, Lcom/cmic/sso/sdk/e/b;->a:[B

    .line 125
    .line 126
    invoke-static {v3, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    new-instance v4, Ljava/util/HashMap;

    .line 131
    .line 132
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 133
    .line 134
    .line 135
    const-string v5, "AES_IV"

    .line 136
    .line 137
    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    const-string v3, "AES_KEY"

    .line 141
    .line 142
    invoke-interface {v4, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    invoke-static {v4}, Lcom/cmic/sso/sdk/e/k;->a(Ljava/util/Map;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 146
    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_2
    monitor-exit v1

    .line 150
    return-object v2

    .line 151
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/cmic/sso/sdk/e/b;->c()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    invoke-static {v5, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    sput-object v5, Lcom/cmic/sso/sdk/e/b;->a:[B

    .line 160
    .line 161
    invoke-static {p0, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    const-string v5, "CMCC_SDK_V1"

    .line 166
    .line 167
    invoke-virtual {v3, v5, v2}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    .line 168
    .line 169
    .line 170
    move-result-object v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 171
    if-nez v3, :cond_4

    .line 172
    .line 173
    monitor-exit v1

    .line 174
    return-object v2

    .line 175
    :cond_4
    :try_start_3
    instance-of v5, v3, Ljavax/crypto/SecretKey;

    .line 176
    .line 177
    const/4 v7, 0x2

    .line 178
    if-eqz v5, :cond_5

    .line 179
    .line 180
    const-string v5, "AES/CBC/PKCS7Padding"

    .line 181
    .line 182
    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    new-instance v8, Ljavax/crypto/spec/IvParameterSpec;

    .line 187
    .line 188
    sget-object v9, Lcom/cmic/sso/sdk/e/b;->a:[B

    .line 189
    .line 190
    invoke-direct {v8, v9}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v5, v7, v3, v8}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 194
    .line 195
    .line 196
    const-string v3, "KeystoreUtil"

    .line 197
    .line 198
    const-string v7, "\u4f7f\u7528aes"

    .line 199
    .line 200
    invoke-static {v3, v7}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_5
    instance-of v5, v3, Ljava/security/PrivateKey;

    .line 205
    .line 206
    if-eqz v5, :cond_6

    .line 207
    .line 208
    const-string v5, "RSA/ECB/OAEPWithSHA256AndMGF1Padding"

    .line 209
    .line 210
    invoke-static {v5}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 211
    .line 212
    .line 213
    move-result-object v5

    .line 214
    invoke-virtual {v5, v7, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 215
    .line 216
    .line 217
    const-string v3, "KeystoreUtil"

    .line 218
    .line 219
    const-string v7, "\u4f7f\u7528rsa"

    .line 220
    .line 221
    invoke-static {v3, v7}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :goto_1
    invoke-virtual {v5, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    const-string v3, "KeystoreUtil"

    .line 229
    .line 230
    new-instance v5, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    invoke-static {p0, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    xor-int/2addr v0, v6

    .line 244
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-static {v3, v0}, Lcom/cmic/sso/sdk/e/c;->b(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 252
    .line 253
    .line 254
    :goto_2
    monitor-exit v1

    .line 255
    return-object p0

    .line 256
    :cond_6
    monitor-exit v1

    .line 257
    return-object v2

    .line 258
    :goto_3
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 259
    .line 260
    .line 261
    monitor-exit v1

    .line 262
    return-object v2

    .line 263
    :goto_4
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 264
    throw p0
.end method

.method private static c()Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "AES_IV"

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cmic/sso/sdk/e/k;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method
