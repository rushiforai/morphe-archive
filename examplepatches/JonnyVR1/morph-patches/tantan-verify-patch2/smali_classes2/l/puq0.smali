.class public Ll/puq0;
.super Ljava/lang/Object;


# instance fields
.field a:Ll/d610$c;

.field b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field volatile c:Lorg/json/JSONObject;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static b(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;)Ll/r4r0;
    .locals 4

    .line 1
    const-string v0, "gzip"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    new-instance v2, Ljava/net/URL;

    .line 5
    .line 6
    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/net/HttpURLConnection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 14
    .line 15
    :try_start_1
    invoke-static {p0}, Ll/irq0;->a(Ljava/net/HttpURLConnection;)V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x1

    .line 19
    invoke-virtual {p0, v2}, Ljava/net/URLConnection;->setDoOutput(Z)V

    .line 20
    .line 21
    .line 22
    const-string v2, "Content-Type"

    .line 23
    .line 24
    const-string v3, "application/json; charset=utf-8"

    .line 25
    .line 26
    invoke-virtual {p0, v2, v3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v2, "Content-Encoding"

    .line 30
    .line 31
    invoke-virtual {p0, v2, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v2, "Accept-Encoding"

    .line 35
    .line 36
    invoke-virtual {p0, v2, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    const-string v0, "aid"

    .line 46
    .line 47
    invoke-virtual {p0, v0, p2}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const-string p2, "x-auth-token"

    .line 51
    .line 52
    invoke-virtual {p0, p2, p3}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :catchall_0
    move-exception p1

    .line 57
    goto :goto_3

    .line 58
    :cond_0
    :goto_0
    const-string p2, "POST"

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    if-eqz p1, :cond_1

    .line 64
    .line 65
    array-length p2, p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 66
    if-lez p2, :cond_1

    .line 67
    .line 68
    :try_start_2
    new-instance p2, Ljava/io/DataOutputStream;

    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    invoke-direct {p2, p3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 75
    .line 76
    .line 77
    :try_start_3
    invoke-virtual {p2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p2}, Ljava/io/DataOutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 81
    .line 82
    .line 83
    :try_start_4
    invoke-static {p2}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 84
    .line 85
    .line 86
    goto :goto_2

    .line 87
    :catchall_1
    move-exception p1

    .line 88
    goto :goto_1

    .line 89
    :catchall_2
    move-exception p1

    .line 90
    move-object p2, v1

    .line 91
    :goto_1
    invoke-static {p2}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 92
    .line 93
    .line 94
    throw p1

    .line 95
    :cond_1
    :goto_2
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 96
    .line 97
    .line 98
    move-result p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 99
    const/16 p2, 0xc8

    .line 100
    .line 101
    const-string p3, "http response code "

    .line 102
    .line 103
    if-ne p1, p2, :cond_2

    .line 104
    .line 105
    :try_start_5
    new-instance p2, Ll/r4r0;

    .line 106
    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    .line 108
    .line 109
    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    invoke-direct {p2, p1, p3}, Ll/r4r0;-><init>(ILjava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 120
    .line 121
    .line 122
    :try_start_6
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 123
    .line 124
    .line 125
    :catch_0
    invoke-static {v1}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 126
    .line 127
    .line 128
    return-object p2

    .line 129
    :cond_2
    :try_start_7
    new-instance p2, Ll/r4r0;

    .line 130
    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    .line 132
    .line 133
    invoke-direct {v0, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    const/16 p3, 0xce

    .line 144
    .line 145
    invoke-direct {p2, p3, p1}, Ll/r4r0;-><init>(ILjava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 146
    .line 147
    .line 148
    :try_start_8
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    .line 149
    .line 150
    .line 151
    :catch_1
    invoke-static {v1}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 152
    .line 153
    .line 154
    return-object p2

    .line 155
    :catchall_3
    move-exception p1

    .line 156
    move-object p0, v1

    .line 157
    :goto_3
    :try_start_9
    invoke-static {p1}, Ll/q5r0;->f(Ljava/lang/Throwable;)V

    .line 158
    .line 159
    .line 160
    new-instance p2, Ll/r4r0;

    .line 161
    .line 162
    const/16 p3, 0xcf

    .line 163
    .line 164
    invoke-direct {p2, p3, p1}, Ll/r4r0;-><init>(ILjava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 165
    .line 166
    .line 167
    if-eqz p0, :cond_3

    .line 168
    .line 169
    :try_start_a
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_2

    .line 170
    .line 171
    .line 172
    :catch_2
    :cond_3
    invoke-static {v1}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 173
    .line 174
    .line 175
    return-object p2

    .line 176
    :catchall_4
    move-exception p1

    .line 177
    if-eqz p0, :cond_4

    .line 178
    .line 179
    :try_start_b
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3

    .line 180
    .line 181
    .line 182
    :catch_3
    :cond_4
    invoke-static {v1}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 183
    .line 184
    .line 185
    throw p1
.end method

.method private c(Ljava/util/HashMap;)Lorg/json/JSONObject;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .line 1
    const-string v0, "Android"

    .line 2
    .line 3
    new-instance v1, Lorg/json/JSONObject;

    .line 4
    .line 5
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "magic_tag"

    .line 9
    .line 10
    const-string v3, "ss_app_log"

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    iget-object v2, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 16
    .line 17
    if-nez v2, :cond_5

    .line 18
    .line 19
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v3, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 29
    .line 30
    iget-object v3, p0, Ll/puq0;->b:Ljava/util/Map;

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    new-instance v3, Lorg/json/JSONObject;

    .line 35
    .line 36
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 37
    .line 38
    .line 39
    iget-object v4, p0, Ll/puq0;->b:Ljava/util/Map;

    .line 40
    .line 41
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v5

    .line 53
    if-eqz v5, :cond_0

    .line 54
    .line 55
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    check-cast v5, Ljava/util/Map$Entry;

    .line 60
    .line 61
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    check-cast v6, Ljava/lang/String;

    .line 66
    .line 67
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_0
    iget-object v4, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 76
    .line 77
    const-string v5, "custom"

    .line 78
    .line 79
    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 80
    .line 81
    .line 82
    :cond_1
    iget-object v3, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 83
    .line 84
    const-string v4, "os"

    .line 85
    .line 86
    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    .line 88
    .line 89
    iget-object v3, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 90
    .line 91
    const-string v4, "platform"

    .line 92
    .line 93
    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 97
    .line 98
    const-string v3, "os_version"

    .line 99
    .line 100
    invoke-static {}, Ll/hwq0;->k()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 108
    .line 109
    const-string v3, "os_api"

    .line 110
    .line 111
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 112
    .line 113
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 117
    .line 118
    const-string v3, "sdk_version"

    .line 119
    .line 120
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 121
    .line 122
    iget-wide v4, v4, Ll/d610$c;->d:J

    .line 123
    .line 124
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 128
    .line 129
    const-string v3, "sdk_version_code"

    .line 130
    .line 131
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 132
    .line 133
    iget-wide v4, v4, Ll/d610$c;->d:J

    .line 134
    .line 135
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 136
    .line 137
    .line 138
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 139
    .line 140
    const-string v3, "sdk_version_name"

    .line 141
    .line 142
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 143
    .line 144
    iget-object v4, v4, Ll/d610$c;->e:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    .line 148
    .line 149
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 150
    .line 151
    const-string v3, "aid"

    .line 152
    .line 153
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 154
    .line 155
    iget-object v4, v4, Ll/d610$c;->a:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    .line 159
    .line 160
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 161
    .line 162
    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 163
    .line 164
    if-nez v0, :cond_2

    .line 165
    .line 166
    move-object v0, v3

    .line 167
    goto :goto_1

    .line 168
    :cond_2
    if-eqz v3, :cond_3

    .line 169
    .line 170
    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 171
    .line 172
    .line 173
    move-result v4

    .line 174
    if-nez v4, :cond_3

    .line 175
    .line 176
    new-instance v4, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    const/16 v5, 0x20

    .line 185
    .line 186
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v0

    .line 196
    :cond_3
    :goto_1
    iget-object v4, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 197
    .line 198
    const-string v5, "device_model"

    .line 199
    .line 200
    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 201
    .line 202
    .line 203
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 204
    .line 205
    const-string v4, "device_brand"

    .line 206
    .line 207
    invoke-virtual {v0, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 211
    .line 212
    const-string v3, "device_manufacturer"

    .line 213
    .line 214
    sget-object v4, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 215
    .line 216
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 220
    .line 221
    const-string v3, "channel"

    .line 222
    .line 223
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 224
    .line 225
    iget-object v4, v4, Ll/d610$c;->c:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 228
    .line 229
    .line 230
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 231
    .line 232
    const-string v3, "app_version"

    .line 233
    .line 234
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 235
    .line 236
    iget-object v4, v4, Ll/d610$c;->e:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 239
    .line 240
    .line 241
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 242
    .line 243
    const-string v3, "version_code"

    .line 244
    .line 245
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 246
    .line 247
    iget-wide v4, v4, Ll/d610$c;->d:J

    .line 248
    .line 249
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 250
    .line 251
    .line 252
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 253
    .line 254
    const-string v3, "update_version_code"

    .line 255
    .line 256
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 257
    .line 258
    iget-wide v4, v4, Ll/d610$c;->d:J

    .line 259
    .line 260
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 261
    .line 262
    .line 263
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 264
    .line 265
    const-string v3, "manifest_version_code"

    .line 266
    .line 267
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 268
    .line 269
    iget-wide v4, v4, Ll/d610$c;->d:J

    .line 270
    .line 271
    invoke-virtual {v0, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 272
    .line 273
    .line 274
    iget-object v0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 275
    .line 276
    const-string v3, "bd_did"

    .line 277
    .line 278
    iget-object v4, p0, Ll/puq0;->a:Ll/d610$c;

    .line 279
    .line 280
    invoke-virtual {v4}, Ll/d610$c;->b()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v4

    .line 284
    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    iget-object v3, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 292
    .line 293
    const-string v4, "package"

    .line 294
    .line 295
    invoke-virtual {v3, v4, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    .line 297
    .line 298
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    const/4 v4, 0x0

    .line 303
    invoke-virtual {v3, v0, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    iget-object v3, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 308
    .line 309
    if-eqz v3, :cond_5

    .line 310
    .line 311
    iget v3, v3, Landroid/content/pm/ApplicationInfo;->labelRes:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 312
    .line 313
    iget-object v4, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 314
    .line 315
    const-string v5, "display_name"

    .line 316
    .line 317
    if-lez v3, :cond_4

    .line 318
    .line 319
    :try_start_1
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    :goto_2
    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 324
    .line 325
    .line 326
    goto :goto_3

    .line 327
    :cond_4
    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    iget-object v0, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 332
    .line 333
    invoke-virtual {v2, v0}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    .line 334
    .line 335
    .line 336
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 337
    goto :goto_2

    .line 338
    :catch_0
    :cond_5
    :goto_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 339
    .line 340
    .line 341
    move-result-wide v2

    .line 342
    const-wide/16 v4, 0x3e8

    .line 343
    .line 344
    div-long/2addr v2, v4

    .line 345
    const-string v0, "header"

    .line 346
    .line 347
    iget-object p0, p0, Ll/puq0;->c:Lorg/json/JSONObject;

    .line 348
    .line 349
    invoke-virtual {v1, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 350
    .line 351
    .line 352
    const-string p0, "local_time"

    .line 353
    .line 354
    invoke-virtual {v1, p0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 355
    .line 356
    .line 357
    new-instance p0, Lorg/json/JSONArray;

    .line 358
    .line 359
    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 360
    .line 361
    .line 362
    new-instance v0, Lorg/json/JSONObject;

    .line 363
    .line 364
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 365
    .line 366
    .line 367
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 368
    .line 369
    .line 370
    move-result-wide v2

    .line 371
    const-string v4, "local_time_ms"

    .line 372
    .line 373
    invoke-virtual {v0, v4, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 374
    .line 375
    .line 376
    const-string v4, "tea_event_index"

    .line 377
    .line 378
    const/16 v5, 0x2711

    .line 379
    .line 380
    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 381
    .line 382
    .line 383
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 384
    .line 385
    .line 386
    move-result-object v4

    .line 387
    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v4

    .line 391
    const-string v5, "session_id"

    .line 392
    .line 393
    invoke-virtual {v0, v5, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 394
    .line 395
    .line 396
    new-instance v4, Ljava/text/SimpleDateFormat;

    .line 397
    .line 398
    const-string v5, "yyyy-MM-dd HH:mm:ss"

    .line 399
    .line 400
    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 401
    .line 402
    invoke-direct {v4, v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 403
    .line 404
    .line 405
    new-instance v5, Ljava/util/Date;

    .line 406
    .line 407
    invoke-direct {v5, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {v4, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v2

    .line 414
    const-string v3, "datetime"

    .line 415
    .line 416
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 417
    .line 418
    .line 419
    if-eqz p1, :cond_7

    .line 420
    .line 421
    new-instance v2, Lorg/json/JSONObject;

    .line 422
    .line 423
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 424
    .line 425
    .line 426
    invoke-virtual {p1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    .line 427
    .line 428
    .line 429
    move-result-object p1

    .line 430
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 431
    .line 432
    .line 433
    move-result-object p1

    .line 434
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 435
    .line 436
    .line 437
    move-result v3

    .line 438
    if-eqz v3, :cond_6

    .line 439
    .line 440
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    check-cast v3, Ljava/util/Map$Entry;

    .line 445
    .line 446
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    check-cast v4, Ljava/lang/String;

    .line 451
    .line 452
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object v3

    .line 456
    invoke-virtual {v2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 457
    .line 458
    .line 459
    goto :goto_4

    .line 460
    :cond_6
    const-string p1, "pv_filters"

    .line 461
    .line 462
    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 463
    .line 464
    .line 465
    :cond_7
    invoke-virtual {p0, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 466
    .line 467
    .line 468
    const-string p1, "launch"

    .line 469
    .line 470
    invoke-virtual {v1, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 471
    .line 472
    .line 473
    return-object v1
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public d(Landroid/content/Context;Ll/d610$c;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/d610$c;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p2, p0, Ll/puq0;->a:Ll/d610$c;

    .line 5
    .line 6
    iput-object p3, p0, Ll/puq0;->b:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Ljava/util/HashMap;Ll/o7m;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/o7m;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/puq0;->a:Ll/d610$c;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/d610$c;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    if-eqz p2, :cond_2

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    invoke-interface {p2, p0}, Ll/o7m;->a(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    :goto_0
    :try_start_0
    invoke-direct {p0, p1}, Ll/puq0;->c(Ljava/util/HashMap;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    .line 28
    .line 29
    const/16 v1, 0x2000

    .line 30
    .line 31
    invoke-direct {v0, v1}, Ljava/io/ByteArrayOutputStream;-><init>(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    :try_start_1
    new-instance v2, Ljava/util/zip/GZIPOutputStream;

    .line 36
    .line 37
    invoke-direct {v2, v0}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 38
    .line 39
    .line 40
    :try_start_2
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v1, "UTF-8"

    .line 45
    .line 46
    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    .line 52
    .line 53
    :try_start_3
    invoke-static {v2}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 54
    .line 55
    .line 56
    :goto_1
    invoke-static {v0}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :catchall_0
    move-object v1, v2

    .line 61
    :catchall_1
    invoke-static {v1}, Ll/m4r0;->a(Ljava/io/Closeable;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :goto_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    new-instance v0, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-static {}, Ll/n0r0;->k()Ll/ow5;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-virtual {v1}, Ll/ow5;->i()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const-string v1, "?version_code="

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Ll/puq0;->a:Ll/d610$c;

    .line 88
    .line 89
    iget-wide v1, v1, Ll/d610$c;->d:J

    .line 90
    .line 91
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v1, "&device_platform=android&aid="

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object v1, p0, Ll/puq0;->a:Ll/d610$c;

    .line 100
    .line 101
    iget-object v1, v1, Ll/d610$c;->a:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v1, "&iid=iid"

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iget-object p0, p0, Ll/puq0;->a:Ll/d610$c;

    .line 116
    .line 117
    iget-object v1, p0, Ll/d610$c;->a:Ljava/lang/String;

    .line 118
    .line 119
    iget-object p0, p0, Ll/d610$c;->b:Ljava/lang/String;

    .line 120
    .line 121
    invoke-static {v0, p1, v1, p0}, Ll/puq0;->b(Ljava/lang/String;[BLjava/lang/String;Ljava/lang/String;)Ll/r4r0;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    if-eqz p2, :cond_2

    .line 126
    .line 127
    invoke-virtual {p0}, Ll/r4r0;->a()Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    invoke-interface {p2, p0}, Ll/o7m;->a(Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 132
    .line 133
    .line 134
    :catchall_2
    :cond_2
    return-void
.end method
