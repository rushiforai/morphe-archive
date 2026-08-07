.class public Lcom/tencent/youtu/liveness/YTCommonInterface;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "YTCommon"

.field public static b:I = 0x1

.field public static final synthetic c:Z = true


# direct methods
.method public static constructor <clinit>()V
    .locals 0

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

.method public static getDeviceInfo(Landroid/content/Context;Lcom/tencent/youtu/liveness/YTDeviceInfo;)I
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tencent/youtu/liveness/YTCommonInterface;->nativeGetDeviceInfo(Lcom/tencent/youtu/liveness/YTDeviceInfo;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static native getEndTime()J
.end method

.method public static native getSDKList()[I
.end method

.method public static native getSDKNameByID(I)Ljava/lang/String;
.end method

.method public static native getVersion()Ljava/lang/String;
.end method

.method public static initAuthByAssets(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tencent/youtu/liveness/YTCommonInterface;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    if-nez p1, :cond_2

    .line 14
    .line 15
    const-string p1, ""

    .line 16
    .line 17
    :cond_2
    invoke-static {p0, p1}, Lcom/tencent/youtu/liveness/YTCommonInterface;->nativeInitAuthByAssets(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public static initAuthByFilePath(Ljava/lang/String;Ljava/lang/String;)I
    .locals 6

    .line 1
    sget-boolean v0, Lcom/tencent/youtu/liveness/YTCommonInterface;->c:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 10
    .line 11
    .line 12
    return v1

    .line 13
    :cond_1
    :goto_0
    if-nez p1, :cond_2

    .line 14
    .line 15
    const-string p1, ""

    .line 16
    .line 17
    :cond_2
    new-instance v0, Ljava/io/File;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    const/16 v3, -0xa

    .line 27
    .line 28
    if-eqz v2, :cond_7

    .line 29
    .line 30
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    .line 31
    .line 32
    invoke-direct {v2, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 33
    .line 34
    .line 35
    const/16 v0, 0x800

    .line 36
    .line 37
    new-array v4, v0, [B

    .line 38
    .line 39
    invoke-virtual {v2, v4}, Ljava/io/FileInputStream;->read([B)I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 44
    .line 45
    .line 46
    if-ge v5, v0, :cond_3

    .line 47
    .line 48
    const/4 v0, 0x2

    .line 49
    invoke-static {v4, v1, v5, v0}, Landroid/util/Base64;->encodeToString([BIII)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v0, p1}, Lcom/tencent/youtu/liveness/YTCommonInterface;->nativeInitAuthByString(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    return p0

    .line 62
    :catch_0
    move-exception p1

    .line 63
    goto :goto_1

    .line 64
    :catch_1
    move-exception p1

    .line 65
    goto :goto_2

    .line 66
    :cond_3
    sget p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 67
    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    sget-object p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->a:Ljava/lang/String;

    .line 71
    .line 72
    const-string v0, "license length oversize."

    .line 73
    .line 74
    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    :cond_4
    const/4 p0, -0x2

    .line 78
    return p0

    .line 79
    :goto_1
    sget v0, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 80
    .line 81
    if-eqz v0, :cond_5

    .line 82
    .line 83
    sget-object v0, Lcom/tencent/youtu/liveness/YTCommonInterface;->a:Ljava/lang/String;

    .line 84
    .line 85
    new-instance v1, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v2, "io error: "

    .line 88
    .line 89
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 103
    .line 104
    .line 105
    :cond_5
    const/4 p0, -0x4

    .line 106
    return p0

    .line 107
    :goto_2
    sget v0, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 108
    .line 109
    if-eqz v0, :cond_6

    .line 110
    .line 111
    sget-object v0, Lcom/tencent/youtu/liveness/YTCommonInterface;->a:Ljava/lang/String;

    .line 112
    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v2, "file not found: "

    .line 116
    .line 117
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 131
    .line 132
    .line 133
    const-string p0, "YTCommon"

    .line 134
    .line 135
    const-string p1, "YouTo Auth\uff1aread auth file error,Failed to read the file, please check whether the APP has READ_EXTERNAL_STORAGE permission\u3002"

    .line 136
    .line 137
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    .line 139
    .line 140
    :cond_6
    return v3

    .line 141
    :cond_7
    sget p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 142
    .line 143
    if-eqz p1, :cond_8

    .line 144
    .line 145
    sget-object p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->a:Ljava/lang/String;

    .line 146
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    .line 148
    .line 149
    const-string v1, "file not exists: "

    .line 150
    .line 151
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    :cond_8
    return v3
.end method

.method public static initAuthByString(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tencent/youtu/liveness/YTCommonInterface;->c:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    if-nez p1, :cond_2

    .line 14
    .line 15
    const-string p1, ""

    .line 16
    .line 17
    :cond_2
    invoke-static {p0, p1}, Lcom/tencent/youtu/liveness/YTCommonInterface;->nativeInitAuthByString(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public static initAuthForQQ()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/tencent/youtu/liveness/YTCommonInterface;->nativeInitAuthForQQ()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static initAuthOnlineWithCache(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)I
    .locals 10

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    if-eqz v1, :cond_2

    .line 13
    .line 14
    invoke-static {p2, p4}, Lcom/tencent/youtu/liveness/YTCommonInterface;->initAuthByFilePath(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    invoke-static {}, Lcom/tencent/youtu/liveness/YTCommonInterface;->getEndTime()J

    .line 21
    .line 22
    .line 23
    move-result-wide v4

    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v6

    .line 28
    const-wide/16 v8, 0x3e8

    .line 29
    .line 30
    div-long/2addr v6, v8

    .line 31
    sub-long/2addr v4, v6

    .line 32
    const-wide/16 v6, 0x18

    .line 33
    .line 34
    div-long/2addr v4, v6

    .line 35
    const-wide/16 v6, 0xe10

    .line 36
    .line 37
    div-long/2addr v4, v6

    .line 38
    const-wide/16 v6, 0x0

    .line 39
    .line 40
    cmp-long v6, v4, v6

    .line 41
    .line 42
    if-ltz v6, :cond_1

    .line 43
    .line 44
    const-wide/16 v6, 0x7

    .line 45
    .line 46
    cmp-long v4, v4, v6

    .line 47
    .line 48
    if-gtz v4, :cond_1

    .line 49
    .line 50
    :cond_0
    :goto_0
    move v4, v3

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    move v4, v2

    .line 53
    goto :goto_1

    .line 54
    :cond_2
    const/16 v1, 0x3ea

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :goto_1
    if-eqz v4, :cond_d

    .line 58
    .line 59
    if-eqz p5, :cond_5

    .line 60
    .line 61
    new-instance p5, Lcom/tencent/youtu/liveness/YTDeviceInfo;

    .line 62
    .line 63
    invoke-direct {p5}, Lcom/tencent/youtu/liveness/YTDeviceInfo;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {p0, p5}, Lcom/tencent/youtu/liveness/YTCommonInterface;->getDeviceInfo(Landroid/content/Context;Lcom/tencent/youtu/liveness/YTDeviceInfo;)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    sget p0, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 73
    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    sget-object p0, Lcom/tencent/youtu/liveness/YTCommonInterface;->a:Ljava/lang/String;

    .line 77
    .line 78
    new-instance p1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string p2, "getDeviceInfo failed: "

    .line 81
    .line 82
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    :cond_3
    return v1

    .line 96
    :cond_4
    :goto_2
    move-object v9, p5

    .line 97
    goto :goto_3

    .line 98
    :cond_5
    const/4 p5, 0x0

    .line 99
    goto :goto_2

    .line 100
    :goto_3
    new-instance v4, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;

    .line 101
    .line 102
    invoke-direct {v4}, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;-><init>()V

    .line 103
    .line 104
    .line 105
    move-object v5, p0

    .line 106
    move-object v6, p1

    .line 107
    move-object v7, p3

    .line 108
    move-object v8, p4

    .line 109
    invoke-virtual/range {v4 .. v9}, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper;->fetchLicenseOnline(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/tencent/youtu/liveness/YTDeviceInfo;)Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    iget p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_code:I

    .line 114
    .line 115
    if-nez p1, :cond_8

    .line 116
    .line 117
    iget-object p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->license:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {p1, v8}, Lcom/tencent/youtu/liveness/YTCommonInterface;->initAuthByString(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    iget-object p3, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->auth_type:Ljava/lang/String;

    .line 124
    .line 125
    const-string p4, "test"

    .line 126
    .line 127
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p3

    .line 131
    if-eqz p3, :cond_6

    .line 132
    .line 133
    iget-object p3, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->bind_type:Ljava/lang/String;

    .line 134
    .line 135
    const-string p4, "APP"

    .line 136
    .line 137
    invoke-virtual {p3, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p3

    .line 141
    if-eqz p3, :cond_6

    .line 142
    .line 143
    goto :goto_4

    .line 144
    :cond_6
    if-nez p1, :cond_7

    .line 145
    .line 146
    move p3, v3

    .line 147
    goto :goto_5

    .line 148
    :cond_7
    :goto_4
    move p3, v2

    .line 149
    goto :goto_5

    .line 150
    :cond_8
    sget p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 151
    .line 152
    if-eqz p1, :cond_9

    .line 153
    .line 154
    sget-object p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->a:Ljava/lang/String;

    .line 155
    .line 156
    new-instance p3, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    const-string p4, "fetch license failed: http_status: "

    .line 159
    .line 160
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget p4, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->http_status:I

    .line 164
    .line 165
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string p4, " error_code: "

    .line 169
    .line 170
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget p4, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_code:I

    .line 174
    .line 175
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    const-string p4, " error_msg: "

    .line 179
    .line 180
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    iget-object p4, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_msg:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p3

    .line 192
    invoke-static {p1, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    .line 194
    .line 195
    :cond_9
    iget p1, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->error_code:I

    .line 196
    .line 197
    sget p3, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 198
    .line 199
    if-eqz p3, :cond_7

    .line 200
    .line 201
    invoke-static {p1}, Lcom/tencent/youtu/liveness/YTCommonInterface;->nativePrintAuthResult(I)V

    .line 202
    .line 203
    .line 204
    goto :goto_4

    .line 205
    :goto_5
    if-ne p3, v3, :cond_c

    .line 206
    .line 207
    :try_start_0
    new-instance p1, Ljava/io/FileOutputStream;

    .line 208
    .line 209
    invoke-direct {p1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p0, Lcom/tencent/youtu/liveness/YTFetchLicenseHelper$FetchLicenseResult;->license:Ljava/lang/String;

    .line 213
    .line 214
    invoke-static {p0, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-virtual {p1, p0}, Ljava/io/FileOutputStream;->write([B)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 222
    .line 223
    .line 224
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 225
    .line 226
    .line 227
    return v2

    .line 228
    :catch_0
    move-exception v0

    .line 229
    move-object p0, v0

    .line 230
    goto :goto_6

    .line 231
    :catch_1
    move-exception v0

    .line 232
    move-object p0, v0

    .line 233
    goto :goto_7

    .line 234
    :goto_6
    sget p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 235
    .line 236
    if-eqz p1, :cond_a

    .line 237
    .line 238
    sget-object p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->a:Ljava/lang/String;

    .line 239
    .line 240
    new-instance p3, Ljava/lang/StringBuilder;

    .line 241
    .line 242
    const-string p4, "io error: "

    .line 243
    .line 244
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p2

    .line 254
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 255
    .line 256
    .line 257
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 258
    .line 259
    .line 260
    :cond_a
    const/4 p0, -0x4

    .line 261
    return p0

    .line 262
    :goto_7
    sget p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 263
    .line 264
    if-eqz p1, :cond_b

    .line 265
    .line 266
    sget-object p1, Lcom/tencent/youtu/liveness/YTCommonInterface;->a:Ljava/lang/String;

    .line 267
    .line 268
    new-instance p3, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    const-string p4, "cache file not found: "

    .line 271
    .line 272
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p2

    .line 282
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 286
    .line 287
    .line 288
    const-string p0, "YTCommon"

    .line 289
    .line 290
    const-string p1, "YouTo Auth\uff1aread auth file error,Failed to read the file, please check whether the APP has READ_EXTERNAL_STORAGE permission\u3002"

    .line 291
    .line 292
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 293
    .line 294
    .line 295
    :cond_b
    const/16 p0, -0xa

    .line 296
    .line 297
    return p0

    .line 298
    :cond_c
    return p1

    .line 299
    :cond_d
    return v1
.end method

.method public static native nativeGetDeviceInfo(Lcom/tencent/youtu/liveness/YTDeviceInfo;)I
.end method

.method public static native nativeInitAuthByAssets(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public static native nativeInitAuthByString(Ljava/lang/String;Ljava/lang/String;)I
.end method

.method public static native nativeInitAuthForQQ()I
.end method

.method public static native nativePrintAuthResult(I)V
.end method

.method public static native nativeSetEnableLog(I)V
.end method

.method public static setEnableLog(I)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tencent/youtu/liveness/YTCommonInterface;->nativeSetEnableLog(I)V

    .line 2
    .line 3
    .line 4
    sput p0, Lcom/tencent/youtu/liveness/YTCommonInterface;->b:I

    .line 5
    .line 6
    return-void
.end method
