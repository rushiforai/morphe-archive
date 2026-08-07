.class public abstract Ll/ywg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Z = true


# direct methods
.method public static a(Ljava/io/File;Ljava/io/File;)Ljava/io/File;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    .line 3
    .line 4
    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 5
    .line 6
    .line 7
    :try_start_1
    new-instance p0, Ljava/io/DataOutputStream;

    .line 8
    .line 9
    new-instance v2, Ljava/io/FileOutputStream;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-direct {p0, v2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 19
    .line 20
    .line 21
    :try_start_2
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-static {v2}, Ll/gxg0;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 34
    .line 35
    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    sget-object v3, Ll/avg0;->a:Ljava/util/HashMap;

    .line 40
    .line 41
    const-string v3, "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA84624QluMte2OQf27WRmq4q3nVjVCQX0o+2lZm3ktKHG2PZf5AjxjZiCuNjqfWSo1gJDsyJZC4FSubhhjDSXrPcJRKS6lXt5DKuhABWWqgkUhcJX3/loigHG4Abyi/+b0NkKPaqTbJ64j9jylyXvO6fj1TMmOw+5zJ/6rV0FMVHosyTUX0zTCt6T5OooGiSt+wCvxlj1IT6vqJ4k8EyM6zYhPzQMK7xZniUyYfdl4OeS9NMT1wW62scuEQ5y2VVeHxFSeauGw9CaQLMIjZl2yj87N8gEtsRj5+hQWmG2kEQOZMv9jRwLGpsH0JoBdJwiThf0fYdB3T1jtgL5eyUnewIDAQAB"

    .line 42
    .line 43
    invoke-static {v3}, Ll/amg0;->b(Ljava/lang/String;)[B

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    new-instance v4, Ljava/security/spec/X509EncodedKeySpec;

    .line 48
    .line 49
    invoke-direct {v4, v3}, Ljava/security/spec/X509EncodedKeySpec;-><init>([B)V

    .line 50
    .line 51
    .line 52
    const-string v3, "RSA"

    .line 53
    .line 54
    invoke-static {v3}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-virtual {v3, v4}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    if-eqz v2, :cond_1

    .line 63
    .line 64
    array-length v4, v2

    .line 65
    if-nez v4, :cond_0

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    const-string v4, "RSA/None/PKCS1Padding"

    .line 69
    .line 70
    invoke-static {v4}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    const/4 v5, 0x1

    .line 75
    invoke-virtual {v4, v5, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v4, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    goto :goto_1

    .line 83
    :cond_1
    :goto_0
    move-object v3, v0

    .line 84
    :goto_1
    array-length v4, v3

    .line 85
    invoke-virtual {p0, v4}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v3}, Ljava/io/OutputStream;->write([B)V

    .line 89
    .line 90
    .line 91
    const/16 v3, 0x2800

    .line 92
    .line 93
    new-array v3, v3, [B

    .line 94
    .line 95
    const/4 v4, 0x0

    .line 96
    move v5, v4

    .line 97
    :goto_2
    invoke-virtual {v1, v3}, Ljava/io/FileInputStream;->read([B)I

    .line 98
    .line 99
    .line 100
    move-result v6

    .line 101
    if-lez v6, :cond_3

    .line 102
    .line 103
    move v7, v4

    .line 104
    :goto_3
    if-ge v7, v6, :cond_2

    .line 105
    .line 106
    aget-byte v8, v3, v7

    .line 107
    .line 108
    aget-byte v9, v2, v5

    .line 109
    .line 110
    xor-int/2addr v8, v9

    .line 111
    int-to-byte v8, v8

    .line 112
    aput-byte v8, v3, v7

    .line 113
    .line 114
    add-int/lit8 v5, v5, 0x1

    .line 115
    .line 116
    array-length v8, v2

    .line 117
    rem-int/2addr v5, v8

    .line 118
    add-int/lit8 v7, v7, 0x1

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :catchall_0
    move-exception p1

    .line 122
    goto :goto_4

    .line 123
    :catch_0
    move-exception p1

    .line 124
    goto :goto_5

    .line 125
    :cond_2
    invoke-virtual {p0, v3, v4, v6}, Ljava/io/DataOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    .line 127
    .line 128
    goto :goto_2

    .line 129
    :cond_3
    invoke-static {v1}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 130
    .line 131
    .line 132
    invoke-static {p0}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 133
    .line 134
    .line 135
    return-object p1

    .line 136
    :goto_4
    move-object v0, p0

    .line 137
    goto :goto_7

    .line 138
    :catchall_1
    move-exception p0

    .line 139
    move-object p1, p0

    .line 140
    goto :goto_7

    .line 141
    :catch_1
    move-exception p0

    .line 142
    move-object p1, p0

    .line 143
    move-object p0, v0

    .line 144
    goto :goto_5

    .line 145
    :catchall_2
    move-exception p0

    .line 146
    move-object p1, p0

    .line 147
    move-object p0, v0

    .line 148
    goto :goto_6

    .line 149
    :catch_2
    move-exception p0

    .line 150
    move-object p1, p0

    .line 151
    move-object p0, v0

    .line 152
    move-object v1, p0

    .line 153
    :goto_5
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 154
    .line 155
    .line 156
    const-string v2, "ReportCLogUtils"

    .line 157
    .line 158
    new-instance v3, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 161
    .line 162
    .line 163
    const-string v4, "encryptFile error:"

    .line 164
    .line 165
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-static {p1}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    invoke-static {v2, p1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 180
    .line 181
    .line 182
    invoke-static {v1}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 183
    .line 184
    .line 185
    invoke-static {p0}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 186
    .line 187
    .line 188
    return-object v0

    .line 189
    :catchall_3
    move-exception p1

    .line 190
    move-object v0, v1

    .line 191
    :goto_6
    move-object v1, v0

    .line 192
    goto :goto_4

    .line 193
    :goto_7
    invoke-static {v1}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 194
    .line 195
    .line 196
    invoke-static {v0}, Ll/xeg0;->c(Ljava/io/Closeable;)V

    .line 197
    .line 198
    .line 199
    throw p1
.end method

.method public static b(Ljava/io/File;)V
    .locals 18

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto/16 :goto_6

    .line 4
    .line 5
    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v0, 0x0

    .line 10
    const-string v2, "TechSudMGPCLog.sp"

    .line 11
    .line 12
    if-eqz v1, :cond_a

    .line 13
    .line 14
    array-length v3, v1

    .line 15
    if-nez v3, :cond_1

    .line 16
    .line 17
    goto/16 :goto_7

    .line 18
    .line 19
    :cond_1
    sput-boolean v0, Ll/ywg0;->a:Z

    .line 20
    .line 21
    array-length v3, v1

    .line 22
    move v4, v0

    .line 23
    :goto_0
    if-ge v4, v3, :cond_9

    .line 24
    .line 25
    aget-object v5, v1, v4

    .line 26
    .line 27
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    invoke-static {v2}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v0, v0, Ll/kjg0;->a:Landroid/content/SharedPreferences;

    .line 36
    .line 37
    const-string v7, ""

    .line 38
    .line 39
    invoke-interface {v0, v6, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-wide/16 v8, 0x0

    .line 44
    .line 45
    const/4 v10, 0x0

    .line 46
    :try_start_0
    new-instance v11, Lorg/json/JSONObject;

    .line 47
    .line 48
    invoke-direct {v11, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const-string v0, "appId"

    .line 52
    .line 53
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v12
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 57
    :try_start_1
    const-string v0, "mgId"

    .line 58
    .line 59
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v13
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 63
    :try_start_2
    const-string v0, "requestId"

    .line 64
    .line 65
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v15
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 69
    :try_start_3
    const-string v0, "filePath"

    .line 70
    .line 71
    invoke-virtual {v11, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 75
    goto :goto_3

    .line 76
    :catch_0
    move-exception v0

    .line 77
    goto :goto_2

    .line 78
    :catch_1
    move-exception v0

    .line 79
    :goto_1
    move-object v15, v10

    .line 80
    goto :goto_2

    .line 81
    :catch_2
    move-exception v0

    .line 82
    move-wide v13, v8

    .line 83
    goto :goto_1

    .line 84
    :catch_3
    move-exception v0

    .line 85
    move-wide v13, v8

    .line 86
    move-object v12, v10

    .line 87
    move-object v15, v12

    .line 88
    :goto_2
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 89
    .line 90
    .line 91
    move-object v0, v10

    .line 92
    :goto_3
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result v11

    .line 96
    if-nez v11, :cond_7

    .line 97
    .line 98
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 99
    .line 100
    .line 101
    move-result v11

    .line 102
    if-eqz v11, :cond_2

    .line 103
    .line 104
    goto :goto_4

    .line 105
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v5

    .line 109
    if-nez v5, :cond_8

    .line 110
    .line 111
    new-instance v5, Ljava/io/File;

    .line 112
    .line 113
    invoke-direct {v5, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_8

    .line 121
    .line 122
    invoke-virtual {v5}, Ljava/io/File;->length()J

    .line 123
    .line 124
    .line 125
    move-result-wide v16

    .line 126
    cmp-long v0, v16, v8

    .line 127
    .line 128
    if-gtz v0, :cond_3

    .line 129
    .line 130
    goto :goto_5

    .line 131
    :cond_3
    sget-object v0, Ll/utg0;->e:Ll/i0h0;

    .line 132
    .line 133
    if-eqz v0, :cond_4

    .line 134
    .line 135
    iget-object v0, v0, Ll/i0h0;->c:Ll/gvg0;

    .line 136
    .line 137
    if-eqz v0, :cond_4

    .line 138
    .line 139
    iget-object v0, v0, Ll/gvg0;->d:Ll/rhg0;

    .line 140
    .line 141
    if-eqz v0, :cond_4

    .line 142
    .line 143
    iget-object v10, v0, Ll/rhg0;->e:Ljava/lang/String;

    .line 144
    .line 145
    :cond_4
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_5

    .line 150
    .line 151
    goto :goto_5

    .line 152
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 153
    .line 154
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-static {v10, v15, v5, v12, v0}, Ll/ywg0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_6

    .line 172
    .line 173
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 174
    .line 175
    .line 176
    invoke-static {v2}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-virtual {v0, v15}, Ll/kjg0;->d(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    goto :goto_5

    .line 184
    :cond_6
    const/4 v0, 0x1

    .line 185
    sput-boolean v0, Ll/ywg0;->a:Z

    .line 186
    .line 187
    goto :goto_5

    .line 188
    :cond_7
    :goto_4
    invoke-static {v2}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {v0, v6}, Ll/kjg0;->d(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 196
    .line 197
    .line 198
    :cond_8
    :goto_5
    add-int/lit8 v4, v4, 0x1

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :cond_9
    :goto_6
    return-void

    .line 203
    :cond_a
    :goto_7
    invoke-static {v2}, Ll/kjg0;->a(Ljava/lang/String;)Ll/kjg0;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-virtual {v1}, Ll/kjg0;->b()V

    .line 208
    .line 209
    .line 210
    sput-boolean v0, Ll/ywg0;->a:Z

    .line 211
    .line 212
    return-void
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8

    .line 1
    const-string v0, "ReportCLogUtils"

    .line 2
    .line 3
    const-string v1, "upload response:"

    .line 4
    .line 5
    const-string v2, ""

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    move-object p1, v2

    .line 10
    :cond_0
    if-nez p3, :cond_1

    .line 11
    .line 12
    move-object p3, v2

    .line 13
    :cond_1
    if-nez p4, :cond_2

    .line 14
    .line 15
    move-object p4, v2

    .line 16
    :cond_2
    new-instance v2, Ll/zug0;

    .line 17
    .line 18
    invoke-direct {v2}, Ll/zug0;-><init>()V

    .line 19
    .line 20
    .line 21
    const/4 v3, 0x3

    .line 22
    iput v3, v2, Ll/zug0;->c:I

    .line 23
    .line 24
    iget-object v3, v2, Ll/zug0;->b:Ll/cpg0;

    .line 25
    .line 26
    const-string v4, "UploadHttpLoggingInterceptor"

    .line 27
    .line 28
    iput-object v4, v3, Ll/cpg0;->a:Ljava/lang/String;

    .line 29
    .line 30
    new-instance v3, Ll/wlg0;

    .line 31
    .line 32
    invoke-direct {v3}, Ll/wlg0;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v4, "UploadLoggingEventListener"

    .line 36
    .line 37
    iput-object v4, v3, Ll/wlg0;->a:Ljava/lang/String;

    .line 38
    .line 39
    new-instance v4, Ll/rg50$b;

    .line 40
    .line 41
    invoke-direct {v4}, Ll/rg50$b;-><init>()V

    .line 42
    .line 43
    .line 44
    const-wide/16 v5, 0xf

    .line 45
    .line 46
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 47
    .line 48
    invoke-virtual {v4, v5, v6, v7}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 49
    .line 50
    .line 51
    move-result-object v4

    .line 52
    const-wide/16 v5, 0x1e

    .line 53
    .line 54
    invoke-virtual {v4, v5, v6, v7}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-virtual {v4, v2}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, v5, v6, v7}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v2, v3}, Ll/rg50$b;->l(Ll/t4f$b;)Ll/rg50$b;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    new-instance v3, Ll/h0h0;

    .line 71
    .line 72
    const-string v4, "UploadLoggingIpv4PreferredDns"

    .line 73
    .line 74
    invoke-direct {v3, v4}, Ll/h0h0;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v2, v3}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-virtual {v2}, Ll/rg50$b;->c()Ll/rg50;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    const-string v3, "application/octet-stream"

    .line 86
    .line 87
    invoke-static {v3}, Ll/e7y;->c(Ljava/lang/String;)Ll/e7y;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    invoke-static {v3, p2}, Ll/z1d0;->create(Ll/e7y;Ljava/io/File;)Ll/z1d0;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    new-instance v4, Ll/ku10$a;

    .line 96
    .line 97
    invoke-direct {v4}, Ll/ku10$a;-><init>()V

    .line 98
    .line 99
    .line 100
    sget-object v5, Ll/ku10;->j:Ll/e7y;

    .line 101
    .line 102
    invoke-virtual {v4, v5}, Ll/ku10$a;->f(Ll/e7y;)Ll/ku10$a;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    const-string v5, "file"

    .line 111
    .line 112
    invoke-virtual {v4, v5, p2, v3}, Ll/ku10$a;->b(Ljava/lang/String;Ljava/lang/String;Ll/z1d0;)Ll/ku10$a;

    .line 113
    .line 114
    .line 115
    move-result-object p2

    .line 116
    const-string v3, "app_id"

    .line 117
    .line 118
    invoke-virtual {p2, v3, p3}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    const-string v3, "mg_id"

    .line 123
    .line 124
    invoke-virtual {p2, v3, p4}, Ll/ku10$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/ku10$a;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p2}, Ll/ku10$a;->e()Ll/ku10;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    new-instance p4, Ll/bxg0;

    .line 133
    .line 134
    invoke-direct {p4}, Ll/bxg0;-><init>()V

    .line 135
    .line 136
    .line 137
    const/4 v3, 0x0

    .line 138
    invoke-static {p1, p4, v3}, Ll/uyg0;->e(Ljava/lang/String;Ll/bxg0;Ll/t4f;)Ll/x1d0$a;

    .line 139
    .line 140
    .line 141
    move-result-object p4

    .line 142
    sget-object v4, Ll/utg0;->a:Ljava/lang/String;

    .line 143
    .line 144
    const/4 v4, 0x2

    .line 145
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    invoke-static {}, Ll/utg0;->d()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v5

    .line 153
    new-instance v6, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string p1, "&"

    .line 162
    .line 163
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    sget-object p3, Ll/utg0;->h:Ljava/lang/String;

    .line 186
    .line 187
    invoke-static {p3, p1}, Ll/jkg0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    const-string p3, "sud-sdk-signature"

    .line 192
    .line 193
    invoke-virtual {p4, p3, p1}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p1, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    invoke-virtual {p0, p2}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    const/4 p1, 0x0

    .line 210
    :try_start_0
    invoke-virtual {v2, p0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 211
    .line 212
    .line 213
    move-result-object p0

    .line 214
    invoke-interface {p0}, Ll/ry3;->execute()Ll/i5d0;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-virtual {p0}, Ll/i5d0;->I()Z

    .line 219
    .line 220
    .line 221
    move-result p2

    .line 222
    if-eqz p2, :cond_4

    .line 223
    .line 224
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 225
    .line 226
    .line 227
    move-result-object p2

    .line 228
    if-eqz p2, :cond_3

    .line 229
    .line 230
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {p0}, Ll/k5d0;->string()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v3

    .line 238
    goto :goto_0

    .line 239
    :catch_0
    move-exception p0

    .line 240
    goto :goto_1

    .line 241
    :cond_3
    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 242
    .line 243
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    .line 248
    .line 249
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 254
    .line 255
    .line 256
    const/4 p0, 0x1

    .line 257
    return p0

    .line 258
    :cond_4
    return p1

    .line 259
    :goto_1
    invoke-static {p0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-static {v0, p0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 264
    .line 265
    .line 266
    return p1
.end method
