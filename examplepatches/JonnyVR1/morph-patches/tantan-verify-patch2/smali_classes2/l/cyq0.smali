.class public Ll/cyq0;
.super Ljava/lang/Object;


# static fields
.field protected static volatile b:Ll/d610;

.field protected static volatile c:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/d610;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected a:Ll/d610;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cyq0;->c:Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>(Ll/d610;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cyq0;->a:Ll/d610;

    .line 5
    .line 6
    invoke-static {p0}, Ll/vuq0;->g(Ll/cyq0;)V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ll/huq0;->e()V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/f4r0;->h()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static a()Ljava/lang/Object;
    .locals 1

    .line 1
    sget-object v0, Ll/cyq0;->b:Ll/d610;

    .line 2
    .line 3
    return-object v0
.end method

.method public static b(Ljava/lang/String;)Ll/d610;
    .locals 1

    .line 1
    sget-object v0, Ll/cyq0;->c:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/d610;

    .line 8
    .line 9
    return-object p0
.end method

.method private h(Z)Lorg/json/JSONObject;
    .locals 7

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 7
    .line 8
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 9
    .line 10
    iget-object v1, v1, Ll/d610$c;->f:[Ljava/lang/String;

    .line 11
    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/n0r0;->i()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/16 v3, 0x80

    .line 27
    .line 28
    invoke-virtual {v2, v1, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object v2, p0, Ll/cyq0;->a:Ll/d610;

    .line 35
    .line 36
    iget-object v2, v2, Ll/d610;->d:Ll/d610$c;

    .line 37
    .line 38
    iget-wide v3, v2, Ll/d610$c;->d:J

    .line 39
    .line 40
    const-wide/16 v5, -0x1

    .line 41
    .line 42
    cmp-long v3, v3, v5

    .line 43
    .line 44
    if-nez v3, :cond_0

    .line 45
    .line 46
    iget v3, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 47
    .line 48
    int-to-long v3, v3

    .line 49
    iput-wide v3, v2, Ll/d610$c;->d:J

    .line 50
    .line 51
    :cond_0
    iget-object v3, v2, Ll/d610$c;->e:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v3, :cond_1

    .line 54
    .line 55
    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, v2, Ll/d610$c;->e:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .line 59
    :catchall_0
    :cond_1
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 60
    .line 61
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 62
    .line 63
    invoke-virtual {v1}, Ll/d610$c;->b()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 74
    .line 75
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 76
    .line 77
    invoke-virtual {v1}, Ll/d610$c;->b()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "0"

    .line 82
    .line 83
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_3

    .line 88
    .line 89
    :cond_2
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 90
    .line 91
    iget-object v2, v1, Ll/d610;->e:Ll/puq0;

    .line 92
    .line 93
    if-eqz v2, :cond_3

    .line 94
    .line 95
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 96
    .line 97
    invoke-virtual {v2}, Ll/puq0;->a()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    const/4 v3, 0x0

    .line 102
    invoke-virtual {v1, v2, v3}, Ll/d610$c;->e(Ljava/lang/String;Z)Ll/d610$c;

    .line 103
    .line 104
    .line 105
    :cond_3
    :try_start_1
    const-string v1, "aid"

    .line 106
    .line 107
    iget-object v2, p0, Ll/cyq0;->a:Ll/d610;

    .line 108
    .line 109
    iget-object v2, v2, Ll/d610;->d:Ll/d610$c;

    .line 110
    .line 111
    iget-object v2, v2, Ll/d610$c;->a:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 118
    .line 119
    .line 120
    if-eqz p1, :cond_4

    .line 121
    .line 122
    iget-object p1, p0, Ll/cyq0;->a:Ll/d610;

    .line 123
    .line 124
    iget-object p1, p1, Ll/d610;->d:Ll/d610$c;

    .line 125
    .line 126
    iget-object p1, p1, Ll/d610$c;->b:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    if-nez p1, :cond_4

    .line 133
    .line 134
    const-string p1, "x-auth-token"

    .line 135
    .line 136
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 137
    .line 138
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 139
    .line 140
    iget-object v1, v1, Ll/d610$c;->b:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 143
    .line 144
    .line 145
    :cond_4
    const-string p1, "update_version_code"

    .line 146
    .line 147
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 148
    .line 149
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 150
    .line 151
    iget-wide v1, v1, Ll/d610$c;->d:J

    .line 152
    .line 153
    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 154
    .line 155
    .line 156
    const-string p1, "version_code"

    .line 157
    .line 158
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 159
    .line 160
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 161
    .line 162
    iget-wide v1, v1, Ll/d610$c;->d:J

    .line 163
    .line 164
    invoke-virtual {v0, p1, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 165
    .line 166
    .line 167
    const-string p1, "app_version"

    .line 168
    .line 169
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 170
    .line 171
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 172
    .line 173
    iget-object v1, v1, Ll/d610$c;->e:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 176
    .line 177
    .line 178
    const-string p1, "channel"

    .line 179
    .line 180
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 181
    .line 182
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 183
    .line 184
    iget-object v1, v1, Ll/d610$c;->c:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 187
    .line 188
    .line 189
    const-string p1, "package"

    .line 190
    .line 191
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 192
    .line 193
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 194
    .line 195
    iget-object v1, v1, Ll/d610$c;->f:[Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {v1}, Ll/t4r0;->d([Ljava/lang/String;)Lorg/json/JSONArray;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 202
    .line 203
    .line 204
    const-string p1, "device_id"

    .line 205
    .line 206
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 207
    .line 208
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 209
    .line 210
    invoke-virtual {v1}, Ll/d610$c;->b()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 215
    .line 216
    .line 217
    const-string p1, "user_id"

    .line 218
    .line 219
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 220
    .line 221
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 222
    .line 223
    invoke-virtual {v1}, Ll/d610$c;->c()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 228
    .line 229
    .line 230
    const-string p1, "os"

    .line 231
    .line 232
    const-string v1, "Android"

    .line 233
    .line 234
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 235
    .line 236
    .line 237
    const-string p1, "so_list"

    .line 238
    .line 239
    iget-object v1, p0, Ll/cyq0;->a:Ll/d610;

    .line 240
    .line 241
    iget-object v1, v1, Ll/d610;->d:Ll/d610$c;

    .line 242
    .line 243
    iget-object v1, v1, Ll/d610$c;->g:[Ljava/lang/String;

    .line 244
    .line 245
    invoke-static {v1}, Ll/t4r0;->d([Ljava/lang/String;)Lorg/json/JSONArray;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    invoke-virtual {v0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 250
    .line 251
    .line 252
    const-string p1, "single_upload"

    .line 253
    .line 254
    invoke-virtual {p0}, Ll/cyq0;->p()Z

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 259
    .line 260
    .line 261
    :catch_0
    return-object v0
.end method

.method public static i(Ll/d610;)V
    .locals 2

    .line 1
    new-instance v0, Ll/cyq0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/cyq0;-><init>(Ll/d610;)V

    .line 4
    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/d610;->d:Ll/d610$c;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Ll/cyq0;->c:Ljava/util/concurrent/ConcurrentHashMap;

    .line 13
    .line 14
    iget-object v1, p0, Ll/d610;->d:Ll/d610$c;

    .line 15
    .line 16
    iget-object v1, v1, Ll/d610$c;->a:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public static l(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/cyq0;->b:Ll/d610;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ll/cyq0;->b:Ll/d610;

    .line 6
    .line 7
    iget-object v0, v0, Ll/d610;->d:Ll/d610$c;

    .line 8
    .line 9
    iget-object v0, v0, Ll/d610$c;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    sget-object p0, Ll/cyq0;->b:Ll/d610;

    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Ll/d610;->d:Ll/d610$c;

    .line 20
    .line 21
    iget-object p0, p0, Ll/d610$c;->b:Ljava/lang/String;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    sget-object v0, Ll/cyq0;->c:Ljava/util/concurrent/ConcurrentHashMap;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    sget-object v0, Ll/cyq0;->c:Ljava/util/concurrent/ConcurrentHashMap;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ll/d610;

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p0, 0x0

    .line 40
    return-object p0
.end method

.method private m(Lcom/apm/lite/CrashType;)Lorg/json/JSONObject;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyq0;->a:Ll/d610;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d610;->a:Ll/r31;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/r31;->a(Lcom/apm/lite/CrashType;)Ljava/util/Map;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return-object v0

    .line 15
    :cond_0
    new-instance p1, Lorg/json/JSONObject;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 18
    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_1
    return-object v0
.end method

.method private o(Lcom/apm/lite/CrashType;)Lorg/json/JSONObject;
    .locals 0

    .line 1
    new-instance p1, Lorg/json/JSONObject;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyq0;->a:Ll/d610;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d610;->b:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {p1, p0}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method public static q()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ll/cyq0;->b:Ll/d610;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    return-object v0

    .line 7
    :cond_0
    sget-object v0, Ll/cyq0;->b:Ll/d610;

    .line 8
    .line 9
    iget-object v0, v0, Ll/d610;->d:Ll/d610$c;

    .line 10
    .line 11
    iget-object v0, v0, Ll/d610$c;->a:Ljava/lang/String;

    .line 12
    .line 13
    return-object v0
.end method


# virtual methods
.method public c([Ljava/lang/StackTraceElement;Ljava/lang/Throwable;)Lorg/json/JSONArray;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyq0;->a:Ll/d610;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d610;->d:Ll/d610$c;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d610$c;->f:[Ljava/lang/String;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    new-instance p0, Lorg/json/JSONArray;

    .line 10
    .line 11
    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance p2, Ll/d6r0$a;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    array-length p1, p1

    .line 18
    invoke-direct {p2, v0, p1}, Ll/d6r0$a;-><init>(II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p2}, Ll/d6r0$a;->a()Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0

    .line 30
    :cond_0
    if-eqz p2, :cond_2

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    invoke-static {p1, p0}, Ll/d6r0;->g([Ljava/lang/StackTraceElement;[Ljava/lang/String;)Lorg/json/JSONArray;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 41
    return-object p0
.end method

.method public d([Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/cyq0;->a:Ll/d610;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/d610;->e()Ll/d610$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Ll/d610$c;->f:[Ljava/lang/String;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance p0, Lorg/json/JSONArray;

    .line 13
    .line 14
    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v0, Ll/d6r0$a;

    .line 18
    .line 19
    array-length p1, p1

    .line 20
    invoke-direct {v0, v1, p1}, Ll/d6r0$a;-><init>(II)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ll/d6r0$a;->a()Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    iget-object v0, p0, Ll/cyq0;->a:Ll/d610;

    .line 33
    .line 34
    iget-object v0, v0, Ll/d610;->d:Ll/d610$c;

    .line 35
    .line 36
    iget-object v0, v0, Ll/d610$c;->f:[Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/d6r0;->h([Ljava/lang/String;[Ljava/lang/String;)Lorg/json/JSONArray;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    :try_start_0
    invoke-static {v0}, Ll/t4r0;->f(Lorg/json/JSONArray;)Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_2

    .line 47
    .line 48
    iget-object v2, p0, Ll/cyq0;->a:Ll/d610;

    .line 49
    .line 50
    iget-object v2, v2, Ll/d610;->d:Ll/d610$c;

    .line 51
    .line 52
    iget-boolean v2, v2, Ll/d610$c;->k:Z

    .line 53
    .line 54
    if-eqz v2, :cond_2

    .line 55
    .line 56
    invoke-static {}, Ll/euq0;->A()Ll/euq0;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Ll/euq0;->K()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-nez v3, :cond_2

    .line 69
    .line 70
    iget-object p0, p0, Ll/cyq0;->a:Ll/d610;

    .line 71
    .line 72
    iget-object p0, p0, Ll/d610;->d:Ll/d610$c;

    .line 73
    .line 74
    iget-object p0, p0, Ll/d610$c;->f:[Ljava/lang/String;

    .line 75
    .line 76
    array-length v3, p0

    .line 77
    move v4, v1

    .line 78
    :goto_0
    if-ge v4, v3, :cond_2

    .line 79
    .line 80
    aget-object v5, p0, v4

    .line 81
    .line 82
    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    if-eqz v5, :cond_1

    .line 87
    .line 88
    new-instance p0, Lorg/json/JSONArray;

    .line 89
    .line 90
    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 91
    .line 92
    .line 93
    new-instance v2, Ll/d6r0$a;

    .line 94
    .line 95
    array-length p1, p1

    .line 96
    invoke-direct {v2, v1, p1}, Ll/d6r0$a;-><init>(II)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v2}, Ll/d6r0$a;->a()Lorg/json/JSONObject;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p0, p1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 104
    .line 105
    .line 106
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    return-object p0

    .line 108
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :catchall_0
    :cond_2
    return-object v0
.end method

.method public e(Lcom/apm/lite/CrashType;)Lorg/json/JSONObject;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/cyq0;->f(Lcom/apm/lite/CrashType;Lorg/json/JSONArray;)Lorg/json/JSONObject;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public f(Lcom/apm/lite/CrashType;Lorg/json/JSONArray;)Lorg/json/JSONObject;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Ll/cyq0;->g(Lcom/apm/lite/CrashType;Lorg/json/JSONArray;Z)Lorg/json/JSONObject;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public g(Lcom/apm/lite/CrashType;Lorg/json/JSONArray;Z)Lorg/json/JSONObject;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "header"

    .line 7
    .line 8
    invoke-direct {p0, p3}, Ll/cyq0;->h(Z)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    invoke-virtual {v0, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    const-string p3, "custom"

    .line 18
    .line 19
    invoke-direct {p0, p1}, Ll/cyq0;->m(Lcom/apm/lite/CrashType;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, p3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string p3, "filters"

    .line 27
    .line 28
    invoke-direct {p0, p1}, Ll/cyq0;->o(Lcom/apm/lite/CrashType;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0, p3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 33
    .line 34
    .line 35
    :cond_0
    const-string p0, "line_num"

    .line 36
    .line 37
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    .line 39
    .line 40
    :catchall_0
    return-object v0
.end method

.method public j(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyq0;->a:Ll/d610;

    .line 2
    .line 3
    if-ne p0, p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyq0;->a:Ll/d610;

    .line 2
    .line 3
    iget-object p0, p0, Ll/d610;->d:Ll/d610$c;

    .line 4
    .line 5
    iget-object p0, p0, Ll/d610$c;->a:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public n()Lorg/json/JSONObject;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Ll/cyq0;->h(Z)Lorg/json/JSONObject;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public p()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
