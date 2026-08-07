.class public Lcom/hihonor/push/sdk/d;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Lcom/hihonor/push/sdk/h1;

.field public static final b:Lcom/hihonor/push/sdk/d;


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/hihonor/push/sdk/d;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/hihonor/push/sdk/d;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/hihonor/push/sdk/d;->b:Lcom/hihonor/push/sdk/d;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)V
    .locals 1

    .line 207
    sget-object p0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    if-nez p0, :cond_0

    .line 208
    new-instance p0, Lcom/hihonor/push/sdk/h1;

    const-string v0, "push"

    invoke-direct {p0, p1, v0}, Lcom/hihonor/push/sdk/h1;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sput-object p0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    :cond_0
    return-void
.end method

.method public declared-synchronized a(Landroid/content/Context;Ljava/lang/String;)V
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/hihonor/push/sdk/d;->a(Landroid/content/Context;)V

    .line 3
    .line 4
    .line 5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 12
    .line 13
    const-string p2, "key_push_token"

    .line 14
    .line 15
    invoke-virtual {p1, p2}, Lcom/hihonor/push/sdk/h1;->a(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    goto/16 :goto_3

    .line 19
    .line 20
    :catchall_0
    move-exception p1

    .line 21
    goto/16 :goto_4

    .line 22
    .line 23
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p1, v0}, Lcom/hihonor/push/sdk/b;->a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string v0, "EA23F5B8C7577CDC744ABD1C6D7E143D5123F8F282BF4E7853C1EC86BD2EDD22"

    .line 32
    .line 33
    invoke-static {v0}, Lcom/hihonor/push/sdk/b;->a(Ljava/lang/String;)[B

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {p1}, Lcom/hihonor/push/sdk/b;->a(Ljava/lang/String;)[B

    .line 38
    .line 39
    .line 40
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    const/16 v1, 0x20

    .line 42
    .line 43
    const/4 v2, 0x0

    .line 44
    :try_start_1
    new-array v1, v1, [B

    .line 45
    .line 46
    new-instance v3, Ljava/security/SecureRandom;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v1}, Ljava/security/SecureRandom;->nextBytes([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :catch_0
    :try_start_2
    new-array v1, v2, [B

    .line 56
    .line 57
    :goto_0
    const/4 v3, -0x4

    .line 58
    invoke-static {v0, v3}, Lcom/hihonor/push/sdk/b;->a([BI)[B

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v0, p1}, Lcom/hihonor/push/sdk/b;->a([B[B)[B

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const/4 v0, 0x6

    .line 67
    invoke-static {p1, v0}, Lcom/hihonor/push/sdk/b;->a([BI)[B

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-static {p1, v1}, Lcom/hihonor/push/sdk/b;->a([B[B)[B

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    sget-object v0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 80
    .line 81
    const-string v1, "key_aes_gcm"

    .line 82
    .line 83
    invoke-virtual {v0, v1, p1}, Lcom/hihonor/push/sdk/h1;->a(Ljava/lang/String;Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    const-string v1, ""

    .line 92
    .line 93
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    if-nez v3, :cond_1

    .line 98
    .line 99
    if-eqz p1, :cond_1

    .line 100
    .line 101
    array-length v3, p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 102
    const/16 v4, 0x10

    .line 103
    .line 104
    if-lt v3, v4, :cond_1

    .line 105
    .line 106
    const/16 v3, 0xc

    .line 107
    .line 108
    :try_start_3
    new-array v3, v3, [B

    .line 109
    .line 110
    new-instance v4, Ljava/security/SecureRandom;

    .line 111
    .line 112
    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v4, v3}, Ljava/security/SecureRandom;->nextBytes([B)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :catch_1
    :try_start_4
    new-array v3, v2, [B

    .line 120
    .line 121
    :goto_1
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 122
    .line 123
    invoke-virtual {p2, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    .line 128
    .line 129
    const-string v4, "AES"

    .line 130
    .line 131
    invoke-direct {v2, p1, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    const-string p1, "AES/GCM/NoPadding"

    .line 135
    .line 136
    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    new-instance v4, Ljavax/crypto/spec/GCMParameterSpec;

    .line 141
    .line 142
    const/16 v5, 0x80

    .line 143
    .line 144
    invoke-direct {v4, v5, v3}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    .line 145
    .line 146
    .line 147
    const/4 v5, 0x1

    .line 148
    invoke-virtual {p1, v5, v2, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    if-eqz p1, :cond_1

    .line 156
    .line 157
    array-length p2, p1

    .line 158
    if-eqz p2, :cond_1

    .line 159
    .line 160
    invoke-static {v3}, Lcom/hihonor/push/sdk/b;->a([B)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p2

    .line 164
    invoke-static {p1}, Lcom/hihonor/push/sdk/b;->a([B)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    new-instance v2, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1
    :try_end_4
    .catch Ljava/security/GeneralSecurityException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 183
    goto :goto_2

    .line 184
    :catch_2
    move-exception p1

    .line 185
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    :cond_1
    :goto_2
    if-eqz v0, :cond_2

    .line 189
    .line 190
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 191
    .line 192
    .line 193
    move-result p1

    .line 194
    if-nez p1, :cond_2

    .line 195
    .line 196
    sget-object p1, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 197
    .line 198
    const-string p2, "key_push_token"

    .line 199
    .line 200
    invoke-virtual {p1, p2, v1}, Lcom/hihonor/push/sdk/h1;->a(Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 201
    .line 202
    .line 203
    :cond_2
    :goto_3
    monitor-exit p0

    .line 204
    return-void

    .line 205
    :goto_4
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 206
    throw p1
.end method

.method public declared-synchronized b(Landroid/content/Context;)Ljava/lang/String;
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/hihonor/push/sdk/d;->a(Landroid/content/Context;)V

    .line 3
    .line 4
    .line 5
    const-string p1, ""

    .line 6
    .line 7
    sget-object v0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 8
    .line 9
    const-string v1, "key_push_token"

    .line 10
    .line 11
    iget-object v0, v0, Lcom/hihonor/push/sdk/h1;->a:Landroid/content/SharedPreferences;

    .line 12
    .line 13
    if-eqz v0, :cond_5

    .line 14
    .line 15
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_5

    .line 20
    .line 21
    sget-object v0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 22
    .line 23
    const-string v1, "key_aes_gcm"

    .line 24
    .line 25
    iget-object v0, v0, Lcom/hihonor/push/sdk/h1;->a:Landroid/content/SharedPreferences;

    .line 26
    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_4

    .line 34
    .line 35
    sget-object v0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 36
    .line 37
    const-string v1, "key_push_token"

    .line 38
    .line 39
    iget-object v0, v0, Lcom/hihonor/push/sdk/h1;->a:Landroid/content/SharedPreferences;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    const-string v2, ""

    .line 44
    .line 45
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto/16 :goto_4

    .line 52
    .line 53
    :cond_0
    const-string v0, ""

    .line 54
    .line 55
    :goto_0
    sget-object v1, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 56
    .line 57
    const-string v2, "key_aes_gcm"

    .line 58
    .line 59
    iget-object v1, v1, Lcom/hihonor/push/sdk/h1;->a:Landroid/content/SharedPreferences;

    .line 60
    .line 61
    if-eqz v1, :cond_1

    .line 62
    .line 63
    const-string v3, ""

    .line 64
    .line 65
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    goto :goto_1

    .line 70
    :cond_1
    const-string v1, ""

    .line 71
    .line 72
    :goto_1
    const/4 v2, 0x0

    .line 73
    invoke-static {v1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v3, ""

    .line 78
    .line 79
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-nez v4, :cond_2

    .line 84
    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    array-length v4, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    const/16 v5, 0x10

    .line 89
    .line 90
    if-lt v4, v5, :cond_2

    .line 91
    .line 92
    :try_start_1
    new-instance v4, Ljavax/crypto/spec/SecretKeySpec;

    .line 93
    .line 94
    const-string v5, "AES"

    .line 95
    .line 96
    invoke-direct {v4, v1, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const-string v1, "AES/GCM/NoPadding"

    .line 100
    .line 101
    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const/16 v5, 0x18

    .line 106
    .line 107
    invoke-virtual {v0, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    if-nez v5, :cond_2

    .line 120
    .line 121
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    if-nez v5, :cond_2

    .line 126
    .line 127
    new-instance v5, Ljavax/crypto/spec/GCMParameterSpec;

    .line 128
    .line 129
    invoke-static {v2}, Lcom/hihonor/push/sdk/b;->a(Ljava/lang/String;)[B

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    const/16 v6, 0x80

    .line 134
    .line 135
    invoke-direct {v5, v6, v2}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    .line 136
    .line 137
    .line 138
    const/4 v2, 0x2

    .line 139
    invoke-virtual {v1, v2, v4, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v0}, Lcom/hihonor/push/sdk/b;->a(Ljava/lang/String;)[B

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-virtual {v1, v0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    new-instance v1, Ljava/lang/String;

    .line 151
    .line 152
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 153
    .line 154
    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 155
    .line 156
    .line 157
    move-object v3, v1

    .line 158
    goto :goto_2

    .line 159
    :catch_0
    move-exception v0

    .line 160
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    :cond_2
    :goto_2
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_3

    .line 168
    .line 169
    move-object p1, v3

    .line 170
    goto :goto_3

    .line 171
    :cond_3
    sget-object v0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 172
    .line 173
    const-string v1, "key_aes_gcm"

    .line 174
    .line 175
    invoke-virtual {v0, v1}, Lcom/hihonor/push/sdk/h1;->a(Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    sget-object v0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 179
    .line 180
    const-string v1, "key_push_token"

    .line 181
    .line 182
    invoke-virtual {v0, v1}, Lcom/hihonor/push/sdk/h1;->a(Ljava/lang/String;)Z

    .line 183
    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_4
    sget-object v0, Lcom/hihonor/push/sdk/d;->a:Lcom/hihonor/push/sdk/h1;

    .line 187
    .line 188
    const-string v1, "key_push_token"

    .line 189
    .line 190
    invoke-virtual {v0, v1}, Lcom/hihonor/push/sdk/h1;->a(Ljava/lang/String;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 191
    .line 192
    .line 193
    :cond_5
    :goto_3
    monitor-exit p0

    .line 194
    return-object p1

    .line 195
    :goto_4
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 196
    throw p1
.end method
